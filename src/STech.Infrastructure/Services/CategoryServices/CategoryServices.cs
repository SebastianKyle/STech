using STech.Core.Domain.Entities;
using STech.Core.Domain.RepositoryContracts;
using STech.Core.Domain.Specifications;
using STech.Core.Domain.Specifications.CategorySpec;
using STech.Core.Helpers;
using STech.Core.ServiceContracts.CategoryServices;

namespace STech.Infrastructure.Services.CategoryServices;

public class CategoryServices : ICategoryServices
{
    #region vars

    private readonly IUnitOfWork _unitOfWork;
    private readonly IGenericRepository<Category> _categoryRepo;

    #endregion

    #region ctor

    public CategoryServices(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
        _categoryRepo = _unitOfWork.Repository<Category>();
    } 

    #endregion
    
    public async Task<Category?> GetCategoryByIdAsync(int categoryID)
    {
        var spec = new CategoriesSpecification(categoryID);
        Category? matchingCategory = await _categoryRepo.GetEntityWithSpec(spec);

        return matchingCategory;
    }

    public async Task<Category?> GetCategoryByNameAsync(string categoryName)
    {
        var spec = new CategoriesSpecification(categoryName);
        Category? matchingCategory = await _categoryRepo.GetEntityWithSpec(spec);

        return matchingCategory;
    }

    public async Task<Pagination<Category>> GetCategoriesAsync(CategorySpecParams categorySpecParams)
    {
        var spec = new CategoriesSpecification(categorySpecParams);
        List<Category> categoriesList = await _categoryRepo.ListAsync(spec);
        List<Category> allCategories = await _categoryRepo.ListAllAsync();

        return new Pagination<Category>(categorySpecParams.PageIndex, categorySpecParams.PageSize, allCategories.Count,
            categoriesList);
    }

    public async Task<List<Category>> GetTopLevelCategoryAsync()
    {
        var spec = new BaseSpecification<Category>(x => !x.ParentCategoryID.HasValue);
        List<Category> categoriesList = await _categoryRepo.ListAsync(spec);

        return categoriesList;
    }

    public async Task<List<Category>> GetAllCategoriesAsync(bool includeProducts = false)
    {
        if (includeProducts)
        {
            var spec = new CategoriesSpecification();
            return await _categoryRepo.ListAsync(spec);
        } 
        
        return await _categoryRepo.ListAllAsync();
    }

    public async Task<bool> AddCategory(Category category)
    {
        _categoryRepo.Add(category);

        return await _unitOfWork.Complete() > 0;
    }

    public async Task<bool> UpdateCategory(Category category)
    {
        _categoryRepo.Update(category);

        return await _unitOfWork.Complete() > 0;
    }

    public async Task<bool> DeleteCategory(int categoryID)
    {
        Category? matchingCategory = await _categoryRepo.GetByIdAsync(categoryID);

        if (matchingCategory == null)
        {
            return false;
        }
        
        _categoryRepo.Delete(matchingCategory);

        return await _unitOfWork.Complete() > 0;
    }
}