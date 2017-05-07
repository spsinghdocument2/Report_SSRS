﻿using MAFWeb.BAL.Models;
using Microsoft.Reporting.WebForms;
using System;
using System.Configuration;
using System.Globalization;

namespace MAFWeb.Reports
{
    public partial class ScoreCardReport : System.Web.UI.Page
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
                if (Convert.ToBoolean(Session["LoadReport"]))
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
                ReportParameter[] parmarray = new ReportParameter[2];
                parmarray[0] = new ReportParameter("Extnum", Convert.ToString(Session["Extnum"], CultureInfo.CurrentCulture), false);
                parmarray[1] = new ReportParameter("date", Convert.ToString(Session["Date"], CultureInfo.CurrentCulture), false);

                string reportServerFolderName = ConfigurationManager.AppSettings["ReportServerFolder"].Replace(" ", string.Empty).Replace("/", string.Empty);

                //Set the report name dynamically as passed from the main page, and report put in specific folder.
                MyReportViewer.ServerReport.ReportPath = "/" + reportServerFolderName + "/" + reportName;  // Report Path

                //Set report server credentials if the report is on different server from the data server.
                if (Convert.ToBoolean(ConfigurationManager.AppSettings["UseCredentials"], CultureInfo.CurrentCulture))
                {
                    MyReportViewer.ServerReport.ReportServerCredentials = new ReportCredentials(ConfigurationManager.AppSettings["ReportServerUser"],
                        ConfigurationManager.AppSettings["ReportServerPassword"],
                        ConfigurationManager.AppSettings["ReportServerDomain"]);
                }

                //Set the paramerter into the report parameter and set other setting of the report.
                MyReportViewer.ServerReport.SetParameters(parmarray);

                MyReportViewer.ServerReport.DisplayName = reportName + "_" + Convert.ToString(Session["Date"], CultureInfo.CurrentCulture).Replace('/', '_') + "_Ext" + Convert.ToString(Session["Extnum"]);
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