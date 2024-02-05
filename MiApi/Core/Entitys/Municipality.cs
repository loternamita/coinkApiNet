using coink.DepartmentEntity;
using coink.UserEntity;

namespace coink.MunicipalityEntity
{
    public class Municipality
    {
        public int Id { get; set; } // pais_id en la base de datos
        public int DepartmentId { get; set; }
        public required string Name { get; set; } // nombre en la base de datos
        public required Department Department { get; set; }
    }
}
