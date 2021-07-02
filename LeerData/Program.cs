using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.SqlServer;

namespace LeerData
{
    class Program
    {
        static void Main(string[] args)
        {
            using(var db = new AppVentaCursosContext())
            {
                // Evita almacenar en el cache de la transaccion la data que esta devolviendo el SQL Server
                // Simplemente la entrega no la guarda en memoria de EF
                // El metodo AsNotracking, evita almacenar en el cache de la transaccion la Data que
                // devuelve SQL Server
                // var cursos = db.Curso.AsNoTracking(); // Esta sentencia devuelve arreglo de tipo IQueryable
                // AsNoTracking ejecuta sentencias de tipo Linq para obtener la data
                // foreach(var curso in cursos){
                //     Console.WriteLine(curso.Titulo + " ----- " + curso.Descripcion);
                // }
                // Evita que Ef Core guarde en memoria cache la transaccion
                var cursos = db.Curso.Include( p => p.Precio).AsNoTracking();
                foreach( var curso in cursos ){
                    Console.WriteLine(curso.Titulo + " --- " + curso.Precio.PrecioActual ) ;
                }

            }
        }
    }
}

