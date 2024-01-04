using Microsoft.EntityFrameworkCore;
using STech.Core.Domain.Entities;
using STech.Core.Domain.RepositoryContracts;
using STech.Core.Domain.Specifications;
using STech.Infrastructure.Data;
using STech.Infrastructure.SpecificationEvaluator;

namespace STech.Infrastructure.Repositories;

public class GenericRepository<T> : IGenericRepository<T> where T : BaseEntity
{
    private readonly eCommerceContext _db;
    
    #region ctor
    public GenericRepository(eCommerceContext db)
    {
        _db = db;
    }
    #endregion
    
    public async Task<T> GetByIdAsync(int id)
    {
        T? matchingItem = await _db.Set<T>().FirstOrDefaultAsync(temp => temp.ID == id);

        if (matchingItem == null)
        {
            throw new ArgumentException(nameof(matchingItem));
        }

        return matchingItem;
    }

    public async Task<List<T>> ListAllAsync()
    {
        List<T> matchingItems = await _db.Set<T>().ToListAsync();

        return matchingItems;
    }

    public async Task<T> GetEntityWithSpec(ISpecification<T> spec)
    {
        return await ApplySpecification(spec).FirstOrDefaultAsync();
    }

    public async Task<List<T>> ListAsync(ISpecification<T> spec)
    {
        return await ApplySpecification(spec).ToListAsync();
    }

    public async Task<int> CountAsync(ISpecification<T> spec)
    {
        return await ApplySpecification(spec).CountAsync();
    }

    public IQueryable<T> ApplySpecification(ISpecification<T> spec)
    {
        return SpecificationEvaluator<T>.GetQuery(_db.Set<T>().AsQueryable(), spec);
    }

    public void Add(T entity)
    {
        _db.Set<T>().Add(entity);
    }

    public void AddRange(IEnumerable<T> entities)
    {
        _db.Set<T>().AddRange(entities);
    }

    public void Update(T entity)
    {
        _db.Set<T>().Attach(entity);
        _db.Entry(entity).State = EntityState.Modified;
    }

    public void Delete(T entity)
    {
        _db.Set<T>().Remove(entity);
    }

    public void DeleteRange(IEnumerable<T> entities)
    {
        _db.Set<T>().RemoveRange(entities);
    }
}