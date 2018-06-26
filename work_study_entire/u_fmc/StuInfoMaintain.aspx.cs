using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StuInfoMaintain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Student student = new Student();
        Repeater1.DataSource = student.Get();
        Repeater1.DataBind();
        student = null;
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id = e.CommandName;
        Student student = new Student();
        student.Delete(id);
        Repeater1.DataSource = student.Get();
        Repeater1.DataBind();
        student = null;
    }
}