using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StackExchange.Redis;

namespace STech.Areas.DashboardAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BaseDashboardApiController : ControllerBase
    {
    }
}
