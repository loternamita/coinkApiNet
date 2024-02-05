using coink.CountryEntity;
using coink.DepartmentEntity;
using coink.MunicipalityEntity;
using coink.UserEntity;

using Microsoft.EntityFrameworkCore;

namespace coink.ApplicationDbContextData
{
    public class ApplicationDbContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Country> Countries { get; set; }
        public DbSet<Department> Departments { get; set; }
        public DbSet<Municipality> Municipalities { get; set; }

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Configuración de la entidad User
            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("usuarios");
                entity.HasKey(e => e.Id).HasName("usuario_id");
                entity.Property(e => e.Id).HasColumnName("usuario_id").ValueGeneratedOnAdd();
                entity.Property(e => e.Name).HasColumnName("nombre").IsRequired().HasMaxLength(255);
                entity.Property(e => e.PhoneNumber).HasColumnName("telefono").HasMaxLength(50);
                entity.Property(e => e.Address).HasColumnName("direccion").HasMaxLength(255);
                entity.Property(e => e.CountryId).HasColumnName("pais_id");
                entity.Property(e => e.DepartmentId).HasColumnName("departamento_id");
                entity.Property(e => e.MunicipalityId).HasColumnName("municipio_id");

                // Configura la relación con Country
                entity.HasOne<Country>()
                    .WithMany()

                    .HasForeignKey(u => u.CountryId)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("fk_usuario_pais");

                // Configura la relación con Department
                entity.HasOne<Department>()
                    .WithMany()
                    .HasForeignKey(d => d.DepartmentId)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("fk_usuario_departamento");

                // Configura la relación con Municipality
                entity.HasOne<Municipality>()
                    .WithMany()
                    .HasForeignKey(d => d.MunicipalityId)
                    .OnDelete(DeleteBehavior.Restrict)
                    .HasConstraintName("fk_usuario_municipio");
            });

            modelBuilder.Entity<Country>(entity =>
            {
                entity.ToTable("paises");

                entity.HasKey(c => c.Id).HasName("pais_id");

                entity.Property(c => c.Name)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<Department>(entity =>
            {
                entity.ToTable("departamentos");

                entity.HasKey(c => c.Id).HasName("departamento_id");

                entity.Property(c => c.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.Country)
                    .WithMany(c => c.Departments)
                    .HasForeignKey(d => d.CountryId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("fk_pais");
            });

            modelBuilder.Entity<Municipality>(entity =>
            {
                entity.ToTable("municipios");

                entity.HasKey(c => c.Id).HasName("municipio_id");

                entity.Property(c => c.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(m => m.Department)
                    .WithMany(d => d.Municipalities)
                    .HasForeignKey(m => m.DepartmentId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("fk_departamento");
            });
        }
    }
}


