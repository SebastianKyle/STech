namespace STech.Core.Domain.Entities;

public class Category : BaseEntity
{
    public string Name { get; set; }
    public string? Description { get; set; }
    public int? ParentCategoryID { get; set; }
    public virtual Category ParentCategory { get; set; }
    public int? PictureID { get; set; }
    public virtual Picture Picture { get; set; }
    public virtual List<Product> Products { get; set; }
}