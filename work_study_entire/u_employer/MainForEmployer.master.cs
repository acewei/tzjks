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
        //this.loginname.Text = "当前登录管理员：" + Request.Cookies["UserName"].Value.ToString() + "，欢迎您！";
    }
    protected void zhuxiao_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/login.aspx");
    }
}
