using System.ComponentModel.DataAnnotations;

namespace UspgPOS.Models
{
    public enum UserRole
    {
        Admin,
        User
    }
    public class RegisterViewModel
    {
        [Required]
        [Display(Name = "Nombre de Usuario")]
        public string Usuario { get; set; } = string.Empty;

        [Required]
        [Display(Name = "Nombre Completo")]
        public string Nombre { get; set; } = string.Empty;

        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; } = string.Empty;

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Contraseña")]
        public string Password { get; set; } = string.Empty;

        [DataType(DataType.Password)]
        [Display(Name = "Confirmar Contraseña")]
        [Compare("Password", ErrorMessage = "Las contraseñas no coinciden.")]
        public string ConfirmPassword { get; set; } = string.Empty;

        [Required]
        [Display(Name = "Rol")]
        public UserRole Rol { get; set; } 
    }
}