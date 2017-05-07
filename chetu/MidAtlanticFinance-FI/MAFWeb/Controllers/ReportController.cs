using MAF.BAL.Enums;
using MAF.BAL.Models;
using MAFWeb.BAL.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace MAFWeb.Controllers
{
    public class ReportController : Controller
    {
        /// <summary>
        /// This private datamember is used to create object of ManagementInfo
        /// </summary>
        private ManagementInfo managementInfo;

        /// <summary>
        /// This property is used to create object of ManagementInfo class and check the object is already created or not
        /// </summary>
        public ManagementInfo ManagementInfo
        {
            get
            {
                if (managementInfo == null)
                {
                    managementInfo = new ManagementInfo();
                }
                return managementInfo;
            }
        }

        /// <summary>
        /// This private datamember is used to create object of ManagementList
        /// </summary>
        private ManagementList managementList;

        /// <summary>
        /// This property is used to create object of ManagementList class and check the object is already created or not
        /// </summary>
        public ManagementList ManagementList
        {
            get
            {
                if (managementList == null)
                {
                    managementList = new ManagementList();
                }
                return managementList;
            }
        }

        #region Queue Call Log
        /// <summary>
        /// This ActionResult return the Queue Log Report view page
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult QueueLog()
        {
            if (Session["login"] == null)
            {
                Response.Redirect("/Account/Login");
            }
            try
            {
                // Create date objects 
                TimeSpan tsMorning = new TimeSpan(08, 00, 0);
                TimeSpan tsEvening = new TimeSpan(21, 00, 0);
                QueueLogParameterModel paramModel = new QueueLogParameterModel()
                {
                    FromDate = DateTime.Now.Date + tsMorning, 
                    ToDate = DateTime.Now.Date + tsEvening
                };
                if (!string.IsNullOrEmpty(Session["Role"].ToString()))
                {
                    ManagementList.objQueueList.Clear();
                    ManagementList.objQueueList.AddRange(ManagementInfo.GetQueueList(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Convert.ToString(Session["Role"], CultureInfo.CurrentCulture)));
                }              
                ViewBag.QueueList = new SelectList(ManagementList.objQueueList, "QueueNumber", "Queuename");
                
                ViewBag.ExtensionList = new SelectList(new List<ExtensionModel>(), "ExtNumber", "Name");

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult QueueLog", ex);
            }
            return null; // We will return it logout page if any error occur
        }

        /// <summary>
        /// This ActionResult return the Queue Log Report view to show report
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult QueueLog(QueueLogParameterModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Session["ReportName"] = MAF.BAL.ResourceFile.Common.QueueLogReportName;
                    Session["QueueNumber"] = reportParams.QueueNumber;
                    Session["ExtNumber"] = string.IsNullOrEmpty(reportParams.ExtNumber) || reportParams.ExtNumber.Equals("0") ? string.Empty : reportParams.ExtNumber;
                    Session["FromDate"] = reportParams.FromDate.ToString(CultureInfo.CurrentCulture);
                    Session["ToDate"] = reportParams.ToDate.ToString(CultureInfo.CurrentCulture);

                    //Show iframe to load report
                    ViewBag.ShowIframe = true;
                    Session["LoadReport"] = true;
                }
                else
                {
                    //Hide iframe to load report
                    ViewBag.ShowIframe = false;
                    Session["LoadReport"] = false;
                }
                if (!string.IsNullOrEmpty(Session["Role"].ToString()))
                {
                    ManagementList.objQueueList.Clear();
                    ManagementList.objQueueList.AddRange(ManagementInfo.GetQueueList(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Convert.ToString(Session["Role"], CultureInfo.CurrentCulture)));
                }  
                ViewBag.QueueList = new SelectList(ManagementList.objQueueList, "QueueNumber", "Queuename",reportParams.QueueNumber);
                if (!string.IsNullOrEmpty(Session["Login"].ToString()))
                {
                    ManagementList.objExtensionList.Clear();
                    ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensionsByQueue(reportParams.QueueNumber, Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture)));
                }
                ViewBag.ExtensionList = new SelectList(ManagementList.objExtensionList, "ExtNumber", "Name", reportParams.ExtNumber);
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult QueueLog", ex);
            }
            return null; // We will return it logout page if any error occur
        }
        #endregion

        #region Hourly Call Log
        /// <summary>
        /// This ActionResult return the Hourly Call Log Report view page
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult HourlyCallLog()
        {
            if (Session["login"] == null)
            {
                Response.Redirect("/Account/Login");
            }
            try
            {
                // Create date objects 
                TimeSpan tsMorning = new TimeSpan(08, 00, 0);
                TimeSpan tsEvening = new TimeSpan(21, 00, 0);
                HourlyCallLogParameterModel paramModel = new HourlyCallLogParameterModel()
                {
                    FromDate = DateTime.Now.Date + tsMorning,
                    ToDate = DateTime.Now.Date + tsEvening
                };
                if (!string.IsNullOrEmpty(Session["Role"].ToString()))
                {
                    ManagementList.objQueueList.Clear();
                    ManagementList.objQueueList.AddRange(ManagementInfo.GetQueueList(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Convert.ToString(Session["Role"], CultureInfo.CurrentCulture)));
                }
                ViewBag.QueueList = new MultiSelectList(ManagementList.objQueueList, "QueueNumber", "Queuename");

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult HourlyCallLog", ex);
            }
            return null; // We will return it logout page if any error occur
        }

        /// <summary>
        /// This ActionResult return the Queue Log Report view to show report
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult HourlyCallLog(HourlyCallLogParameterModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Session["ReportName"] = MAF.BAL.ResourceFile.Common.HourlyCallReportName;
                    Session["QueueNumber"] = string.Join(", ", reportParams.QueueNumber);                 
                    Session["FromDate"] = reportParams.FromDate.ToString(CultureInfo.CurrentCulture);
                    Session["ToDate"] = reportParams.ToDate.ToString(CultureInfo.CurrentCulture);

                    //Show iframe to load report
                    ViewBag.ShowIframe = true;
                    Session["LoadReport"] = true;
                }
                else
                {
                    //Hide iframe to load report
                    ViewBag.ShowIframe = false;
                    Session["LoadReport"] = false;
                }
                if (!string.IsNullOrEmpty(Session["Role"].ToString()))
                {
                    ManagementList.objQueueList.Clear();
                    ManagementList.objQueueList.AddRange(ManagementInfo.GetQueueList(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Convert.ToString(Session["Role"], CultureInfo.CurrentCulture)));
                }
                ViewBag.QueueList = new MultiSelectList(ManagementList.objQueueList, "QueueNumber", "Queuename", reportParams.QueueNumber);                
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult HourlyCallLog", ex);
            }
            return null; // We will return it logout page if any error occur
        }
        #endregion

        #region Drop Calls Log
        /// <summary>
        /// This ActionResult return the Drop Call Log Report view page
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult DropCallLog()
        {
            if (Session["login"] == null)
            {
                Response.Redirect("/Account/Login");
            }
            try
            {
                // Create date objects 
                TimeSpan tsMorning = new TimeSpan(08, 00, 0);
                TimeSpan tsEvening = new TimeSpan(21, 00, 0);
                DropCallsParameterModel paramModel = new DropCallsParameterModel()
                {
                    FromDate = DateTime.Now.Date + tsMorning,
                    ToDate = DateTime.Now.Date + tsEvening
                };
                if (!string.IsNullOrEmpty(Session["Role"].ToString()))
                {
                    ManagementList.objQueueList.Clear();
                    ManagementList.objQueueList.AddRange(ManagementInfo.GetQueueList(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Convert.ToString(Session["Role"], CultureInfo.CurrentCulture)));
                }
                ViewBag.QueueList = new MultiSelectList(ManagementList.objQueueList, "QueueNumber", "Queuename");

                //Get Report Type select list in view bag
                ViewBag.Types = new SelectList(EnumHelper.GetReportTypeList());

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult DropCallLog", ex);
            }
            return null; // We will return it logout page if any error occur
        }

        /// <summary>
        /// This ActionResult return the Drop Call Log Report view to show report
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DropCallLog(DropCallsParameterModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (reportParams.Type.HasValue && !reportParams.Type.Equals(ReportTypes.None))
                    {
                        reportParams = GetDateRange(reportParams);
                    }
                    Session["ReportName"] = MAF.BAL.ResourceFile.Common.DropCallLogReportName;
                    Session["QueueNumber"] = string.Join(", ", reportParams.Queues);
                    Session["FromDate"] = reportParams.FromDate.ToString(CultureInfo.CurrentCulture);
                    Session["ToDate"] = reportParams.ToDate.ToString(CultureInfo.CurrentCulture);

                    //Show iframe to load report
                    ViewBag.ShowIframe = true;
                    Session["LoadReport"] = true;
                }
                else
                {
                    //Hide iframe to load report
                    ViewBag.ShowIframe = false;
                    Session["LoadReport"] = false;
                }
                if (!string.IsNullOrEmpty(Session["Role"].ToString()))
                {
                    ManagementList.objQueueList.Clear();
                    ManagementList.objQueueList.AddRange(ManagementInfo.GetQueueList(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Convert.ToString(Session["Role"], CultureInfo.CurrentCulture)));
                }
                ViewBag.QueueList = new MultiSelectList(ManagementList.objQueueList, "QueueNumber", "Queuename", reportParams.Queues);

                //Get Report Type select list in view bag
                ViewBag.Types = new SelectList(EnumHelper.GetReportTypeList(), reportParams.Type);

                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult DropCallLog", ex);
            }
            return null; // We will return it logout page if any error occur
        }
        #endregion

        #region Agent Call Log
        /// <summary>
        /// This ActionResult return the Agent Log Report view page
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult AgentLog()
        {
            if (Session["login"] == null)
            {
                Response.Redirect("/Account/Login");
            }
            try
            {
                TimeSpan tsMorning = new TimeSpan(08, 00, 0);
                TimeSpan tsEvening = new TimeSpan(21, 00, 0);
                AgentLogParameterModel paramModel = new AgentLogParameterModel()
                {
                    FromDate = DateTime.Now.Date + tsMorning,
                    ToDate = DateTime.Now.Date + tsEvening,
                    IsSummary = true
                };
        
                Logger.WriteTraceLog("Get Agent: Start" + paramModel.FromDate + "  " + paramModel.ToDate);

                if (!string.IsNullOrEmpty(Session["Role"].ToString()))
                {
                    ManagementList.objExtensionList.Clear();
                    ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensions(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Session["Role"].ToString()));
                }
                ViewBag.ExtensionList = new MultiSelectList(ManagementList.objExtensionList, "ExtNumber", "Name");

                Logger.WriteTraceLog("Get Agent: End" + paramModel.FromDate + "  " + paramModel.ToDate);

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult AgentLog", ex);
            }
            return null; // We will return it logout page if any error occur
        }

        /// <summary>
        /// This ActionResult return the Agent Log Report view to show report
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult AgentLog(AgentLogParameterModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Logger.WriteTraceLog("Post AgentLog: Start " + reportParams.FromDate + "  " + reportParams.ToDate);

                    if (reportParams.IsSummary)
                        Session["ReportName"] = MAF.BAL.ResourceFile.Common.AgentLogWithSummaryReportName;
                    else
                        Session["ReportName"] = MAF.BAL.ResourceFile.Common.AgentLogReportName;
                    Session["ExtNumber"] = string.Join(", ", reportParams.ExtNumbers);
                    Session["FromDate"] = reportParams.FromDate.ToString(CultureInfo.CurrentCulture);
                    Session["ToDate"] = reportParams.ToDate.ToString(CultureInfo.CurrentCulture);
                    Session["IsInternal"] = reportParams.IsInternal;
                    Session["HasVoiceMail"] = reportParams.IncludeVoiceMail;
                    Session["IsInternalOnly"] = reportParams.IsInternalOnly;

                    //Show iframe to load report
                    ViewBag.ShowIframe = true;
                    Session["LoadReport"] = true;

                    Logger.WriteTraceLog("Post AgentLog: End " + reportParams.FromDate + "  " + reportParams.ToDate);
                }
                else
                {
                    //Hide iframe to load report
                    ViewBag.ShowIframe = false;
                    Session["LoadReport"] = false;
                }
                if (!string.IsNullOrEmpty(Session["Role"].ToString()))
                {
                    ManagementList.objExtensionList.Clear();
                    ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensions(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Session["Role"].ToString()));
                }
                ViewBag.ExtensionList = new MultiSelectList(ManagementList.objExtensionList, "ExtNumber", "Name", reportParams.ExtNumbers);
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult AgentLog", ex);
            }
            return null; // We will return it AgentLog page if any error occur
        }
        #endregion

        #region Search By Phone
        /// <summary>
        /// This ActionResult return the Search by Phone Report view page
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult SearchByPhone()
        {
            if (Session["login"] == null)
            {
                Response.Redirect("/Account/Login");
            }
            try
            {
                TimeSpan tsMorning = new TimeSpan(08, 00, 0);
                TimeSpan tsEvening = new TimeSpan(21, 00, 0);
                SearchByPhoneParameterModel paramModel = new SearchByPhoneParameterModel()
                {
                    FromDate = DateTime.Now.Date + tsMorning, 
                    ToDate = DateTime.Now.Date + tsEvening
                };

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult Search By Phone Report", ex);
            }
            return null; // We will return it Search By Phone Report page if any error occur
        }

        /// <summary>
        /// This ActionResult return the Agent Log Report view to show report
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SearchByPhone(SearchByPhoneParameterModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Logger.WriteTraceLog("Post SearchByPhone: Start " + reportParams.FromDate + "  " + reportParams.ToDate);

                        Session["ReportName"] = MAF.BAL.ResourceFile.Common.SearchByPhoneReportName;
                        Session["PhoneNumber"] = reportParams.PhoneNumber;
                    Session["FromDate"] = reportParams.FromDate.ToString(CultureInfo.CurrentCulture);
                    Session["ToDate"] = reportParams.ToDate.ToString(CultureInfo.CurrentCulture);

                    //Show iframe to load report
                    ViewBag.ShowIframe = true;
                    Session["LoadReport"] = true;

                    Logger.WriteTraceLog("Post SearchByPhone: End " + reportParams.FromDate + "  " + reportParams.ToDate);
                }
                else
                {
                    //Hide iframe to load report
                    ViewBag.ShowIframe = false;
                    Session["LoadReport"] = false;
                }
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult SearchByPhone", ex);
            }
            return null; // We will return it AgentLog page if any error occur
        }
        #endregion 
        
        #region Collection Log
        /// <summary>
        /// This ActionResult return the Collection Report view page
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Collection()
        {
            if (Session["login"] == null)
            {
                Response.Redirect("/Account/Login");
            }
            try
            {
                TimeSpan tsMorning = new TimeSpan(08, 00, 0);
                TimeSpan tsEvening = new TimeSpan(21, 00, 0);
                CollectionModel paramModel = new CollectionModel()
                {
                    FromDate = DateTime.Now.Date + tsMorning, 
                    ToDate = DateTime.Now.Date + tsEvening
                };

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult Collection Report", ex);
            }
            return null; // We will return it Search By Phone Report page if any error occur
        }

        /// <summary>
        /// This ActionResult return the Agent Log Report view to show report
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Collection(CollectionModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Logger.WriteTraceLog("Post Collection: Start " + reportParams.FromDate + "  " + reportParams.ToDate);

                    Session["ReportName"] = MAF.BAL.ResourceFile.Common.CollectionReportName;
                    Session["FromDate"] = reportParams.FromDate.ToString(CultureInfo.CurrentCulture);
                    Session["ToDate"] = reportParams.ToDate.ToString(CultureInfo.CurrentCulture);

                    //Show iframe to load report
                    ViewBag.ShowIframe = true;
                    Session["LoadReport"] = true;

                    Logger.WriteTraceLog("Post Collection Report: End " + reportParams.FromDate + "  " + reportParams.ToDate);
                }
                else
                {
                    //Hide iframe to load report
                    ViewBag.ShowIframe = false;
                    Session["LoadReport"] = false;
                }
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult Collection Report", ex);
            }
            return null; // We will return it AgentLog page if any error occur
        }
        #endregion

        #region Power Zone
        /// <summary>
        /// This ActionResult return the Power Zone Report view page
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult PowerZone()
        {
            if (Session["login"] == null)
            {
                Response.Redirect("/Account/Login");
            }
            try
            {
                PowerZoneParameterModel paramModel = new PowerZoneParameterModel()
                {
                    Date = DateTime.Now.Date,
                    Zone1FromTime = DateTime.Now.Date + new TimeSpan(11,00,00),
                    Zone1ToTime = DateTime.Now.Date + new TimeSpan(12, 00, 00),
                    Zone2FromTime = DateTime.Now.Date + new TimeSpan(15, 00, 00),
                    Zone2ToTime = DateTime.Now.Date + new TimeSpan(16, 00, 00)
                };

                //Get saved time for power zones
                ReportModel reportModel = ManagementInfo.GetPowerZoneTime();
                if (reportModel != null)
                {
                    paramModel.Zone1FromTime = DateTime.Now.Date + reportModel.Zone1FromTime.Value;
                    paramModel.Zone1ToTime = DateTime.Now.Date + reportModel.Zone1ToTime.Value;
                    paramModel.Zone2FromTime = DateTime.Now.Date + reportModel.Zone2FromTime.Value;
                    paramModel.Zone2ToTime = DateTime.Now.Date + reportModel.Zone2ToTime.Value;
                }

                //Hide iframe and popup window on get request.
                ViewBag.ShowIframe = false;
                ViewBag.ShowPopup1 = false;
                ViewBag.ShowPopup2 = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult Power Zone Report", ex);
            }
            return null; // We will return it Power Zone Report page if any error occur
        }

        /// <summary>
        /// This ActionResult return the Power Zone Report view to show report
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult PowerZone(PowerZoneParameterModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Logger.WriteTraceLog("Post PowerZone: Start " + reportParams.Date);

                    Session["ReportName"] = MAF.BAL.ResourceFile.Common.PowerZoneBigScreen;
                    Session["Date"] = reportParams.Date.ToShortDateString();
                    Session["Zone1FromTime"] = reportParams.Zone1FromTime.ToShortTimeString();
                    Session["Zone1ToTime"] = reportParams.Zone1ToTime.ToShortTimeString();
                    Session["Zone2FromTime"] = reportParams.Zone2FromTime.ToShortTimeString();
                    Session["Zone2ToTime"] = reportParams.Zone2ToTime.ToShortTimeString();

                    // show in same screen if unchecked
                    if (!reportParams.BigScreen1 && !reportParams.BigScreen2)
                    {
                        Session["ReportName"] = MAF.BAL.ResourceFile.Common.PowerZoneReportName;
                        //Show iframe and hide popup to load report
                        ViewBag.ShowIframe = true;
                        ViewBag.ShowPopup1 = false;
                        ViewBag.ShowPopup2 = false;
                    }
                    if(reportParams.BigScreen1 && !reportParams.BigScreen2)
                    {
                        //hide iframe and show popup to load report
                        ViewBag.ShowIframe = false;
                        ViewBag.ShowPopup1 = true;
                        ViewBag.ShowPopup2 = false;
                    }
                    else if (!reportParams.BigScreen1 && reportParams.BigScreen2)
                    {
                        //hide iframe and show popup to load report
                        ViewBag.ShowIframe = false;
                        ViewBag.ShowPopup1 = false;
                        ViewBag.ShowPopup2 = true;
                    }
                    else if (reportParams.BigScreen1 && reportParams.BigScreen2)
                    {
                        //hide iframe and show popup to load report
                        ViewBag.ShowIframe = false;
                        ViewBag.ShowPopup1 = true;
                        ViewBag.ShowPopup2 = true;
                    }
                    Session["LoadReport"] = true;
                    Logger.WriteTraceLog("Post PowerZone Report: End " + reportParams.Date);
                }
                else
                {
                    //Hide iframe and popup window on get request.
                    ViewBag.ShowIframe = false;
                    ViewBag.ShowPopup = false;
                    Session["LoadReport"] = false;
                }
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult PowerZone Report", ex);
            }
            return null; // We will return it PowerZone page if any error occur
        }
        #endregion

        #region Score Card
        /// <summary>
        /// This ActionResult return the Score Card Report view page
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ScoreCard()
        {
            if (Session["login"] == null)
            {
                Response.Redirect("/Account/Login");
            }
            try
            {
                ScoreCardParameterModel paramModel = new ScoreCardParameterModel() { Date = DateTime.Now.Date };

                if (!string.Equals(Session["Role"], Roles.Admin.ToString()))
                {
                    if (string.Equals(Session["Role"], Roles.User.ToString()))
                    {
                        ManagementList.objExtensionList.Clear();
                        ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensionsInPowerZone(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Roles.User.ToString()));                        
                    }
                    else
                    {
                        ManagementList.objExtensionList.Clear();
                        ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensionsInPowerZone(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Roles.Manager.ToString()));                        
                    }
                }
                else
                {
                    ManagementList.objExtensionList.Clear();
                    ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensionsInPowerZone(0,null));
                }               
                ViewBag.ExtensionList = new SelectList(ManagementList.objExtensionList, "ExtNumber", "Name");

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult ScoreCard Report", ex);
            }
            return null; // We will return it ScoreCard Report page if any error occur
        }

        /// <summary>
        /// This ActionResult return the ScoreCard Report view to show report
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ScoreCard(ScoreCardParameterModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Logger.WriteTraceLog("Post ScoreCard: Start " + reportParams.Date);

                    Session["ReportName"] = MAF.BAL.ResourceFile.Common.ScoreDateReportName;
                    Session["Date"] = reportParams.Date.ToShortDateString();
                    Session["Extnum"] = reportParams.ExtNumber;

                    //Show iframe to load report
                    ViewBag.ShowIframe = true;
                    Session["LoadReport"] = true;

                    Logger.WriteTraceLog("Post ScoreCard Report: End " + reportParams.Date);
                }
                else
                {
                    //Hide iframe to load report
                    ViewBag.ShowIframe = false;
                    Session["LoadReport"] = false;
                }
                if (!string.Equals(Session["Role"], Roles.Admin.ToString()))
                {
                    if (string.Equals(Session["Role"], Roles.User.ToString()))
                    {
                        ManagementList.objExtensionList.Clear();
                        ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensionsInPowerZone(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Roles.User.ToString()));
                    }
                    else
                    {
                        ManagementList.objExtensionList.Clear();
                        ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensionsInPowerZone(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Roles.Manager.ToString()));
                    }
                }
                else
                {
                    ManagementList.objExtensionList.Clear();
                    ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensionsInPowerZone(0, null));
                }
                ViewBag.ExtensionList = new SelectList(ManagementList.objExtensionList, "ExtNumber", "Name", reportParams.ExtNumber);
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult ScoreCard Report", ex);
            }
            return null; // We will return it ScoreCard page if any error occur
        }
        #endregion

        #region Chat Log
        /// <summary>
        /// This ActionResult return the ChatLog Report view page
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ChatLog()
        {
            if (Session["login"] == null)
            {
                Response.Redirect("/Account/Login");
            }
            try
            {
                TimeSpan tsMorning = new TimeSpan(08, 00, 0);
                TimeSpan tsEvening = new TimeSpan(21, 00, 0);
                ChatLogParameterModel reportParams = new ChatLogParameterModel()
                {
                    FromDate = DateTime.Now.Date + tsMorning, 
                    ToDate = DateTime.Now.Date + tsEvening
                };


                if (!string.IsNullOrEmpty(Session["Role"].ToString()))
                {
                    ManagementList.objExtensionList.Clear();
                    ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensions(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Session["Role"].ToString()));
                }
                ViewBag.ExtensionList = new SelectList(ManagementList.objExtensionList, "ExtNumber", "Name", reportParams.ExtNumber);

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult ChatLog Report", ex);
            }
            return null; // We will return it ScoreCard Report page if any error occur
        }

        /// <summary>
        /// This ActionResult return the ChatLog Report view to show report
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ChatLog(ChatLogParameterModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Logger.WriteTraceLog("Post ChatLog: Start " + reportParams.FromDate);

                    Session["ReportName"] = MAF.BAL.ResourceFile.Common.ChatLogReportName;
                    Session["ExtNumber"] = string.Join(", ", reportParams.ExtNumber);
                    Session["FromDate"] = reportParams.FromDate.ToString(CultureInfo.CurrentCulture);
                    Session["ToDate"] = reportParams.ToDate.ToString(CultureInfo.CurrentCulture);

                    //Show iframe to load report
                    ViewBag.ShowIframe = true;
                    Session["LoadReport"] = true;

                    Logger.WriteTraceLog("Post ChatLog Report: End " + reportParams.FromDate);
                }
                else
                {
                    //Hide iframe to load report
                    ViewBag.ShowIframe = false;
                    Session["LoadReport"] = false;
                }
                if (!string.IsNullOrEmpty(Session["Role"].ToString()))
                {
                    ManagementList.objExtensionList.Clear();
                    ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensions(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Session["Role"].ToString()));
                }
                ViewBag.ExtensionList = new SelectList(ManagementList.objExtensionList, "ExtNumber", "Name", reportParams.ExtNumber);
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult ChatLog Report", ex);
            }
            return null; // We will return it ChatLog page if any error occur
        }
        #endregion

        #region DND Status Report
        /// <summary>
        /// This ActionResult return the DND Status Report view page
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult DNDCall()
        {
            if (Session["login"] == null)
            {
                Response.Redirect("/Account/Login");
            }
            try
            {
                // Create date objects 
                TimeSpan tsMorning = new TimeSpan(08, 00, 0);
                TimeSpan tsEvening = new TimeSpan(21, 00, 0);
                DNDParameterModel paramModel = new DNDParameterModel()
                {
                    FromDate = DateTime.Now.Date + tsMorning,
                    ToDate = DateTime.Now.Date + tsEvening
                };
                if (!string.IsNullOrEmpty(Session["Role"].ToString()))
                {
                    ManagementList.objQueueList.Clear();
                    ManagementList.objQueueList.AddRange(ManagementInfo.GetQueueList(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Convert.ToString(Session["Role"], CultureInfo.CurrentCulture)));
                }
                ViewBag.QueueList = new SelectList(ManagementList.objQueueList, "QueueNumber", "Queuename");

                ViewBag.ExtensionList = new SelectList(new List<ExtensionModel>(), "ExtNumber", "Name");

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult DND Status Report", ex);
            }
            return null; // We will return it logout page if any error occur
        }

        /// <summary>
        /// This ActionResult return the DND Status Report view to show report
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult DNDCall(DNDParameterModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Session["ReportName"] = MAF.BAL.ResourceFile.Common.DNDStatusReportName;
                    Session["QueueNumber"] = reportParams.QueueNumber;
                    Session["ExtNumber"] = string.IsNullOrEmpty(reportParams.ExtNumber) || reportParams.ExtNumber.Equals("0") ? string.Empty : reportParams.ExtNumber;
                    Session["FromDate"] = reportParams.FromDate.ToString(CultureInfo.CurrentCulture);
                    Session["ToDate"] = reportParams.ToDate.ToString(CultureInfo.CurrentCulture);

                    //Show iframe to load report
                    ViewBag.ShowIframe = true;
                    Session["LoadReport"] = true;
                }
                else
                {
                    //Hide iframe to load report
                    ViewBag.ShowIframe = false;
                    Session["LoadReport"] = false;
                }
                if (!string.IsNullOrEmpty(Session["Role"].ToString()))
                {
                    ManagementList.objQueueList.Clear();
                    ManagementList.objQueueList.AddRange(ManagementInfo.GetQueueList(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Convert.ToString(Session["Role"], CultureInfo.CurrentCulture)));
                }
                ViewBag.QueueList = new SelectList(ManagementList.objQueueList, "QueueNumber", "Queuename", reportParams.QueueNumber);
                if (!string.IsNullOrEmpty(Session["Login"].ToString()))
                {
                    ManagementList.objExtensionList.Clear();
                    ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensionsByQueue(reportParams.QueueNumber, Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture)));
                }
                ViewBag.ExtensionList = new SelectList(ManagementList.objExtensionList, "ExtNumber", "Name", reportParams.ExtNumber);
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult DND Status Report", ex);
            }
            return null; // We will return it logout page if any error occur
        }
        #endregion

        #region Common Methods
        //Action result for ajax call
        /// <summary>
        /// This ActionResult return the Extension list in power zone queues for ajax call
        /// </summary>
        /// <returns>Json data</returns>
        [HttpPost]
        public ActionResult GetExtensionInPowerZone()
        {
            try
            {
                if (!string.Equals(Session["Role"], Roles.Admin.ToString()))
                {
                    if (string.Equals(Session["Role"], Roles.User.ToString()))
                    {
                        ManagementList.objExtensionList.Clear();
                        ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensionsInPowerZone(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Roles.User.ToString()));
                    }
                    else
                    {
                        ManagementList.objExtensionList.Clear();
                        ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensionsInPowerZone(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Roles.Manager.ToString()));
                    }
                }
                else
                {
                    ManagementList.objExtensionList.Clear();
                    ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensionsInPowerZone(0, null));
                }
                SelectList objExtList = new SelectList(ManagementList.objExtensionList, "ExtNumber", "Name", 0);
                return Json(objExtList);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in GetExtensionInPowerZone", ex);
            }
            return null;
        }

        /// <summary>
        /// This ActionResult return the Extension list for particular queue for ajax call
        /// </summary>
        /// <returns>Json data</returns>
        [HttpPost]
        public ActionResult GetExtensionByQueue(string queueNumber)
        {
            try
            {
                if (!string.IsNullOrEmpty(Session["Login"].ToString()))
                {
                    ManagementList.objExtensionList.Clear();
                    ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensionsByQueue(queueNumber, Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture)));
                }

                SelectList objExtList = new SelectList(ManagementList.objExtensionList, "ExtNumber", "Name", 0);
                return Json(objExtList);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in GetExtensionByQueue", ex);
            }
            return null;
        }

        //Action result for ajax call
        /// <summary>
        /// This ActionResult return the Extension list for date range by ajax call
        /// </summary>
        /// <returns>Json data</returns>
        [HttpPost]
        public ActionResult GetExtensions()
        {
            try
            {
                Logger.WriteTraceLog("Post GetExtensions:start");

                if (!string.IsNullOrEmpty(Session["Role"].ToString()))
                {
                    ManagementList.objExtensionList.Clear();
                    ManagementList.objExtensionList.AddRange(ManagementInfo.GetExtensions(Convert.ToInt32(Session["Login"], CultureInfo.CurrentCulture), Session["Role"].ToString()));
                }
                SelectList objExtList = new SelectList(ManagementList.objExtensionList, "ExtNumber", "Name");

                Logger.WriteTraceLog("Post GetExtensions: End ");

                return Json(objExtList);

            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in GetExtensions", ex);
            }
            return null;
        }
        #endregion

        /// <summary>
        /// Update date range in model based on ReportType 
        /// </summary>
        /// <param name="paramModel">model object</param>
        /// <returns>Model with updated date range</returns>
        private DropCallsParameterModel GetDateRange(DropCallsParameterModel paramModel)
        {
            TimeSpan tsMorning = new TimeSpan(08, 00, 0);
            TimeSpan tsEvening = new TimeSpan(21, 00, 0);

            paramModel.ToDate = DateTime.Now.Date + tsEvening;
            if (paramModel.Type.Equals(ReportTypes.Monthly))
            {
                paramModel.FromDate = DateTime.Now.Date.AddDays(-29) + tsMorning;
            }
            else if (paramModel.Type.Equals(ReportTypes.Weekly))
            {
                paramModel.FromDate = DateTime.Now.Date.AddDays(-6) + tsMorning;
            }
            else if (paramModel.Type.Equals(ReportTypes.Daily))
            {
                paramModel.FromDate = DateTime.Now.Date + tsMorning;
            }
            return paramModel;
        }
    }

    /// <summary>
    /// Helper class to convert enum to List
    /// </summary>
    public static class EnumHelper
    {
        public static List<ListItem> GetReportTypeList()
        {
            Array values = Enum.GetValues(typeof(ReportTypes));
            List<ListItem> items = new List<ListItem>(values.Length);

            foreach (var i in values)
            {
                items.Add(new ListItem
                {
                    Text = Enum.GetName(typeof(ReportTypes), i),
                    Value = ((int)i).ToString()
                });
            }

            return items;
        }
    }
}

