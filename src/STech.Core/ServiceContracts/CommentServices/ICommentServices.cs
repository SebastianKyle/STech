using STech.Core.Domain.Entities;
using STech.Core.Domain.Entities.CustomEntities;
using STech.Core.Domain.Specifications.CommentSpec;
using STech.Core.DTO;
using STech.Core.Helpers;

namespace STech.Core.ServiceContracts.CommentServices;

public interface ICommentServices
{
    Task<Comment?> GetCommentByIDAsync(int commentID);
    Task<Pagination<CommentResponseDTO>> GetCommentsAsync(CommentsSpecParams commentsSpecParams);
    Task<Pagination<CommentWithProductDTO>> GetCommentsWithProductsAsync(CommentsSpecParams commentsSpecParams);
    Task<List<Comment>> GetAllComments();
    Task<ProductRating> GetProductRatingAsync(int productID);
    Task<bool> AddCommentAsync(Comment comment);
    Task<bool> DeleteCommentAsync(Comment comment);
}