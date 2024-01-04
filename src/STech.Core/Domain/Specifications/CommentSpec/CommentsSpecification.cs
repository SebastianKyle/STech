using STech.Core.Domain.Entities;

namespace STech.Core.Domain.Specifications.CommentSpec;

public class CommentsSpecification : BaseSpecification<Comment>
{
    public CommentsSpecification(CommentsSpecParams commentsSpecParams)
        : base(x => 
            (string.IsNullOrEmpty(commentsSpecParams.SearchTerm) || x.Text.Contains(commentsSpecParams.SearchTerm)) && 
            (!commentsSpecParams.EntityID.HasValue || x.EntityID == commentsSpecParams.EntityID) && 
            (string.IsNullOrEmpty(commentsSpecParams.UserID) || x.UserID == commentsSpecParams.UserID)
        )
    {
        AddInclude(x => x.User); 
        AddOrderByDescending(x => x.Timestamp);
        
        ApplyPaging(commentsSpecParams.PageSize * (commentsSpecParams.PageIndex - 1), commentsSpecParams.PageSize);
    }
}