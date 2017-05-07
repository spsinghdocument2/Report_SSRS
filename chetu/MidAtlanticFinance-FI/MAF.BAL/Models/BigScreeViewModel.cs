namespace MAF.BAL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public class BigScreeViewModel
    {
        [Required(ErrorMessage = "Queue is required.")]
        [DisplayName("Power Zone Queues")]
        public IList<string> Queues { get; set; }
        [Required(ErrorMessage = "Zone 1 From Time is required.")]
        [DataType(DataType.Time)]
        [DisplayName("Zone1 From Time")]
        public DateTime Zone1FromTime { get; set; }
        [Required(ErrorMessage = "Zone 1 To Time is required.")]
        [DataType(DataType.Time)]
        [DisplayName("Zone1 To Time")]
        public DateTime Zone1ToTime { get; set; }
        [Required(ErrorMessage = "Zone 2 From Time is required.")]
        [DataType(DataType.Time)]
        [DisplayName("Zone2 From Time")]
        public DateTime Zone2FromTime { get; set; }
        [Required(ErrorMessage = "Zone 2 To Time is required.")]
        [DataType(DataType.Time)]
        [DisplayName("Zone2 To Time")]
        public DateTime Zone2ToTime { get; set; }
        [Required(ErrorMessage = "Header 1 Color is required.")]
        [DisplayName("Header 1 Color")]
        [RegularExpression("^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$", ErrorMessage = "Invalid Color Format")]
        public string Header1Color { get; set; }
        [Required(ErrorMessage = "Header 2 Color is required.")]
        [DisplayName("Header 2 Color")]
        [RegularExpression("^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$", ErrorMessage = "Invalid Color Format")]
        public string Header2Color { get; set; }
        [Required(ErrorMessage = "Row Color is required.")]
        [DisplayName("Row Color")]
        [RegularExpression("^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$", ErrorMessage = "Invalid Color Format")]
        public string RowColor { get; set; }
        [Required(ErrorMessage = "Alterate Row Color is required.")]
        [DisplayName("AlternateRow Color")]
        [RegularExpression("^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$", ErrorMessage = "Invalid Color Format")]
        public string AlternateRowColor { get; set; }
        [Required(ErrorMessage = "Font Color is required.")]
        [DisplayName("Font Color")]
        [RegularExpression("^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$", ErrorMessage = "Invalid Color Format")]
        public string FontColor { get; set; }
    }
}
