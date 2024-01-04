using System.Security.Claims;
using Microsoft.AspNetCore.Identity;
using STech.Core.DTO;
using STech.Core.ServiceContracts.TokenServices;

namespace STech.Core.Domain.Entities;

public class eCommerceUser : IdentityUser<string>
{
    public string FullName { get; set; }
    public string Country { get; set; }
    public string City { get; set; }
    public string Address { get; set; }
    public string ZipCode { get; set; }

    public DateTime RegisteredOn { get; set; }
}

public static class eCommerceUserExtensions
{
    public static async Task<UserDTO> ToUserDTO(this eCommerceUser user, ITokenServices tokenServices, UserManager<eCommerceUser> userManager = null)
    {
        UserDTO newUser = new UserDTO()
        {
            Email = user.Email,
            Username = user.UserName,
            Token = await tokenServices.CreateToken(user)
        };

        if (userManager != null)
        {
            var roles = await userManager.GetRolesAsync(user);
            newUser.Roles = roles.ToList();
        }

        return newUser;
    }
}