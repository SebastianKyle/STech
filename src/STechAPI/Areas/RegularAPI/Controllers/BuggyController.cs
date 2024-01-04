using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using STech.Areas.Commons;
using STech.Core.ServiceContracts.ProductServices;

namespace STech.Areas.RegularAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BuggyController : BaseApiController
    {
        private readonly IProductServices _productServices;

        public BuggyController(IProductServices productServices)
        {
            _productServices = productServices;
        }

        [HttpGet("notfound")]
        public async Task<ActionResult> GetNotFoundProduct()
        {
            var thing = await _productServices.GetProductByIdAsync(200);

            if (thing == null)
            {
                return NotFound(new ApiResponse(404));
            }

            return Ok();
        }
        
        [HttpGet("servererror")]
        public async Task<ActionResult> GetServerErrorAsync()
        {
            var thing = await _productServices.GetProductByIdAsync(200);

            var thingToReturn = thing.ToString();

            return Ok();
        }

        [HttpGet("badrequest")]
        public ActionResult GetBadRequest()
        {


            return BadRequest(new ApiResponse(400));
        }

        [HttpGet("badrequest/{id}")]
        public ActionResult GetNotFoundRequest(int id)
        {
            return Ok();
        }

    }
}
