using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Razor.TagHelpers;
using STech.Areas.Commons;
using STech.Areas.StartupExtensions;
using STech.Core.Domain.Entities;
using STech.Core.Domain.Specifications.CommentSpec;
using STech.Core.DTO;
using STech.Core.Helpers;
using STech.Core.ServiceContracts.CommentServices;

namespace STech.Areas.RegularAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommentController : BaseApiController
    {
        #region vars

        private readonly UserManager<eCommerceUser> _userManager;
        private readonly ICommentServices _commentServices;
        private readonly IMapper _mapper;

        #endregion

        #region ctor

        public CommentController(UserManager<eCommerceUser> userManager, ICommentServices commentServices,
            IMapper mapper)
        {
            _userManager = userManager;
            _commentServices = commentServices;
            _mapper = mapper;
        }

        #endregion

        [HttpPost("leave")]
        [Authorize]
        public async Task<ActionResult<CommentResponseDTO>> LeaveComment(CommentDTO commentDto)
        {
            var newComment = new Comment()
            {
                Rating = commentDto.Rating,
                Text = commentDto.Text,
                EntityID = commentDto.EntityID,
                Timestamp = DateTime.Now
            };
            newComment.Timestamp = DateTime.Now;

            var userID = _userManager.GetUserId(User);
            newComment.UserID = userID;

            var result = await _commentServices.AddCommentAsync(newComment);
            if (!result)
            {
                return BadRequest(new ApiResponse(400, "Problem adding comment"));
            }

            return _mapper.Map<Comment, CommentResponseDTO>(newComment);
        }

        [HttpGet("product")]
        public async Task<ActionResult<Pagination<CommentResponseDTO>>> GetProductComments(
            [FromQuery] CommentsSpecParams commentsSpecParams)
        {
            return await _commentServices.GetCommentsAsync(commentsSpecParams);
        }

        [HttpGet("user")]
        public async Task<ActionResult<Pagination<CommentWithProductDTO>>> GetUserComments(
            [FromQuery] CommentsSpecParams commentsSpecParams)
        {
            var userID = User.RetrieveUserIDFromPrincipal();
            commentsSpecParams.UserID = userID;

            return await _commentServices.GetCommentsWithProductsAsync(commentsSpecParams);
        }

        [HttpDelete("delete/{commentID}")]
        [Authorize]
        public async Task<ActionResult> DeleteComment(int commentID)
        {
            var comment = await _commentServices.GetCommentByIDAsync(commentID);

            if (comment != null && User.Identity.IsAuthenticated && (User.IsInRole("Administrator") ||
                                                                     comment.UserID ==
                                                                     User.RetrieveUserIDFromPrincipal()))
            {
                var result = await _commentServices.DeleteCommentAsync(comment);

                if (!result)
                {
                    return BadRequest(new ApiResponse(400, "Problem in deleting comment"));
                }

                return Ok(new ApiResponse(200, "Deleted comment successfully"));
            }

            if (comment == null)
            {
                return NotFound(new ApiResponse(404, "Comment not found"));
            }

            return Unauthorized(new ApiResponse(401, "Unauthorized, unable to delete comment"));
        }
    }
}