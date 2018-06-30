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
           
        }
    }

  





    

    protected void Button1_Click(object sender, EventArgs e)
    {
        string gradereq = "";
        foreach (ListItem x in CheckBoxList1.Items)
        {
            if (x.Selected) gradereq += ("," + x.Text.Trim());
        }
        if (gradereq.Length > 0)
            gradereq = gradereq.Substring(1);
        Label1.Text = gradereq;
    }
}