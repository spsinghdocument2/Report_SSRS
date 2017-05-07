using Microsoft.Reporting.WebForms;

namespace MAFWeb.Reports
{
    /// <summary>
    /// This ReportCredentials class is use when reports are not on same server where the database exists, in that case we need to pass
    /// the sever credentials inthe report server report credentials property using this class.
    /// </summary>
    public class ReportCredentials : IReportServerCredentials
    {
        string _userName, _password, _domain;

        /// <summary>
        /// Set the credentials datamembers.
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <param name="domain"></param>
        public ReportCredentials(string userName, string password, string domain)
        {
            _userName = userName;
            _password = password;
            _domain = domain;
        }

        /// <summary>
        /// 
        /// </summary>
        public System.Security.Principal.WindowsIdentity ImpersonationUser
        {
            get
            {
                return null;
            }
        }

        /// <summary>
        /// Set network credentials through data member.
        /// </summary>
        public System.Net.ICredentials NetworkCredentials
        {
            get
            {
                return new System.Net.NetworkCredential(_userName, _password, _domain);
            }
        }

        /// <summary>
        /// Get report credentials from the datamember or from cookie.
        /// </summary>
        /// <param name="authCoki"></param>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <param name="authority"></param>
        /// <returns></returns>
        public bool GetFormsCredentials(out System.Net.Cookie authCoki, out string userName, out string password, out string authority)
        {
            userName = _userName;
            password = _password;
            authority = _domain;
            authCoki = new System.Net.Cookie(".ASPXAUTH", ".ASPXAUTH", "/", "Domain");
            return true;
        }
    }
}