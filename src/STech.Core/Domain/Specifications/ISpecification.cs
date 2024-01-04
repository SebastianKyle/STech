using System.Linq.Expressions;

namespace STech.Core.Domain.Specifications;

public interface ISpecification<T>
{
    Expression<Func<T, bool>> Criteria { get; }
    List<Expression<Func<T, object>>> Includes { get; }
    List<string> StringIncludes { get; }
    Expression<Func<T, object>> OrderBy { get; } 
    Expression<Func<T, object>> OrderByDescending { get; } 
    int Take { get; }
    int Skip { get; }
    bool IsPagingEnabled { get; }
}