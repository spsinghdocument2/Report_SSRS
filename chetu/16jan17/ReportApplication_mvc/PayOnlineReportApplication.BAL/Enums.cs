namespace PayOnlineReportApplication.BAL
{
    public class Enums
    {
        // <summary>
        /// Enum for Payment Status
        /// </summary>
        public enum PaymentStatus
        {
            All = 0,
            Success = 1,
            Failed = 2,
        }

        // <summary>
        /// Enum for Payment Method
        /// </summary>
        public enum PaymentMethod
        {
            All = 0,
            ACH = 1,
            Card = 2,
        }

        // <summary>
        /// Enum for Message Type
        /// </summary>
        public enum MessageType
        {
            All = 0,
            Inbound = 1,
            Outbound = 2,
        }
    }
}
