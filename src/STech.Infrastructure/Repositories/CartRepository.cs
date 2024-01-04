using StackExchange.Redis;
using STech.Core.Domain.Entities;
using STech.Core.Domain.RepositoryContracts;
using System.Text.Json;

namespace STech.Infrastructure.Repositories;

public class CartRepository : ICartRepository
{
    private readonly IDatabase  _db;

    #region ctor

    public CartRepository(IConnectionMultiplexer redis)
    {
        _db = redis.GetDatabase();
    } 

    #endregion
    
    public async Task<CustomerCart?> GetCartAsync(string cartId)
    {
        var data = await _db.StringGetAsync(cartId);
        
        return data.IsNullOrEmpty ? null : JsonSerializer.Deserialize<CustomerCart>(data);
    }

    public async Task<CustomerCart> UpdateCartAsync(CustomerCart cart)
    {
        var created = await _db.StringSetAsync(cart.ID, JsonSerializer.Serialize(cart), TimeSpan.FromDays(1));

        if (!created)
        {
            return null;
        }

        return await GetCartAsync(cart.ID);
    }

    public async Task<bool> DeleteCartAsync(string cartId)
    {
        return await _db.KeyDeleteAsync(cartId);
    }
}