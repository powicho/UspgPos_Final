using System.ComponentModel.DataAnnotations.Schema;

namespace UspgPOS.Models
{
    public class Marca
    {
        [Column("id")]
        public long Id { get; set; }

        [Column("nombre")]
        public string Nombre { get; set; }
        [Column("urlImagenMarca")]
        public string? ImgUrlMarca { get; set; }

        [Column("urlThumbnailMarca")]
        public string? UrlThumbnailMarca { get; set; }

        public ICollection<Producto> Productos { get; set; }
    }
}