using System.ComponentModel.DataAnnotations;

namespace STech.Core.DTO;

public class OrderDTO
{
    public string CartID { get; set; }
    public int DeliveryMethodID { get; set; }
    
    public int PaymentMethod { get; set; }
    
    [Required]
    public string CustomerName { get; set; }
    
    [Required]
    public string CustomerEmail { get; set; }
    
    [Required]
    public string CustomerPhone { get; set; }
    
    [Required]
    public string CustomerCountry { get; set; }
    
    [Required]
    public string CustomerCity { get; set; }
    
    [Required]
    public string CustomerAddress { get; set; }
    
    [Required]
    public string CustomerZipCode { get; set; }
}