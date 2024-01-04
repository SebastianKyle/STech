using System.ComponentModel.DataAnnotations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion.Internal;

namespace STech.Core.DTO;

public class CartItemDTO
{
    [Required]
    public int ID { get; set; }

    [Required]
    public string ProductName { get; set; }

    [Required]
    [Range(0.1, Double.MaxValue, ErrorMessage = "Price must be greater than zero")]
    public decimal Price { get; set; }

    [Required]
    [Range(1, Double.MaxValue, ErrorMessage = "Quantity must be greater than zero")]
    public int Quantity { get; set; }

    [Required]
    public string PictureUrl { get; set; }

    [Required]
    public string CategoryName { get; set; }

    [Required]
    public int StockQuantity { get; set; }
}