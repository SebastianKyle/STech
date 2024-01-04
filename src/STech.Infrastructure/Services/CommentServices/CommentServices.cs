using AutoMapper;
using STech.Core.Domain.Entities;
using STech.Core.Domain.Entities.CustomEntities;
using STech.Core.Domain.RepositoryContracts;
using STech.Core.Domain.Specifications;
using STech.Core.Domain.Specifications.CommentSpec;
using STech.Core.DTO;
using STech.Core.Helpers;
using STech.Core.ServiceContracts.CommentServices;

namespace STech.Infrastructure.Services.CommentServices;

public class CommentServices : ICommentServices
{
    #region vars

    private readonly IUnitOfWork _unitOfWork;
    private readonly IGenericRepository<Comment> _commentRepo;
    private readonly IGenericRepository<Product> _productRepo;
    private readonly IMapper _mapper;

    #endregion

    #region ctor

    public CommentServices(IUnitOfWork unitOfWork, IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _commentRepo = _unitOfWork.Repository<Comment>();
        _productRepo = _unitOfWork.Repository<Product>();
        _mapper = mapper;
    }
    
    #endregion
    
    public async Task<Comment?> GetCommentByIDAsync(int commentID)
    {
        return await _commentRepo.GetByIdAsync(commentID);
    }

    public async Task<Pagination<CommentResponseDTO>> GetCommentsAsync(CommentsSpecParams commentsSpecParams)
    {
        var spec = new CommentsSpecification(commentsSpecParams);
        List<Comment> matchingComments = await _commentRepo.ListAsync(spec);
        List<CommentResponseDTO> matchingCommentsReponse = _mapper.Map<List<Comment>, List<CommentResponseDTO>>(matchingComments);

        var countSpec = new CommentsCountSpecification(commentsSpecParams);
        List<Comment> allMatchingComments = await _commentRepo.ListAsync(countSpec);

        return new Pagination<CommentResponseDTO>(commentsSpecParams.PageIndex, commentsSpecParams.PageSize,
            allMatchingComments.Count, matchingCommentsReponse);
    }

    public async Task<Pagination<CommentWithProductDTO>> GetCommentsWithProductsAsync(CommentsSpecParams commentsSpecParams)
    {
        var spec = new CommentsSpecification(commentsSpecParams);
        List<Comment> matchingComments = await _commentRepo.ListAsync(spec);

        var countSpec = new CommentsCountSpecification(commentsSpecParams);
        List<Comment> allMatchingComments = await _commentRepo.ListAsync(countSpec);

        List<CommentWithProductDTO> commentsWithProduct = _mapper.Map<List<Comment>, List<CommentWithProductDTO>>(matchingComments);
        foreach (CommentWithProductDTO comment in commentsWithProduct)
        {
            comment.Product = await _productRepo.GetByIdAsync(comment.EntityID);
        }

        return new Pagination<CommentWithProductDTO>(commentsSpecParams.PageIndex, commentsSpecParams.PageSize,
            allMatchingComments.Count, commentsWithProduct);
    }

    public async Task<List<Comment>> GetAllComments()
    {
        return await _commentRepo.ListAllAsync();
    }

    public async Task<ProductRating> GetProductRatingAsync(int productID)
    {
        var productRating = new ProductRating();

        var spec = new BaseSpecification<Comment>(c => c.EntityID == productID);
        var productComments = await _commentRepo.ListAsync(spec);

        productRating.TotalRatings = productComments.Count;
        productRating.AverageRating = productRating.TotalRatings > 0 ? (int)productComments.Average(x => x.Rating) : 0;

        return productRating;
    }

    public async Task<bool> AddCommentAsync(Comment comment)
    {
        _commentRepo.Add(comment);

        return await _unitOfWork.Complete() > 0;
    }

    public async Task<bool> DeleteCommentAsync(Comment comment)
    {
        comment.IsDeleted = true;
        _commentRepo.Delete(comment);

        return await _unitOfWork.Complete() > 0;
    }
}