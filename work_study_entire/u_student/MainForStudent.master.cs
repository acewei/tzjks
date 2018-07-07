using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hchMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null || Session["userid"].ToString() != "学生")
        {
            Session.Clear();
            Response.Redirect("~/login.aspx");
        }

    }
    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {

    }

    protected void zhuxiao_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/login.aspx");
    }
}
