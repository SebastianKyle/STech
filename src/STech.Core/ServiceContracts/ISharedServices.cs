using STech.Core.Domain.Entities;

namespace STech.Core.ServiceContracts;

public interface ISharedServices
{
    Task<int> AddPicture(Picture picture);
}