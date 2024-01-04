using STech.Core.Domain.Entities;

namespace STech.Core.DTO;

public class OrderResponseDTO
{
    public int Id { get; set; }
    public string PlacedOn { get; set; }
    
    public string CustomerName { get; set; }
    public string CustomerEmail { get; set; }
    public string CustomerPhone { get; set; }
    public string CustomerCountry { get; set; }
    public string CustomerCity { get; set; }
    public string CustomerAddress { get; set; }
    public string CustomerZipCode { get; set; }
    
    public string DeliveryMethod { get; set; }
    public string PaymentMethod { get; set; }
    public decimal ShippingPrice { get; set; }
    public IReadOnlyList<OrderItemDTO> OrderItems { get; set; }
    public decimal TotalAmount { get; set; }
    public decimal FinalAmount { get; set; }
    public OrderHistoryDTO OrderHistory { get; set; }
}