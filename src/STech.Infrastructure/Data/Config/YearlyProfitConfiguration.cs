using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using STech.Core.Domain.Entities;

namespace STech.Infrastructure.Data.Config;

public class YearlyProfitConfiguration : IEntityTypeConfiguration<YearlyProfitRecord>
{
    public void Configure(EntityTypeBuilder<YearlyProfitRecord> builder)
    {
        builder.Property(o => o.TotalProfit).HasColumnType("decimal(18, 2)");
    }
}