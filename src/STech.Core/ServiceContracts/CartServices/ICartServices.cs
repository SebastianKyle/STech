using STech.Core.Domain.Entities;

namespace STech.Core.ServiceContracts.CartServices;

public interface ICartServices
{
    Task<CustomerCart?> GetCartAsync(string cartID);
    Task<CustomerCart> UpdateCartAsync(CustomerCart cart);
    Task<bool> DeleteCartAsync(string cartID);
}