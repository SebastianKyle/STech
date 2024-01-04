namespace STech.Core.Domain.Enums;

public enum OrderStatus
{
    Placed = 1,
    Processing = 2,
    Delivered = 3,
    Failed = 4,
    Cancelled = 5,
    OnHold = 6,
    WaitingForPayment = 7,
    Refunded = 8
}