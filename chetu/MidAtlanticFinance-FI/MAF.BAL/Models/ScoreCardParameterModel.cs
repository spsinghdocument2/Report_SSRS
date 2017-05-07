namespace MAF.BAL.Models
{
    using System;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public class ScoreCardParameterModel
    {
        [Required(ErrorMessage = "Date is required.")]
        [DataType(DataType.Date)]
        [DisplayName("Date")]
        public DateTime Date { get; set; }
        [Required(ErrorMessage = "Extension is required.")]
        [DisplayName("Extension")]
        public string ExtNumber { get; set; }
    }
}
