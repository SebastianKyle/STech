using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using STech.Areas.Commons;
using STech.Areas.StartupExtensions;
using STech.Core.Domain.Specifications.CommentSpec;
using STech.Core.DTO;
using STech.Core.Helpers;
using STech.Core.ServiceContracts.CommentServices;

namespace STech.Areas.DashboardAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "Administrator,Employee")]
    public class CommentController : BaseDashboardApiController
    {
        #region vars

        private readonly ICommentServices _commentServices;
        private readonly IMapper _mapper;

        #endregion

        #region ctor

        public CommentController(ICommentServices commentServices, IMapper mapper)
        {
            _commentServices = commentServices;
            _mapper = mapper;
        }

        #endregion

        [HttpGet("get")]
        public async Task<Pagination<CommentWithProductDTO>> GetComments([FromQuery] CommentsSpecParams commentsSpecParams)
        {
            return await _commentServices.GetCommentsWithProductsAsync(commentsSpecParams);
        }
        
        [HttpGet("count")]
        public async Task<ActionResult<int>> GetAllCommentsCount()
        {
            var comments = await _commentServices.GetAllComments();
            
            return comments.Count;
        }

        [HttpDelete("delete")]
        public async Task<ActionResult> DeleteComment(int commentID)
        {
            var matchingComment = await _commentServices.GetCommentByIDAsync(commentID);

            if (matchingComment == null)
            {
                return NotFound(new ApiResponse(404, "Comment not found"));
            }

            var result = await _commentServices.DeleteCommentAsync(matchingComment);
            if (!result)
            {
                return BadRequest(new ApiResponse(400, "Problem deleting comment"));
            }

            return Ok(new ApiResponse(200, "Delete comment successfully"));
        }

    }
}
