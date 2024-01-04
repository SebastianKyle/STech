using STech.Core.Domain.Entities;

namespace STech.Core.Domain.Specifications.OrderSpec;

public class OrderWithPaymentIntentIDSpecification : BaseSpecification<Order>
{
    public OrderWithPaymentIntentIDSpecification(string paymentIntentID)
        : base(o => o.PaymentIntentID == paymentIntentID)
    {
        AddInclude(o => o.OrderHistories); 
        AddInclude(o => o.OrderItems);
    }
}