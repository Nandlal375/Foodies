using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodies.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "";
                if (Session["admin"] == null)
                {
                    Response.Write("../User/Login.aspx");
                }
                else 
                {
                    DashboardCount dashboardCount = new DashboardCount();
                    Session["category"] = dashboardCount.Count("CATEGORY");
                    Session["PRODUCT"] = dashboardCount.Count("PRODUCT");
                    Session["DELIVERED"] = dashboardCount.Count("DELIVERED");
                    Session["Pending"] = dashboardCount.Count("Pending");
                    Session["USER"] = dashboardCount.Count("USER");
                    Session["SOLDAMOUNT"] = dashboardCount.Count("SOLDAMOUNT");
                    Session["CONTACT"] = dashboardCount.Count("CONTACT");
                }
            }
        }
    }
}