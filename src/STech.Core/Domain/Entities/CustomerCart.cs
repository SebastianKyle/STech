namespace STech.Core.Domain.Entities;

public class CustomerCart
{
    #region ctor

    public CustomerCart()
    {
        
    }

    public CustomerCart(string id)
    {
        ID = id;
    }
    
    #endregion

    public string ID { get; set; }
    public List<CartItem> CartItems { get; set; } = new List<CartItem>();
    public int? DeliveryMethodID { get; set; }
    public decimal? ShippingPrice { get; set; }
    public string? PaymentIntentID { get; set; }
    public string? ClientSecret { get; set; }
}