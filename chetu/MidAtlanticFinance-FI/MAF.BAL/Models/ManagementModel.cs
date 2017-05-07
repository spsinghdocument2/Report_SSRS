using System.ComponentModel.DataAnnotations;

namespace MAF.BAL
{
    public class ManagementModel
    {
        [Required]
        public string UserName { get; set; }
        [Required]
        public int Ext { get; set; }
        public string SearchUser { get; set; }
        public int IsEnable { get; set; }
        public int IsExclude { get; set; }
        public int UserId { get; set; }
        public int QueueCnt { get; set; }
        public string QueueNum { get; set; }
        public string LoginID { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
        public string ManagerQueue { get; set; }
    }
}
