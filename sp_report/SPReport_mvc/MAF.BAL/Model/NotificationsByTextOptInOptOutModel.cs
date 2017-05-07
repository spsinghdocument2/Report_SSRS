

namespace MAF.BAL.Model
{
    using MAF.BAL.ValidationHelper;
    using System;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
     public class NotificationsByTextOptInOptOutModel
    {
        [DisplayName("Account Number")]
        public string AccountNumber { get; set; }

        [Required(ErrorMessage = "From Date is required.")]
        [DataType(DataType.DateTime)]
        [DisplayName("From Date")]
        public DateTime FromDate { get; set; }

        [Required(ErrorMessage = "To Date is required.")]
        [DataType(DataType.DateTime)]
        [DisplayName("To Date")]
        [IsDateAfter("FromDate", true, ErrorMessage = "To Date should not be less than From Date.")]
        public DateTime ToDate { get; set; }

        public string Type { get; set; }
    }
}
