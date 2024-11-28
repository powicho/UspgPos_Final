using System.ComponentModel.DataAnnotations.Schema;

namespace UspgPOS.DTOs
{
    public class DetalleVentaDTO
    {
        public long ProductoId { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
    }
}