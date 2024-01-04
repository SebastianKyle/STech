using System.Net;
using System.Text.Json;
using Azure.Core;
using STech.Areas.Commons;

namespace STech.Middleware;

public class ExceptionHandlingMiddleware
{
    #region vars

    private readonly RequestDelegate _next;
    private readonly ILogger<ExceptionHandlingMiddleware> _logger;
    private readonly IHostEnvironment _env;

    #endregion

    #region ctor

    public ExceptionHandlingMiddleware(RequestDelegate next, ILogger<ExceptionHandlingMiddleware> logger,
        IHostEnvironment env)
    {
        _next = next;
        _logger = logger;
        _env = env;
    }

    #endregion

    public async Task InvokeAsync(HttpContext context)
    {
        try
        {
            await _next(context);
        }
        catch (System.Exception ex)
        {
            LogException(ex);
            context.Response.ContentType = "application/json";
            context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;

            var response = _env.IsDevelopment()
                ? new ApiException((int)HttpStatusCode.InternalServerError, ex.Message, ex.StackTrace.ToString())
                : new ApiException((int)HttpStatusCode.InternalServerError);

            var options = new JsonSerializerOptions()
            {
                PropertyNamingPolicy = JsonNamingPolicy.CamelCase
            };

            var json = System.Text.Json.JsonSerializer.Serialize(response, options);
            await context.Response.WriteAsync(json);
        }
    }

    private void LogException(Exception ex)
    {
        if (ex.InnerException != null)
        {
            if (ex.InnerException.InnerException != null)
            {
                _logger.LogError("{ExceptionType} - {ExceptionMessage}",
                    ex.InnerException.InnerException.GetType().ToString(), ex.InnerException.InnerException.Message);
            }
            else
            {
                _logger.LogError("{ExceptionType} - {ExceptionMessage}", ex.InnerException.GetType().ToString(),
                    ex.InnerException.Message);
            }
        }
        else
        {
            _logger.LogError("{ExceptionType} - {ExceptionMessage}", ex.GetType().ToString(), ex.Message);
        }
    }
}

public static class ExceptionHandlingMiddlewareExtensions
{
    public static IApplicationBuilder UseExceptionHandlingMiddleware(this IApplicationBuilder builder)
    {
        return builder.UseMiddleware<ExceptionHandlingMiddleware>();
    }
}