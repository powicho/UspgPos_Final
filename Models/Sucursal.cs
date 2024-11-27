using System.ComponentModel.DataAnnotations.Schema;

namespace UspgPOS.Models
{
    public class Sucursal
    {

        [Column("id")]
        public long Id { get; set; } = 0;

        [Column("nombre")]
        public string Nombre { get; set; } = string.Empty;
        [Column("area")]
        public string Area { get; set; } = string.Empty;

        [Column("ciudad")]
        public string Ciudad { get; set; } = string.Empty;
    }
}