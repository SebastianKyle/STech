using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using STech.Core.Domain.Entities;

namespace STech.Infrastructure.Data.Config;

public class MonthlyProfitConfiguration : IEntityTypeConfiguration<MonthlyProfitRecord>
{
    public void Configure(EntityTypeBuilder<MonthlyProfitRecord> builder)
    {
        builder.Property(o => o.Profit).HasColumnType("decimal(18, 2)");
    }
}