using STech.Core.Domain.Entities;
using STech.Core.Domain.Specifications.CategorySpec;
using STech.Core.Helpers;

namespace STech.Core.ServiceContracts.CategoryServices;

public interface ICategoryServices
{
    Task<Category?> GetCategoryByIdAsync(int categoryID);
    Task<Category?> GetCategoryByNameAsync(string categoryName);
    Task<Pagination<Category>> GetCategoriesAsync(CategorySpecParams categorySpecParams);
    Task<List<Category>> GetTopLevelCategoryAsync();
    Task<List<Category>> GetAllCategoriesAsync(bool includeProducts = false);
    Task<bool> AddCategory(Category category);
    Task<bool> UpdateCategory(Category category);
    Task<bool> DeleteCategory(int categoryID);
}