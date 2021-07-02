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
               var cursos = db.Curso.Include( c => c.InstructorLink).ThenInclude(ci => ci.Instructor).AsNoTracking();
               foreach (var curso in cursos)
               {
                   Console.WriteLine(curso.Titulo);
                   foreach (var instructorLink in curso.InstructorLink)
                   {
                       Console.WriteLine("Instructor: " + instructorLink.Instructor.Nombre);
                   }
               }
            }
        }
    }
}