using coink.ApplicationDbContextData;
using coink.IDepartmentRepositories;
using Microsoft.EntityFrameworkCore;
using Npgsql;


namespace coink.DepartmentRepository
{
    public class DepartmentRepository : IDepartmentRepository
    {
        private readonly ApplicationDbContext _context;

        public DepartmentRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<bool> ValidateDepartmentAsync(int departmentId)
        {
            try
            {
                await _context.Database.ExecuteSqlInterpolatedAsync($"CALL ValidarDepartamento({departmentId})");
                return true;
            }
            catch (PostgresException ex)
            {
                if (ex.SqlState == "P0001")
                {
                    return false;
                }
                throw;
            }
        }
    }
}