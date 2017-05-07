namespace MAF.BAL.Models
{
    using MAF.BAL.Enums;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    public class DropCallsParameterModel
    {
        [Required(ErrorMessage = "Queue is required.")]
        [DisplayName("Queue")]
        public IList<string> Queues { get; set; }
        [Required(ErrorMessage = "From Date is required.")]
        [DataType(DataType.DateTime)]
        [DisplayName("From Date")]
        public DateTime FromDate { get; set; }
        [Required(ErrorMessage = "To Date is required.")]
        [DataType(DataType.DateTime)]
        [DisplayName("To Date")]
        [IsDateAfter("FromDate", true, ErrorMessage = "To Date should not be less than From Date.")]
        public DateTime ToDate { get; set; }

        public Nullable<ReportTypes> Type { get; set; }
    }

}
