<%@ WebHandler Language="C#" Class="QlyMain.Admin.ClearDashboardCache" %>
using System;
using System.Web;
using DataService.Helpers;

namespace QlyMain.Admin
{
    public class ClearDashboardCache : IHttpHandler
    {
        public bool IsReusable => false;

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                // Same cache and key DataAccessLayer uses for the dashboard
                SimpleMemoryCache.Remove("DashboardVM_v1");
                context.Response.ContentType = "text/plain";
                context.Response.Write("OK");
            }
            catch (Exception ex)
            {
                context.Response.StatusCode = 500;
                context.Response.ContentType = "text/plain";
                context.Response.Write("ERROR: " + ex.Message);
            }
        }
    }
}
