namespace MAF.BAL.Models
{
    public class QueueModel
    {
        public int QueueId { get; set; }
        public string QueueNumber { get; set; }
        public string QueueName { get; set; }
        public int FkIddn { get; set; }
    }
}
