using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserInfoAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["UserName"] != null)
            {
                User user = new User();
                UserData[] userData = user.Select(Request.QueryString["UserName"]);
                TextBox1.Text = userData[0].UserName;
                TextBox2.Text = userData[0].PassWord;
                TextBox3.Text = userData[0].UserId;
                TextBox4.Text = userData[0].Remark;
                user = null;
                userData = null;
            }
        }
    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        User user = new User();
        UserData userData = new UserData();
        userData.UserName = TextBox1.Text.Trim();
        userData.PassWord = TextBox2.Text.Trim();
        userData.UserId = TextBox3.Text.Trim();
        userData.Remark = TextBox4.Text.Trim();
        if (Request.QueryString["UserName"] != null)
        {
            userData.UserName = Request.QueryString["UserName"];
            user.Modify(userData);
        }
        else
        {
            user.Insert(userData);
        }
        user = null;
        userData = null;
        Response.Redirect("UserInfoMaintain.aspx");
    }
}