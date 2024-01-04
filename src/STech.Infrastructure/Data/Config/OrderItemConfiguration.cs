using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using STech.Core.Domain.Entities;

namespace STech.Infrastructure.Data.Config;

public class OrderItemConfiguration : IEntityTypeConfiguration<OrderItem>
{
    public void Configure(EntityTypeBuilder<OrderItem> builder)
    {
        builder.Property(o => o.ItemPrice).HasColumnType("decimal(18, 2)");
    }
}