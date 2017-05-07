using System;

namespace MAF.BAL.Models
{
    public class ReportModel
    {
        public int ReportId { get; set; }
        public string ReportName { get; set; }
        public int UserId { get; set; }
        public int ScheduleType { get; set; }
        public int ScheduleId { get; set; }
        public string ScheduleTime { get; set; }
        public string EmailId { get; set; }
        public string QueueNumber { get; set; }
        public string UserName { get; set; }
        public string MultiuserId { get; set; }
        public string Abbreviation { get; set; }
        public bool IsSchedule { get; set; }
        public bool Status { get; set; }
        public TimeSpan? Zone1FromTime { get; set; }
        public TimeSpan? Zone1ToTime { get; set; }
        public TimeSpan? Zone2FromTime { get; set; }
        public TimeSpan? Zone2ToTime { get; set; }
    }
}
