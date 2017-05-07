using MAF.BAL;
using MAF.BAL.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MAF.WEB.Controllers
{

     [Authorize]
    public class ReportController : Controller
    {
        [HttpGet]
         public ActionResult Test()
        {
            try
            {
                // Create date objects 
                TimeSpan tsFrom = new TimeSpan(-1, 23, 59, 59);
                TimeSpan tsTo = new TimeSpan(0, 23, 59, 59);
                UserLoginReportViewModel paramModel = new UserLoginReportViewModel()
                {
                    FromDate = DateTime.Now.Date + tsFrom,
                    ToDate = DateTime.Now.Date + tsTo
                };


                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult Test", ex);
            }
            return RedirectToAction("Login", "Account");// We will return it logout page if any error occur
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult Test(UserLoginReportViewModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                   
                    Session["ReportName"] = MAF.BAL.ResourceFile.Common.test;
                    Session["AccountNumber"] = reportParams.AccountNumber;
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
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult Test Report", ex);
            }
            return RedirectToAction("Test", "Account"); // We will return it logout page if any error occur
        }

        [HttpGet]
        public ActionResult NotificationsByTextOptInOptOut()
        {
            try
            {
                // Create date objects 
                TimeSpan tsFrom = new TimeSpan(-1, 23, 59, 59);
                TimeSpan tsTo = new TimeSpan(0, 23, 59, 59);
                NotificationsByTextOptInOptOutModel paramModel = new NotificationsByTextOptInOptOutModel()
                {
                    FromDate = DateTime.Now.Date + tsFrom,
                    ToDate = DateTime.Now.Date + tsTo
                };


                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult NotificationsByTextOptInOptOutModel", ex);
            }
            return RedirectToAction("Login", "Account"); // We will return it logout page if any error occur
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult NotificationsByTextOptInOptOut(NotificationsByTextOptInOptOutModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    Session["ReportName"] = MAF.BAL.ResourceFile.Common.GetNotificationsByTextOptInOptOutReport;
                    Session["AccountNumber"] = reportParams.AccountNumber;
                    Session["FromDate"] = reportParams.FromDate.ToString(CultureInfo.CurrentCulture);
                    Session["ToDate"] = reportParams.ToDate.ToString(CultureInfo.CurrentCulture);
                    Session["Type"] = reportParams.Type;
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
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult Test Report", ex);
            }
            return RedirectToAction("Test", "Account"); // We will return it logout page if any error occur
        }

        [HttpGet]
        public ActionResult AllNotificationsByText()
        {
            try
            {
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View();
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult AllNotificationsByText", ex);
            }
            return RedirectToAction("Login", "Account"); // We will return it logout page if any error occur
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult AllNotificationsByText(AllNotificationsByModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    Session["ReportName"] = MAF.BAL.ResourceFile.Common.AllNotificationsByTextReport;
                    Session["AccountNumber"] = reportParams.AccountNumber;
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
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult Test Report", ex);
            }
            return RedirectToAction("Test", "Account"); // We will return it logout page if any error occur
        }
	
     
     
     }
}