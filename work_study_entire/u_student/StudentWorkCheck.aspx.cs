using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentWorkCheck : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        GridView2.DataSource = DBManager.Query("select Student.SId,WorkInfo.Post,WorkCheck.IsAttend,WorkCheck.IsSettle,WorkCheck.DetailDate from WorkCheck,WorkInfo,Student where WorkCheck.Postid=WorkInfo.postid and student.sid='" + Session["username"].ToString() + "' and WorkCheck.SId=Student.SId and  WorkCheck.isfinishwc=1");
        GridView2.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
 
        GridView2.DataSource = DBManager.Query("select Student.SId,WorkInfo.Post,WorkCheck.IsAttend,WorkCheck.IsSettle,WorkCheck.DetailDate from WorkCheck,WorkInfo,Student where WorkCheck.Postid=WorkInfo.postid and WorkCheck.SId=Student.SId and " +
            "WorkCheck.isfinishwc=1 and detaildate>='" + TextBox1.Text + "' and detaildate<='" + TextBox2.Text + "'");
       
        GridView2.DataBind();
        
    }

   
}