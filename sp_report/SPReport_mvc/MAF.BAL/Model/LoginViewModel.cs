

namespace MAF.BAL.Model
{
    using System.ComponentModel.DataAnnotations;

    public class LoginViewModel
    {
        [Required]
        [Display(Name = "Username")]
        [StringLength(50)]
        public string Username { get; set; }

        [Required]
        [Display(Name = "Password")]
        [StringLength(50)]
        public string Password { get; set; }

        [Display(Name = "Remember Me")]
        public bool IsRemember { get; set; }
    }
}
