using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using STech.Core.Domain.Entities;
using STech.Core.ServiceContracts.TokenServices;

namespace STech.Infrastructure.Services.TokenServices;

public class TokenServices : ITokenServices
{
    #region vars

    private readonly IConfiguration _config;
    private readonly SymmetricSecurityKey _key;
    private readonly UserManager<eCommerceUser> _userManager;

    #endregion

    #region ctor

    public TokenServices(IConfiguration config, UserManager<eCommerceUser> userManager)
    {
        _config = config;
        _key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Token:Key"]));
        _userManager = userManager;
    } 

    #endregion
    
    public async Task<string> CreateToken(eCommerceUser user)
    {
        var claims = new List<Claim>()
        {
            new Claim(ClaimTypes.Email, user.Email),
            new Claim(ClaimTypes.GivenName, user.UserName),
            new Claim(ClaimTypes.NameIdentifier, user.Id)
        };

        var userRoles = await _userManager.GetRolesAsync(user);
        foreach (string role in userRoles)
        {
            claims.Add(new Claim(ClaimTypes.Role, role));
        }

        var credentials = new SigningCredentials(_key, SecurityAlgorithms.HmacSha512Signature);

        var tokenDescriptor = new SecurityTokenDescriptor()
        {
            Subject = new ClaimsIdentity(claims),
            Expires = DateTime.Now.AddDays(7),
            SigningCredentials = credentials,
            Issuer = _config["Token:Issuer"]
        };

        var tokenHandler = new JwtSecurityTokenHandler();

        var token = tokenHandler.CreateToken(tokenDescriptor);

        return tokenHandler.WriteToken(token);
    }
}