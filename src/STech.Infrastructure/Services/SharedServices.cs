using STech.Core.Domain.Entities;
using STech.Core.Domain.RepositoryContracts;
using STech.Core.ServiceContracts;

namespace STech.Infrastructure.Services;

public class SharedServices : ISharedServices
{
    #region vars

    private readonly IUnitOfWork _unitOfWork;
    private readonly IGenericRepository<Picture> _pictureRepo;

    #endregion

    #region ctor

    public SharedServices(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
        _pictureRepo = _unitOfWork.Repository<Picture>();
    } 

    #endregion
    
    public async Task<int> AddPicture(Picture picture)
    {
        _pictureRepo.Add(picture);
        await _unitOfWork.Complete();

        return picture.ID;
    }
}