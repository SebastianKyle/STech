using Microsoft.AspNetCore.Http;

namespace STech.Core.DTO;

public class CategoryDTO
{
    public int ID { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public int? ParentCategoryID { get; set; }
    public IFormFile? Picture { get; set; }
}