using System.ComponentModel.DataAnnotations;

namespace UspgPOS.Models
{
    public class LoginViewModel
    {
        [Required]
        public string Usuario { get; set; } = string.Empty;

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; } = string.Empty;

        public bool Recordar { get; set; } = false;

        [Required]
        public long SucursalId { get; set; } = 0;   
    }
}
