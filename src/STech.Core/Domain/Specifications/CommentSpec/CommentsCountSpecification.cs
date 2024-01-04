using Microsoft.VisualBasic;
using STech.Core.Domain.Entities;

namespace STech.Core.Domain.Specifications.CommentSpec;

public class CommentsCountSpecification : BaseSpecification<Comment>
{
    public CommentsCountSpecification(CommentsSpecParams commentsSpecParams)
        : base(x => 
            (string.IsNullOrEmpty(commentsSpecParams.SearchTerm) || x.Text.Contains(commentsSpecParams.SearchTerm)) && 
            (!commentsSpecParams.EntityID.HasValue || x.EntityID == commentsSpecParams.EntityID) && 
            (string.IsNullOrEmpty(commentsSpecParams.UserID) || x.UserID == commentsSpecParams.UserID)
        )
    {
        
    }
}