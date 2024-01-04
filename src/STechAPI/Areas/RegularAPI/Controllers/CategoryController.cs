using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using STech.Core.Domain.Entities;
using STech.Core.Domain.Specifications.CategorySpec;
using STech.Core.DTO;
using STech.Core.Helpers;
using STech.Core.ServiceContracts.CategoryServices;

namespace STech.Areas.RegularAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : BaseApiController
    {
        #region vars

        private readonly ICategoryServices _categoryServices;

        #endregion

        #region ctor

        public CategoryController(ICategoryServices categoryServices)
        {
            _categoryServices = categoryServices;
        } 

        #endregion

        [HttpGet("all")]
        [Cached(600)]
        public async Task<ActionResult<CategoriesResponse?>> GetCategoriesMenu()
        {
            CategoriesResponse categoriesResponse = new CategoriesResponse();
            var categories = await _categoryServices.GetAllCategoriesAsync(true);

            if (categories != null && categories.Count > 0)
            {
                // Remove uncategorized category
                categories = categories.Where(x => x.ID != 1).ToList();

                categoriesResponse.CategoryWithChildren = CategoryHelper.MakeCategoriesHierarchy(categories);
            }
            else
            {
                return null;
            }

            return categoriesResponse;
        }

        [HttpGet("{categoryID}")]
        public async Task<ActionResult<Category?>> GetCategory(int categoryID)
        {
            return await _categoryServices.GetCategoryByIdAsync(categoryID);
        }
    }
}
