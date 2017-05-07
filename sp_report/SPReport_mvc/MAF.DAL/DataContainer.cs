

namespace MAF.DAL
{
    using System.Collections.Generic;
    using System.Linq;
    public class DataContainer
    {
        /// <summary>
        /// Variable to hold ReportServerEntities instance
        /// </summary>

        private ReportServerEntities reservesEntity;

        /// <summary>
        /// Property to get ReportServerEntities instance
        /// </summary>
        public ReportServerEntities ReservesEntity
        {
            get { return reservesEntity ?? (reservesEntity = new ReportServerEntities()); }
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
    }
    }

