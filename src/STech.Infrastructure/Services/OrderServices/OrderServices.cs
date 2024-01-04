using System.Xml;
using AutoMapper;
using STech.Core.Domain.Entities;
using STech.Core.Domain.Enums;
using STech.Core.Domain.RepositoryContracts;
using STech.Core.Domain.ServiceContracts;
using STech.Core.Domain.Specifications;
using STech.Core.Domain.Specifications.OrderSpec;
using STech.Core.DTO;
using STech.Core.Helpers;
using STech.Core.ServiceContracts.OrderServices;
using STech.Core.ServiceContracts.ProductServices;
using STech.Core.ServiceContracts.ProfitServices;
using OrderStatus = STech.Core.Domain.Entities.OrderStatus;

namespace STech.Infrastructure.Services.OrderServices;

public class OrderServices : IOrderServices
{
    #region vars

    private readonly IUnitOfWork _unitOfWork;
    private readonly IGenericRepository<Order> _orderRepo;
    private readonly IGenericRepository<OrderHistory> _orderHistoryRepo;
    private readonly IGenericRepository<Product> _productRepo;
    private readonly IGenericRepository<DeliveryMethod> _deliMethodRepo;

    private readonly ICartRepository _cartRepo;

    private readonly IPaymentServices _paymentServices;
    private readonly IProductServices _productServices;
    private readonly IMapper _mapper;

    #endregion

    #region ctor

    public OrderServices(IUnitOfWork unitOfWork, ICartRepository cartRepo, IPaymentServices paymentServices,
        IMapper mapper, IProductServices productServices)
    {
        _unitOfWork = unitOfWork;

        _orderRepo = _unitOfWork.Repository<Order>();
        _orderHistoryRepo = _unitOfWork.Repository<OrderHistory>();
        _productRepo = _unitOfWork.Repository<Product>();
        _deliMethodRepo = _unitOfWork.Repository<DeliveryMethod>();

        _cartRepo = cartRepo;
        _paymentServices = paymentServices;
        _productServices = productServices;
        _mapper = mapper;
    }

    #endregion

    public async Task<Order?> GetOrderByIDAsync(int orderID)
    {
        var spec = new OrderWithItemsAndOrderingSpecification(orderID);

        return await _orderRepo.GetEntityWithSpec(spec);
    }

    public Task<Order?> GetOrderByIDForUserAsync(int orderID, string customerEmail)
    {
        var spec = new OrderWithItemsAndOrderingSpecification(orderID, customerEmail);

        return _orderRepo.GetEntityWithSpec(spec);
    }

    public async Task<IReadOnlyList<DeliveryMethod>> GetDeliveryMethodsAsync()
    {
        return await _deliMethodRepo.ListAllAsync();
    }

    public async Task<Pagination<OrderResponseDTO>> GetOrdersForUserAsync(OrderSpecParams orderSpecParams)
    {
        var spec = new OrderWithItemsAndOrderingSpecification(orderSpecParams);
        var countSpec = new OrderCountSpecification(orderSpecParams);

        var matchingOrders = await _orderRepo.ListAsync(spec);
        var allMatchingOrders = await _orderRepo.ListAsync(countSpec);

        var matchingOrdersReponse = _mapper.Map<List<Order>, List<OrderResponseDTO>>(matchingOrders);

        return new Pagination<OrderResponseDTO>(orderSpecParams.PageIndex, orderSpecParams.PageSize, allMatchingOrders.Count, matchingOrdersReponse);
    }

    public async Task<Pagination<OrderResponseDTO>> GetOrdersAsync(OrderSpecParams orderSpecParams)
    {
        var spec = new OrderWithItemsAndOrderingSpecification(orderSpecParams, false);
        var countSpec = new OrderCountSpecification(orderSpecParams);
        var orders = await _orderRepo.ListAsync(spec);
        var allOrders = await _orderRepo.ListAsync(countSpec);

        var orderResponses = _mapper.Map<List<Order>, List<OrderResponseDTO>>(orders);
        
        return new Pagination<OrderResponseDTO>(orderSpecParams.PageIndex, orderSpecParams.PageSize, allOrders.Count, orderResponses);
    }

    public async Task<List<Order>> GetAllOrders()
    {
        return await _orderRepo.ListAllAsync();
    }

    public async Task<Order> CreateOrderAsync(Order order, int deliveryMethodID, string cartID)
    {
        var cart = await _cartRepo.GetCartAsync(cartID);

        // Get items from product repo
        var items = new List<OrderItem>();
        foreach (var item in cart.CartItems)
        {
            var productItem = await _productRepo.GetByIdAsync(item.ID);
            var orderItem = new OrderItem()
            {
                ProductID = productItem.ID,
                Product = productItem,
                OrderID = order.ID,
                ProductName = productItem.Name,
                ItemPrice = productItem.Price,
                Quantity = item.Quantity
            };

            items.Add(orderItem);
        }

        var dmMethod = await _deliMethodRepo.GetByIdAsync(deliveryMethodID);

        var totalAmount = items.Sum(i => i.ItemPrice * i.Quantity);

        // Check if order already exists
        var spec = new OrderWithPaymentIntentIDSpecification(cart.PaymentIntentID);
        var existingOrder = await _orderRepo.GetEntityWithSpec(spec);
        if (existingOrder != null)
        {
            _orderRepo.Delete(existingOrder);
            await _paymentServices.CreateOrUpdatePaymentIntent(cart.ID);
        }

        order.OrderItems = items;
        order.DeliveryMethod = dmMethod;
        order.TotalAmount = totalAmount;
        order.FinalAmount = order.TotalAmount + dmMethod.Price;
        order.PaymentIntentID = cart.PaymentIntentID;
        order.PlacedOn = DateTime.Now;
        order.ModifiedOn = DateTime.Now;

        order.OrderHistories = new List<OrderHistory>()
        {
            new OrderHistory()
            {
                OrderStatus = (int)OrderStatus.Placed,
                ModifiedOn = DateTime.Now,
                Note = "Order Placed."
            }
        };

        if (order.PaymentMethod == (int)PaymentMethod.PayPal)
        {
            order.OrderHistories.Add(new OrderHistory()
            {
                OrderStatus = (int)OrderStatus.Processing,
                ModifiedOn = DateTime.Now,
                Note = "Payment received - Now Processing."
            });  
        }

        if (order.PaymentMethod == (int)PaymentMethod.CashOnDelivery)
        {
            order.OrderHistories.Add(new OrderHistory()
            {
                OrderStatus = (int)OrderStatus.WaitingForPayment,
                ModifiedOn = DateTime.Now,
                Note = "Now Processing - Waiting For Payment"
            });
        }

        _orderRepo.Add(order);

        var result = await _unitOfWork.Complete() > 0;
        if (!result)
            return null;

        return order;
    }

    public async Task<List<OrderHistory>> GetOrderHistories(int orderID)
    {
        // var spec = new BaseSpecification<OrderHistory>(o => o.OrderID == orderID);
        var spec = new OrderHistorySpecification(orderID);
        var orderHistories = await _orderHistoryRepo.ListAsync(spec);

        return orderHistories;
    }

    public async Task<bool> AddOrderHistory(OrderHistory orderHistory)
    {
        _orderHistoryRepo.Add(orderHistory);

        return await _unitOfWork.Complete() > 0;
    }
}