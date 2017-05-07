namespace MAF.BAL.Models
{
    using System;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public class PowerZoneTimeViewModel
    {
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
    }
}
