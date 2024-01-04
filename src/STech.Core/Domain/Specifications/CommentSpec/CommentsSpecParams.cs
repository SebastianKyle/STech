namespace STech.Core.Domain.Specifications.CommentSpec;

public class CommentsSpecParams : BaseSpecParams
{
    public int? EntityID { get; set; }  
    public string? UserID { get; set; }
}