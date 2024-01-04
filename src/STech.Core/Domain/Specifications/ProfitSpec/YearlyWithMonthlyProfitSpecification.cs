using STech.Core.Domain.Entities;

namespace STech.Core.Domain.Specifications.ProfitSpec;

public class YearlyWithMonthlyProfitSpecification : BaseSpecification<YearlyProfitRecord>
{
    public YearlyWithMonthlyProfitSpecification(YearlyProfitSpecParams yearlyProfitSpecParams)
        : base(p => (!yearlyProfitSpecParams.Year.HasValue || p.Year == yearlyProfitSpecParams.Year))
    {
        AddInclude(p => p.MonthlyProfits);
        AddOrderByDescending(p => p.Year);
    }
}