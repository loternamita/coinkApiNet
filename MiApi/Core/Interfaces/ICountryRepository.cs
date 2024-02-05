namespace coink.ICountryRepositories
{
    public interface ICountryRepository
    {
        Task<bool> ValidateCountryAsync(int countryId);
    }
}