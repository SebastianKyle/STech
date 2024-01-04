using STech.Core.Domain.Entities;

namespace STech.Core.ServiceContracts.ProfitServices;

public interface IProfitServices
{
    Task<YearlyProfitRecord?> GetYearProfit(int year);
    Task<List<YearlyProfitRecord>> GetAllYearsProfit();
    Task<bool> UpdateCurrentProfit(Order order);
}