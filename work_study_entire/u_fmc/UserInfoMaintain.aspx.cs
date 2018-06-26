using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserInfoMaintain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            User user = new User();
            Repeater1.DataSource = user.Get();
            Repeater1.DataBind();
            user = null;
        }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id = e.CommandName;
        User user = new User();
        user.Delete(id);
        Repeater1.DataSource = user.Get();
        Repeater1.DataBind();
        user = null;
    }
}