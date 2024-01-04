using AutoMapper;
using STech.Core.Domain.Entities;
using STech.Core.Domain.RepositoryContracts;
using STech.Core.Domain.Specifications;
using STech.Core.Domain.Specifications.ProductsSpec;
using STech.Core.DTO;
using STech.Core.Helpers;
using STech.Core.ServiceContracts.ProductServices;

namespace STech.Infrastructure.Services.ProductServices;

public class ProductServices : IProductServices
{
    #region vars

    private readonly IGenericRepository<Product> _productRepo;
    private readonly IGenericRepository<ProductPicture> _prodPicRepo;
    private readonly IUnitOfWork _unitOfWork;

    private readonly IMapper _mapper;

    #endregion

    #region ctor

    public ProductServices(IUnitOfWork unitOfWork, IMapper mapper)
    {
        _unitOfWork = unitOfWork; 
        
        _productRepo = _unitOfWork.Repository<Product>();
        _prodPicRepo = _unitOfWork.Repository<ProductPicture>();

        _mapper = mapper;
    }

    #endregion
    
    public async Task<ProductResponse?> GetProductByIdAsync(int productID)
    {
        var spec = new ProductsWithCategoriesSpecification(productID) { };
        Product? matchingProduct = await _productRepo.GetEntityWithSpec(spec);

        return _mapper.Map<Product, ProductResponse>(matchingProduct);
    }

    public async Task<Product?> GetProductDetailsByIdAsync(int productID)
    {
        var spec = new ProductsWithCategoriesSpecification(productID);
        return await _productRepo.GetEntityWithSpec(spec);
    }

    public async Task<Product?> GetProductByNameAsync(string name)
    {
        var spec = new ProductsWithCategoriesSpecification(name);
        return await _productRepo.GetEntityWithSpec(spec);
    }

    public async Task<Pagination<ProductResponse>> GetProductsAsync(ProductSpecParams productSpecParams)
    {
        var spec = new ProductsWithCategoriesSpecification(productSpecParams);
        List<Product> prodList = await _productRepo.ListAsync(spec);

        var countSpec = new ProductsFiltersForCountSpecification(productSpecParams);
        var totalItems = await _productRepo.CountAsync(countSpec);

        List<ProductResponse> productResponses = _mapper.Map<List<Product>, List<ProductResponse>>(prodList);

        return new Pagination<ProductResponse>(productSpecParams.PageIndex, productSpecParams.PageSize, totalItems, productResponses);
    }

    public async Task<Pagination<Product>> GetProductsDetailsAsync(ProductSpecParams productSpecParams)
    {
        var spec = new ProductsWithCategoriesSpecification(productSpecParams);
        List<Product> prodList = await _productRepo.ListAsync(spec);

        var countSpec = new ProductsFiltersForCountSpecification(productSpecParams);
        var totalItems = await _productRepo.CountAsync(countSpec);

        return new Pagination<Product>(productSpecParams.PageIndex, productSpecParams.PageSize, totalItems, prodList);
    }

    public async Task<List<Product>> GetAllProducts()
    {
        return await _productRepo.ListAllAsync();
    }

    public async Task<bool> AddProduct(Product product)
    {
        _productRepo.Add(product);

        return await _unitOfWork.Complete() > 0;
    }

    public async Task<bool> UpdateProduct(Product product)
    {
        _productRepo.Update(product);

        return await _unitOfWork.Complete() > 0;
    }

    public async Task UpdateProductStockQuantity(Order order)
    {
        foreach (OrderItem orderItem in order.OrderItems)
        {
            var matchingProduct = await _productRepo.GetByIdAsync(orderItem.ProductID);
            matchingProduct.StockQuantity = matchingProduct.StockQuantity - orderItem.Quantity;
            
            _productRepo.Update(matchingProduct);
        }

        await _unitOfWork.Complete();
    }

    public async Task<bool> UpdateProductPictures(int productID, List<ProductPicture> newPictures)
    {
        var spec = new BaseSpecification<ProductPicture>(x => x.ProductID == productID);
        var oldPictures = await _prodPicRepo.ListAsync(spec);
        
        _prodPicRepo.DeleteRange(oldPictures);
        _prodPicRepo.AddRange(newPictures);

        return await _unitOfWork.Complete() > 0;
    }

    public async Task<bool> AddProductPictures(List<ProductPicture> newPictures)
    {
        _prodPicRepo.AddRange(newPictures);
        return await _unitOfWork.Complete() > 0;
    }

    public async Task<bool> RemoveProductPictures(List<int> prodPicIDs)
    {
        List<ProductPicture> prodPics = new List<ProductPicture>();
        foreach (int id in prodPicIDs)
        {
            var matchingProdPic = await _prodPicRepo.GetByIdAsync(id);
            prodPics.Add(matchingProdPic);
        }
        
        _prodPicRepo.DeleteRange(prodPics);

        return await _unitOfWork.Complete() > 0;
    }

    public async Task<bool> DeleteProduct(int productID)
    {
        Product? matchingProduct = await _productRepo.GetByIdAsync(productID);

        if (matchingProduct == null)
        {
            return false;
        }
        
        _productRepo.Delete(matchingProduct);

        return await _unitOfWork.Complete() > 0;
    }
}