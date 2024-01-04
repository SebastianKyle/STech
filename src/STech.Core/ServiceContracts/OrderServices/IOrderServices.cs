using STech.Core.Domain.Entities;
using STech.Core.Domain.Specifications.OrderSpec;
using STech.Core.DTO;
using STech.Core.Helpers;

namespace STech.Core.ServiceContracts.OrderServices;

public interface IOrderServices
{
    Task<Order?> GetOrderByIDAsync(int orderID);
    Task<Order?> GetOrderByIDForUserAsync(int orderID, string customerEmail);
    Task<IReadOnlyList<DeliveryMethod>> GetDeliveryMethodsAsync();
    Task<Pagination<OrderResponseDTO>> GetOrdersForUserAsync(OrderSpecParams orderSpecParams);
    Task<Pagination<OrderResponseDTO>> GetOrdersAsync(OrderSpecParams orderSpecParams);
    Task<List<Order>> GetAllOrders();
    Task<Order?> CreateOrderAsync(Order order, int deliveryMethodID, string cartID);
    Task<List<OrderHistory>> GetOrderHistories(int orderID);
    Task<bool> AddOrderHistory(OrderHistory orderHistory);
}