using coink.ApplicationDbContextData;
using coink.ICountryRepositories;
using Microsoft.EntityFrameworkCore;
using Npgsql;


namespace coink.CountryRepository
{
    public class CountryRepository : ICountryRepository
    {
        private readonly ApplicationDbContext _context;

        public CountryRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<bool> ValidateCountryAsync(int countryId)
        {
            try
            {
                await _context.Database.ExecuteSqlInterpolatedAsync($"CALL ValidarPais({countryId})");
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