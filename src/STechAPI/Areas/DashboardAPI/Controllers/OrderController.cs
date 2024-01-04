using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using STech.Areas.Commons;
using STech.Core.Domain.Entities;
using STech.Core.Domain.Specifications.OrderSpec;
using STech.Core.DTO;
using STech.Core.Helpers;
using STech.Core.ServiceContracts.OrderServices;

namespace STech.Areas.DashboardAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "Administrator,Employee")]
    public class OrderController : BaseDashboardApiController
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

        [HttpGet("get")]
        public async Task<ActionResult<Pagination<OrderResponseDTO>>> GetOrders([FromQuery] OrderSpecParams orderSpecParams)
        {
            return await _orderServices.GetOrdersAsync(orderSpecParams);
        }

        [HttpGet("count")]
        public async Task<ActionResult<int>> GetAllOrdersCount()
        {
            var orders = await _orderServices.GetAllOrders(); 
            
            return orders.Count;
        }

        [HttpGet("get/{orderID}")]
        public async Task<ActionResult<OrderResponseDTO>> GetOrderDetails(int orderID)
        {
            var order = await _orderServices.GetOrderByIDAsync(orderID);

            if (order == null)
            {
                return NotFound(new ApiResponse(404, "Order not found"));
            }

            return _mapper.Map<Order, OrderResponseDTO>(order);
        }

        [HttpPost("update")]
        public async Task<ActionResult> UpdateOrderStatus(OrderHistoryRequestDTO orderHistoryDto)
        {
            var order = await _orderServices.GetOrderByIDAsync(orderHistoryDto.OrderID);

            if (order == null)
            {
                return NotFound(new ApiResponse(404, "Order not found"));
            }

            var orderHistory = new OrderHistory()
            {
                OrderID = orderHistoryDto.OrderID,
                OrderStatus = orderHistoryDto.OrderStatus,
                Note = orderHistoryDto.Note,
                ModifiedOn = DateTime.Now
            };

            var result = await _orderServices.AddOrderHistory(orderHistory);

            if (!result)
            {
                return BadRequest(new ApiResponse(400, "Problem updating order history"));
            }
            
            return Ok();
        }
        
    }
}
