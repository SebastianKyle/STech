namespace STech.Core.Domain.Entities;

public class Order : BaseEntity
{
    public string CustomerID { get; set; }
    public string CustomerName { get; set; }
    public string CustomerEmail { get; set; }
    public string CustomerPhone { get; set; }
    public string CustomerCountry { get; set; }
    public string CustomerCity { get; set; }
    public string CustomerAddress { get; set; }
    public string CustomerZipCode { get; set; }

    public int PaymentMethod { get; set; }
    public decimal TotalAmount { get; set; }
    public decimal FinalAmount { get; set; }
    public DateTime PlacedOn { get; set; }
    
    public virtual List<OrderItem> OrderItems { get; set; }
    public virtual List<OrderHistory> OrderHistories { get; set; }

    public int DeliveryMethodID { get; set; }
    public virtual DeliveryMethod DeliveryMethod { get; set; }
    
    public string? PaymentIntentID { get; set; }
}