using STech.Core.Domain.Entities;

namespace STech.Core.Domain.RepositoryContracts;

public interface ICartRepository
{
    Task<CustomerCart?> GetCartAsync(string cartId);
    Task<CustomerCart> UpdateCartAsync(CustomerCart cart);
    Task<bool> DeleteCartAsync(string cartId);
}