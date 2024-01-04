using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using STech.Areas.Commons;
using STech.Core.Domain.Entities;
using STech.Core.Domain.Specifications.CategorySpec;
using STech.Core.DTO;
using STech.Core.Helpers;
using STech.Core.ServiceContracts.CategoryServices;
using STech.Core.ServiceContracts.PictureServices;

namespace STech.Areas.DashboardAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "Administrator")]
    public class CategoryController : BaseDashboardApiController
    {
        #region vars

        private readonly ICategoryServices _categoryServices;
        private readonly IPictureServices _pictureServices;

        #endregion

        #region ctor

        public CategoryController(ICategoryServices categoryServices, IPictureServices pictureServices)
        {
            _categoryServices = categoryServices;
            _pictureServices = pictureServices;
        }

        #endregion

        [HttpGet("get")]
        public async Task<ActionResult<Pagination<Category>>> GetCategories([FromQuery] CategorySpecParams categorySpecParams)
        {
            return await _categoryServices.GetCategoriesAsync(categorySpecParams);
        }

        [HttpGet("toplevel")]
        public async Task<ActionResult<List<Category>>> GetTopLevelCategories()
        {
            return await _categoryServices.GetTopLevelCategoryAsync();
        }

        [HttpGet("getall")]
        public async Task<ActionResult<List<Category>>> GetAllCategories()
        {
            return await _categoryServices.GetAllCategoriesAsync();
        }

        [HttpGet("count")]
        public async Task<ActionResult<int>> GetAllCategoriesCount()
        {
            var categories = await _categoryServices.GetAllCategoriesAsync();

            return categories.Count;
        }
        
        [HttpPost("create")]
        public async Task<ActionResult> CreateCategory([FromForm] CategoryDTO category)
        {
            var newCategory = new Category()
            {
                Name = category.Name,
                Description = category.Description,
                ModifiedOn = DateTime.Now
            };

            if (category.ParentCategoryID > 0)
            {
                newCategory.ParentCategoryID = category.ParentCategoryID;
            }
            
            var result = await _categoryServices.AddCategory(newCategory);

            if (!result)
            {
                return BadRequest(new ApiResponse(400, "Problem creating new category"));
            }

            var addedCategory = await _categoryServices.GetCategoryByNameAsync(category.Name);
            if (addedCategory != null && category.Picture != null)
            {
                string fileName = addedCategory.ID + "_" + Guid.NewGuid().ToString();
                string folderName = "categories";
                int pictureID = await _pictureServices.UploadImage(category.Picture, fileName, folderName);
                if (pictureID == -1)
                {
                    return BadRequest(new ApiResponse(400, "Problem uploading category image"));
                } 
                
                addedCategory.PictureID = pictureID;

                var updateResult = await _categoryServices.UpdateCategory(addedCategory);
                if (!updateResult)
                {
                    return BadRequest(new ApiResponse(400, "Problem updating category image"));
                }
            }

            return Ok();
        }

        [HttpPost("update")]
        public async Task<ActionResult> UpdateCategory([FromForm] CategoryDTO category)
        {
            if (category.ID == null)
            {
                return BadRequest(new ApiResponse(400, "No category ID provided"));
            }
            
            var matchingCategory = await _categoryServices.GetCategoryByIdAsync(category.ID);
            matchingCategory.Name = category.Name;

            if (category.ParentCategoryID > 0)
            {
                matchingCategory.ParentCategoryID = category.ParentCategoryID;
            }
            
            matchingCategory.Description = category.Description;
            matchingCategory.ModifiedOn = DateTime.Now;

            if (category.Picture != null)
            {
                string fileName = matchingCategory.ID + "_" + Guid.NewGuid().ToString();
                string folderName = "categories";
                int pictureID = await _pictureServices.UploadImage(category.Picture, fileName, folderName);
                if (pictureID == -1)
                {
                    return BadRequest(new ApiResponse(400, "Problem uploading category image"));
                }

                matchingCategory.PictureID = pictureID;
            }

            var result = await _categoryServices.UpdateCategory(matchingCategory);

            if (!result)
            {
                return BadRequest(new ApiResponse(400, "Problem uploading category"));
            }

            return Ok();
        }

        [HttpDelete("delete/{categoryID}")]
        public async Task<ActionResult> DeleteCategory(int categoryID)
        {
            var matchingCategory = await _categoryServices.GetCategoryByIdAsync(categoryID);
            if (matchingCategory.Products.Count > 0)
            {
                return BadRequest(new ApiResponse(400,
                    "Can not delete category. There are still products that are related to it!"));
            }
            
            var result = await _categoryServices.DeleteCategory(categoryID);

            if (!result)
            {
                return BadRequest(new ApiResponse(400, "Problem deleting category"));
            }

            return Ok();
        }

    }
}
