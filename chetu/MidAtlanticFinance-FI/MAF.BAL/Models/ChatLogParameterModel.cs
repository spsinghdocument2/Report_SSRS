﻿namespace MAF.BAL.Models
{
    using System;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public class ChatLogParameterModel
    {
        [Required(ErrorMessage = "Extension is required.")]
        [DisplayName("Extension")]
        public string ExtNumber { get; set; }
        [Required(ErrorMessage = "From Date is required.")]
        [DataType(DataType.DateTime)]
        [DisplayName("From Date")]
        public DateTime FromDate { get; set; }
        [Required(ErrorMessage = "To Date is required.")]
        [DataType(DataType.DateTime)]
        [DisplayName("To Date")]
        [IsDateAfter("FromDate", true, ErrorMessage = "To Date should not be less than From Date.")]
        public DateTime ToDate { get; set; }
    }
}