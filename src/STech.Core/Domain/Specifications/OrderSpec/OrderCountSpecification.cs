using STech.Core.Domain.Entities;

namespace STech.Core.Domain.Specifications.OrderSpec;

public class OrderCountSpecification : BaseSpecification<Order>
{
    public OrderCountSpecification(OrderSpecParams orderSpecParams)
        : base(x =>
            (string.IsNullOrEmpty(orderSpecParams.CustomerEmail) || x.CustomerEmail == orderSpecParams.CustomerEmail) &&
            (!orderSpecParams.OrderID.HasValue || x.ID == orderSpecParams.OrderID) &&
            (!orderSpecParams.OrderStatus.HasValue ||
             x.OrderHistories.OrderByDescending(x => x.ModifiedOn).FirstOrDefault().OrderStatus ==
             orderSpecParams.OrderStatus))
    {
        
    }
}