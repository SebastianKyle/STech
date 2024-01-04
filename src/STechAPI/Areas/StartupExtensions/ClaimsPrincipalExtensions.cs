using System.Security.Claims;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using STech.Core.Domain.Entities;

namespace STech.Areas.StartupExtensions;

public static class ClaimsPrincipalExtensions
{
    public static string RetrieveEmailFromPrincipal(this ClaimsPrincipal user)
    {
        return user.FindFirstValue(ClaimTypes.Email);
    }

    public static string RetrieveUserIDFromPrincipal(this ClaimsPrincipal user)
    {
        return user.FindFirstValue(ClaimTypes.NameIdentifier);
    }

    public static async Task<eCommerceUser> FindUserByClaimsPrincipleAsync(this UserManager<eCommerceUser> input,
        ClaimsPrincipal user)
    {
        var email = user.FindFirstValue(ClaimTypes.Email);

        return await input.Users.SingleOrDefaultAsync(x => x.Email == email);
    }
}