using coink.ApplicationDbContextData;
using coink.IMunicipalityRepositories;
using Microsoft.EntityFrameworkCore;
using Npgsql;


namespace coink.MunicipalityRepository
{
    public class MunicipalityRepository : IMunicipalityRepository
    {
        private readonly ApplicationDbContext _context;

        public MunicipalityRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<bool> ValidateMunicipalityAsync(int municipalityId)
        {
            try
            {
                await _context.Database.ExecuteSqlInterpolatedAsync($"CALL ValidarDepartamento({municipalityId})");
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