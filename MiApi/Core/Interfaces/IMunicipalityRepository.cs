namespace coink.IMunicipalityRepositories
{
    public interface IMunicipalityRepository
    {
        Task<bool> ValidateMunicipalityAsync(int municipalityId);
    }
}