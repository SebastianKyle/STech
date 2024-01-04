using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using STech.Core.Domain.Entities;

namespace STech.Infrastructure.Data.Config;

public class ProductConfiguration : IEntityTypeConfiguration<Product>
{
    public void Configure(EntityTypeBuilder<Product> builder)
    {
        builder.Property(p => p.ID).IsRequired();
        builder.Property(p => p.Name).IsRequired();
        builder.Property(p => p.Description).IsRequired();
        builder.Property(p => p.Price).HasColumnType("decimal(18, 2)");
        builder.Property(p => p.Cost).HasColumnType("decimal(18, 2)");
    }
}