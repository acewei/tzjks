
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WorkInfoMaintain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            WorkInfo workInfo = new WorkInfo();
            Repeater1.DataSource = workInfo.Get();
            Repeater1.DataBind();
            workInfo = null;
        }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id = e.CommandName;
        WorkInfo workInfo = new WorkInfo();
        workInfo.Delete(id);
        Repeater1.DataSource = workInfo.Get();
        Repeater1.DataBind();
        workInfo = null;
    }
}