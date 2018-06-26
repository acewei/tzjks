using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmployerMaintain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Employer employer = new Employer();
            Repeater1.DataSource = employer.Get();
            Repeater1.DataBind();
            employer = null;
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id = e.CommandName;
        Employer employer = new Employer();
        employer.Delete(id);
        Repeater1.DataSource = employer.Get();
        Repeater1.DataBind();
        employer = null;
    }
}