namespace STech.Core.Domain.Entities;

public class Comment : BaseEntity
{
    public DateTime Timestamp { get; set; }
    public int Rating { get; set; }
    public string Text { get; set; }
    public int EntityID { get; set; }
    public string UserID { get; set; }
    public virtual eCommerceUser User { get; set; }
}