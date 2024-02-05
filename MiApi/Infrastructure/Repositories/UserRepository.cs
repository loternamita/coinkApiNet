using coink.IUserRepositoryInterface;
using coink.UserEntity;
using coink.ApplicationDbContextData;

namespace coink.UserRepository
{
    public class UserRepository : IUserRepository
    {
        readonly ApplicationDbContext _context;

        public UserRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task CreateUserAsync(User user)
        {
            // Añade el usuario al contexto de EF
            await _context.Users.AddAsync(user);
            // Guarda los cambios en la base de datos
            await _context.SaveChangesAsync();
        }
    }
}


