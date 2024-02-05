using System.Text.RegularExpressions;
using coink.ICountryRepositories;
using coink.IDepartmentRepositories;
using coink.IMunicipalityRepositories;
using coink.IUserRepositoryInterface;
using coink.UserDTO;
using coink.UserEntity;
using coink.UserService;

namespace coink.UserServices
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;
        private readonly ICountryRepository _countryRepository;
        private readonly IDepartmentRepository _departmentRepository;
        private readonly IMunicipalityRepository _municipalityRepository;

        public UserService(
                            IUserRepository userRepository,
                            ICountryRepository countryRepository,
                            IDepartmentRepository departmentRepository,
                            IMunicipalityRepository municipalityRepository)
        {
            _userRepository = userRepository;
            _countryRepository = countryRepository;
            _departmentRepository = departmentRepository;
            _municipalityRepository = municipalityRepository;
        }

        public async Task CreateUserAsync(UserDto userDto)
        {

            // Valida que el país exista
            if (!await _countryRepository.ValidateCountryAsync(userDto.CountryId))
            {
                throw new ArgumentException("Invalid country ID.");
            }

            // Valida que el departamento exista
            if (!await _departmentRepository.ValidateDepartmentAsync(userDto.DepartmentId))
            {
                throw new ArgumentException("Invalid department ID.");
            }

            // Valida que el municipio exista
            if (!await _municipalityRepository.ValidateMunicipalityAsync(userDto.MunicipalityId))
            {
                throw new ArgumentException("Invalid municipality ID.");
            }

            if (!Regex.IsMatch(userDto.PhoneNumber, @"^\d+$"))
            {
                throw new ArgumentException("The phone number must contain only numbers.");
            }

            var user = new User
            {
                Name = userDto.Name,
                PhoneNumber = userDto.PhoneNumber,
                Address = userDto.Address,
                CountryId = userDto.CountryId,
                DepartmentId = userDto.DepartmentId,
                MunicipalityId = userDto.MunicipalityId
            };

            await _userRepository.CreateUserAsync(user);
        }
    }
}
