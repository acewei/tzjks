using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hchMasterPage : System.Web.UI.MasterPage
{
    private System.ComponentModel.BackgroundWorker backgroundWorker1;

    protected void Page_Load(object sender, EventArgs e)
    {
     
    }

   

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
       
    }

    private void InitializeComponent()
    {
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();

    }



    protected void zhuxiao_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/login.aspx");
    }
}
