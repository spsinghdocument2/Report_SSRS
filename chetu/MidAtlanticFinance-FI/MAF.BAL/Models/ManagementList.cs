using System.Collections.Generic;

namespace MAF.BAL.Models
{
    public class ManagementList
    {
        private  List<ManagementModel> listManagementModel = new List<ManagementModel>();

        /// <summary>
        /// this model use  for show userdetails list in management interface.
        /// </summary>
        public List<ManagementModel> objManagementList
        {
            get { return listManagementModel; }
        }


        private List<ReportModel> listReportModel = new List<ReportModel>();
        /// <summary>
        /// this model use for show report list in management interface.
        /// </summary>
        public List<ReportModel> objReportList
        {
            get { return listReportModel; }
        }

        private List<QueueModel> listQueueModel = new List<QueueModel>();
        /// <summary>
        /// this model use for show Queue list in management interface.
        /// </summary>
        public List<QueueModel> objQueueList {
            get { return listQueueModel; }
        }

        private List<ExtensionModel> listExtension = new List<ExtensionModel>();
        /// <summary>
        /// this model use for show Queue list in management interface.
        /// </summary>
        public List<ExtensionModel> objExtensionList {
            get { return listExtension; }
        }

        private List<QueueModel> listUserinQueueList = new List<QueueModel>();
        /// <summary>
        /// this model use for show UserInQueue list in management interface.
        /// </summary>
        public List<QueueModel> objUserinQueueList {
            get { return listUserinQueueList; }
        }

        private List<ReportModel> listUserReportModel = new List<ReportModel>();
        /// <summary>
        /// this model use for show Active User Report list in management interface.
        /// </summary>
        public List<ReportModel> objUserReportList {
            get { return listUserReportModel; }
        }

        private List<ReportModel> listUserScheduleReportList = new List<ReportModel>();
        /// <summary>
        /// this model use for show Active User Schedule Report list in management interface.
        /// </summary>
        public List<ReportModel> objUserScheduleReportlist {
            get { return listUserScheduleReportList; }
        }

        private List<ReportModel> listMultiuserReportModel = new List<ReportModel>();
        /// <summary>
        /// this model use for show Active Multi User Schedule Report list in management interface.
        /// </summary>
        public List<ReportModel> objMultiuserScheduleReportlist {
            get { return listMultiuserReportModel; } 
        }

        private List<LoginModel> listLoginModel = new List<LoginModel>();
        /// <summary>
        /// this model use for show Login Report list in management interface.
        /// </summary>
        public List<LoginModel> objLoginReportList {
            get { return listLoginModel; } 
        }
    }
}
