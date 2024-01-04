using STech.Core.Domain.Entities;
using STech.Core.Domain.Specifications.ProductsSpec;
using STech.Core.DTO;
using STech.Core.Helpers;

namespace STech.Core.ServiceContracts.ProductServices;

public interface IProductServices
{
    Task<ProductResponse?> GetProductByIdAsync(int productID);
    Task<Product?> GetProductDetailsByIdAsync(int productID);
    Task<Product?> GetProductByNameAsync(string name);
    Task<Pagination<ProductResponse>> GetProductsAsync(ProductSpecParams productSpecParams);
    Task<Pagination<Product>> GetProductsDetailsAsync(ProductSpecParams productSpecParams);
    Task<List<Product>> GetAllProducts();
    Task<bool> AddProduct(Product product);
    Task<bool> UpdateProduct(Product product);
    Task UpdateProductStockQuantity(Order order);
    Task<bool> UpdateProductPictures(int productID, List<ProductPicture> newPictures);
    Task<bool> AddProductPictures(List<ProductPicture> newPictures);
    Task<bool> RemoveProductPictures(List<int> prodPicIDs);
    Task<bool> DeleteProduct(int productID);
}