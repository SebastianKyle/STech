namespace STech.Core.Domain.Entities;

public class Product : BaseEntity
{
    public decimal Price { get; set; }
    public decimal Cost { get; set; }
    public int StockQuantity { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public int CategoryID { get; set; }
    public virtual Category Category { get; set; }
    public virtual List<ProductPicture> ProductPictures { get; set; }
}