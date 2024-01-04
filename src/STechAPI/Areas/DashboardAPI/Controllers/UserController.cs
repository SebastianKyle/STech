using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using STech.Areas.Commons;
using STech.Core.Domain.Entities;
using STech.Core.Domain.Specifications.UserSpec;
using STech.Core.DTO;
using STech.Core.Helpers;
using STech.Core.ServiceContracts.UserServices;
using STech.Infrastructure.Data;

namespace STech.Areas.DashboardAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "Administrator")]
    public class UserController : BaseDashboardApiController
    {
        #region vars

        private readonly UserManager<eCommerceUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly IUserServices _userServices;
        private readonly IMapper _mapper;

        #endregion

        #region ctor

        public UserController(UserManager<eCommerceUser> userManager, RoleManager<IdentityRole> roleManager, IUserServices userServices, IMapper mapper)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _userServices = userServices;
            _mapper = mapper;
        }

        #endregion

        [HttpGet("users")]
        public async Task<ActionResult<Pagination<UserManagementDTO>>> GetUsers([FromQuery] UserSpecParams userSpecParams)
        {
            return await _userServices.GetUsers(userSpecParams);
        }

        [HttpGet("count")] 
        public async Task<ActionResult<int>> GetAllUsersCount()
        {
            return _userServices.GetAllUsersCount();
        }

        [HttpGet("userdetails/{userID}")]
        public async Task<ActionResult<UserDetailsDTO>> GetUserDetails(string userID)
        {
            var matchingUser = await _userServices.GetUserDetails(userID);

            return _mapper.Map<eCommerceUser, UserDetailsDTO>(matchingUser);
        }

        [HttpGet("userroles/{userID}")]
        public async Task<List<string>> GetUserRoles(string userID)
        {
            var matchingUser = await _userServices.GetUserDetails(userID);
            var roles = await _userManager.GetRolesAsync(matchingUser);

            return roles.ToList();
        }

        [HttpPut("addtorole/{userID}/{role}")]
        public async Task<ActionResult> AssignUserToRole(string userID, string role)
        {
            var result = await _userServices.AssignUserToRole(userID, role);

            if (!result)
            {
                return BadRequest(new ApiResponse(400, "Problem assigning user to role"));
            }

            return Ok(new ApiResponse(200, "Assign user to role successfully"));
        }

        [HttpPut("removefromrole/{userID}/{role}")]
        public async Task<ActionResult> RemoveUserFromRole(string userID, string role)
        {
            var result = await _userServices.DeleteUserFromRole(userID, role);

            if (!result)
            {
                return BadRequest(new ApiResponse(400, "Problem removing user from role"));
            }

            return Ok(new ApiResponse(200, "Remove user from role successfully"));
        }

        [HttpGet("roles")]
        public async Task<ActionResult<List<string>>> GetRoles()
        {
            return await _userServices.GetRoles();
        }
    }
}
