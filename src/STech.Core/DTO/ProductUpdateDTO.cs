using Microsoft.AspNetCore.Http;

namespace STech.Core.DTO;

public class ProductUpdateDTO
{
    public int ID { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public int CategoryID { get; set; }
    public decimal Price { get; set; }
    public decimal Cost { get; set; }
    public int StockQuantity { get; set; }
    public List<IFormFile>? Pictures { get; set; } = new List<IFormFile>();
    public List<int>? ProdPicIDsToRemove { get; set; } = new List<int>();
}