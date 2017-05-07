namespace MAF.BAL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public class HourlyCallLogParameterModel
    {
        [Required(ErrorMessage = "Queue # is required.")]
        [DisplayName("Queue #")]
        public IList<string> QueueNumber { get; set; }       
        [DataType(DataType.DateTime)]
        [DisplayName("From Date")]
        public DateTime FromDate { get; set; }
        [Required(ErrorMessage = "To Date is required.")]
        [DataType(DataType.DateTime)]
        [DisplayName("To Date")]
        [IsDateAfter("FromDate", true, ErrorMessage="To Date should not be less than From Date.")]
        public DateTime ToDate { get; set; }
    }
}
