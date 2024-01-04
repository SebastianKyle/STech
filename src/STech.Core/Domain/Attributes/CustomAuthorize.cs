using System.Drawing;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Filters;

namespace STech.Core.Domain.Attributes;

public class CustomAuthorizeAttribute : Attribute, IAuthorizationFilter
{
    #region vars

    private readonly List<IdentityRole> _roles;

    #endregion

    #region ctor

    public CustomAuthorizeAttribute(params IdentityRole[] roles)
    {
        
    } 

    #endregion
    
    public void OnAuthorization(AuthorizationFilterContext context)
    {
        throw new NotImplementedException();
    }
}