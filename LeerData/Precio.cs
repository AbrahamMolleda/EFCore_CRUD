namespace LeerData
{
    public class Precio
    {
        public int PrecioId { get; set; }
        public decimal PrecioActual { get; set; }
        public decimal Promocion { get; set; }
        public int CursoId { get; set; }
        // Referencia a nivel de objeto no dentro de la base
        public Curso Curso { get; set; }
    }
}