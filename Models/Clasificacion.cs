using System.ComponentModel.DataAnnotations.Schema;

namespace UspgPOS.Models
{
    public class Clasificacion
    {
        [Column("id")]
        public long Id { get; set; }

        [Column("nombre")]
        public string Nombre { get; set; }

        [Column("urlImagenClasificacion")]
        public string? UrlImagenClasificacion { get; set; }

        [Column("urlThumbnailClasificacion")]
        public string? UrlThumbnailClasificacion { get; set; }


    }
}