namespace STech.Core.Domain.Entities.CustomEntities;

public class CategoryWithChildren
{
    public Category Category { get; set; }
    public List<Category> Children { get; set; }
}