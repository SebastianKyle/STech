using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using STech.Areas.Commons;
using STech.Areas.StartupExtensions;
using STech.Core.Domain.Entities;
using STech.Core.Domain.Specifications.OrderSpec;
using STech.Core.DTO;
using STech.Core.Helpers;
using STech.Core.ServiceContracts.OrderServices;

namespace STech.Areas.RegularAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class OrderController : BaseApiController
    {
        #region vars

        private readonly IOrderServices _orderServices;
        private readonly IMapper _mapper;

        #endregion

        #region ctor

        public OrderController(IOrderServices orderServices, IMapper mapper)
        {
            _orderServices = orderServices;
            _mapper = mapper;
        } 

        #endregion

        [HttpPost]
        [Authorize]
        public async Task<ActionResult<Order>> CreateOrder(OrderDTO orderDto)
        {
            var userID = User.RetrieveUserIDFromPrincipal();
            
            var newOrder = _mapper.Map<OrderDTO, Order>(orderDto);
            newOrder.CustomerID = userID;

            var order = await _orderServices.CreateOrderAsync(newOrder, orderDto.DeliveryMethodID, orderDto.CartID);

            if (order == null)
            {
                return BadRequest(new ApiResponse(400, "Problem creating order"));
            }

            return Ok(order);
        }

        [HttpGet]
        [Authorize]
        public async Task<ActionResult<Pagination<OrderResponseDTO>>> GetOrdersForUser([FromQuery] OrderSpecParams orderSpecParams)
        {
            var email = User.RetrieveEmailFromPrincipal();
            orderSpecParams.CustomerEmail = email;

            return await _orderServices.GetOrdersForUserAsync(orderSpecParams);
        }

        [HttpGet("tracking/{id}")]
        [Authorize]
        public async Task<ActionResult<OrderResponseDTO>> GetOrderByIdForUser(int id)
        {
            var order = new Order();
            if (User.IsInRole("Administrator") || User.IsInRole("Employee"))
            {
                order = await _orderServices.GetOrderByIDAsync(id);
            }
            else
            {
                var email = User.RetrieveEmailFromPrincipal();
                order = await _orderServices.GetOrderByIDForUserAsync(id, email);
            }

            if (order == null)
            {
                return BadRequest(new ApiResponse(400, "We are unable to track your order!"));
            }

            return _mapper.Map<Order, OrderResponseDTO>(order);
        }

        [HttpGet("DeliveryMethods")]
        [Authorize]
        public async Task<ActionResult<IReadOnlyList<DeliveryMethod>>> GetDeliveryMethods()
        {
            return Ok(await _orderServices.GetDeliveryMethodsAsync());
        }

        [Authorize]
        [HttpGet("histories/{orderID}")]
        public async Task<ActionResult<List<OrderHistoryDTO>>> GetOrderHistories(int orderID)
        {
            var orderHistories = await _orderServices.GetOrderHistories(orderID);
            
            return _mapper.Map<List<OrderHistory>, List<OrderHistoryDTO>>(orderHistories);
        }

        [HttpGet("track")]
        [Authorize]
        public async Task<ActionResult<OrderResponseDTO?>> TrackOrder(int id)
        {
            var matchingOrder = await _orderServices.GetOrderByIDAsync(id);

            if (matchingOrder == null)
            {
                return BadRequest(new ApiResponse(400, "Order not found"));
            }

            return _mapper.Map<Order, OrderResponseDTO>(matchingOrder);
        }

    }
}
