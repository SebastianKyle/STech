using Microsoft.AspNetCore.Http;
using STech.Core.Domain.Entities;
using STech.Core.DTO;

namespace STech.Core.ServiceContracts.PictureServices;

public interface IPictureServices
{
    Task<int> UploadImage(IFormFile picture, string fileName, string folderName);
    public Task<ProductPicture?> UploadProductImage(IFormFile picture, Product product);
    public Task<List<ProductPicture>> UploadProductImages(ProductImageDTO productImageDto);
    public Task<List<ProductPicture>> UpdateProductImages(ProductImageDTO productImageDto);
}