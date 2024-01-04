using STech.Core.Domain.Entities;

namespace STech.Core.Domain.RepositoryContracts;

public interface IUnitOfWork : IDisposable
{
    IGenericRepository<TEntity> Repository<TEntity>() where TEntity : BaseEntity;
    Task<int> Complete();
}