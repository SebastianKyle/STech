using STech.Core.Domain.Entities;
using STech.Core.Domain.RepositoryContracts;
using STech.Core.ServiceContracts.CartServices;
using Stripe;

namespace STech.Infrastructure.Services.CartServices;

public class CartServices : ICartServices
{
    #region vars

    private readonly ICartRepository _cartRepo; 

    #endregion

    #region ctor

    public CartServices(ICartRepository cartRepo)
    {
        _cartRepo = cartRepo;
    }

    #endregion
    
    public async Task<CustomerCart?> GetCartAsync(string cartID)
    {
        CustomerCart? cartFromGet = await _cartRepo.GetCartAsync(cartID);

        return cartFromGet;
    }

    public async Task<CustomerCart> UpdateCartAsync(CustomerCart cart)
    {
        CustomerCart updatedCart = await _cartRepo.UpdateCartAsync(cart);

        return updatedCart;
    }

    public async Task<bool> DeleteCartAsync(string cartID)
    {
        bool succeeded = await _cartRepo.DeleteCartAsync(cartID);

        return succeeded;
    }
}