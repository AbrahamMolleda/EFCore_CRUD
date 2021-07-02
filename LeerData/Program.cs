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
               var cursos = db.Curso.Include( c => c.ListaComentarios).AsNoTracking();
               foreach (var curso in cursos)
               {
                   Console.WriteLine(curso.Titulo);
                   foreach (var Comentario in curso.ListaComentarios)
                   {
                       Console.WriteLine("***" + Comentario.ComentarioTexto);
                   }
               }
            }
        }
    }
}