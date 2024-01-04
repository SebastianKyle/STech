using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using STech.Areas.Commons;
using STech.Core.Domain.Entities;
using STech.Core.Domain.Entities.CustomEntities;
using STech.Core.Domain.Specifications.ProductsSpec;
using STech.Core.DTO;
using STech.Core.Helpers;
using STech.Core.ServiceContracts.CommentServices;
using STech.Core.ServiceContracts.ProductServices;

namespace STech.Areas.RegularAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : BaseApiController
    {
        #region vars

        private readonly IProductServices _productServices;
        private readonly ICommentServices _commentServices;

        #endregion

        #region ctor

        public ProductsController(IProductServices productServices, ICommentServices commentServices)
        {
            _productServices = productServices;
            _commentServices = commentServices;
        }

        #endregion

        [HttpGet]
        [Cached(600)]
        public async Task<ActionResult<Pagination<ProductResponse>>> GetProducts([FromQuery] ProductSpecParams productSpecParams)
        {
            Pagination<ProductResponse> paginationResponse = await _productServices.GetProductsAsync(productSpecParams);

            return Ok(paginationResponse);
        }

        [HttpGet("{id}")]
        [Cached(600)]
        public async Task<ActionResult<ProductResponseDetails?>> GetProduct(int id)
        {
            ProductResponse? productResponse = await _productServices.GetProductByIdAsync(id);
            
            if (productResponse == null)
            {
                return NotFound(new ApiResponse(404));
            }
            
            ProductRating ratings = await _commentServices.GetProductRatingAsync(id);
            ProductResponseDetails productResponseDetails = new ProductResponseDetails()
            {
                ProductID = productResponse.ProductID,
                Name = productResponse.Name,
                Description = productResponse.Description,
                Price = productResponse.Price,
                StockQuantity = productResponse.StockQuantity,
                PictureUrls = productResponse.PictureUrls,
                CategoryName = productResponse.CategoryName,
                Ratings = ratings
            };

            return Ok(productResponseDetails);
        }
    }
}
