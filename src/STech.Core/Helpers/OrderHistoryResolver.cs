using AutoMapper;
using STech.Core.Domain.Entities;
using STech.Core.DTO;

namespace STech.Core.Helpers;

public class OrderHistoryResolver : IValueResolver<Order, OrderResponseDTO, OrderHistoryDTO>
{
    public OrderHistoryDTO Resolve(Order source, OrderResponseDTO destination, OrderHistoryDTO destMember,
        ResolutionContext context)
    {
        var orderHistory = source.OrderHistories[source.OrderHistories.Count - 1];
        return context.Mapper.Map<OrderHistoryDTO>(orderHistory);
    }
}