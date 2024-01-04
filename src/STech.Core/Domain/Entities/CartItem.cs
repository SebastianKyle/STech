namespace STech.Core.Domain.Entities;

public class CartItem
{
    public int ID { get; set; }
    public string ProductName { get; set; }
    public decimal Price { get; set; }
    public int Quantity { get; set; }
    public string PictureUrl { get; set; }
    public string CategoryName { get; set; }
    public int StockQuantity { get; set; }
}