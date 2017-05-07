using MAFWeb.BAL.Models;
using Microsoft.Reporting.WebForms;
using System;
using System.Configuration;
using System.Globalization;

namespace MAFWeb.Reports
{
    public partial class ChatLogReport : System.Web.UI.Page
    {
        /// <summary>
        /// Call Render report method to open the report according to pass report name.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        
        {
            if (!IsPostBack)
            {
                if (Convert.ToBoolean(Session["LoadReport"], CultureInfo.CurrentCulture))
                    RenderReportModels();
            }
        }

        /// <summary>
        /// Render report method to open the report according to report name.
        /// </summary>
        private void RenderReportModels()
        {
            try
            {
                //Get the report name from the query string and replace space with string
                string reportName = (Session["ReportName"]).ToString().Replace(" ", string.Empty);

                //Get the reprot server URL from the web.config file to use in the report parameter
                MyReportViewer.ServerReport.ReportServerUrl = new Uri(ConfigurationManager.AppSettings["ReportServerURL"]); // Report Server URL

                //Pass the parameter value into the report.
                ReportParameter[] parmarray = new ReportParameter[3];
                if (reportName.Equals(MAF.BAL.ResourceFile.Common.ChatLogReportName))
                {                    
                    parmarray[0] = new ReportParameter("fromDate", Session["FromDate"].ToString(), false);
                    parmarray[1] = new ReportParameter("toDate", Session["ToDate"].ToString(), false);
                    parmarray[2] = new ReportParameter("source", Session["ExtNumber"].ToString(), false);
                }

                string reportServerFolderName = ConfigurationManager.AppSettings["ReportServerFolder"].Replace(" ", string.Empty).Replace("/", string.Empty);

                //Set the report name dynamically as passed from the main page, and report put in specific folder.
                MyReportViewer.ServerReport.ReportPath = "/" + reportServerFolderName + "/" + reportName;  // Report Path

                //Set report server credentials if the report is on different server from the data server.
                if (Convert.ToBoolean(ConfigurationManager.AppSettings["UseCredentials"], CultureInfo.InvariantCulture))
                {
                    MyReportViewer.ServerReport.ReportServerCredentials = new ReportCredentials(ConfigurationManager.AppSettings["ReportServerUser"],
                        ConfigurationManager.AppSettings["ReportServerPassword"],
                        ConfigurationManager.AppSettings["ReportServerDomain"]);
                }

                //Set the paramerter into the report parameter and set other setting of the report.
                MyReportViewer.ServerReport.SetParameters(parmarray);

                MyReportViewer.ServerReport.DisplayName = reportName + "_" + Convert.ToString(Session["FromDate"], CultureInfo.CurrentCulture).Replace('/', '_').Replace(':', '_') + "_Ext" + Session["ExtNumber"].ToString();
                MyReportViewer.ShowPrintButton = false;

                //Hide export control for "User" role
                MyReportViewer.ShowExportControls = !string.Equals(Session["Role"].ToString(), MAF.BAL.Enums.Roles.User.ToString());
                MyReportViewer.SizeToReportContent = false;
                MyReportViewer.ServerReport.Refresh();
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Report page while generating report", ex);
            }
        }
    }
}