using STech.Core.Domain.Entities;

namespace STech.Core.Domain.Specifications.CategorySpec;

public class CategoriesSpecification : BaseSpecification<Category>
{
    public CategoriesSpecification(CategorySpecParams categorySpecParams)
        : base(x =>
            (string.IsNullOrEmpty(categorySpecParams.SearchTerm) || x.Name.Contains(categorySpecParams.SearchTerm))
        )
    {
        AddInclude(x => x.ParentCategory);
        AddInclude(x => x.Products);
        AddInclude(x => x.Picture);
        AddOrderBy(x => x.Name);
        
        ApplyPaging(categorySpecParams.PageSize * (categorySpecParams.PageIndex - 1), categorySpecParams.PageSize);
    }

    public CategoriesSpecification(int categoryID)
        : base(x => x.ID == categoryID)
    {
        AddInclude(x => x.ParentCategory);
        AddInclude(x => x.Picture);
        AddInclude(x => x.Products);
        AddOrderBy(x => x.Name);
    }

    public CategoriesSpecification(string name)
        : base(x => x.Name == name)
    {
        AddInclude(x => x.ParentCategory);
        AddInclude(x => x.Picture);
        AddOrderBy(x => x.Name);
    }

    public CategoriesSpecification()
        : base()
    {
        AddInclude(x => x.ParentCategory);
        AddInclude(x => x.Products);
        AddOrderBy(x => x.Name);
    }
}