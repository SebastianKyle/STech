namespace STech.Core.Domain.Entities;

public class MonthlyProfitRecord : BaseEntity
{
    public int Month { get; set; }
    public decimal Profit { get; set; }
    public int YearlyProfitRecordID { get; set; }
}