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
    
   
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.DataSource = DBManager.Query("select Salary.*,WorkInfo.* from Salary,WorkInfo where Salary.PostId=WorkInfo.PostId and salary.sid='"+Session["username"].ToString()+"'");
        GridView1.DataBind();

    }


    protected void Boxsearch_Click(object sender, EventArgs e)
    
    {
        
        GridView1.DataSource = DBManager.Query("select Salary.*,WorkInfo.* from Salary,WorkInfo where Salary.PostId=WorkInfo.PostId and salary.sid='" + Session["username"].ToString() + "' and payday>'"+TextBox1.Text+"' and payday<'"+TextBox2.Text+"'");
        GridView1.DataBind();
    }
   
  
}