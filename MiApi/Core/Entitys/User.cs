using coink.CountryEntity;
using coink.DepartmentEntity;
using coink.MunicipalityEntity;

namespace coink.UserEntity
{
    public class User
    {
        public int Id { get; set; }
        public required string Name { get; set; }
        public required string PhoneNumber { get; set; }
        public required string Address { get; set; }
        
        // Propiedades de navegación y claves foráneas
        public int CountryId { get; set; } // pais_id en la base de datos
        public int DepartmentId { get; set; } // departamento_id en la base de datos
        public int MunicipalityId { get; set; } // municipio_id en la base de datos
    }
}
