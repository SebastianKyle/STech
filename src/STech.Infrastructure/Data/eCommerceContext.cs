using System.Reflection;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using STech.Core.Domain.Entities;

namespace STech.Infrastructure.Data;

public class eCommerceContext : IdentityDbContext<eCommerceUser, IdentityRole, string>
{
    public eCommerceContext(DbContextOptions<eCommerceContext> options) : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);
        
        builder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());

        builder.Entity<eCommerceUser>().ToTable("Users");
        builder.Entity<IdentityRole>().ToTable("Roles");
        builder.Entity<IdentityUserRole<string>>().ToTable("UserRoles");
        builder.Entity<IdentityUserClaim<string>>().ToTable("UserClaims");
        builder.Entity<IdentityUserLogin<string>>().ToTable("UserLogins");
    }

    public virtual DbSet<Category> Categories { get; set; }
    public virtual DbSet<Product> Products { get; set; }
    public virtual DbSet<Picture> Pictures { get; set; }
    public virtual DbSet<ProductPicture> ProductPictures { get; set; }
    public virtual DbSet<Comment> Comments { get; set; }
    public virtual DbSet<Order> Orders { get; set; }
    public virtual DbSet<OrderHistory> OrderHistories { get; set; }
    public virtual DbSet<DeliveryMethod> DeliveryMethods { get; set; }
    public virtual DbSet<YearlyProfitRecord> YearlyProfitRecords { get; set; }
    public virtual DbSet<MonthlyProfitRecord> MonthlyProfitRecords { get; set; }
}