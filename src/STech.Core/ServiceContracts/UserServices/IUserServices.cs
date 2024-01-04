using STech.Core.Domain.Entities;
using STech.Core.Domain.Specifications.UserSpec;
using STech.Core.DTO;
using STech.Core.Helpers;

namespace STech.Core.ServiceContracts.UserServices;

public interface IUserServices
{
    Task<Pagination<UserManagementDTO>> GetUsers(UserSpecParams userSpecParams);
    int GetAllUsersCount();
    Task<eCommerceUser> GetUserDetails(string userID);
    Task<bool> AssignUserToRole(string userID, string role);
    Task<bool> DeleteUserFromRole(string userID, string role);
    Task<List<string>> GetRoles();
}