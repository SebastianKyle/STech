using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using STech.Areas.StartupExtensions;
using STech.Core.Domain.Entities;
using STech.Infrastructure.Data;
using STech.Middleware;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.ConfigureSwaggerServices();

builder.Services.ConfigureServices(builder.Configuration, builder.Environment);

var corsPolicy = "CorsPolicy";
builder.Services.AddCors(options =>
{
    options.AddPolicy(corsPolicy, policy =>
    {
        policy.AllowAnyHeader().AllowAnyMethod().WithOrigins("http://localhost:4200");
        policy.AllowAnyHeader().AllowAnyMethod().WithOrigins("https://localhost:44473");
        policy.AllowAnyHeader().AllowAnyMethod().WithOrigins("https://5791-171-227-116-52.ngrok-free.app");
    });
});

var app = builder.Build();

app.UseExceptionHandlingMiddleware();

app.UseStatusCodePagesWithReExecute("/Errors/{0}");

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseRouting();

app.UseCors(corsPolicy);

app.UseAuthentication();
app.UseAuthorization();

app.UseSwaggerDocumentation();

app.MapControllers();

using var scope = app.Services.CreateScope();
var services = scope.ServiceProvider;
var context = services.GetRequiredService<eCommerceContext>();
var userManager = services.GetRequiredService<UserManager<eCommerceUser>>();
var roleManager = services.GetRequiredService<RoleManager<IdentityRole>>();
var logger = services.GetRequiredService<ILogger<Program>>();
try
{
    await context.Database.MigrateAsync();
    await eCommerceDbInitializer.SeedRoles(roleManager);
    await eCommerceDbInitializer.SeedUsers(userManager);
    await eCommerceDbInitializer.SeedCategories(context);
}
catch (Exception ex)
{
    logger.LogError(ex, "An error occured during migration");
}

app.Run();