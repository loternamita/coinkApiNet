using coink.CountryEntity;
using coink.MunicipalityEntity;
using coink.UserEntity;

namespace coink.DepartmentEntity
{
    public class Department
    {
        public int Id { get; set; } // pais_id en la base de datos
        public int CountryId { get; set; }
        public required string Name { get; set; } // nombre en la base de datos
        public required Country Country { get; set; }
        // Representa la relación uno a muchos con Municipality
        public required ICollection<Municipality> Municipalities { get; set; }
    }
}
