using coink.UserEntity;

namespace coink.IUserRepositoryInterface
{
    public interface IUserRepository
    {
        Task CreateUserAsync(User user);
    }
}


