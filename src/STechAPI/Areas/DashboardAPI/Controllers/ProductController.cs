using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using STech.Areas.Commons;
using STech.Core.Domain.Entities;
using STech.Core.Domain.Specifications.ProductsSpec;
using STech.Core.DTO;
using STech.Core.Helpers;
using STech.Core.ServiceContracts.PictureServices;
using STech.Core.ServiceContracts.ProductServices;

namespace STech.Areas.DashboardAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "Administrator")]
    public class ProductController : BaseDashboardApiController
    {
        #region vars

        private readonly IProductServices _productServices;
        private readonly IPictureServices _pictureServices;
        private readonly IMapper _mapper;

        #endregion

        #region ctor

        public ProductController(IProductServices productServices, IPictureServices pictureServices, IMapper mapper)
        {
            _productServices = productServices;
            _pictureServices = pictureServices;
            _mapper = mapper;
        } 

        #endregion

        [HttpGet("get")]
        public async Task<ActionResult<Pagination<Product>>> GetProducts([FromQuery] ProductSpecParams productSpecParams)
        {
            return await _productServices.GetProductsDetailsAsync(productSpecParams);
        }

        [HttpGet("get/{productID}")]
        public async Task<ActionResult<Product?>> GetProduct(int productID)
        {
            return await _productServices.GetProductDetailsByIdAsync(productID);
        }

        [HttpGet("count")]
        public async Task<ActionResult<int>> GetTotalProductsCount()
        {
            var products = await _productServices.GetAllProducts();

            return products.Count;
        }

        [HttpPost("create")]
        public async Task<ActionResult> CreateProduct([FromForm] ProductUpdateDTO productUpdateDto)
        {
            Product newProduct = new Product()
            {
                Name = productUpdateDto.Name,
                Description = productUpdateDto.Description,
                CategoryID = productUpdateDto.CategoryID,
                Price = productUpdateDto.Price,
                Cost = productUpdateDto.Cost,
                StockQuantity = productUpdateDto.StockQuantity
            };
            
            var result = await _productServices.AddProduct(newProduct);

            if (!result)
            {
                return BadRequest(new ApiResponse(400, "Problem creating new product"));
            }

            var addedProduct = await _productServices.GetProductByNameAsync(newProduct.Name);

            if (addedProduct != null)
            {
                List<ProductPicture> prodPics = new List<ProductPicture>();
                foreach (IFormFile picture in productUpdateDto.Pictures)
                {
                    var prodPic = await _pictureServices.UploadProductImage(picture, addedProduct);
                    if (prodPic == null)
                    {
                        return BadRequest(new ApiResponse(400, "Problem uploading product images"));
                    }
                    
                    prodPics.Add(prodPic);
                }

                if (prodPics.Count > 0)
                {
                    var prodPicResult = await _productServices.AddProductPictures(prodPics);
                    if (!prodPicResult)
                    {
                        return BadRequest(new ApiResponse(400, "Problem updating product pictures"));
                    }
                }
                
                return Ok(new ApiResponse(200, "Create product successfully"));
            }
            
            return BadRequest(new ApiResponse(400, "Problem creating new product"));
        }

        [HttpPost("update")]
        public async Task<ActionResult> UpdateProduct([FromForm] ProductUpdateDTO productUpdateDto)
        {
            var matchingProduct = await _productServices.GetProductDetailsByIdAsync(productUpdateDto.ID);
            matchingProduct.Name = productUpdateDto.Name;
            matchingProduct.Description = productUpdateDto.Description;
            matchingProduct.CategoryID = productUpdateDto.CategoryID;
            matchingProduct.Price = productUpdateDto.Price;
            matchingProduct.Cost = productUpdateDto.Cost;
            matchingProduct.StockQuantity = productUpdateDto.StockQuantity;

            if (productUpdateDto.ProdPicIDsToRemove != null && productUpdateDto.ProdPicIDsToRemove.Count > 0)
            {
                var prodPicRemovingRes = await _productServices.RemoveProductPictures(productUpdateDto.ProdPicIDsToRemove);
                if (!prodPicRemovingRes)
                {
                    return BadRequest(new ApiResponse(400, "Problem removing product pictures"));
                } 
            }

            List<ProductPicture> prodPics = new List<ProductPicture>();
            foreach (IFormFile picture in productUpdateDto.Pictures)
            {
                var prodPic = await _pictureServices.UploadProductImage(picture, matchingProduct);
                prodPics.Add(prodPic);
            }

            if (prodPics.Count > 0)
            {
                var prodPicResult = await _productServices.AddProductPictures(prodPics);
                if (!prodPicResult)
                {
                    return BadRequest(new ApiResponse(400, "Problem updating product pictures"));
                }
            }

            var result = await _productServices.UpdateProduct(matchingProduct);

            if (!result)
            {
                return BadRequest(new ApiResponse(400, "Problem updating product"));
            }

            return Ok(new ApiResponse(200, "Update product successfully"));
        }

        [HttpDelete("deleteprodpic/{prodPicID}")]
        public async Task<ActionResult> RemoveProductPicture(int prodPicID)
        {
            List<int> prodPicIDs = new List<int>() { prodPicID };
            var result = await _productServices.RemoveProductPictures(prodPicIDs);

            if (!result)
            {
                return BadRequest(new ApiResponse(400, "Problem removing product picture"));
            }

            return Ok();
        }

        [HttpDelete("delete/{productID}")]
        public async Task<ActionResult> DeleteProduct(int productID)
        {
            var result = await _productServices.DeleteProduct(productID);

            if (!result)
            {
                return BadRequest(new ApiResponse(400, "Problem deleting product"));
            }

            return Ok(new ApiResponse(200, "Delete product successfully"));
        }
    }
}
