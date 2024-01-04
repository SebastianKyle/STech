using Microsoft.AspNetCore.Http;

namespace STech.Core.DTO;

public class ProductImageDTO
{
    public int ProductID { get; set; }
    public List<IFormFile> Images { get; set; }
}