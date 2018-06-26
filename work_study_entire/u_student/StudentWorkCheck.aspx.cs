using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentWorkCheck : System.Web.UI.Page
{
    public static string Caluser = "";
    public static DateTime a,b;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        GridView2.DataSource = DBManager.Query("select Student.SId,WorkInfo.Post,WorkCheck.IsAttend,WorkCheck.IsSettle,WorkCheck.DetailDate from WorkCheck,WorkInfo,Student where WorkCheck.Postid=WorkInfo.postid and student.sid='" + Session["username"].ToString() + "' and WorkCheck.SId=Student.SId and  WorkCheck.isfinishwc=1");
        GridView2.DataBind();
    }
  

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
        Caluser = ImageButton1.ID;
        
    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
        Caluser = ImageButton2.ID;
        
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
       
        if (Caluser == ImageButton1.ID)
        {
            
            Label2.Text = Calendar1.SelectedDate.ToString();
            a = Calendar1.SelectedDate;
        }
        else if(Caluser == ImageButton2.ID)
        {
            Label3.Text = Calendar1.SelectedDate.ToString();
            b= Calendar1.SelectedDate;
        }
        Calendar1.Visible = false;
        Calendar1.SelectedDate = DateTime.Now;
        //Page.ClientScript.RegisterClientScriptBlock(GetType(),"asa","alert('"+Label2.Text+"')",true);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //GridView2.Visible = !GridView2.Visible;
        Page.ClientScript.RegisterClientScriptBlock(GetType(), "asa", "alert('" + Label2.Text + "')", true);
        GridView2.DataSource = DBManager.Query("select Student.SId,WorkInfo.Post,WorkCheck.IsAttend,WorkCheck.IsSettle,WorkCheck.DetailDate from WorkCheck,WorkInfo,Student where WorkCheck.Postid=WorkInfo.postid and WorkCheck.SId=Student.SId and " +
            "WorkCheck.isfinishwc=1 and detaildate>='" + a + "' and detaildate<='" + b + "'");
        //GridView2.DataSource = DBManager.Query("select Student.SId,WorkInfo.Post,WorkCheck.IsAttend,WorkCheck.IsSettle,WorkCheck.DetailDate from WorkCheck,WorkInfo,Student where WorkCheck.Postid=WorkInfo.postid and WorkCheck.SId=Student.SId and " +
        //    "WorkCheck.isfinishwc=1 and sid='1511240145'");
        GridView2.DataBind();
        //DBManager.Nonquery("insert into stufreetime values('1511240142','33','151124014233')");
    }

   
}