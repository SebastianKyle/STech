using STech.Core.Domain.Entities.CustomEntities;

namespace STech.Core.DTO;

public class ProductResponse
{
    public int ProductID { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public decimal Price { get; set; }
    public int StockQuantity { get; set; }
    public List<string> PictureUrls { get; set; }
    public string CategoryName { get; set; }
}

public class ProductResponseDetails
{
    public int ProductID { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public decimal Price { get; set; }
    public int StockQuantity { get; set; }
    public List<string> PictureUrls { get; set; }
    public string CategoryName { get; set; }
    public ProductRating Ratings { get; set; }  
}