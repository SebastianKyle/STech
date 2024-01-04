using STech.Core.Domain.Entities;

namespace STech.Core.Domain.ServiceContracts;

public interface IPaymentServices
{
    Task<CustomerCart?> CreateOrUpdatePaymentIntent(string cartID);
    Task<Order> UpdateOrderPaymentFailed(string paymentIntentID);
    Task<Order> UpdateOrderPaymentSucceeded(string paymentIntentID);
}