using coink.DepartmentEntity;
using coink.UserEntity;

namespace coink.CountryEntity
{
    public class Country
    {
        public int Id { get; set; } // pais_id en la base de datos
        public required string Name { get; set; } // nombre en la base de datos
        public required ICollection<Department> Departments { get; set; }
    }
}
