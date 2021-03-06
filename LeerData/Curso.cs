using System;
using System.Collections.Generic;

namespace LeerData
{
    public class Curso
    {
        public int CursoId { get; set; }
        public string Titulo { get; set; }
        public string Descripcion { get; set; }
        public DateTime FechaPublicacion { get; set; }
        public byte[] FotoPortada { get; set; }
        // Referencia a Precios dentro de Cursos
        public Precio Precio { get; set; }
        public ICollection<Comentario> ListaComentarios { get; set; }
        public ICollection<CursoInstructor> InstructorLink { get; set; }
    }
}