using System.Security.Claims;
using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using STech.Core.Domain.Entities;
using STech.Core.Domain.Specifications.UserSpec;
using STech.Core.DTO;
using STech.Core.Helpers;
using STech.Core.ServiceContracts.UserServices;

namespace STech.Infrastructure.Services.UserServices;

public class UserServices : IUserServices
{
    #region vars

    private readonly UserManager<eCommerceUser> _userManager;
    private readonly RoleManager<IdentityRole> _roleManager;
    private readonly IMapper _mapper;

    #endregion

    #region ctor

    public UserServices(UserManager<eCommerceUser> userManager, RoleManager<IdentityRole> roleManager, IMapper mapper)
    {
        _userManager = userManager;
        _roleManager = roleManager;
        _mapper = mapper;
    } 

    #endregion
    
    public async Task<Pagination<UserManagementDTO>> GetUsers(UserSpecParams userSpecParams)
    {
        var skip = userSpecParams.PageSize * (userSpecParams.PageIndex - 1);
        var take = userSpecParams.PageSize;

        var users = _userManager.Users.ToList();

        if (!string.IsNullOrEmpty(userSpecParams.UserName))
        {
            users = users.Where(u => u.FullName.Contains(userSpecParams.UserName) || u.UserName.Contains(userSpecParams.UserName) || u.Email.Contains(userSpecParams.UserName)).ToList();
        }

        if (!string.IsNullOrEmpty(userSpecParams.Role))
        {
            var usersInRole = await _userManager.GetUsersInRoleAsync(userSpecParams.Role);
            users = users.Intersect(usersInRole).ToList();
        }
        
        // users = _userManager.Users.Skip(skip).Take(take).OrderByDescending(u => u.RegisteredOn).ToList();
        users = users.Skip(skip).Take(take).OrderByDescending(u => u.RegisteredOn).ToList();
        var allUsersCount = _userManager.Users.Count();

        List<UserManagementDTO> userRepsonsesList = _mapper.Map<List<eCommerceUser>, List<UserManagementDTO>>(users);

        Pagination<UserManagementDTO> userResponses =
            new Pagination<UserManagementDTO>(userSpecParams.PageIndex, userSpecParams.PageSize, allUsersCount, userRepsonsesList);

        foreach (UserManagementDTO user in userResponses.Data)
        {
            var matchingUser = users.FirstOrDefault(u => u.Id == user.Id);
            var roles = await _userManager.GetRolesAsync(matchingUser);
            user.Roles = roles.ToList();
        }

        return userResponses;
    }

    public int GetAllUsersCount()
    {
        return _userManager.Users.Count();
    }

    public async Task<eCommerceUser> GetUserDetails(string userID)
    {
        return await _userManager.Users.SingleOrDefaultAsync(u => u.Id == userID);
    }

    public async Task<bool> AssignUserToRole(string userID, string role)
    {
        var user = await _userManager.Users.SingleOrDefaultAsync(u => u.Id == userID);
        var result = await _userManager.AddToRoleAsync(user, role);

        return result.Succeeded;
    }

    public async Task<bool> DeleteUserFromRole(string userID, string role)
    {
        var user = await _userManager.Users.SingleOrDefaultAsync(u => u.Id == userID);
        var result = await _userManager.RemoveFromRoleAsync(user, role);

        return result.Succeeded;
    }

    public async Task<List<string>> GetRoles()
    {
        return await _roleManager.Roles.Select(r => r.Name).ToListAsync();
    }
}