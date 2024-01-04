using STech.Core.Domain.Entities.CustomEntities;

namespace STech.Core.DTO;

public class CategoriesResponse
{
    public List<CategoryWithChildren> CategoryWithChildren { get; set; }
}