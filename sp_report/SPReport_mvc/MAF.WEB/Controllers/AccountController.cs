using MAF.BAL.Model;
using MAF.BAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace MAF.WEB.Controllers
{
    public class AccountController : Controller
    {
        //
        // GET: /Account/
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View(new LoginViewModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel loginVM)
        {
            try
            {
                
                //Check if ModelState is valid or not
                if (ModelState.IsValid)
                {
                    User objUser = new User();
                    string nameOfUser = objUser.Login(loginVM.Username, loginVM.Password);

                    //When login using demo account then set session variables and redirect to reserves
                    if (!string.IsNullOrEmpty(nameOfUser))
                    {
                        //Set form authentication cookies
                        FormsAuthentication.SetAuthCookie(nameOfUser, false);
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ModelState.AddModelError(String.Empty, "Invalid Username or Password!");
                        ModelState.Remove("Password");
                    }
                }
             
                return View(loginVM);
            }
            catch (Exception ex)
            {
               Logger.WriteErrorLog("Error in Login Post Action Method", ex);
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.InternalServerError);
            }
        }

        /// <summary>
        /// This ActionResult use for logout action and return login page.
        /// </summary>
        [HttpGet]
        public ActionResult Logout()
        {
            try
            {
                FormsAuthentication.SignOut();
                if (Session.Count > 0)
                {
                    Session.Clear();
                    Session.Abandon();
                }
                return RedirectToAction("Login", "Account");
            }

            catch (Exception ex)
            {
                Logger.WriteErrorLog("Error in Logout Action Method", ex);
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.InternalServerError);
            }
        }

	}
}