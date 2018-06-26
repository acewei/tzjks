using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

public partial class Dismissal : System.Web.UI.Page
{

    public static bool flag = false;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            bindgrid();

        }
    }


    protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        this.GridView1.EditIndex = -1;
        bindgrid();
    }


    void bindgrid()
    {
        GridView1.DataSource = DBManager.Query("select distinct student.sid,sname,ssex,institute,class,belongunit,post,sgid from workinfo,employer,student,schedule where " +
            "workinfo.belongunit=employername and student.sid=schedule.sid and schedule.postid=workinfo.postid");
        GridView1.DataBind();
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindgrid();
    }





    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        string sid = GridView1.Rows[e.RowIndex].Cells[0].Text;

        DBManager.Nonquery("delete from schedule where sid='" + sid + "'");
        GridView1.EditIndex = -1;
        bindgrid();

    }




    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label3.Text = "未计算";
        string sid= GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
        GridView2.DataSource = DBManager.Query("select * from workcheck where sid='" +sid+ "'");
        GridView2.DataBind();
        string a= DBManager.Query("select count(*) from workcheck where isfinishwc=1 and sid='" + sid + "'").Tables[0].Rows[0][0].ToString();
        string b= DBManager.Query("select count(*) from workcheck where isfinishwc=1 and isattend is null and sid='" + sid + "'").Tables[0].Rows[0][0].ToString();
        recordCount.Text = a;
        Label2.Text = b;
        if (a != "0")
            Label3.Text = Math.Round((Convert.ToDecimal(b) / Convert.ToDecimal(a))*100,1).ToString();
    }



    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        string sid = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
        GridView2.DataSource = DBManager.Query("select * from workcheck where sid='" +sid+ "'");
        GridView2.DataBind();
    }

    protected void GridView1_Sorting1(object sender, GridViewSortEventArgs e)
    {

    }
}