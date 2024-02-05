namespace coink.UserDTO
{
    public class UserDto
    {
        public required string Name { get; set; }
        public required string PhoneNumber { get; set; }
        public required string Address { get; set; }

        // Si tienes relaciones con otras entidades
        public int CountryId { get; set; }
        public int DepartmentId { get; set; }
        public int MunicipalityId { get; set; }
    }
}
