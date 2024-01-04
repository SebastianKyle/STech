namespace STech.Core.Domain.Entities;

public class BaseEntity
{
    public int ID { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime ModifiedOn { get; set; }
}