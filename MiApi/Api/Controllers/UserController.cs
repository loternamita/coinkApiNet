using Microsoft.AspNetCore.Mvc;
using coink.UserService;
using coink.UserDTO;

namespace UserController
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpPost]
        [Route("createUser")]
        public async Task<IActionResult> CreateUser(UserDto userDto)
        {
            try
            {
                await _userService.CreateUserAsync(userDto);
                return Ok(userDto);
            }
            catch (Exception ex)
            {
                // Manejo de errores
                var response = new { StatusCode = 500, message = ex.Message };
                return StatusCode(500, response);
            }
        }
    }
}



