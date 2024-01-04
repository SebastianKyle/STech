namespace STech.Core.ServiceContracts.CacheServices;

public interface IResponseCacheServices
{
    Task CacheResponseAsync(string cacheKey, object response, TimeSpan timeToLive);
    Task<string> GetCachedResponseAsync(string cacheKey);
}