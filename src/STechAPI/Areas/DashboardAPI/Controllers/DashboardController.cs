using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using STech.Core.Domain.Entities;
using STech.Core.ServiceContracts.CommentServices;
using STech.Core.ServiceContracts.OrderServices;
using STech.Core.ServiceContracts.ProductServices;
using STech.Core.ServiceContracts.ProfitServices;

namespace STech.Areas.DashboardAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "Administrator")]
    public class DashboardController : BaseDashboardApiController
    {
        #region vars

        private readonly IProductServices _productServices;
        private readonly IOrderServices _orderServices;
        private readonly ICommentServices _commentServices;
        private readonly IProfitServices _profitServices;

        #endregion

        #region ctor

        public DashboardController(IProductServices productServices, IOrderServices orderServices,
            ICommentServices commentServices, IProfitServices profitServices)
        {
            _productServices = productServices;
            _orderServices = orderServices;
            _commentServices = commentServices;
            _profitServices = profitServices;
        } 

        #endregion

        [HttpGet("profits")]
        public async Task<ActionResult<List<YearlyProfitRecord>>> GetLastMonthProfit()
        {
            return await _profitServices.GetAllYearsProfit();
        }

    }
}
