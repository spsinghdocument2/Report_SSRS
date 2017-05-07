namespace MAF.BAL.Models
{
    using System.ComponentModel.DataAnnotations;
    public class LoginModel
    {
        [Required]
        public string Loginid { get; set; }
        [Required]
        public string Password { get; set; }
        public string Role { get; set; }
        public int Reportid { get; set; }
        public string Abbreviation { get; set; }

    }
}
