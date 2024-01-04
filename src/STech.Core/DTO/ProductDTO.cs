using STech.Core.Domain.Entities;

namespace STech.Core.DTO;

public class ProductDTO
{
    public string Name { get; set; }
    public string Description { get; set; }
    public decimal Price { get; set; }
    public int CategoryID { get; set; }
}