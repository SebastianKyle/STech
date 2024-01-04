export interface IYearlyProfit {
  year: number;
  totalProfit: number;
  monthlyProfits: IMonthlyProfit[];
}

export interface IMonthlyProfit {
  month: number;
  profit: number;
  yearlyProfitID: number;
}
