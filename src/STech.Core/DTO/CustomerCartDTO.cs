using System.ComponentModel.DataAnnotations;

namespace STech.Core.DTO;

public class CustomerCartDTO
{
    [Required] 
    public string ID { get; set; }

    public List<CartItemDTO> CartItems { get; set; }

    public int? DeliveryMethodID { get; set; }

    public string? PaymentIntentID { get; set; }

    public string? ClientSecret { get; set; }

    public decimal? ShippingPrice { get; set; }
}