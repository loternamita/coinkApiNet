namespace coink.IDepartmentRepositories
{
    public interface IDepartmentRepository
    {
        Task<bool> ValidateDepartmentAsync(int departmentId);
    }
}