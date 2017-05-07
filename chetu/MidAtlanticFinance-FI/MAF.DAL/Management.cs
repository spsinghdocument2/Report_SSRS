using System;
using System.Collections.Generic;
using System.Linq;

namespace MAF.DAL
{
    public class Management
    {
        /// <summary>
        /// Create datamember of the MAFContainer class;
        /// </summary>
        private MAFContainer mafEntity;

        /// <summary>
        /// Create MAFContainer class object and check if its already created.
        /// </summary>
        public MAFContainer MAFEntity
        {
            get { return mafEntity ?? (mafEntity = new MAFContainer()); }
        }

        /// <summary>
        /// This method is used to get the User Details list from the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        /// <returns>User Details list</returns>
        public List<SP_GetUserDetails_Result> GetUserDetails(string serachUser, string searchQueue)
        {
            try
            {
                return
                    (from userdetail in MAFEntity.SP_GetUserDetails(serachUser, searchQueue) select userdetail).ToList();
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// This method is used to get the schedule User Details list from the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        /// <returns>Schedule User Details list</returns>
        public List<SP_GetSchduleUserDetails_Result> GetScheduleUserDetails(string serachUser, string abbreviation)
        {
            try
            {
                return
                    (from userdetail in MAFEntity.SP_GetSchduleUserDetails(serachUser, abbreviation) select userdetail).ToList();
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the User role Details  from the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        /// <returns>User Details Role Details</returns>
        public List<SP_UserRoleDetails_Result> GetUserRoleDetails(string userId)
        {
            try
            {
                return (from userdetail in MAFEntity.SP_UserRoleDetails(userId) select userdetail).ToList();
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to Update the User role Details  into the database
        /// </summary>.    
        public string UpdateUserRoleDetails(string userId,string loginId,string password,string role)
        {
            try
            {
                return MAFEntity.SP_UpdateUserRole(userId, loginId, password, role).Single();
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to Update Manager in Queue details save  into the database.   
        /// </summary>
        public void UpdateManagerInQueue(int extnum, string queueId,string role)
        {
            try
            {
                MAFEntity.SP_UpdateManagerInQueue(extnum, queueId, role);
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
                MAFEntity.SP_DeleteSchedule(scheduleId);
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// This method is used to get the Exclude By Report User Details list from the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        /// <returns>Exclude User Details list</returns>
        public List<SP_GetExcludeUserByReport_Result> GetExcludeUserDetails(string serachUser)
        {
            try
            {
                return (from userdetail in MAFEntity.SP_GetExcludeUserByReport(serachUser) select userdetail).ToList();
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to Update the enable in the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public void UpdateEnableUser(int userId, string active)
        {
            try
            {
                MAFEntity.SP_UpdateEnableUser(userId, active);
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
        /// <parameter></parameter>
        public void DeleteUser(int userId)
        {
            try
            {
                MAFEntity.SP_DeleteUser(userId);
            }
            catch
            {
                throw;
            }
        }
        /// <summary>
        /// This method is used to Update the Exclude Management in the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public void UpdateExcludeManagementUser(int userId, int active)
        {
            try
            {
                MAFEntity.SP_UpdateExculdeUser(userId, active);
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to verify the login details in the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public List<spLogin_Result> CheckLogin(string loginId, string password)
        {
            try
            {
                return MAFEntity.spLogin(loginId, password).ToList();
            }
            catch
            {
                throw;
            }
        }
      

        /// <summary>
        /// This method is used to get the report list from the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public List<SP_GetReportList_Result> GetReportList(string reportName)
        {
            try
            {
                return (MAFEntity.SP_GetReportList(reportName).ToList());
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the Queue list from the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public List<SP_GetQueueList_Result> GetQueueList(string queueName)
        {
            try
            {
                return (MAFEntity.SP_GetQueueList(queueName).ToList());
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the Queue list from the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public List<SP_GetQueueNumbers_Result> GetQueueNumbers()
        {
            try
            {
                return (MAFEntity.SP_GetQueueNumbers().ToList());
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the user in Queue list from the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public List<SP_GetUserInQueueList_Result> GetUserInQueueList(int userId)
        {
            try
            {
                return (MAFEntity.SP_GetUserInQueueList(userId).ToList());
            }
            catch
            {
                throw;
            }
        }


        /// <summary>
        /// This method is used to Update the User In Queue in the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public void UpdateUserinQueue(int extNum, int queueId, string active)
        {
            try
            {
                MAFEntity.SP_UpdateUserInQueue(extNum, queueId, active);
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
                MAFEntity.SP_UpdateUserReports(reportId, userId);
            }
            catch
            {
                throw;
            }
        }


        /// <summary>
        /// This method is used to Update the User Schedule Reports in the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public void UpdateUserScheduleReports(int reportId, int userId, string emailId, string scheduleTime,
            int scheduleType, int isSchedule)
        {
            try
            {
                MAFEntity.SP_UpdateScheduleReport(userId, reportId, emailId, scheduleTime, scheduleType, isSchedule);
            }
            catch
            {
                throw;
            }
        }


        /// <summary>
        /// This method is used to Update the Multi User Schedule Reports in the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public void UpdateMultiUserScheduleReports(int reportId, string emailId, string scheduleTime, int scheduleType,
            string users, string queueNum, int scheduleId, int isSchedule, TimeSpan? zone1FromTime,
            TimeSpan? zone1ToTime, TimeSpan? zone2FromTime, TimeSpan? zone2ToTime)
        {
            try
            {
                MAFEntity.SP_UpdateMUInSReport(reportId, emailId, scheduleTime, scheduleType, users, queueNum,
                    scheduleId, isSchedule, zone1FromTime, zone1ToTime, zone2FromTime, zone2ToTime);
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the active User Schedule Reports list from the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public List<SP_GetUpdateScheduleRepotList_Result> GetUserScheduleReportList(int userId)
        {
            try
            {
                return (MAFEntity.SP_GetUpdateScheduleRepotList(userId).ToList());
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the active Multi User Schedule Reports list from the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public List<SP_GetMUInScheduleList_Result> GetMultiUserScheduleReportList()
        {
            try
            {
                return (MAFEntity.SP_GetMUInScheduleList().ToList());
            }
            catch
            {
                throw;
            }
        }


        /// <summary>
        /// This method is used to get the active user Report list from the database.
        /// </summary>
        /// <name></name>
        /// <parameter></parameter>
        public List<SP_GetUserReports_Result> GetUserReportList(int userId)
        {
            try
            {
                return (MAFEntity.SP_GetUserReports(userId).ToList());
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the queue list from the database.
        /// </summary>
        public List<spGetQueues_Result> GetQueues(int extNumber ,string role)
        {
            try
            {
                return (MAFEntity.spGetQueues(extNumber,role).ToList());
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the extension list for particular queue from the database.
        /// </summary>
        /// <param name="queueNumber">Queue Number</param>
        public List<spExtensionByQueue_Result> GetExtensionsByQueue(string queueNumber,int extNum)
        {
            try
            {
                return (MAFEntity.spExtensionByQueue(queueNumber,extNum).ToList());
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the extension list  from the database.
        /// </summary>
        public List<spExtensions_Result> GetExtensions(int extNumber,string role)
        {
            try
            {
                return (MAFEntity.spExtensions(extNumber,role).ToList());
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the extension list for Power Zones from the database.
        /// </summary>
        public List<spExtensionsByPowerZone_Result> GetExtensionInPowerZone(int extNumber)
        {
            try
            {
                return (MAFEntity.spExtensionsByPowerZone(extNumber).ToList());
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the power zone times for big screen.
        /// </summary>
        public List<GetPowerZoneTime_Result> GetPowerZoneTime()
        {
            try
            {
                return MAFEntity.GetPowerZoneTime().ToList();
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to update the power zone times for big screen.
        /// </summary>
        /// <param name="zone1FromTime">Zone1 From Time</param>
        /// <param name="zone1ToTime">Zone1 To Time</param>
        /// <param name="zone2FromTime">Zone2 From Time</param>
        /// <param name="zone2ToTime">Zone2 To Time</param>
        public void UpdatePowerZoneTime(TimeSpan? zone1FromTime, TimeSpan? zone1ToTime, TimeSpan? zone2FromTime,
            TimeSpan? zone2ToTime)
        {
            try
            {
                MAFEntity.spUpdatePowerZoneTime(zone1FromTime, zone1ToTime, zone2FromTime, zone2ToTime);
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get the power zone times for big screen.
        /// </summary>
        public List<GetBigScreenPowerZoneTime_Result> GetBigScreenPowerZoneTime()
        {
            try
            {
                return MAFEntity.GetBigScreenPowerZoneTime().ToList();
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to update the power zone times for big screen.
        /// </summary>
        /// <param name="zone1FromTime">Zone1 From Time</param>
        /// <param name="zone1ToTime">Zone1 To Time</param>
        /// <param name="zone2FromTime">Zone2 From Time</param>
        /// <param name="zone2ToTime">Zone2 To Time</param>
        /// <param name="queues"></param>
        public void UpdateBigScreenPowerZoneTime(TimeSpan? zone1FromTime, TimeSpan? zone1ToTime, TimeSpan? zone2FromTime,
            TimeSpan? zone2ToTime, string header1Color, string header2Color, string rowColor, string alternateRowColor,
            string fontColor, string queues)
        {
            try
            {
                MAFEntity.spUpdateBigScreenPowerZoneTime(zone1FromTime, zone1ToTime, zone2FromTime, zone2ToTime,
                    header1Color, header2Color, rowColor, alternateRowColor, fontColor, queues);
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to reset the colors for big screen power zone
        /// </summary>
        public int ResetPowerZoneColor()
        {
            try
            {
                return MAFEntity.spResetPowerZoneColor();
            }
            catch
            {
                throw;
            }
        }


        /// <summary>
        /// This method is used to set recording path for virtual directory
        /// </summary>
        public int SetRecordingPath(string path, int callInterval)
        {
            try
            {
                return MAFEntity.spSetRecordingPath(path, callInterval);
            }
            catch
            {
                throw;
            }
        }

        /// <summary>
        /// This method is used to get recording path for virtual directory
        /// </summary>
        public List<spGetRecordingPath_Result> GetRecordingPath()
        {
            try
            {
                return MAFEntity.spGetRecordingPath().ToList();
            }
            catch
            {
                throw;
            }
        }
    }
}
