namespace PayOnlineReportApplication.Web
{
    using System.Web;
    using System.Web.Routing;

    public class CustomRouteConstraint : IRouteConstraint
    {
        //Route contraint to the webforms route to ensure that it only catches on incoming routes,
        //not outgoing route generation.
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
        {
            return routeDirection == RouteDirection.IncomingRequest;
        }
    }
}