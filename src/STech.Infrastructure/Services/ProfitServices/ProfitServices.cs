using STech.Core.Domain.Entities;
using STech.Core.Domain.RepositoryContracts;
using STech.Core.Domain.Specifications;
using STech.Core.Domain.Specifications.ProfitSpec;
using STech.Core.ServiceContracts.ProductServices;
using STech.Core.ServiceContracts.ProfitServices;

namespace STech.Infrastructure.Services.ProfitServices;

public class ProfitServices : IProfitServices
{
    #region vars

    private readonly IUnitOfWork _unitOfWork;
    private readonly IGenericRepository<YearlyProfitRecord> _yearlyProfitRepo;
    private readonly IProductServices _productServices;

    #endregion

    #region ctor

    public ProfitServices(IUnitOfWork unitOfWork, IProductServices productServices)
    {
        _unitOfWork = unitOfWork;

        _yearlyProfitRepo = _unitOfWork.Repository<YearlyProfitRecord>();
        _productServices = productServices;
    } 

    #endregion
    
    public async Task<YearlyProfitRecord?> GetYearProfit(int year)
    {
        var yearlyProfitSpecParams = new YearlyProfitSpecParams()
        {
            Year = year
        };

        var spec = new YearlyWithMonthlyProfitSpecification(yearlyProfitSpecParams);

        return await _yearlyProfitRepo.GetEntityWithSpec(spec);
    }

    public async Task<List<YearlyProfitRecord>> GetAllYearsProfit()
    {
        var spec = new YearlyWithMonthlyProfitSpecification(new YearlyProfitSpecParams());
        
        return await _yearlyProfitRepo.ListAsync(spec);
    }

    public async Task<bool> UpdateCurrentProfit(Order order)
    {
        var currentDate = DateTime.Now;

        YearlyProfitRecord? currentYearlyProfitRecord = await GetYearProfit(currentDate.Year);

        if (currentYearlyProfitRecord == null)
        {
            await SeedYearProfitRecord(currentDate.Year);
        }
        
        decimal profitFromOrder = 0;

        foreach (OrderItem item in order.OrderItems)
        {
            profitFromOrder += item.Quantity * (item.Product.Price - item.Product.Cost);
        }

        currentYearlyProfitRecord.MonthlyProfits.FirstOrDefault(p => p.Month == currentDate.Month).Profit += profitFromOrder;
        currentYearlyProfitRecord.TotalProfit += profitFromOrder;
        currentYearlyProfitRecord.ModifiedOn = DateTime.Now;

        _yearlyProfitRepo.Update(currentYearlyProfitRecord);

        return await _unitOfWork.Complete() > 0;
    }

    public async Task<bool> SeedYearProfitRecord(int year)
    {
        YearlyProfitRecord newYearlyProfitRecord = new YearlyProfitRecord()
        {
            Year = year,
            ModifiedOn = DateTime.Now,
            MonthlyProfits = new List<MonthlyProfitRecord>()
            {
                new MonthlyProfitRecord() { Month = 1, Profit = 0, ModifiedOn = DateTime.Now },
                new MonthlyProfitRecord() { Month = 2, Profit = 0, ModifiedOn = DateTime.Now },
                new MonthlyProfitRecord() { Month = 3, Profit = 0, ModifiedOn = DateTime.Now },
                new MonthlyProfitRecord() { Month = 4, Profit = 0, ModifiedOn = DateTime.Now },
                new MonthlyProfitRecord() { Month = 5, Profit = 0, ModifiedOn = DateTime.Now },
                new MonthlyProfitRecord() { Month = 6, Profit = 0, ModifiedOn = DateTime.Now },
                new MonthlyProfitRecord() { Month = 7, Profit = 0, ModifiedOn = DateTime.Now },
                new MonthlyProfitRecord() { Month = 8, Profit = 0, ModifiedOn = DateTime.Now },
                new MonthlyProfitRecord() { Month = 9, Profit = 0, ModifiedOn = DateTime.Now },
                new MonthlyProfitRecord() { Month = 10, Profit = 0, ModifiedOn = DateTime.Now },
                new MonthlyProfitRecord() { Month = 11, Profit = 0, ModifiedOn = DateTime.Now },
                new MonthlyProfitRecord() { Month = 12, Profit = 0, ModifiedOn = DateTime.Now }
            },
            TotalProfit = 0
        };
        
        _yearlyProfitRepo.Add(newYearlyProfitRecord);

        return await _unitOfWork.Complete() > 0;
    }
}