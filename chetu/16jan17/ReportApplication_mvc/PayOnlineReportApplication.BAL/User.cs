namespace PayOnlineReportApplication.BAL
{
    using PayOnlineReportApplication.BAL.Model;
    using PayOnlineReportApplication.DAL;
    using System.Collections.Generic;
    using System.Linq;

    public class User
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
        /// Method to verify the login 
        /// </summary>
        /// <param name="username">username</param>
        /// <param name="password">password</param>
        /// <returns>Name of the logged in user</returns>
        public string Login(string username, string password)
        {
            try
            {
                return DataContainer.Login(username, password).FirstOrDefault();
            }
            catch
            {
                throw;
            }
        }
    }
}
