using System.Composition;
using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NuGet.Common;
using StackExchange.Redis;
using STech.Areas.Commons;
using STech.Core.Domain.Entities;
using STech.Core.Domain.RepositoryContracts;
using STech.Core.Domain.ServiceContracts;
using STech.Core.Helpers;
using STech.Core.ServiceContracts;
using STech.Core.ServiceContracts.CacheServices;
using STech.Core.ServiceContracts.CartServices;
using STech.Core.ServiceContracts.CategoryServices;
using STech.Core.ServiceContracts.CommentServices;
using STech.Core.ServiceContracts.OrderServices;
using STech.Core.ServiceContracts.PictureServices;
using STech.Core.ServiceContracts.ProductServices;
using STech.Core.ServiceContracts.ProfitServices;
using STech.Core.ServiceContracts.TokenServices;
using STech.Core.ServiceContracts.UserServices;
using STech.Infrastructure.Data;
using STech.Infrastructure.Repositories;
using STech.Infrastructure.Services;
using STech.Infrastructure.Services.CacheServices;
using STech.Infrastructure.Services.CartServices;
using STech.Infrastructure.Services.CategoryServices;
using STech.Infrastructure.Services.CommentServices;
using STech.Infrastructure.Services.OrderServices;
using STech.Infrastructure.Services.PaymentServices;
using STech.Infrastructure.Services.PictureServices;
using STech.Infrastructure.Services.ProductServices;
using STech.Infrastructure.Services.ProfitServices;
using STech.Infrastructure.Services.TokenServices;
using STech.Infrastructure.Services.UserServices;

namespace STech.Areas.StartupExtensions;

public static class ConfigureServicesExtension
{
    public static IServiceCollection ConfigureServices(this IServiceCollection services, IConfiguration config,
        IWebHostEnvironment env)
    {
        services.AddControllers().AddJsonOptions(options =>
        {
            options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
        });
        
        /* Services and repositories */

        #region services
        
        services.AddSingleton<IResponseCacheServices, ResponseCacheServices>();
        services.AddScoped<ICartServices, CartServices>();
        services.AddScoped<ICategoryServices, CategoryServices>();
        services.AddScoped<ICommentServices, CommentServices>();
        services.AddScoped<IOrderServices, OrderServices>();
        services.AddScoped<IPaymentServices, PaymentServices>();
        services.AddScoped<IPictureServices, PictureServices>();
        services.AddScoped<IProductServices, ProductServices>();
        services.AddScoped<IProfitServices, ProfitServices>();
        services.AddScoped<ITokenServices, TokenServices>();
        services.AddScoped<IUserServices, UserServices>();
        services.AddScoped<ISharedServices, SharedServices>();

        #endregion

        #region repos

        services.AddScoped<ICartRepository, CartRepository>();
        services.AddScoped<IUnitOfWork, UnitOfWork>();
        services.AddScoped(typeof(IGenericRepository<>), typeof(GenericRepository<>));

        #endregion
        
        /* Auto mapper */
        services.AddAutoMapper(typeof(MappingProfiles));
        
        /* DbContext (Sql Server) */
        services.AddDbContext<eCommerceContext>(options =>
        {
            options.UseSqlServer(config.GetConnectionString("DefaultConnection"), sqlServerOptions =>
            {
                sqlServerOptions.EnableRetryOnFailure();
            });
        });
        
        /* Redis */
        services.AddSingleton<IConnectionMultiplexer>(c =>
        {
            var conf = new ConfigurationOptions();
            conf = ConfigurationOptions.Parse(config.GetConnectionString("Redis"));

            return ConnectionMultiplexer.Connect(conf);
        });
        
        /* Identity services */
        services.AddIdentityServices(config);

        services.Configure<ApiBehaviorOptions>(options =>
        {
            options.InvalidModelStateResponseFactory = actionContext =>
            {
                var errors = actionContext.ModelState.Where(e => e.Value.Errors.Count > 0)
                    .SelectMany(x => x.Value.Errors)
                    .Select(x => x.ErrorMessage).ToList();

                var errorResponse = new ApiValidationErrorResponse()
                {
                    Errors = errors
                };

                return new BadRequestObjectResult(errorResponse);
            };
        });

        return services;
    }
}