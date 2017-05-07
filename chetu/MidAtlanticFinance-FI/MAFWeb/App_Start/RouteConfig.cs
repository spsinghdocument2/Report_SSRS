using System.Web.Mvc;
using System.Web.Routing;

namespace MAFWeb
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{myWebForms}.aspx/{*pathInfo}");
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapPageRoute(
                "Zone1",
                "Reports/PowerZone/Zone1",
                "~/Reports/BigScreen/Zone1.aspx",
                true, null,
                new RouteValueDictionary { { "outgoing", new CustomRouteConstraint() } }
            );
            routes.MapPageRoute(
                "Zone2",
                "Reports/PowerZone/Zone2",
                "~/Reports/BigScreen/Zone2.aspx",
                true, null,
                new RouteValueDictionary { { "outgoing", new CustomRouteConstraint() } }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}