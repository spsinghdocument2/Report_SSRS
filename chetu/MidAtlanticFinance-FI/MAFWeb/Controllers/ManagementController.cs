using MAF.BAL.Models;
using MAFWeb.BAL.Models;
using System;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;
using MAF.BAL;
using MAF.BAL.ResourceFile;
using System.Configuration;

namespace MAFWeb.Controllers
{
    public class ManagementController : Controller
    {
        #region Private members
        int userIds; // Get userid in int type
        #endregion
        /// <summary>
        /// This private datamember is used to create object of ManagementInfo
        /// </summary>
        private ManagementInfo managementInfo;

        /// <summary>
        /// This property is used to create object of ManagementInfo class and check the object is already created or not
        /// </summary>
        public ManagementInfo ManagementInfo
        {
            get { return managementInfo ?? (managementInfo = new ManagementInfo()); }
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
            get { return managementList ?? (managementList = new ManagementList()); }
        }

        /// <summary>
        /// This ActionResult return the Mangement Index view page.
        /// </summary>
        public ActionResult Index()
        {
            try
            {
                if (Session["login"] == null)
                {
                    Response.Redirect("/Account/Login");
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Home Page return view", ex);
            }
            return View();
          //  return null;  // We will return it logout page if any error occur
        }

        /// This ActionResult return the Power Zone Schedule Timingview page.
        public ActionResult PartialPowerZoneScheduleTime(string scheduleId)
        {
            try
            {
                PowerZoneTimeViewModel powerZoneTimeVM = new PowerZoneTimeViewModel()
                {
                    Zone1FromTime = DateTime.Now.Date + new TimeSpan(11, 00, 00),
                    Zone1ToTime = DateTime.Now.Date + new TimeSpan(12, 00, 00),
                    Zone2FromTime = DateTime.Now.Date + new TimeSpan(15, 00, 00),
                    Zone2ToTime = DateTime.Now.Date + new TimeSpan(16, 00, 00)
                };
                if (!string.IsNullOrWhiteSpace(scheduleId))
                {
                    ReportModel reportModel = ManagementInfo.GetMultiUserReportList(scheduleId).FirstOrDefault();
                    if (reportModel != null)
                    {
                        powerZoneTimeVM.Zone1FromTime = DateTime.Now.Date + reportModel.Zone1FromTime.Value;
                        powerZoneTimeVM.Zone1ToTime = DateTime.Now.Date + reportModel.Zone1ToTime.Value;
                        powerZoneTimeVM.Zone2FromTime = DateTime.Now.Date + reportModel.Zone2FromTime.Value;
                        powerZoneTimeVM.Zone2ToTime = DateTime.Now.Date + reportModel.Zone2ToTime.Value;
                    }
                }

                return PartialView(powerZoneTimeVM);
            }
            catch (InvalidOperationException exception)
            {
                Logger.WriteErrorLog("Error in PartialView Power Zone Schedule Time Info", exception);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in PartialView Power Zone Schedule Time Info", ex);
            }
            return null;  // We will return it PartialView Power Zone Time  if any error occur
            // return PartialView();
        }

        /// This ActionResult return the Big Screen Zone Timing view page.
        public ActionResult PartialBigScreenZoneTime()
        {
            try
            {
                BigScreeViewModel bigScreenVM = new BigScreeViewModel()
                {
                    Zone1FromTime = DateTime.Now.Date + new TimeSpan(11, 00, 00),
                    Zone1ToTime = DateTime.Now.Date + new TimeSpan(12, 00, 00),
                    Zone2FromTime = DateTime.Now.Date + new TimeSpan(15, 00, 00),
                    Zone2ToTime = DateTime.Now.Date + new TimeSpan(16, 00, 00)
                };

                BigScreenPowerZoneModel reportModel = ManagementInfo.GetBigScreenPowerZoneTime();
                if (reportModel != null)
                {
                    bigScreenVM.Zone1FromTime = DateTime.Now.Date + reportModel.Zone1FromTime.Value;
                    bigScreenVM.Zone1ToTime = DateTime.Now.Date + reportModel.Zone1ToTime.Value;
                    bigScreenVM.Zone2FromTime = DateTime.Now.Date + reportModel.Zone2FromTime.Value;
                    bigScreenVM.Zone2ToTime = DateTime.Now.Date + reportModel.Zone2ToTime.Value;
                    bigScreenVM.Header1Color = reportModel.Header1Color;
                    bigScreenVM.Header2Color = reportModel.Header2Color;
                    bigScreenVM.RowColor = reportModel.RowColor;
                    bigScreenVM.AlternateRowColor = reportModel.AlternateRowColor;
                    bigScreenVM.FontColor = reportModel.FontColor;
                    bigScreenVM.Queues = reportModel.Queues.Split(',').ToList();
                }

                //Get Queues in view bag
                ViewBag.QueueList = new MultiSelectList(ManagementInfo.GetQueueNumbers(), "QueueNumber", "Queuename", bigScreenVM.Queues);

                return PartialView(bigScreenVM);
            }
            catch (InvalidOperationException exception)
            {
                Logger.WriteErrorLog("Error in PartialView Big Screen Power Zone Time Info", exception);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in PartialView Big Screen Power Zone Time Info", ex);
            }
            return null;  // We will return it PartialView Power Zone Time  if any error occur
            // return PartialView();
        }

        /// <summary>
        /// Updates power zone time for big screen
        /// </summary>
        /// <param name="zone1FromTime">Zone1 From Time</param>
        /// <param name="zone1ToTime">Zone1 To Time</param>
        /// <param name="zone2FromTime">Zone2 From Time</param>
        /// <param name="zone2ToTime">Zone2 To Time</param>
        /// <param name="header1Color"></param>
        /// <param name="header2Color"></param>
        /// <param name="row1Color"></param>
        /// <param name="row2Color"></param>
        /// <param name="fontColor"></param>
        /// <param name="queues"></param>
        public ActionResult UpdateBigScreenZoneTime(TimeSpan? zone1FromTime, TimeSpan? zone1ToTime, TimeSpan? zone2FromTime, TimeSpan? zone2ToTime, string header1Color, string header2Color, string row1Color, string row2Color, string fontColor, string queues)
        {
            try
            {
                //Check for null value
                if (zone1FromTime.HasValue && zone1ToTime.HasValue && zone2FromTime.HasValue && zone2ToTime.HasValue)
                {
                    ManagementInfo.UpdateBigScreenPowerZoneTime(zone1FromTime, zone1ToTime, zone2FromTime, zone2ToTime, header1Color, header2Color, row1Color, row2Color, fontColor, queues);
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Function Update Big Screen Power zone time", ex);
            }
            return View("Index");
        }

        /// <summary>
        /// Method to get Partial view for Recording Path
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult PartialRecordingPath()
        {
            try
            {
                RecordingViewModel recordingVM = new RecordingViewModel()
                {
                    Path = VirtualDirectoryManager.GetPhysicalPath(ConfigurationManager.AppSettings["IISApplicationName"],
                    ConfigurationManager.AppSettings["RecordingPathVirtualDirectoryName"]),                    
                    CallIntervals = Convert.ToInt32(ManagementInfo.GetRecordingPath().CallIntervals)
                };
                
                return PartialView(recordingVM);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in PartialView Recording path", ex);
            }
            return null;
        }

        /// <summary>
        /// Method to update virtual directory path
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        [HttpPost]
        public JsonResult UpdateRecordingPath(string path, string callInterval)
        {
            try
            {
                if (VirtualDirectoryManager.IsExists(path))
                {
                    if (VirtualDirectoryManager.CanRead(path))
                    {
                        //set virtual directory path
                        VirtualDirectoryManager.SetPhysicalPath(ConfigurationManager.AppSettings["IISApplicationName"],
                    ConfigurationManager.AppSettings["RecordingPathVirtualDirectoryName"], path);
                        
                        // Save path in database
                        ManagementInfo.SetRecordingPath(path.Replace(@"\", @"\\"), Convert.ToInt32(callInterval,CultureInfo.CurrentCulture));
                        return Json(new {Success=true, Message=Common.RecordingPathSuccess}, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        //Don't have read access
                        return Json(new { Success = false, Message = Common.RecordingPathAccessDenied }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    //Directory path is invalid
                    return Json(new { Success = false, Message = Common.RecordingPathInvalid }, JsonRequestBehavior.AllowGet);                   
                }
            }
            catch (UnauthorizedAccessException ex)
            {
                // Unauthorized access to directory 
                Logger.WriteErrorLog("Error in Function Update Recording Path", ex);
                return Json(new { Success = false, Message = Common.RecordingPathAccessDenied }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception exception)
            {
                //exception
                Logger.WriteErrorLog("Error in Function Update Recording Path", exception);
            }
            return Json(new { Success = false, Message = Common.RecordingPathError }, JsonRequestBehavior.AllowGet);
        }

        /// This ActionResult return the User Roles view page.
        public ActionResult PartialAssignRole(string userId)
        {
            try
            {
                //ManagementList.objManagementList = ManagementInfo.GetUserRoleDetails(userId);
                ManagementList.objManagementList.Clear();
                ManagementList.objManagementList.Add(ManagementInfo.GetUserRoleDetails(userId));
                ManagementList.objQueueList.Clear();
                ManagementList.objQueueList.AddRange(ManagementInfo.GetQueueNumbers());
                if (!string.IsNullOrEmpty(ManagementList.objManagementList.FirstOrDefault().ManagerQueue))
                {
                    MultiSelectList obj = new MultiSelectList(ManagementList.objQueueList, "QueueNumber", "Queuename", ManagementList.objManagementList.FirstOrDefault().ManagerQueue.Split(','));
                    ViewBag.QueueList = obj;
                }
                else
                {
                    MultiSelectList obj = new MultiSelectList(ManagementList.objQueueList, "QueueNumber", "Queuename");
                    ViewBag.QueueList = obj;
                }
                
                return PartialView(ManagementList);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in PartialView Assign Role Info", ex);
            }
            return null;  // We will return it PartialView Assign Role if any error occur
            // return PartialView();
        }

        /// This string function Post the User Roles details page.
        public string UpdateAssignRole(string userId,string loginId , string password , string role,string queue)
        {
            try
            {
                ManagementInfo.UpdateManagerInQueue(Convert.ToInt32(loginId, CultureInfo.CurrentCulture), queue, role);
                return  ManagementInfo.UpdateUserRoleDetails(userId, loginId, password, role);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in PartialView Assign Role Info", ex);
            }
            return null;  // We will return it PartialView Assign Role if any error occur
            // return PartialView();
        }
        /// This ActionResult return the User Details List view page.

        public ActionResult PartialUserDetails(string searchUser, string searchQueue)
        {
            try
            {
                //ManagementList.objManagementList = ManagementInfo.GetUserDetails(searchUser, searchQueue);
                ManagementList.objManagementList.Clear();
                ManagementList.objManagementList.AddRange(ManagementInfo.GetUserDetails(searchUser,searchQueue));
                return PartialView(ManagementList);
            }
            catch (Exception ex)
            {
                 Logger.WriteErrorLog("Error in PartialView Management Info", ex);
            }
            return null;  // We will return it PartialView Management if any error occur
           // return PartialView();
        }


        /// This ActionResult return the Exclude User Details By Report List view page.

        public ActionResult PartialExcludeUserDetails(string searchUser)
        {
            try
            {
                //ManagementList.objManagementList = ManagementInfo.GetExcludeUserDetails(searchUser);
                ManagementList.objManagementList.Clear();
                ManagementList.objManagementList.AddRange(ManagementInfo.GetExcludeUserDetails(searchUser));
                return PartialView(ManagementList);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in PartialView exculde user Management Info", ex);
            }
            return null;  // We will return it PartialView exculde user page if any error occur
            // return PartialView();
        }


        /// This ActionResult return the Queue List view page.

        public ActionResult PartialQueuelist(string userId, string queueName)
        {
            string queueNames = null;
            try
            {
                if (!string.IsNullOrEmpty(queueName)) { queueNames = queueName; }
                ManagementList.objQueueList.Clear();
                ManagementList.objQueueList.AddRange(ManagementInfo.GetQueueList(queueNames));
                if (!string.IsNullOrEmpty(userId))
                {
                    ManagementList.objUserinQueueList.Clear();
                    ManagementList.objUserinQueueList.AddRange(ManagementInfo.GetUserInQueueList(Convert.ToInt32(userId, CultureInfo.CurrentCulture)));
                }
                return PartialView(ManagementList);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in PartialView Queue List Info", ex);
            }
            return null;  // We will return it PartialView Queue List Page if any error occur
        }

        /// This ActionResult return the Schedule Report List view page.
 
        public ActionResult PartialScheduleReport(string reportName,string userId)
        {
            string reportNames = null;
            try
            {
                ManagementList.objQueueList.Clear();
                ManagementList.objQueueList.AddRange(ManagementInfo.GetQueueList(reportName));
                ViewBag.QueueList = new SelectList(ManagementList.objQueueList, "QueueNumber", "Queuename");
                if (!string.IsNullOrEmpty(reportName)) { reportNames = reportName; }
                ManagementList.objReportList.Clear();
                ManagementList.objReportList.AddRange(ManagementInfo.GetReportList(reportNames));

                if (!string.IsNullOrEmpty(userId)) { userIds = Convert.ToInt32(userId, CultureInfo.CurrentCulture); }
                ManagementList.objUserScheduleReportlist.Clear();
                ManagementList.objUserScheduleReportlist.AddRange(ManagementInfo.GetUserScheduleReportList(userIds));

                return PartialView(ManagementList);
            }
            catch (Exception ex)
            {
                 Logger.WriteErrorLog("Error in PartialView Schedule Report Info", ex);
            }
            return null;  // We will return it PartialView Schedule Report page if any error occur

        }

        /// This ActionResult return the Multi User Schedule Report List view page.

        public ActionResult PartialMulitUserScheduleReport(string reportName)
        {
            string reportNames = null;
            try
            {
                ManagementList.objQueueList.Clear();
                ManagementList.objQueueList.AddRange(ManagementInfo.GetQueueNumbers());
                ViewBag.QueueList = new SelectList(ManagementList.objQueueList, "QueueNumber", "Queuename");
                ViewBag.multiQueueList = new MultiSelectList(ManagementList.objQueueList, "QueueNumber", "Queuename");
                if (!string.IsNullOrEmpty(reportName)) { reportNames = reportName; }
                ManagementList.objReportList.Clear();
                ManagementList.objReportList.AddRange(ManagementInfo.GetReportList(reportNames));
                ManagementList.objMultiuserScheduleReportlist.Clear();
                ManagementList.objMultiuserScheduleReportlist.AddRange(ManagementInfo.GetMultiUserReportList(null));
                return PartialView(ManagementList);
            }
            catch (Exception ex)
            {
                 Logger.WriteErrorLog("Error in PartialView Multi User Schedule Report Info", ex);
            }
            return null;  // We will return it PartialView Multi User Schedule Report page if any error occur

        }

        /// This ActionResult return the Add Report to User List view page.

        public ActionResult PartialAddReport(string reportName,string userId)
        {
            string reportNames = string.Empty; 
            try
            {
                if (!string.IsNullOrEmpty(reportName)) { reportNames = reportName; }
                ManagementList.objReportList.Clear();
                ManagementList.objReportList.AddRange(ManagementInfo.GetReportList(reportNames));

                if (!string.IsNullOrEmpty(userId)) { userIds = Convert.ToInt32(userId, CultureInfo.CurrentCulture); }
                ManagementList.objUserReportList.Clear();
                ManagementList.objUserReportList.AddRange(ManagementInfo.GetUserReportList(userIds));
                return PartialView(ManagementList);
            }
            catch (Exception ex)
            {
                 Logger.WriteErrorLog("Error in PartialView Add Report Info", ex);
            }
            return null;  // We will return it PartialView Add Report page if any error occur
        }

        /// This ActionResult return the Schedule User List view page.

        public ActionResult PartialScheduleUser(string userName, string scheduleId, string queueNum, string reportId, string abbreviation)
        {
            try
            {
                //ManagementList.objManagementList = ManagementInfo.GetScheduleUserDetails(userName, "", queueNum, reportId, abbreviation);
                ManagementList.objManagementList.Clear();
                ManagementList.objManagementList.AddRange(ManagementInfo.GetScheduleUserDetails(userName, "", queueNum, reportId, abbreviation));
                ManagementList.objMultiuserScheduleReportlist.Clear();
                ManagementList.objMultiuserScheduleReportlist.AddRange(ManagementInfo.GetMultiUserReportList(scheduleId));
                return PartialView(ManagementList);
            }
            catch (Exception ex)
            {
                 Logger.WriteErrorLog("Error in PartialView schedule user Info", ex);
            }
            return null;  // We will return it PartialView schedule user page if any error occur
        }
        /// This ActionResult return the Schedule User List view page.

        public ActionResult PartialScheduleQueue(string queueName, string scheduleId)
        {
            try
            {
                ManagementList.objQueueList.Clear();
                ManagementList.objQueueList.AddRange(ManagementInfo.GetQueueList(queueName));
                ManagementList.objMultiuserScheduleReportlist.Clear();
                ManagementList.objMultiuserScheduleReportlist.AddRange(ManagementInfo.GetMultiUserReportList(scheduleId));
                return PartialView(ManagementList);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in PartialView schedule user Info", ex);
            }
            return null;  // We will return it PartialView schedule user page if any error occur
        }

        //Action result for ajax call
        /// This string function update enable user view page.
        public string UpdateEnableUser(string userId, string active)
        {
     
            try
            {
                if (!string.IsNullOrEmpty(userId) && !string.IsNullOrEmpty(active)) {
                    ManagementInfo.UpdateEnableUser(Convert.ToInt32(userId, CultureInfo.CurrentCulture), active);
                }
            }
            catch (Exception ex)
            {
                 Logger.WriteErrorLog("Error in Function Update Enable User", ex);
            }
            return null;  // We will return it Function Update Enable User  if any error occur
        }
        //Action result for ajax call
        /// This string function delete schedule multiuser schedule view page.
        public string Deleteschedule(string scheduleId)
        {

            try
            {
                if (!string.IsNullOrEmpty(scheduleId))
                {
                    ManagementInfo.DeleteSchedule(Convert.ToInt32(scheduleId, CultureInfo.CurrentCulture));
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Function Delete Schedule", ex);
            }
            return null;  // We will return it Function Delete Schedule  if any error occur
        }


        //Action result for ajax call
        /// This string function update Exclude Management user in pop up.
        public string UpdateExcludeManagementUser(string userId,string active)
        {

            try
            {
                if (!string.IsNullOrEmpty(userId) && !string.IsNullOrEmpty(active))
                {
                    ManagementInfo.UpdateExcludeManagementUser(Convert.ToInt32(userId, CultureInfo.CurrentCulture), Convert.ToInt32(active, CultureInfo.CurrentCulture));
                }
            }
            catch (Exception ex)
            {
                 Logger.WriteErrorLog("Error in Function Update Exclude Management User", ex);
            }
            return null;  // We will return it Function Update Exclude Management User if any error occur
        }


        //Action result for ajax call
        /// This String function update User Reports.
        public string UpdateUserReports(string userId, string reportId)
        {
            try
            {

                if (!string.IsNullOrEmpty(userId) && !string.IsNullOrEmpty(reportId))
                {
                    ManagementInfo.UpdateUserReports(Convert.ToInt32(reportId, CultureInfo.CurrentCulture), Convert.ToInt32(userId, CultureInfo.CurrentCulture));
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Function Update User Reports", ex);
            }
            return null;  // We will return it Function Update User Reports if any error occur
        }

        //Action result for ajax call
        /// This String function update User In Queue.
        public string UpdateUserInQueue(string extNum, string queueId, string active)
        {
            try
            {

                if (!string.IsNullOrEmpty(extNum) && !string.IsNullOrEmpty(queueId) && !string.IsNullOrEmpty(active))
                {
                    ManagementInfo.UpdateUserInQueue(Convert.ToInt32(extNum, CultureInfo.CurrentCulture), Convert.ToInt32(queueId, CultureInfo.CurrentCulture), active);
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Function Update  User in Queue", ex);
            }
            return null;  // We will return it Function Update  User in Queue  if any error occur
        }

        //Action result for ajax call
        /// This String function update User Schedule Reports.
        ///  // daily:1 , Weekly : 2; Parameters  ,1 for update / Insert, 2 for schedule ,3 for unschedule
        public string UpdateUserScheduleReports(string userId, string reportId, string emailId, string scheduleTime, string scheduleType,string isSchedule)
        {
            try
            {                                
                    if (!string.IsNullOrEmpty(userId) && !string.IsNullOrEmpty(reportId) && !string.IsNullOrEmpty(scheduleTime) && !string.IsNullOrEmpty(scheduleType))
                    {
                        ManagementInfo.UpdateUserScheduleReports(Convert.ToInt32(userId, CultureInfo.CurrentCulture), Convert.ToInt32(reportId, CultureInfo.CurrentCulture), emailId, scheduleTime, Convert.ToInt32(scheduleType, CultureInfo.CurrentCulture), Convert.ToInt32(isSchedule, CultureInfo.CurrentCulture));
                    }                
            }
            catch (Exception ex)
            {
                 Logger.WriteErrorLog("Error in Function Update User Schedule Reports", ex);
            }
            return null;  // We will return it Function Update User Schedule Reports page if any error occur
        }

        //Action result for ajax call
        /// This String function update Multi User Schedule Reports.
        public string UpdateMultiUserScheduleReports(string reportId, string emailId, string scheduleTime, string scheduleType, string users, string queueNum, string scheduleId, string isSchedule, TimeSpan? zone1FromTime, TimeSpan? zone1ToTime, TimeSpan? zone2FromTime, TimeSpan? zone2ToTime)
        {
            try
            {
                // daily:1 , Weekly : 2; Parameters 
                if (!string.IsNullOrEmpty(reportId) && !string.IsNullOrEmpty(scheduleTime) && !string.IsNullOrEmpty(scheduleType))
                {
                    ManagementInfo.UpdateMultiUserScheduleReports(Convert.ToInt32(reportId, CultureInfo.CurrentCulture), emailId, scheduleTime, Convert.ToInt32(scheduleType, CultureInfo.CurrentCulture), users.TrimEnd(','), queueNum.TrimEnd(','), Convert.ToInt32(scheduleId, CultureInfo.CurrentCulture), Convert.ToInt32(isSchedule, CultureInfo.CurrentCulture), zone1FromTime, zone1ToTime, zone2FromTime, zone2ToTime);
                }
            }
            catch (Exception ex)
            {
                 Logger.WriteErrorLog("Error in Function Update Multi User Schedule Reports", ex);
            }
            return null;  // We will return it Function Update Multi User Schedule Reports page if any error occur
        }

        /// This String function delete user into the management.
        public string DeleteUser(string userId)
        {
            try
            {
                if(!string.IsNullOrEmpty(userId))
                {
                    ManagementInfo.DeleteUser(Convert.ToInt32(userId));
                }
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in delete user in management", ex);
            }
            return null;
        }

        [HttpGet]
        public void ResetPowerZoneColor()
        {
            try
            {
                ManagementInfo.ResetPowerZoneColor();
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Reset power zone color", ex);
            }
        }
    }
}
