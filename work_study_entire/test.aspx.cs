using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindg();
        }
    }

   void bindg()
    {
       
        GridView1.DataSource = DBManager.Query("select * from student");
        GridView1.DataBind();
    }





    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "xs")
        {
            int row = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
            Label1.Text = GridView1.DataKeys[row].Value.ToString();
        }
    }
}