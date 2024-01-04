using System.Net;
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using STech.Core.Domain.Entities;
using STech.Core.DTO;
using STech.Core.ServiceContracts;
using STech.Core.ServiceContracts.PictureServices;
using STech.Core.ServiceContracts.ProductServices;
using Stripe;
using Account = CloudinaryDotNet.Account;
using Product = STech.Core.Domain.Entities.Product;

namespace STech.Infrastructure.Services.PictureServices;

public class PictureServices : IPictureServices
{
    #region vars

    private readonly IConfiguration _config;
    private readonly ISharedServices _sharedServices;
    private readonly IProductServices _productServices;

    #endregion

    #region ctor

    public PictureServices(IConfiguration config, ISharedServices sharedServices, IProductServices productServices)
    {
        _config = config;
        _sharedServices = sharedServices;
        _productServices = productServices;
    }

    #endregion

    public async Task<int> UploadImage(IFormFile picture, string fileName, string folderName)
    {
        Account account = new Account()
        {
            ApiKey = _config["Cloudinary:ApiKey"],
            ApiSecret = _config["Cloudinary:ApiSecret"],
            Cloud = _config["Cloudinary:Cloud"]
        };

        Cloudinary cloud = new Cloudinary(account);

        Picture newPic = new Picture();
        int picID = -1;

        ImageUploadResult result;
        using (var stream = picture.OpenReadStream())
        {
            var uploadParams = new ImageUploadParams()
            {
                File = new FileDescription(fileName, stream),
                Folder = folderName,
                PublicId = fileName
            };

            result = await cloud.UploadAsync(uploadParams);

            if (result.StatusCode == HttpStatusCode.OK)
            {
                newPic.Url = result.SecureUrl.ToString();
                newPic.ModifiedOn = DateTime.Now;

                picID = await _sharedServices.AddPicture(newPic);
            }
        }

        return picID;
    }

    public async Task<ProductPicture?> UploadProductImage(IFormFile picture, Product product)
    {
        string fileName = product.ID + "_" + Guid.NewGuid().ToString();
        string folderName = "Products";
        
        Account account = new Account()
        {
            ApiKey = _config["Cloudinary:ApiKey"],
            ApiSecret = _config["Cloudinary:ApiSecret"],
            Cloud = _config["Cloudinary:Cloud"]
        };

        Cloudinary cloud = new Cloudinary(account);

        ProductPicture prodPic = new ProductPicture();
        Picture newPic = new Picture();
        int picID = -1;

        ImageUploadResult result;
        using (var stream = picture.OpenReadStream())
        {
            var uploadParams = new ImageUploadParams()
            {
                File = new FileDescription(fileName, stream),
                Folder = folderName,
                PublicId = fileName
            };

            result = await cloud.UploadAsync(uploadParams);

            if (result.StatusCode == HttpStatusCode.OK)
            {
                newPic.Url = result.SecureUrl.ToString();
                newPic.ModifiedOn = DateTime.Now;

                picID = await _sharedServices.AddPicture(newPic);
            }
        }

        if (picID > 0)
        {
            prodPic.ProductID = product.ID;
            prodPic.PictureID = picID;
            prodPic.Picture = newPic;
            prodPic.ModifiedOn = DateTime.Now;

            return prodPic;
        }

        return null;
    }

    public async Task<List<ProductPicture>> UploadProductImages(ProductImageDTO productImageDto)
    {
        Account account = new Account()
        {
            ApiKey = _config["Cloudinary:ApiKey"],
            ApiSecret = _config["Cloudinary:ApiSecret"],
            Cloud = _config["Cloudinary:Cloud"]
        };

        Cloudinary cloud = new Cloudinary(account);

        List<ProductPicture> productPictures = new List<ProductPicture>();
        List<Picture> pictures = new List<Picture>();

        foreach (IFormFile img in productImageDto.Images)
        {
            ImageUploadResult result;
            string imgName = productImageDto.ProductID.ToString() + "_" + Guid.NewGuid().ToString();

            using (var stream = img.OpenReadStream())
            {
                var uploadParams = new ImageUploadParams()
                {
                    File = new FileDescription(imgName, stream),
                    Folder = "Products",
                    PublicId = imgName
                };

                result = await cloud.UploadAsync(uploadParams);

                pictures.Add(new Picture()
                {
                    Url = result.SecureUrl.ToString(),
                    ModifiedOn = DateTime.Now
                }); 
            }
        }

        foreach (Picture picture in pictures)
        {
            var picID = await _sharedServices.AddPicture(picture);
            productPictures.Add(new ProductPicture()
            {
                PictureID = picID,
                ProductID = productImageDto.ProductID,
                Picture = picture,
                ModifiedOn = DateTime.Now
            });
        }

        return productPictures;
    }

    public async Task<List<ProductPicture>> UpdateProductImages(ProductImageDTO productImageDto)
    {
        List<ProductPicture> newProductPictures = await UploadProductImages(productImageDto);
        await _productServices.UpdateProductPictures(productImageDto.ProductID, newProductPictures);

        return newProductPictures;
    }
}