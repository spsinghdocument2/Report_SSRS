﻿namespace PayOnlineReportApplication.BAL.Model
{
    using System;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public class CardPaymentReportViewModel
    {
        [DisplayName("Account Number")]
        public string AccountNumber { get; set; }

        [DisplayName("Confirmation Number")]
        public string ConfirmationNumber { get; set; }

        [DisplayName("Payment Status")]
        public Nullable<Enums.PaymentStatus> Status { get; set; }

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