using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class _Default : System.Web.UI.Page
{
    public static string Caluser = "";
    public static DateTime a, b;
    public static bool flag =false ;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            
            bindgrid();
           
        }
    }

    protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        this.GridView1.EditIndex = e.NewEditIndex;
       
        bindgrid();
    }

    protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        this.GridView1.EditIndex = -1;
        bindgrid();
    }

    protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        
       // string sid=((DropDownList)GridView1.Rows[e.RowIndex].Cells[1].FindControl("DropDownList1")).SelectedValue;
         string wcid=GridView1.Rows[e.RowIndex].Cells[0].Text;
        bool isattend = ((CheckBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Checked;
         bool isfinish = ((CheckBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Checked;



        DBManager.Nonquery("update workcheck set isattend='"+isattend+"',isfinishwc='"+isfinish+"' where wcid='"+wcid+"'");
        
        
        
        GridView1.EditIndex = -1;
        bindgrid();
        
    }

    void bindgrid()
    {
        GridView1.DataSource = DBManager.Query("select * from workcheck,workinfo,employer where workcheck.postid=workinfo.postid and workinfo.belongunit=employername and employerid='01'");
        GridView1.DataBind();
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindgrid();
    }



    protected void GridView1_DataBinding(object sender, EventArgs e)
    {
        recordCount.Text = DBManager.Query("select count(*) from workcheck").Tables[0].Rows[0][0].ToString();
        
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       
        string wcid=GridView1.Rows[e.RowIndex].Cells[0].Text;
       
        DBManager.Nonquery("delete from workcheck where wcid='"+wcid+"'");
        GridView1.EditIndex = -1;
        bindgrid();
        
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
      
        if (input1.Value == "") Page.ClientScript.RegisterClientScriptBlock(GetType(), "aa", "alert('请输入天数')", true);
        else
        {
            DBManager.Nonquery("exec createWC " + input1.Value+",'01'");
            
            bindgrid();
            
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (!flag)
        {
          
          
            
            GridView1.DataSource = DBManager.Query("select * from workcheck where isfinishwc is null order by detaildate,tid");
            GridView1.DataBind();
        }
        else
        {
            bindgrid();
        }
        flag = !flag;
      
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
        else if (Caluser == ImageButton2.ID)
        {
            Label3.Text = Calendar1.SelectedDate.ToString();
            b = Calendar1.SelectedDate;
        }
        Calendar1.Visible = false;
        Calendar1.SelectedDate = DateTime.Now;
        //Page.ClientScript.RegisterClientScriptBlock(GetType(),"asa","alert('"+Label2.Text+"')",true);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql = "select * from WorkCheck,WorkInfo,Student where WorkCheck.Postid=WorkInfo.postid and WorkCheck.SId=Student.SId and " +
            "WorkCheck.isfinishwc=1 and detaildate>='" + a + "' and detaildate<='" + b + "' order by detaildate";
        //Response.Write("sadsad"+new Random().Next());
        //GridView2.Visible = !GridView2.Visible;
        //Page.ClientScript.RegisterClientScriptBlock(GetType(), "asa", "alert('" + Label2.Text + "')", true);
        GridView1.DataSource = DBManager.Query(sql);
        //GridView2.DataSource = DBManager.Query("select Student.SId,WorkInfo.Post,WorkCheck.IsAttend,WorkCheck.IsSettle,WorkCheck.DetailDate from WorkCheck,WorkInfo,Student where WorkCheck.Postid=WorkInfo.postid and WorkCheck.SId=Student.SId and " +
        //    "WorkCheck.isfinishwc=1 and sid='1511240145'");
        GridView1.DataBind();
        //DBManager.Nonquery("insert into stufreetime values('1511240142','33','151124014233')");
    }
}