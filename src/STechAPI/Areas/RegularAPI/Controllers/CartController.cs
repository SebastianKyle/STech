using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using STech.Core.Domain.Entities;
using STech.Core.DTO;
using STech.Core.ServiceContracts.CartServices;

namespace STech.Areas.RegularAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartController : BaseApiController
    {
        #region vars

        private readonly ICartServices _cartServices;
        private readonly IMapper _mapper;

        #endregion

        #region ctor

        public CartController(ICartServices cartServices, IMapper mapper)
        {
            _cartServices = cartServices;
            _mapper = mapper;
        } 

        #endregion

        [HttpGet]
        public async Task<ActionResult<CustomerCart>> GetCartByID(string cartID)
        {
            var cart = await _cartServices.GetCartAsync(cartID);

            return Ok(cart ?? new CustomerCart(cartID));
        }

        [HttpPost]
        public async Task<ActionResult<CustomerCart>> UpdateCart(CustomerCartDTO customerCart)
        {
            var cart = _mapper.Map<CustomerCartDTO, CustomerCart>(customerCart);
            var updatedCart = await _cartServices.UpdateCartAsync(cart);

            return Ok(updatedCart);
        }

        [HttpDelete]
        public async Task<ActionResult<bool>> DeleteCartByID(string cartID)
        {
            bool deleted = await _cartServices.DeleteCartAsync(cartID);

            return deleted;
        }

    }
}
