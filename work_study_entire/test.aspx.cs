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

    }

    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text = String.Empty;
        foreach (ListItem x in CheckBoxList1.Items)
        {
            if (x.Selected) Label1.Text += "," + x.Text.Trim();
        }
        Label1.Text = Label1.Text.Substring(1);
    }

    protected void CheckBoxList1_TextChanged(object sender, EventArgs e)
    {
        
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = DBManager.Query("SELECT dbo.newpostid('西苑')").Tables[0].Rows[0][0].ToString();
    }
}