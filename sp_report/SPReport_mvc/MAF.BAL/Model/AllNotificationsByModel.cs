

namespace MAF.BAL.Model
{
    using MAF.BAL.ValidationHelper;
    using System;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
   public class AllNotificationsByModel
    {
        [DisplayName("Account Number")]
        public string AccountNumber { get; set; }
    }
}
