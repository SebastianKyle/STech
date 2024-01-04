namespace STech.Core.Domain.Specifications.OrderSpec;

public class OrderSpecParams : BaseSpecParams
{
    public string? CustomerEmail { get; set; }
    public int? OrderID { get; set; }
    public int? OrderStatus { get; set; }
}