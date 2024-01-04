using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using STech.Areas.Commons;
using STech.Core.Domain.Entities;
using STech.Core.Domain.ServiceContracts;
using Stripe;

namespace STech.Areas.RegularAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentController : BaseApiController
    {
        #region vars

        private readonly IPaymentServices _paymentServices;
        private readonly ILogger<PaymentController> _logger;
        private readonly string _whSecret;

        #endregion

        #region ctor

        public PaymentController(IPaymentServices paymentServices, ILogger<PaymentController> logger,
            IConfiguration config)
        {
            _paymentServices = paymentServices;
            _logger = logger;
            _whSecret = config.GetSection("StripeSettings:WhSecret").Value;
        } 

        #endregion

        [Authorize]
        [HttpPost("{cartID}")]
        public async Task<ActionResult<CustomerCart>> CreateOrUpdatePaymentIntent(string cartID)
        {
            var cart = await _paymentServices.CreateOrUpdatePaymentIntent(cartID);

            if (cart == null)
            {
                return BadRequest(new ApiResponse(400, "Problem with your basket"));
            }
            
            return await _paymentServices.CreateOrUpdatePaymentIntent(cartID);
        }

        [HttpPost("webhook")]
        public async Task<ActionResult> StripeWebHook()
        {
            var json = await new StreamReader(HttpContext.Request.Body).ReadToEndAsync();
            var stripeEvent = EventUtility.ConstructEvent(json, Request.Headers["Stripe-Signature"], _whSecret, throwOnApiVersionMismatch: false);

            PaymentIntent intent;
            Order order;

            switch (stripeEvent.Type)
            {
                case "payment_intent.succeeded":
                    intent = (PaymentIntent)stripeEvent.Data.Object;
                    _logger.LogInformation("Payment succeeded: ", intent.Id);

                    order = await _paymentServices.UpdateOrderPaymentSucceeded(intent.Id);
                    _logger.LogInformation("Order updated to Payment Received", order.ID);

                    break;
                case "payment_intent.payment_failed":
                    intent = (PaymentIntent)stripeEvent.Data.Object;
                    _logger.LogInformation("Payment failed: ", intent.Id);

                    order = await _paymentServices.UpdateOrderPaymentFailed(intent.Id);
                    _logger.LogInformation("Payment failed: ", order.ID);
                    
                    break;
            }
            
            return new EmptyResult();
        }
    }
}
