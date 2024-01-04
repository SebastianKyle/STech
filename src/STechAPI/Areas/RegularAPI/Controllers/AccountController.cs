using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NuGet.Protocol.Core.Types;
using STech.Areas.Commons;
using STech.Areas.StartupExtensions;
using STech.Core.Domain.Entities;
using STech.Core.DTO;
using STech.Core.ServiceContracts.TokenServices;
using Stripe;

namespace STech.Areas.RegularAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : BaseApiController
    {
        #region vars

        private readonly UserManager<eCommerceUser> _userManager;
        private readonly SignInManager<eCommerceUser> _signInManager;
        private readonly ITokenServices _tokenServices;
        private readonly IMapper _mapper;

        #endregion

        #region ctor

        public AccountController(UserManager<eCommerceUser> userManager, SignInManager<eCommerceUser> signInManager,
            ITokenServices tokenServices, IMapper mapper)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _tokenServices = tokenServices;
            _mapper = mapper;
        }

        #endregion

        [HttpGet]
        [Authorize]
        public async Task<ActionResult<UserDTO>> GetCurrentUser()
        {
            var user = await _userManager.FindUserByClaimsPrincipleAsync(User);

            return await user.ToUserDTO(_tokenServices, _userManager);
        }

        [HttpGet("details")]
        [Authorize]
        public async Task<ActionResult<UserDetailsDTO>> GetUserDetails()
        {
            var user = await _userManager.FindUserByClaimsPrincipleAsync(User);

            return _mapper.Map<eCommerceUser, UserDetailsDTO>(user);
        }

        [HttpGet("emailexists")]
        public async Task<ActionResult<bool>> CheckEmailExistsAsync([FromQuery] string email)
        {
            return await _userManager.FindByEmailAsync(email) != null;
        }

        [HttpGet("address")]
        [Authorize]
        public async Task<ActionResult<AddressDTO>> GetUserAddress()
        {
            var user = await _userManager.FindUserByClaimsPrincipleAsync(User);

            return _mapper.Map<eCommerceUser, AddressDTO>(user);
        }

        [Authorize]
        [HttpPut("address")]
        public async Task<ActionResult<AddressDTO>> UpdateUserAddress(AddressDTO address)
        {
            var user = await _userManager.FindUserByClaimsPrincipleAsync(User);

            user.Country = address.Country;
            user.City = address.City;
            user.Address = address.Address;
            user.ZipCode = address.ZipCode;
            
            var result = await _userManager.UpdateAsync(user);

            if (!result.Succeeded)
            {
                return BadRequest("Problem updating user");
            }

            return _mapper.Map<eCommerceUser, AddressDTO>(user);
        }

        [Authorize]
        [HttpPost("details")]
        public async Task<ActionResult<UserDetailsDTO>> UpdateUserDetails(UserDetailsDTO userDetailsDto)
        {
            var user = await _userManager.FindUserByClaimsPrincipleAsync(User);

            user.FullName = userDetailsDto.FullName;
            user.Email = userDetailsDto.Email;
            user.UserName = userDetailsDto.UserName;
            user.PhoneNumber = userDetailsDto.PhoneNumber;
            user.Country = userDetailsDto.Country;
            user.City = userDetailsDto.City;
            user.Address = userDetailsDto.Address;
            user.ZipCode = userDetailsDto.ZipCode;

            var result = await _userManager.UpdateAsync(user);

            if (!result.Succeeded)
            {
                return BadRequest("Problem updating user");
            }

            return _mapper.Map<eCommerceUser, UserDetailsDTO>(user);
        }

        [HttpPost("login")]
        public async Task<ActionResult<UserDTO>> Login(LoginDTO loginDto)
        {
            var user = await _userManager.FindByEmailAsync(loginDto.Email);

            if (user == null)
            {
                return Unauthorized(new ApiResponse(401));
            }

            var result = await _signInManager.CheckPasswordSignInAsync(user, loginDto.Password, false);

            if (!result.Succeeded)
            {
                return Unauthorized(new ApiResponse(401));
            }

            return await user.ToUserDTO(_tokenServices, _userManager);
        }

        [HttpPost("register")]
        public async Task<ActionResult<UserDTO>> Register(RegisterDTO registerDto)
        {
            if (CheckEmailExistsAsync(registerDto.Email).Result.Value)
            {
                return new BadRequestObjectResult(new ApiValidationErrorResponse
                    { Errors = new[] { "Email address is in use" } });
            }

            var user = new eCommerceUser()
            {
                Id = Guid.NewGuid().ToString(),
                UserName = registerDto.Username,
                Email = registerDto.Email,
                FullName = registerDto.FullName,
                Country = "",
                City = "",
                Address = "",
                ZipCode = "",
                RegisteredOn = DateTime.Now
            };

            var result = await _userManager.CreateAsync(user, registerDto.Password);

            if (!result.Succeeded)
            {
                return BadRequest(new ApiResponse(400));
            }
            
            var createdUser = await _userManager.Users.FirstOrDefaultAsync(u => u.Id == user.Id);
            await _userManager.AddToRoleAsync(createdUser, "Customer");

            return await user.ToUserDTO(_tokenServices, _userManager);
        }
        
    }
}