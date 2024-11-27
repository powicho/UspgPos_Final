using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace UspgPOS.Models
{
    public class Cliente
    {
        [Column("id")]
        public long? Id { get; set; } = 0;

        [StringLength(255)] 
        [Required]
        [Column("nombre")]
        public string Nombre { get; set; } = string.Empty;

        [StringLength(50)]
        [Required]
        [Column("nit")]
        public string Nit { get; set; } = string.Empty;

        [StringLength(255)]
        [Column("correo")]
        public string Correo { get; set; } = string.Empty;

        public ICollection<Venta> Ventas { get; set; } // Relacion de uno a muchos
    }
}