namespace UspgPOS.DTOs
{
    public class VentaDTO
    {
        public long ClienteId { get; set; }

        public List<DetalleVentaDTO> Detalles { get; set; }
    }
}