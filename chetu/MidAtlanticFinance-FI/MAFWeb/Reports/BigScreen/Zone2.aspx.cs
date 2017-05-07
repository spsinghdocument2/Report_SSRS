using MAFWeb.BAL.Models;
using System;
using System.Configuration;

namespace MAFWeb.Reports
{
    public partial class Zone2 : System.Web.UI.Page
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
                //Get the report name from the resource file and replace space with string
                string reportName = MAF.BAL.ResourceFile.Common.BigScreenZone2Name;

                //Get the reprot server URL from the web.config file to use in the report parameter
                this.MyReportViewer.ServerReport.ReportServerUrl = new Uri(ConfigurationManager.AppSettings["ReportServerURL"]); // Report Server URL

                string reportServerFolderName = ConfigurationManager.AppSettings["ReportServerFolder"].Replace(" ", string.Empty).Replace("/", string.Empty);

                //Set the report name dynamically as passed from the main page, and report put in specific folder.
                MyReportViewer.ServerReport.ReportPath = "/" + reportServerFolderName + "/" + reportName;  // Report Path

                //Set report server credentials if the report is on different server from the data server.
                if (Convert.ToBoolean(ConfigurationManager.AppSettings["UseCredentials"], System.Globalization.CultureInfo.InvariantCulture))
                {
                    this.MyReportViewer.ServerReport.ReportServerCredentials = new ReportCredentials(ConfigurationManager.AppSettings["ReportServerUser"],
                        ConfigurationManager.AppSettings["ReportServerPassword"],
                        ConfigurationManager.AppSettings["ReportServerDomain"]);
                }

                this.MyReportViewer.ShowPrintButton = true;
                this.MyReportViewer.SizeToReportContent = true;

                //Show report viewer toolbar based on the session value
                this.MyReportViewer.ShowToolBar = false;
                this.MyReportViewer.ServerReport.Refresh();
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Report page while generating report", ex);
            }
        }
    }
}