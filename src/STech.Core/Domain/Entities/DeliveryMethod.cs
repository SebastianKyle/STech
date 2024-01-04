namespace STech.Core.Domain.Entities;

public class DeliveryMethod : BaseEntity
{
    public string Name { get; set; }
    public string Description { get; set; }
    public string DeliveryTime { get; set; }
    public decimal Price { get; set; }
}