using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using STech.Core.Domain.Entities;

namespace STech.Infrastructure.Data.Config;

public class OrderConfiguration : IEntityTypeConfiguration<Order>
{
    public void Configure(EntityTypeBuilder<Order> builder)
    {
        builder.HasMany(o => o.OrderItems).WithOne().OnDelete(DeleteBehavior.Cascade);
        builder.Property(o => o.TotalAmount).HasColumnType("decimal(18, 2)");
        builder.Property(o => o.FinalAmount).HasColumnType("decimal(18, 2)");
    }
}