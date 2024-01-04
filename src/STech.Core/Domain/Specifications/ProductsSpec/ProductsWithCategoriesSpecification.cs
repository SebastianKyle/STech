using STech.Core.Domain.Entities;

namespace STech.Core.Domain.Specifications.ProductsSpec;

public class ProductsWithCategoriesSpecification : BaseSpecification<Product>
{
    public ProductsWithCategoriesSpecification(ProductSpecParams productSpecParams)
        : base(x =>
            (string.IsNullOrEmpty(productSpecParams.SearchTerm) || x.Name.Contains(productSpecParams.SearchTerm)) &&
            (!productSpecParams.CategoryID.HasValue || x.CategoryID == productSpecParams.CategoryID))
    {
        AddInclude(x => x.Category); 
        AddStringInclude("ProductPictures.Picture");
        AddOrderBy(x => x.Name);
        
        ApplyPaging(productSpecParams.PageSize * (productSpecParams.PageIndex - 1), productSpecParams.PageSize);

        if (!string.IsNullOrEmpty(productSpecParams.Sort))
        {
            switch (productSpecParams.Sort)
            {
                case "priceAsc": 
                    AddOrderBy(p => p.Price);
                    break;
                case "priceDesc": 
                    AddOrderByDescending(p => p.Price);
                    break;
                default: 
                    AddOrderBy(n => n.Name);
                    break;
            }
        }
    }

    public ProductsWithCategoriesSpecification(int id)
        : base(x => x.ID == id)
    {
        AddInclude(x => x.Category);
        AddStringInclude("ProductPictures.Picture");
        AddOrderBy(x => x.Name);
    }

    public ProductsWithCategoriesSpecification(string name)
        : base(x => x.Name == name)
    {
        AddInclude(x => x.Category);
        AddStringInclude("ProductPictures.Picture");
        AddOrderBy(x => x.Name);
    }
}