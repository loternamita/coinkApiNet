using coink.UserDTO;

namespace coink.UserService
{
    public interface IUserService
    {
        Task CreateUserAsync(UserDto userDto);
    }
}