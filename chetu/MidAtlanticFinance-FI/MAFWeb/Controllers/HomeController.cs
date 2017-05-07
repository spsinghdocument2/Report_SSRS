using MAFWeb.BAL.Models;
using System;
using System.Web.Mvc;

namespace MAFWeb.Controllers
{
    public class HomeController : Controller
    {
        /// <summary>
        /// This ActionResult return the Index view page.
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            try
            {
                if (Session["login"] == null)
                {
                    Response.Redirect("/Account/Login");
                }
                else
                {
                    ViewBag.Session = Session["login"];
                }
                return View();
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in ActionResult login", ex);
            }
            return null;  // We will return it logout page if any error occur

        }

        /// <summary>
        /// This ActionResult return the LeftNavigation.
        /// </summary>
        /// <returns></returns>
        public ActionResult PartialLeftNavigation()
        {
            try
            {
                return View();
            }
            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Partial View LeftNavigation ", ex);
            }
            return null;  // We will return it is LeftNavigation if any error occur

        }
    }
}
