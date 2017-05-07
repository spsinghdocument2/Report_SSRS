namespace PayOnlineReportApplication.DAL
{
    using System.Collections.Generic;
    using System.Linq; 
    public class DataContainer
    {
        /// <summary>
        /// Variable to hold ReservesEntities instance
        /// </summary>
        private ReservesEntities reservesEntity;

        /// <summary>
        /// Property to get ReservesEntities instance
        /// </summary>
        public ReservesEntities ReservesEntity
        {
            get { return reservesEntity ?? (reservesEntity = new ReservesEntities()); }
        }

        /// <summary>
        /// Method to get login
        /// </summary>
        /// <param name="userName">username</param>
        /// <param name="password">password</param>
        /// <returns></returns>
        public List<string> Login(string userName, string password)
        {
            
            try
            {
                return ReservesEntity.sp_rpt_AdminLogin(userName, password).ToList();
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// Method to get list of account numbers
        /// </summary>
        /// <returns></returns>
        public List<sp_rpt_GetAccountInfo_Result> GetAccountNumbers()
        {
            try
            {
                return ReservesEntity.sp_rpt_GetAccountInfo().ToList();
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// Method to get list of payment status
        /// </summary>
        /// <returns></returns>
        public List<string> GetPaymentStatus()
        {
            try
            {
                return ReservesEntity.sp_rpt_GetPaymentStatus().ToList();
            }
            catch
            {
                throw;
            }
        }
    }
}
