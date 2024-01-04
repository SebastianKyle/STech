using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;
using STech.Core.Domain.Entities;
using STech.Core.Domain.RepositoryContracts;
using STech.Core.Domain.ServiceContracts;
using STech.Core.Domain.Specifications.OrderSpec;
using STech.Core.ServiceContracts.ProductServices;
using STech.Core.ServiceContracts.ProfitServices;
using Stripe;
using Stripe.Terminal;
using Product = STech.Core.Domain.Entities.Product;

namespace STech.Infrastructure.Services.PaymentServices;

public class PaymentServices : IPaymentServices
{
    #region vars

    private readonly ICartRepository _cartRepo;
    private readonly IConfiguration _config;

    private readonly IUnitOfWork _unitOfWork;
    private readonly IGenericRepository<Order> _orderRepo;
    private readonly IGenericRepository<Product> _productRepo;
    private readonly IGenericRepository<DeliveryMethod> _deliMethodRepo;

    private readonly IProfitServices _profitServices;
    private readonly IProductServices _productServices;

    #endregion

    #region ctor

    public PaymentServices(ICartRepository cartRepo, IConfiguration config, IUnitOfWork unitOfWork,
        IProfitServices profitServices, IProductServices productServices)
    {
        _cartRepo = cartRepo;
        _config = config;
        _unitOfWork = unitOfWork;

        _orderRepo = _unitOfWork.Repository<Order>();
        _productRepo = _unitOfWork.Repository<Product>();
        _deliMethodRepo = _unitOfWork.Repository<DeliveryMethod>();

        _profitServices = profitServices;
        _productServices = productServices;
    }

    #endregion

    public async Task<CustomerCart?> CreateOrUpdatePaymentIntent(string cartID)
    {
        StripeConfiguration.ApiKey = _config["StripeSettings:SecretKey"];
        var cart = await _cartRepo.GetCartAsync(cartID);

        if (cart == null)
        {
            return null;
        }

        var shippingPrice = 0m;
        if (cart.DeliveryMethodID.HasValue)
        {
            var deliveryMethod = await _deliMethodRepo.GetByIdAsync((int)cart.DeliveryMethodID);
            shippingPrice = deliveryMethod.Price;
        }

        foreach (var item in cart.CartItems)
        {
            var product = await _productRepo.GetByIdAsync(item.ID);
            if (item.Price != product.Price)
            {
                item.Price = product.Price;
            }
        }

        var service = new PaymentIntentService();
        PaymentIntent intent;

        if (string.IsNullOrEmpty(cart.PaymentIntentID))
        {
            var options = new PaymentIntentCreateOptions()
            {
                Amount = (long)cart.CartItems.Sum(i => i.Quantity * (i.Price * 100)) + (long)shippingPrice * 100,
                Currency = "usd",
                PaymentMethodTypes = new List<string> { "card" }
            };

            intent = await service.CreateAsync(options);

            cart.PaymentIntentID = intent.Id;
            cart.ClientSecret = intent.ClientSecret;
        }
        else
        {
            var options = new PaymentIntentUpdateOptions()
            {
                Amount = (long)cart.CartItems.Sum(i => i.Quantity * (i.Price * 100)) + (long)shippingPrice * 100
            };

            await service.UpdateAsync(cart.PaymentIntentID, options);
        }

        await _cartRepo.UpdateCartAsync(cart);

        return cart;
    }

    public async Task<Order> UpdateOrderPaymentFailed(string paymentIntentID)
    {
        var spec = new OrderWithPaymentIntentIDSpecification(paymentIntentID);
        var order = await _orderRepo.GetEntityWithSpec(spec);

        if (order == null)
            return null;

        OrderHistory orderHistory = new OrderHistory()
        {
            OrderStatus = (int)OrderStatus.Failed,
            ModifiedOn = DateTime.Now,
            Note = "Payment Failed."
        };

        if (order.OrderHistories == null)
        {
            order.OrderHistories = new List<OrderHistory>()
            {
                orderHistory
            };
        }
        else
        {
            order.OrderHistories.Add(orderHistory);
        }

        _orderRepo.Update(order);

        await _unitOfWork.Complete();

        return order;
    }

    public async Task<Order> UpdateOrderPaymentSucceeded(string paymentIntentID)
    {
        var spec = new OrderWithPaymentIntentIDSpecification(paymentIntentID);
        var order = await _orderRepo.GetEntityWithSpec(spec);

        if (order == null)
            return order;

        OrderHistory orderHistory = new OrderHistory()
        {
            OrderStatus = (int)OrderStatus.Processing,
            ModifiedOn = DateTime.Now,
            Note = "Payment Received - Now Processing."
        };

        if (order.OrderHistories == null)
        {
            order.OrderHistories = new List<OrderHistory>()
            {
                orderHistory
            };
        }
        else
        {
            order.OrderHistories.Add(orderHistory);
        }

        _orderRepo.Update(order);

        await _unitOfWork.Complete();
        
        // Update products stock quantity
        var orderWithItemsSpec = new OrderWithItemsAndOrderingSpecification(order.ID);
        var orderWithItems = await _orderRepo.GetEntityWithSpec(orderWithItemsSpec);
        await _productServices.UpdateProductStockQuantity(orderWithItems);
        
        // Update profit
        await _profitServices.UpdateCurrentProfit(order);

        return order;
    }
}