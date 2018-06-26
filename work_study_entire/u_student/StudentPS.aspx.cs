using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using  System .Threading;
using System.Text; 

public partial class StudentPS : System.Web.UI.Page
{
    public static DateTime a;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.DataSource = DBManager.Query("select Salary.*,WorkInfo.* from Salary,WorkInfo where Salary.PostId=WorkInfo.PostId and salary.sid='"+Session["username"].ToString()+"'");
        GridView1.DataBind();

    }


    protected void Boxsearch_Click(object sender, EventArgs e)
    
    {
        
        GridView1.DataSource = DBManager.Query("select Salary.*,WorkInfo.* from Salary,WorkInfo where Salary.PostId=WorkInfo.PostId and salary.sid='" + Session["username"].ToString() + "' and datepart(yyyy,payday)='" + a.Year+"' and datepart(m,payday)='"+a.Month+"'");
        GridView1.DataBind();
    }
   
   
    
   

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox1.Text = Calendar1.SelectedDate.ToString();
        a = Calendar1.SelectedDate;
        Calendar1.Visible = false;
    }
}