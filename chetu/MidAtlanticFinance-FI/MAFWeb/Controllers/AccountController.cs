using System;
using System.Linq;
using System.Web.Mvc;
using MAF.BAL.Models;
using MAFWeb.BAL.Models;
using System.IO;

namespace MAFWeb.Controllers
{
    public class AccountController : Controller
    {
        ///<summary>
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
        ///<summary>
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

        /// <summary>
        /// This ActionResult return the Login view page.
        /// </summary>
        [HttpGet]
        public ActionResult Login()
        {            
            return View(new LoginModel());
        }

        /// <summary>
        /// This ActionResult Post data in Login view page.
        /// </summary>
        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ManagementList.objLoginReportList.Clear();
                    ManagementList.objLoginReportList.AddRange(ManagementInfo.CheckLogin(model.Loginid, model.Password));
                    if (ManagementList.objLoginReportList.Count == 0)
                    {
                        ViewBag.error = "Login failed! Please contact to administrator.";
                    }
                    else
                    {
                        var role = (from p in ManagementList.objLoginReportList select p.Role).FirstOrDefault();
                        if (!string.Equals(role, "Admin"))
                        {
                            foreach (var item in ManagementList.objLoginReportList)
                            {
                                switch (item.Abbreviation)
                                {
                                    case "QueueLog": Session["QueueLog"] = "display:inline-block"; break;
                                    case "AgentLog": Session["AgentLog"] = "display:inline-block"; break;
                                    case "ChatLog": Session["ChatLog"] = "display:inline-block"; break;
                                    case "Collection": Session["Collection"] = "display:inline-block"; break;
                                    case "PowerZone": Session["PowerZone"] = "display:inline-block"; break;
                                    case "ScoreCard": Session["ScoreCard"] = "display:inline-block"; break;
                                    case "SearchByPhone": Session["SearchByPhone"] = "display:inline-block"; break;
                                    case "HourlyCallLog": Session["HourlyCallLog"] = "display:inline-block"; break;
                                    case "DropCallLog": Session["HourlyCallLog"] = "display:inline-block"; break;
                                    case "DNDStatus": Session["DNDStatus"] = "display:inline-block"; break;
                                }                                                                                                        
                            }
                            Session["Management"] = "display:none";
                        }
                        else
                        {
                            Session["QueueLog"] = "display:inline-block";
                            Session["AgentLog"] = "display:inline-block";
                            Session["ChatLog"] = "display:inline-block";
                            Session["Collection"] = "display:inline-block";
                            Session["PowerZone"] = "display:inline-block";
                            Session["ScoreCard"] = "display:inline-block";
                            Session["SearchByPhone"] = "display:inline-block";
                            Session["Management"] = "display:inline-block";
                            Session["HourlyCallLog"] = "display:inline-block";
                            Session["DropCallLog"] = "display:inline-block";
                            Session["DNDStatus"] = "display:inline-block";
                        }
                        Session["Role"] = role;
                        Session["login"] = model.Loginid;
                        return RedirectToAction("Index", "Home");
                    }

                }
                else
                {
                    ViewBag.error = "Please fill username and password!";
                }
                return View(model);
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Login Page", ex);
            }
            return null;  // We will return it Login page if any error occur
            // return PartialView();
        }

        /// <summary>
        /// This ActionResult Logout the User.
        /// </summary>
        public ActionResult Logout()
        {
            try
            {
                Session["login"] = null;
                Session["QueueLog"] = null; 
                Session["AgentLog"] = null; 
                Session["ChatLog"] = null; 
                Session["Collection"] = null;  
                Session["PowerZone"] = null;  
                Session["ScoreCard"] = null;
                Session["SearchByPhone"] = null;
                Session["HourlyCallLog"] = null;
                Session["DropCallLog"] = null;
                Session["Management"] = null;
                Session["DNDStatus"] = null;
                //Response.Redirect("/Account/Login");
                return View("Login");
            }
            catch (FileNotFoundException ex)
            {
                Logger.WriteErrorLog("Error in Logout ", ex);
            }
            return null;  // We will return it Logout if any error occur
            // return PartialView();
        }
    }
}
