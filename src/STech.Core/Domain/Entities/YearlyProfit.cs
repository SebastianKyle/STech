namespace STech.Core.Domain.Entities;

public class YearlyProfitRecord : BaseEntity
{
    public int Year { get; set; }
    public decimal TotalProfit { get; set; }
    public virtual List<MonthlyProfitRecord> MonthlyProfits { get; set; }
}