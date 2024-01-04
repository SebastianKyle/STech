namespace STech.Core.Domain.Entities;

public class OrderItem : BaseEntity
{
    public int OrderID { get; set; }
    public int ProductID { get; set; }
    public virtual Product Product { get; set; }
    public string ProductName { get; set; }
    public decimal ItemPrice { get; set; }
    public int Quantity { get; set; }
}