using STech.Core.Domain.Entities;

namespace STech.Core.Domain.Specifications.OrderSpec;

public class OrderHistorySpecification : BaseSpecification<OrderHistory>
{
    public OrderHistorySpecification(int orderID)
        : base(o => o.OrderID == orderID)
    {
        AddOrderByDescending(o => o.ModifiedOn);
    }
}