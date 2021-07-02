using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;

namespace LeerData
{
    // Una instancia de DbContext es una parte integral de EF
    // Representa una sesion con la base de datos a la que nos conectaremos
    // Un DbContext es la representacion de la base de datos que vamos a representar
    // Ya sean tablas, vistas, etc
    public class AppVentaCursosContext : DbContext
    {
        private const string connectionString = @"Server=localhost;Initial Catalog=CursosOnline;User Id=sa;Password=AbrAz0501;";
        // Metodo OnConfigure, crea la instancia hacia el servidor SQL Server al cual vamos a conectarnos

        // Al ser protegida solamente que hereden estos metodos o propiedades accedan a esta
        // Override sobre escribe un metodo que anteriormente fue declarada por un metodo padre
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(connectionString);
        }

        // UN DbSet dentro de DbContext representa una tabla o una vista dentro de la DB
        public DbSet<Curso> Curso { get; set; }
        public DbSet<Precio> Precio { get; set; }
        public DbSet<Comentario> Comentario { get; set; }


    }
}