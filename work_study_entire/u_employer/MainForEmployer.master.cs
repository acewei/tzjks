using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmployerMgr : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null || Session["userid"].ToString() != "用人单位")
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }
    }
    protected void zhuxiao_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/login.aspx");
    }
}
