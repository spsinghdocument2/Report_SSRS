namespace PayOnlineReportApplication.BAL
{
    using PayOnlineReportApplication.BAL.Model;
    using PayOnlineReportApplication.DAL;
    using System.Collections.Generic;
    using System.Linq;

    public class ReportFilter
    {
        /// <summary>
        /// Variable to hold DataContainer DAL instance
        /// </summary>
        private DataContainer dataContainer;

        /// <summary>
        /// Property to get DataContainer DAL instance.
        /// </summary>
        public DataContainer DataContainer
        {
            get { return dataContainer ?? (dataContainer = new DataContainer()); }
        }

        /// <summary>
        /// Get list of account numbers with name
        /// </summary>
        /// <returns></returns>
        public List<AccountModel> GetAccountNumber()
        {
            try
            {
                return DataContainer.GetAccountNumbers().Select(s => new AccountModel
                {
                    AccountNumber = s.AccountNumber,
                    Name = s.Name
                }).ToList();
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// Method to get payment status list
        /// </summary>
        /// <returns></returns>
        public List<string> GetPaymentStatus()
        {
            try
            {
                return DataContainer.GetPaymentStatus();
            }
            catch
            {
                throw;
            }
        }
    }
}
