using System.Collections;
using STech.Core.Domain.Entities;
using STech.Core.Domain.RepositoryContracts;
using STech.Infrastructure.Data;

namespace STech.Infrastructure.Repositories;

public class UnitOfWork : IUnitOfWork
{
    private readonly eCommerceContext _db;
    private Hashtable _repositories;

    #region ctor

    public UnitOfWork(eCommerceContext db)
    {
        _db = db;
    } 

    #endregion
    
    public void Dispose()
    {
        _db.Dispose();
    }

    public IGenericRepository<TEntity> Repository<TEntity>() where TEntity : BaseEntity
    {
        if (_repositories == null) 
        {
            _repositories = new Hashtable();
        }

        var type = typeof(TEntity).Name;

        if (!_repositories.ContainsKey(type))
        {
            var repositoryType = typeof(GenericRepository<>);
            var repositoryInstance = Activator.CreateInstance(repositoryType.MakeGenericType(typeof(TEntity)), _db);

            _repositories.Add(type, repositoryInstance);
        }

        return (IGenericRepository<TEntity>) _repositories[type];
    }

    public async Task<int> Complete()
    {
        return await _db.SaveChangesAsync();
    }
}