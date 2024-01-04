using STech.Core.Domain.Entities;

namespace STech.Core.Domain.Specifications.OrderSpec;

public class OrderWithItemsAndOrderingSpecification : BaseSpecification<Order>
{
    public OrderWithItemsAndOrderingSpecification(string email)
        : base(o => o.CustomerEmail == email)
    {
        AddInclude(o => o.OrderItems);
        AddInclude(o => o.OrderHistories);
        AddInclude(o => o.DeliveryMethod);
        
        AddOrderByDescending(o => o.PlacedOn);
    }

    public OrderWithItemsAndOrderingSpecification(int orderID)
        : base(o => o.ID == orderID)
    {
        AddInclude(o => o.OrderItems);
        AddInclude(o => o.OrderHistories);
        AddInclude(o => o.DeliveryMethod);
    }
    
    public OrderWithItemsAndOrderingSpecification(int orderID, string customerEmail)
        : base(o => o.ID == orderID && o.CustomerEmail == customerEmail)
    {
        AddStringInclude("OrderItems.Product");
        AddInclude(o => o.OrderHistories);
        AddInclude(o => o.DeliveryMethod);
    }

    public OrderWithItemsAndOrderingSpecification(OrderSpecParams orderSpecParams, bool include = true)
        : base(o => 
            (string.IsNullOrEmpty(orderSpecParams.CustomerEmail) || o.CustomerEmail == orderSpecParams.CustomerEmail) && 
            (!orderSpecParams.OrderID.HasValue || o.ID == orderSpecParams.OrderID) &&
            (!orderSpecParams.OrderStatus.HasValue || o.OrderHistories.OrderByDescending(o => o.ModifiedOn).FirstOrDefault().OrderStatus == orderSpecParams.OrderStatus)
        )
    {
        AddOrderByDescending(o => o.PlacedOn);
        if (include)
        {
            AddInclude(o => o.OrderItems);
            AddInclude(o => o.DeliveryMethod);
        }
        
        AddInclude(o => o.OrderHistories);
        
        ApplyPaging(orderSpecParams.PageSize * (orderSpecParams.PageIndex - 1), orderSpecParams.PageSize); 
    }
}