namespace STech.Core.DTO;

public class OrderItemDTO
{
    public int ProductID { get; set; }
    public string ProductName { get; set; }
    public string PictureUrl { get; set; }
    public decimal Price { get; set; }
    public int Quantity { get; set; }
}