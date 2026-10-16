<%@ WebHandler Language="C#" Class="QlyMain.Admin.ClearDashboardCache" %>
using System;
using System.Web;
using System.Runtime.Caching;

namespace QlyMain.Admin
{
    public class ClearDashboardCache : IHttpHandler
    {
        public bool IsReusable => false;

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                var cache = MemoryCache.Default;
                const string key = "DashboardVM_v1";
                if (cache.Contains(key)) cache.Remove(key);
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
