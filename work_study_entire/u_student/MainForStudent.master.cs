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
      //  Label1.Text = "欢迎"+Session["userId"].ToString();

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
