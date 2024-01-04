using System.Text;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.DependencyInjection;
using STech.Core.ServiceContracts.CacheServices;

namespace STech.Core.Helpers;

public class CachedAttribute : Attribute, IAsyncActionFilter
{
    #region vars

    private readonly int _timeToLiveSeconds; 

    #endregion

    #region ctor

    public CachedAttribute(int timeToLiveSeconds)
    {
        _timeToLiveSeconds = timeToLiveSeconds;
    } 

    #endregion
    
    public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
    {
        var cacheService = context.HttpContext.RequestServices.GetRequiredService<IResponseCacheServices>();
        var cacheKey = GenerateCacheKeyFromRequest(context.HttpContext.Request);
        
        var cachedResponse = await cacheService.GetCachedResponseAsync(cacheKey);

        if (!string.IsNullOrEmpty(cachedResponse))
        {
            var contentResult = new ContentResult
            {
                Content = cachedResponse,
                ContentType = "application/json",
                StatusCode = 200
            };
            context.Result = contentResult;

            return;
        }

        var executedContent = await next();

        if (executedContent.Result is OkObjectResult okObjectResult)
        {
            await cacheService.CacheResponseAsync(cacheKey, okObjectResult.Value,
                TimeSpan.FromSeconds(_timeToLiveSeconds));
        }
    }

    private string GenerateCacheKeyFromRequest(HttpRequest request)
    {
        var keyBuilder = new StringBuilder();
        keyBuilder.Append($"{request.Path}");

        foreach (var (key, value) in request.Query.OrderBy(x => x.Key))
        {
            keyBuilder.Append($"|{key}-{value}");
        }

        return keyBuilder.ToString();
    }
}