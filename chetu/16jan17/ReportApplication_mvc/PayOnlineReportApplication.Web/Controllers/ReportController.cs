using PayOnlineReportApplication.BAL;
using PayOnlineReportApplication.BAL.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PayOnlineReportApplication.Web.Controllers
{
    [Authorize]
    public class ReportController : Controller
    {
        [HttpGet]
        public ActionResult UserLogin()
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

                //ReportFilter objReportFilter = new ReportFilter();

                //var accountList = objReportFilter.GetAccountNumber();

                //ViewBag.AccountList = new SelectList(accountList, "AccountNumber", "Name");

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult UserLogin", ex);
            }
            return RedirectToAction("Login", "Account"); // We will return it logout page if any error occur
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult UserLogin(UserLoginReportViewModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Session["ReportName"] = PayOnlineReportApplication.BAL.ResourceFile.Common.UserLoginReportName;
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
                Logger.WriteErrorLog("Error in Post ActionResult UserLogin Report", ex);
            }
            return RedirectToAction("Login", "Account"); // We will return it logout page if any error occur
        }

        [HttpGet]
        public ActionResult CardPayment()
        {
            try
            {
                // Create date objects 
                TimeSpan tsFrom = new TimeSpan(-1, 23, 59, 59);
                TimeSpan tsTo = new TimeSpan(0, 23, 59, 59);
                CardPaymentReportViewModel paramModel = new CardPaymentReportViewModel()
                {
                    FromDate = DateTime.Now.Date + tsFrom,
                    ToDate = DateTime.Now.Date + tsTo
                };

                ViewBag.PaymentStatusList = new SelectList(Helper.ConvertEnumToList<Enums.PaymentStatus>());

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult CardPayment", ex);
            }
            return RedirectToAction("Login", "Account"); // We will return it logout page if any error occur
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult CardPayment(CardPaymentReportViewModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string status = string.Empty;
                    if (reportParams.Status.HasValue)
                    {
                        if (reportParams.Status.Equals(Enums.PaymentStatus.Success))
                        {
                            status = Enums.PaymentStatus.Success.ToString();
                        }
                        else if (reportParams.Status.Equals(Enums.PaymentStatus.Failed))
                        {
                            status = Enums.PaymentStatus.Failed.ToString();
                        }
                    }
                    Session["ReportName"] = PayOnlineReportApplication.BAL.ResourceFile.Common.CardPaymentReportName;
                    Session["AccountNumber"] = reportParams.AccountNumber;
                    Session["ConfirmationNumber"] = reportParams.ConfirmationNumber;
                    Session["FromDate"] = reportParams.FromDate.ToString(CultureInfo.CurrentCulture);
                    Session["ToDate"] = reportParams.ToDate.ToString(CultureInfo.CurrentCulture);
                    Session["Status"] = status;

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

                ViewBag.PaymentStatusList = new SelectList(Helper.ConvertEnumToList<Enums.PaymentStatus>(), reportParams.Status);
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult CardPayment Report", ex);
            }
            return RedirectToAction("Login", "Account"); // We will return it logout page if any error occur
        }

        [HttpGet]
        public ActionResult TextMessage()
        {
            try
            {
                // Create date objects 
                TimeSpan tsFrom = new TimeSpan(-1, 23, 59, 59);
                TimeSpan tsTo = new TimeSpan(0, 23, 59, 59);
                TextMessageReportViewModel paramModel = new TextMessageReportViewModel()
                {
                    FromDate = DateTime.Now.Date + tsFrom,
                    ToDate = DateTime.Now.Date + tsTo
                };

                ViewBag.MessageTypeList = new SelectList(Helper.ConvertEnumToList<Enums.MessageType>());

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult TextMessage", ex);
            }
            return RedirectToAction("Login", "Account"); // We will return it logout page if any error occur
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult TextMessage(TextMessageReportViewModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string type = string.Empty;
                    if (reportParams.Type.HasValue)
                    {
                        if (reportParams.Type.Equals(Enums.MessageType.Inbound))
                        {
                            type = Enums.MessageType.Inbound.ToString();
                        }
                        else if (reportParams.Type.Equals(Enums.MessageType.Outbound))
                        {
                            type = Enums.MessageType.Outbound.ToString();
                        }
                    }
                    Session["ReportName"] = PayOnlineReportApplication.BAL.ResourceFile.Common.TextMessageReportName;
                    Session["AccountNumber"] = reportParams.AccountNumber;
                    Session["FromDate"] = reportParams.FromDate.ToString(CultureInfo.CurrentCulture);
                    Session["ToDate"] = reportParams.ToDate.ToString(CultureInfo.CurrentCulture);
                    Session["Type"] = type;

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

                ViewBag.MessageTypeList = new SelectList(Helper.ConvertEnumToList<Enums.MessageType>(), reportParams.Type);
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult TextMessage Report", ex);
            }
            return RedirectToAction("Login", "Account"); // We will return it logout page if any error occur
        }

        [HttpGet]
        public ActionResult AllPayment()
        {
            try
            {
                // Create date objects 
                TimeSpan tsFrom = new TimeSpan(-1, 23, 59, 59);
                TimeSpan tsTo = new TimeSpan(0, 23, 59, 59);
                AllPaymentReportViewModel paramModel = new AllPaymentReportViewModel()
                {
                    FromDate = DateTime.Now.Date + tsFrom,
                    ToDate = DateTime.Now.Date + tsTo
                };

                ReportFilter reportFilter = new ReportFilter();

                ViewBag.PaymentStatusList = new SelectList(reportFilter.GetPaymentStatus());
                ViewBag.PaymentMethodList = new SelectList(Helper.ConvertEnumToList<Enums.PaymentMethod>());

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult AllPayment", ex);
            }
            return RedirectToAction("Login", "Account"); // We will return it logout page if any error occur
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult AllPayment(AllPaymentReportViewModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string paymentMethod = string.Empty;
                    if (reportParams.PaymentMethod.HasValue)
                    {
                        if (reportParams.PaymentMethod.Equals(Enums.PaymentMethod.ACH))
                        {
                            paymentMethod = Enums.PaymentMethod.ACH.ToString();
                        }
                        else if (reportParams.PaymentMethod.Equals(Enums.PaymentMethod.Card))
                        {
                            paymentMethod = Enums.PaymentMethod.Card.ToString();
                        }
                    }
                    Session["ReportName"] = PayOnlineReportApplication.BAL.ResourceFile.Common.AllPaymentReportName;
                    Session["AccountNumber"] = reportParams.AccountNumber;
                    Session["ConfirmationNumber"] = reportParams.ConfirmationNumber;
                    Session["FromDate"] = reportParams.FromDate.ToString(CultureInfo.CurrentCulture);
                    Session["ToDate"] = reportParams.ToDate.ToString(CultureInfo.CurrentCulture);
                    Session["Status"] = reportParams.PaymentStatus;
                    Session["PaymentMethod"] = paymentMethod;

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

                ReportFilter reportFilter = new ReportFilter();

                ViewBag.PaymentStatusList = new SelectList(reportFilter.GetPaymentStatus(), reportParams.PaymentStatus);
                ViewBag.PaymentMethodList = new SelectList(Helper.ConvertEnumToList<Enums.PaymentMethod>(), reportParams.PaymentMethod);
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult AllPayment Report", ex);
            }
            return RedirectToAction("Login", "Account"); // We will return it logout page if any error occur
        }

        [HttpGet]
        public ActionResult AutoPayEnrollment()
        {
            try
            {
                // Create date objects 
                TimeSpan tsFrom = new TimeSpan(-1, 23, 59, 59);
                TimeSpan tsTo = new TimeSpan(0, 23, 59, 59);
                AutoPayEnrollmentReportViewModel paramModel = new AutoPayEnrollmentReportViewModel()
                {
                    FromDate = DateTime.Now.Date + tsFrom,
                    ToDate = DateTime.Now.Date + tsTo
                };

                ViewBag.PaymentMethodList = new SelectList(Helper.ConvertEnumToList<Enums.PaymentMethod>());

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult AutoPayEnrollment", ex);
            }
            return RedirectToAction("Login", "Account"); // We will return it logout page if any error occur
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult AutoPayEnrollment(AutoPayEnrollmentReportViewModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    string paymentMethod = string.Empty;
                    if (reportParams.PaymentMethod.HasValue)
                    {
                        if (reportParams.PaymentMethod.Equals(Enums.PaymentMethod.ACH))
                        {
                            paymentMethod = Enums.PaymentMethod.ACH.ToString();
                        }
                        else if (reportParams.PaymentMethod.Equals(Enums.PaymentMethod.Card))
                        {
                            paymentMethod = Enums.PaymentMethod.Card.ToString();
                        }
                    }
                    Session["ReportName"] = PayOnlineReportApplication.BAL.ResourceFile.Common.AutoPayEnrollmentReportName;
                    Session["AccountNumber"] = reportParams.AccountNumber;
                    Session["ConfirmationNumber"] = reportParams.ConfirmationNumber;
                    Session["FromDate"] = reportParams.FromDate.ToString(CultureInfo.CurrentCulture);
                    Session["ToDate"] = reportParams.ToDate.ToString(CultureInfo.CurrentCulture);
                    Session["PaymentMethod"] = paymentMethod;

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

                ViewBag.PaymentMethodList = new SelectList(Helper.ConvertEnumToList<Enums.PaymentMethod>(), reportParams.PaymentMethod);
                return View(reportParams);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Post ActionResult AutoPayEnrollment Report", ex);
            }
            return RedirectToAction("Login", "Account"); // We will return it logout page if any error occur
        }

        [HttpGet]
        public ActionResult AutoPay()
        {
            try
            {
                // Create date objects 
                TimeSpan tsFrom = new TimeSpan(-1, 23, 59, 59);
                TimeSpan tsTo = new TimeSpan(0, 23, 59, 59);
                AutoPayReportViewModel paramModel = new AutoPayReportViewModel()
                {
                    FromDate = DateTime.Now.Date + tsFrom,
                    ToDate = DateTime.Now.Date + tsTo
                };

                //Hide iframe on get request.
                ViewBag.ShowIframe = false;
                Session["LoadReport"] = false;
                return View(paramModel);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Get ActionResult AutoPay", ex);
            }
            return RedirectToAction("Login", "Account"); // We will return it logout page if any error occur
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult AutoPay(AutoPayReportViewModel reportParams)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Session["ReportName"] = PayOnlineReportApplication.BAL.ResourceFile.Common.AutoPayReportName;
                    Session["AccountNumber"] = reportParams.AccountNumber;
                    Session["ConfirmationNumber"] = reportParams.ConfirmationNumber;
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
                Logger.WriteErrorLog("Error in Post ActionResult AutoPay Report", ex);
            }
            return RedirectToAction("Login", "Account"); // We will return it logout page if any error occur
        }
    }
}