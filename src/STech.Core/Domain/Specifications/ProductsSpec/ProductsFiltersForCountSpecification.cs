using STech.Core.Domain.Entities;

namespace STech.Core.Domain.Specifications.ProductsSpec;

public class ProductsFiltersForCountSpecification : BaseSpecification<Product>
{
    public ProductsFiltersForCountSpecification(ProductSpecParams productSpecParams)
        : base(x =>
            (string.IsNullOrEmpty(productSpecParams.SearchTerm) || x.Name.Contains(productSpecParams.SearchTerm)) &&
            (!productSpecParams.CategoryID.HasValue || x.CategoryID == productSpecParams.CategoryID))
    {
        
    }
}