using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading;

public partial class u_student_Apply : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (DetailsView1.DataItemCount == 0)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("applytimebe");
                dt.Columns.Add("applytimefi");
                dt.Columns.Add("postid");
                dt.Columns.Add("jobdescription");
              
                if (dt.Rows.Count == 0)
                {
                    dt.Rows.Add(dt.NewRow());
                }
                DetailsView1.DataSource = dt;
                DetailsView1.DataBind();
            }
            bindgrid();
            //设置数据库连接
            Label1.Text = Session["username"].ToString();
            Label10.Text = DBManager.Query("select sname from student where sid='" + Session["username"].ToString() + "'").Tables[0].Rows[0][0].ToString();
            GridView2.DataSource = DBManager.Query("select * from time");
            GridView2.DataBind();
        }
    }
    void bindgrid()
    {

        GridView1.DataSource = DBManager.Query("select * from workinfo");
        GridView1.DataBind();

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ddk")
        {
            //Page.ClientScript.RegisterClientScriptBlock(GetType(), "asdad", "alert('ad')", true);


        }

    }





    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        //Page.ClientScript.RegisterClientScriptBlock(GetType(), "asdad", "alert('"+ GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text + "')", true);
        string postid = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
        //note.Text = String.Empty;
        DetailsView1.DataSource = DBManager.Query("select * from workinfo where postid='" + postid + "'");
        DetailsView1.DataBind();
        GridView g3 = (GridView)DetailsView1.FindControl("GridView3");
        g3.DataSource = DBManager.Query("select time.tid,whatday,starttime,endtime from WorkReqTime,time where postid='" + postid + "' and WorkReqTime.tid=time.tid");
        string[] x = new string[1];
        x[0] = "tid";
        g3.DataKeyNames = x;
        g3.DataBind();
        post.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text + "-" + GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string postid = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
        //DBManager.Nonquery("insert into stufreetime values('1511240142','12','151124014212')");
        note.Text = "提交成功！";
        bool suitsex, suitgrade, suittime = false;
        GridView g3 = (GridView)DetailsView1.FindControl("GridView3");
        int alltime = Convert.ToInt32(DBManager.Query("select count(*) from time").Tables[0].Rows[0][0].ToString());
        int fl = 0;
        int reqtime = Convert.ToInt32(DBManager.Query("select count(*) from workreqtime where postid='" + GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString() + "'").Tables[0].Rows[0][0].ToString());

        for (int i = 0; i < alltime; i++)
        {

            if (((CheckBox)GridView2.Rows[i].Cells[4].FindControl("CheckBox1")).Checked)
            {

                for (int j = 0; j < reqtime; j++)
                {

                    //g3.DataKeys[j].Value.ToString() == GridView2.DataKeys[i].Value.ToString()+"|";
                    if (g3.DataKeys[j].Value.ToString() == GridView2.DataKeys[i].Value.ToString())
                    {
                        fl++;

                    }
                }
            }
        }
        if (fl >= 1) suittime = true;
        if (GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text == DBManager.Query("select ssex from student where sid='" + Label1.Text + "'").Tables[0].Rows[0][0].ToString()) suitsex = true;
        //if(DBManager.Query("select ssex from student where sid='" + Label1.Text + "'").Tables[0].Rows[0][0].ToString()=="true")
        if (suittime)
        {
            if (DBManager.Query("select count(*) from apply,workinfo where apply.postid='" + postid + "' and apply.postid=workinfo.postid and applytime > applytimebe and applytime<applytimefi").Tables[0].Rows[0][0].ToString() =="0")
            {
                for (int i = 0; i < alltime; i++)
                {
                    if (((CheckBox)GridView2.Rows[i].Cells[4].FindControl("CheckBox1")).Checked)
                    DBManager.Nonquery("insert into stufreetime(sfid,sid,tid) values('" + Label1.Text + GridView2.DataKeys[i].Value.ToString() + "','" + Label1.Text + "','" + GridView2.DataKeys[i].Value.ToString() + "')");

                }
            DBManager.Nonquery("insert into apply values('" + Label1.Text + GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString() + DateTime.Now.ToString("yyyyMMdd") + "','" + applyreason.InnerText + "','待审核','" + DateTime.Now + "','" + Label1.Text + "','" + GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text + "')");
            //DBManager.Nonquery("insert into apply values('1511240142010120180613','dfgdgg','待审核','2018-06-13','1511240142','0101')"); + Label1.Text + GridView1.DataKeys[GridView1.SelectedIndex].Value
            note.Text = "提交成功！" + new Random().Next();
            }
            else
            {
                note.Text = "已经申请该岗位....." + new Random().Next();
            }
        }
        else
        {
            note.Text = "提交失败....." + new Random().Next();
        }
        Timer1.Enabled = true;
    }





    

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        note.Text = "";
        Timer1.Enabled = false;
    }
}