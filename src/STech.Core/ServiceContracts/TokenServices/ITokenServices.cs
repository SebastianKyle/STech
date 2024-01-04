using STech.Core.Domain.Entities;

namespace STech.Core.ServiceContracts.TokenServices;

public interface ITokenServices
{
    Task<string> CreateToken(eCommerceUser user);
}