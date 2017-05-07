namespace MAF.BAL.Models
{
    using System;
    using System.Collections.Generic;
    using System.Globalization;
    using System.Linq;
   public class ManagementInfo
    {
        /// <summary>
        /// Create datamember of the MAFWebEntities class;
        /// </summary>
        private DAL.Management management;

        /// <summary>
        /// Create MAFWebEntities class object and check if its already created.
        /// </summary>
        public DAL.Management Management
        {
            get { return management ?? (management = new DAL.Management()); }
        }

        /// <summary>
        /// This method is used to get the Userdetails list and bind that into Management model.
        /// </summary>
        /// <name></name>
        /// <parameter>NA</parameter>
        /// <returns>User Details list</returns>
        public List<ManagementModel> GetUserDetails(string serachUser, string searchQueue)
        {
            try
            {
                return Management.GetUserDetails(serachUser, searchQueue).Select(s => new ManagementModel {ManagerQueue=s.managerqueue,Role=s.role, UserName = s.Name, QueueCnt = Convert.ToInt32(s.QueueCnt, System.Globalization.CultureInfo.CurrentCulture), Ext = Convert.ToInt32(s.Ext, System.Globalization.CultureInfo.CurrentCulture), UserId = s.iduser, IsEnable = Convert.ToInt32(s.IsEnable, System.Globalization.CultureInfo.CurrentCulture), QueueNum = s.queuenum }).OrderBy(s => s.Ext).ToList();
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the User Role details list and bind that into Management model.
        /// </summary>
        /// <name></name>
        /// <parameter>NA</parameter>
        /// <returns>User Role Details </returns>
        public ManagementModel GetUserRoleDetails(string userId)
        {
            try
            {
                return Management.GetUserRoleDetails(userId).Select(s => new ManagementModel { ManagerQueue=s.managerqueue, UserId = s.iduser, Role = s.Role, LoginID = s.LoginID, Password = s.Password }).FirstOrDefault();
            }
            catch
            {
                throw;
            }

        }
         /// This method is used to Update the User role Details  into the database.    
        public string UpdateUserRoleDetails(string userId, string loginId, string password, string role)
        {
            try
            {
                 return Management.UpdateUserRoleDetails(userId, loginId, password, role);
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// This method is used to delete the user in the database.
        /// </summary>
        /// <name></name>
        /// <parameter>userId</parameter>
        public void DeleteUser(int userId)
        {
            try
            {
                Management.DeleteUser(userId);
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// This method is used to Update Manager in Queue details save  into the database.   
        /// </summary>
        /// <returns>NA</returns>
        public void UpdateManagerInQueue(int extnum, string queueid, string role)
        {
            try
            {
                Management.UpdateManagerInQueue(extnum, queueid, role);
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// This method is used to get the Shedule Userdetails list and bind that into Management model.
        /// </summary>
        /// <name></name>
        /// <parameter>NA</parameter>
        /// <returns>Shedule User Details list: List<ManagementModel></returns>
        public List<ManagementModel> GetScheduleUserDetails(string serachUser, string searchQueue, string queueNum, string reportId, string abbreviation)
        {
            try
            {
                if (!string.IsNullOrEmpty(queueNum))
                    return Management.GetScheduleUserDetails(serachUser, null).Select(s => new ManagementModel { UserName = s.Name, Ext = Convert.ToInt32(s.Ext, System.Globalization.CultureInfo.CurrentCulture), UserId = s.iduser,  QueueNum = s.queuenum }).OrderBy(s => s.Ext).Where(s => s.QueueNum !=null && s.QueueNum.Contains(queueNum)).ToList();
                else if (abbreviation == "ScoreCard")
                    return Management.GetScheduleUserDetails(serachUser, abbreviation).Select(s => new ManagementModel { UserName = s.Name, Ext = Convert.ToInt32(s.Ext, System.Globalization.CultureInfo.CurrentCulture), UserId = s.iduser, QueueNum = s.queuenum }).OrderBy(s => s.Ext).ToList();
                else
                    return Management.GetScheduleUserDetails(serachUser, null).Select(s => new ManagementModel { UserName = s.Name,  Ext = Convert.ToInt32(s.Ext, System.Globalization.CultureInfo.CurrentCulture), UserId = s.iduser,  QueueNum = s.queuenum }).OrderBy(s => s.Ext).ToList();
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// This method is used to Update the enable in the database.
        /// </summary>
        public void UpdateEnableUser(int userId,string active)
        {
            try
            {
                Management.UpdateEnableUser(userId, active);
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to Delete schedule into the database.   
        /// </summary>
        public void DeleteSchedule(int scheduleId)
        {
            try
            {
                Management.DeleteSchedule(scheduleId);
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// This method is Verify the login details in the database.
        /// </summary>
        public List<LoginModel> CheckLogin(string loginId, string password)
        {
            try
            {
                return Management.CheckLogin(loginId, password).Select(s => new LoginModel { Role = s.Role,Abbreviation=s.Abbreviation }).ToList();              
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to Update the Exclude Management User in the database.
        /// </summary>
        public void UpdateExcludeManagementUser(int userId, int active)
        {
            try
            {
                Management.UpdateExcludeManagementUser(userId, active);
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the Report list and bind that into Management model.
        /// </summary>
        /// <name></name>
        /// <parameter>NA</parameter>
        /// <returns>Report list: List<ReportModel></returns>
        public List<ReportModel> GetReportList(string reportName)
        {
            try
            {
                return Management.GetReportList(reportName).Select(s => new ReportModel { ReportId = s.idreport, ReportName = s.name,Abbreviation=s.Abbreviation }).ToList();
            }
            catch
            {
                throw;
            }
        }
       
        /// <summary>
        /// This method is used to get the Exclude user By Report list and bind that into Management model.
        /// </summary>
        /// <name></name>
        /// <parameter>NA</parameter>
        /// <returns>Exclude User  list: List<ManagementModel></returns>
        public List<ManagementModel> GetExcludeUserDetails(string searchUser)
        {
            try
            {
                return Management.GetExcludeUserDetails(searchUser).Select(s => new ManagementModel { Ext = Convert.ToInt32(s.Ext, System.Globalization.CultureInfo.CurrentCulture), UserName = s.Name, UserId = s.iduser, IsExclude = Convert.ToInt32(s.IsExclude, System.Globalization.CultureInfo.CurrentCulture) }).ToList();
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// This method is used to get the Queue list and bind that into Management model.
        /// </summary>
        /// <name></name>
        /// <parameter>NA</parameter>
        /// <returns>Queue list: List<QueueModel></returns>
        public List<QueueModel> GetQueueList(string queueName)
        {
            try
            {
                return Management.GetQueueList(queueName).Select(s => new QueueModel { FkIddn = s.fkiddn, QueueId = s.idqueue, QueueName = s.name, QueueNumber = s.value }).OrderBy(s => s.QueueName).ToList();
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the Queue list and bind that into Management model.
        /// </summary>
        /// <name></name>
        /// <parameter>NA</parameter>
        /// <returns>Queue list Number: List<QueueModel></returns>
        public List<QueueModel> GetQueueNumbers()
        {
            try
            {
                return Management.GetQueueNumbers().Select(s => new QueueModel { QueueNumber = s.QueueNumber, QueueName = s.QueueNumber + " " + s.QueueName }).ToList();
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// This method is used to get the Queue list and bind that into Management model.
        /// </summary>
        /// <name></name>
        /// <parameter>NA</parameter>
        /// <returns>Queue list: List<QueueModel></returns>
        public List<QueueModel> GetQueueList(int extNumber,string role)
        {
            try
            {
                return Management.GetQueues(extNumber,role).Select(s => new QueueModel { QueueNumber = s.QueueNumber, QueueName = s.QueueNumber + " " + s.QueueName }).ToList();
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the Extension list by queue number and bind that into Management model.
        /// </summary>
        /// <name></name>
        /// <parameter>NA</parameter>
        /// <returns>Extension list: List<ExtensionModel></returns>
        public List<ExtensionModel> GetExtensionsByQueue(string queueNumber,int extNum)
        {
            try
            {
               
                return Management.GetExtensionsByQueue(queueNumber,extNum).Select(e => new ExtensionModel { ExtNumber = e.extnum, Name = e.extnum + " " + e.firstname + " " + e.lastname }).ToList();
                
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the Extension list and bind that into Management model.
        /// </summary>
        /// <name></name>
        /// <returns>Extension list: List<ExtensionModel></returns>
        public List<ExtensionModel> GetExtensions(int extNumber, string role)
        {
            try
            {
                 return Management.GetExtensions(extNumber,role).Select(e => new ExtensionModel { ExtNumber = e.extnum, Name = e.extnum + " " + e.firstname + " " + e.lastname }).ToList();                
                
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// This method is used to Update the UserReports in the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public void UpdateUserReports(int reportId, int userId)
        {
            try
            {
                Management.UpdateUserReports(reportId, userId);
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to Update the UserReports in the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public void UpdateUserScheduleReports(int reportId, int userId, string emailId, string scheduleTime, int scheduletType, int isSchedule)
        {
            try
            {
                Management.UpdateUserScheduleReports(userId, reportId, emailId, scheduleTime, scheduletType, isSchedule);
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to Update the Multi User Reports in the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public void UpdateMultiUserScheduleReports(int reportId, string emailId, string scheduleTime, int scheduleType, string users, string queueNum, int scheduleId, int isSchedule, TimeSpan? zone1FromTime, TimeSpan? zone1ToTime, TimeSpan? zone2FromTime, TimeSpan? zone2ToTime)
        {
            try
            {
                Management.UpdateMultiUserScheduleReports(reportId, emailId, scheduleTime, scheduleType, users, queueNum, scheduleId, isSchedule, zone1FromTime, zone1ToTime, zone2FromTime, zone2ToTime);
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to Update the User in Queue in the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public void UpdateUserInQueue(int extNum, int queueId, string active)
        {
            try
            {
                Management.UpdateUserinQueue(extNum, queueId, active);
            }
            catch
            {
                throw;
            }
        }

     

        /// <summary>
        /// This method is used to get the User Report list and bind that into Management model.
        /// </summary>
        /// <name></name>
        /// <parameter>NA</parameter>
        /// <returns>User Report list: List<Reportmodel></returns>
        public List<ReportModel> GetUserReportList(int useriId)
        {
            try
            {
                return Management.GetUserReportList(useriId).Select(s => new ReportModel { UserId = s.iduser, ReportId = s.idreport }).ToList();
            }
            catch
            {
                throw;
            }
        }



        /// <summary>
        /// This method is used to get the Multi User Report list and bind that into Management model.
        /// </summary>
        /// <name></name>
        /// <parameter>NA</parameter>
        /// <returns>Multi User Report list: List<Reportmodel></returns>
        public List<ReportModel> GetMultiUserReportList(string scheduleId)
        {
            try
            {
                if (!string.IsNullOrEmpty(scheduleId))
                {
                    return Management.GetMultiUserScheduleReportList().Select(s => new ReportModel
                    {
                        MultiuserId = s.MultiUserID,
                        ReportId = s.ReportID,
                        QueueNumber = s.QueueNum,
                        ScheduleTime = s.ScheduleTime,
                        ScheduleType = s.ScheduleType,
                        IsSchedule = s.IsSchedule,
                        ReportName = s.ReportName,
                        EmailId = s.EmailID,
                        UserName = s.Users,
                        ScheduleId = s.ScheduleID,
                        Zone1FromTime = s.Zone1FromTime,
                        Zone1ToTime = s.Zone1ToTime,
                        Zone2FromTime = s.Zone2FromTime,
                        Zone2ToTime = s.Zone2ToTime,
                        Abbreviation=s.Abbreviation
                    })
                    .OrderBy(s => s.ReportId)
                    .Where(s => s.ScheduleId == Convert.ToInt32(scheduleId, System.Globalization.CultureInfo.CurrentCulture)).Where(s=>s.IsSchedule==true).ToList();
                }

                else 
                { 
                    return Management.GetMultiUserScheduleReportList().Select(s => new ReportModel 
                    { 
                        MultiuserId = s.MultiUserID, 
                        ReportId = s.ReportID, 
                        QueueNumber = s.QueueNum, 
                        ScheduleTime = s.ScheduleTime, 
                        ScheduleType = s.ScheduleType, 
                        IsSchedule = s.IsSchedule, 
                        ReportName = s.ReportName, 
                        EmailId = s.EmailID, 
                        UserName = s.Users,
                        ScheduleId = s.ScheduleID,
                        Zone1FromTime = s.Zone1FromTime,
                        Zone1ToTime = s.Zone1ToTime,
                        Zone2FromTime = s.Zone2FromTime,
                        Zone2ToTime = s.Zone2ToTime,
                        Abbreviation = s.Abbreviation
                    })
                    .OrderBy(s => s.ReportId).Where(s => s.IsSchedule == true).ToList(); 
                }
            }
                
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the User Schedule Report list and bind that into Management model.
        /// </summary>
        /// <name></name>
        /// <parameter>NA</parameter>
        /// <returns>User Report list: List<Reportmodel></returns>
        public List<ReportModel> GetUserScheduleReportList(int userId)
        {
            try
            {
                return Management.GetUserScheduleReportList(userId).Select(s => new ReportModel { UserId = s.fkuserid, ReportName = s.ReportName, ReportId = s.ReportID, ScheduleTime = s.ScheduleTime, ScheduleType = s.ScheduleType, IsSchedule = s.IsSchedule, EmailId = s.EmailID }).ToList();
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the Queue List for perticular user and bind that into Queue model.
        /// </summary>
        /// <name></name>
        /// <parameter>NA</parameter>
        /// <returns>User In Queue list: List<Reportmodel></returns>
        public List<QueueModel> GetUserInQueueList(int userId)
        {
            try
            {
                return Management.GetUserInQueueList(userId).Select(s => new QueueModel { FkIddn = s.fkiddn }).ToList();
            }
            catch
            {
                throw;
            }
        }

        //public List<MAF.BAL.Models.Enum.ScheduleType> GetScheduleType()
        //{
        //    List<MAF.BAL.Models.Enum.ScheduleType> list = System.Enum.GetValues(typeof(MAF.BAL.Models.Enum.ScheduleType)).Cast<MAF.BAL.Models.Enum.ScheduleType>().ToList();
        //    return list;
        //}

        ///// <summary>
        ///// This method is used to get the Extension list in queue and bind that into Management model.
        ///// </summary>        
        ///// <returns>Extension list: List<ExtensionModel></returns>
        public List<ExtensionModel> GetExtensionsInPowerZone(int extNumber, string role)
        {
            try
            {
                if (string.Equals(role, MAF.BAL.Enums.Roles.User.ToString()))
                {
                    return Management.GetExtensionInPowerZone(extNumber).Select(e => new ExtensionModel { ExtNumber = e.extnum, Name = e.extnum + " " + e.firstname + " " + e.lastname }).Where(e=>Convert.ToInt32(e.ExtNumber,System.Globalization.CultureInfo.CurrentCulture)==extNumber).ToList();
                }
                else
                {
                    return Management.GetExtensionInPowerZone(extNumber).Select(e => new ExtensionModel { ExtNumber = e.extnum, Name = e.extnum + " " + e.firstname + " " + e.lastname }).ToList();
                }
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// Updates power zone times for big screen
        /// </summary>
        /// <param name="zone1FromTime">Zone1 From Time</param>
        /// <param name="zone1ToTime">Zone1 To Time</param>
        /// <param name="zone2FromTime">Zone2 From Time</param>
        /// <param name="zone2ToTime">Zone2 To Time</param>
        public void UpdatePowerZoneTime(TimeSpan? zone1FromTime, TimeSpan? zone1ToTime, TimeSpan? zone2FromTime, TimeSpan? zone2ToTime)
        {
            try
            {
                Management.UpdatePowerZoneTime(zone1FromTime, zone1ToTime, zone2FromTime, zone2ToTime);
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// Get Power Zone time
        /// </summary>
        /// <returns>Report Model with zone time</returns>
        public ReportModel GetPowerZoneTime()
        {
            try {
                return Management.GetPowerZoneTime().
                    Select(pt => new ReportModel
                    {
                        Zone1FromTime = pt.Zone1FromTime,
                        Zone1ToTime = pt.Zone1ToTime,
                        Zone2FromTime = pt.Zone2FromTime,
                        Zone2ToTime = pt.Zone2ToTime
                    }).FirstOrDefault();
            }
            catch {
                throw;
            }
        }

        /// <summary>
        /// Get Big Screen Power Zone time and report color
        /// </summary>
        /// <returns>Report Model with zone time</returns>
        public BigScreenPowerZoneModel GetBigScreenPowerZoneTime()
        {
            try
            {
                return Management.GetBigScreenPowerZoneTime().
                    Select(pt => new BigScreenPowerZoneModel
                    {
                        Zone1FromTime = pt.Zone1FromTime,
                        Zone1ToTime = pt.Zone1ToTime,
                        Zone2FromTime = pt.Zone2FromTime,
                        Zone2ToTime = pt.Zone2ToTime,
                        Header1Color = pt.Header1Color,
                        Header2Color = pt.Header2Color,
                        RowColor = pt.Row1Color,
                        AlternateRowColor = pt.Row2Color,
                        FontColor = pt.FontColor,
                        Queues =  (pt.Queue1 + ',' + pt.Queue2).Trim(',')
                    }).FirstOrDefault();
            }
            catch
            {
                throw;
            }
        }


        /// <summary>
        /// Updates power zone times for big screen
        /// </summary>
        /// <param name="zone1FromTime">Zone1 From Time</param>
        /// <param name="zone1ToTime">Zone1 To Time</param>
        /// <param name="zone2FromTime">Zone2 From Time</param>
        /// <param name="zone2ToTime">Zone2 To Time</param>
        /// <param name="queues"></param>
        public void UpdateBigScreenPowerZoneTime(TimeSpan? zone1FromTime, TimeSpan? zone1ToTime, TimeSpan? zone2FromTime, TimeSpan? zone2ToTime, string header1Color, string header2Color, string rowColor, string alternateRowColor, string fontColor, string queues)
        {
            try
            {
                Management.UpdateBigScreenPowerZoneTime(zone1FromTime, zone1ToTime, zone2FromTime, zone2ToTime, header1Color, header2Color, rowColor, alternateRowColor, fontColor, queues);
            }
            catch
            {
                throw;
            }
        }

       /// <summary>
       /// Reset colors for power zone big screen
       /// </summary>
       public void ResetPowerZoneColor()
       {
           try
           {
               Management.ResetPowerZoneColor();
           }
           catch
           {
               throw;
           }
       }

       /// <summary>
       /// This method is used to set recording path for virtual direcotry
       /// </summary>
       public void SetRecordingPath(string path, int callInterval)
       {
           try
           {
               Management.SetRecordingPath(path, callInterval);
           }
           catch
           {
               throw;
           }
       }

       /// <summary>
       /// This method is used to get recording path for virtual directory
       /// </summary>
       public RecordingViewModel GetRecordingPath()
       {
           try
           {

               return Management.GetRecordingPath().Select(s=>new RecordingViewModel { Path=s.Path , CallIntervals=Convert.ToInt32(s.CallInterval)}).FirstOrDefault();
           }
           catch
           {
               throw;
           }
       }
    }
}
