using System.Text.Json;
using StackExchange.Redis;
using STech.Core.ServiceContracts.CacheServices;

namespace STech.Infrastructure.Services.CacheServices;

public class ResponseCacheServices : IResponseCacheServices
{
    #region vars

    private readonly IDatabase _db; 

    #endregion

    #region ctor

    public ResponseCacheServices(IConnectionMultiplexer redis)
    {
        _db = redis.GetDatabase();
    } 

    #endregion
    
    public async Task CacheResponseAsync(string cacheKey, object response, TimeSpan timeToLive)
    {
        if (response == null)
        {
            return;
        }

        var options = new JsonSerializerOptions()
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase
        };
        
        var serializedResponse = JsonSerializer.Serialize(response, options);
        await _db.StringSetAsync(cacheKey, serializedResponse, timeToLive);
    }

    public async Task<string> GetCachedResponseAsync(string cacheKey)
    {
        var cachedResponse = await _db.StringGetAsync(cacheKey);

        if (cachedResponse.IsNullOrEmpty)
        {
            return null;
        }

        return cachedResponse;
    }
}