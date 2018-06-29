using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class u_employer_JobArrange : System.Web.UI.Page
{
    public string sd;
    string sid, postid, tid;
    string d1, d2;
    public static bool flag = false;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            DropDownList1.DataSource = DBManager.Query("select * from student,apply,shinfo where apply.applyid=shinfo.applyid and apply.sid=student.sid and shinfo.reviewresult='通过'");
            DropDownList1.DataBind();
            DropDownList2.DataSource = DBManager.Query("select * from workinfo,apply,shinfo,student where apply.applyid=shinfo.applyid and apply.sid=student.sid and apply.postid=workinfo.postid and student.sname='"+DropDownList1.SelectedValue+"'");
            DropDownList2.DataBind();
            GridView2.DataSource = DBManager.Query("select time.* from stufreetime,workreqtime,workinfo,student,time where stufreetime.tid=time.tid and stufreetime.tid=workreqtime.tid and workreqtime.postid=workinfo.postid and stufreetime.sid=student.sid and student.sname='" + DropDownList1.SelectedValue + "' and workinfo.post='" + DropDownList2.SelectedValue + "' ");
            GridView2.DataBind();
            bindgrid();

        }

    }


    void bindgrid()
    {
        GridView1.DataSource = DBManager.Query("select * from schedule order by validstart desc");
        GridView1.DataBind();
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindgrid();
    }



    protected void GridView1_DataBinding(object sender, EventArgs e)
    {
        recordCount.Text = DBManager.Query("select count(*) from schedule").Tables[0].Rows[0].ItemArray[0].ToString();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DBManager.Query("delete from schedule where scid = '" + GridView1.Rows[e.RowIndex].Cells[0].Text + "'");
        //Page.ClientScript.RegisterClientScriptBlock(GetType(), "dssd", "alert('saasf"++"')", true);
        GridView1.EditIndex = -1;
        bindgrid();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int cou = 0;
        sid = DBManager.Query("select sid from student where sname='" + DropDownList1.SelectedValue + "'").Tables[0].Rows[0][0].ToString();
        postid = DBManager.Query("select postid from workinfo where post='" + DropDownList2.SelectedValue + "' and belongunit='西苑'").Tables[0].Rows[0][0].ToString();

        d1 = t1.Text;
        d2 = t2.Text;
        int allar = Convert.ToInt32(DBManager.Query("select count(*) from stufreetime,workreqtime,workinfo,student,time where stufreetime.tid=time.tid and stufreetime.tid=workreqtime.tid and workreqtime.postid=workinfo.postid and stufreetime.sid=student.sid and student.sname='" + DropDownList1.SelectedValue + "' and workinfo.post='" + DropDownList2.SelectedValue + "' ").Tables[0].Rows[0][0].ToString());
        for (int i = 0; i < allar; i++)

            if (((CheckBox)GridView2.Rows[i].Cells[5].FindControl("CheckBox1")).Checked)

                if (DBManager.Nonquery("exec arrangework '" + sid + "','" + postid + "','" + GridView2.DataKeys[i].Value.ToString() + "','" + d1 + "','" + d2 + "'") >= 1) cou++;


        bindgrid();
        if (cou > 0)
            Label13.Text = "成功添加" + cou + "条记录！";
        else Label13.Text = "没有添加...";
        Timer1.Enabled = true;
    }


    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView2.DataSource = DBManager.Query("select time.* from stufreetime,workreqtime,workinfo,student,time where stufreetime.tid=time.tid and stufreetime.tid=workreqtime.tid and workreqtime.postid=workinfo.postid and stufreetime.sid=student.sid and student.sname='" + DropDownList1.SelectedValue + "' and workinfo.post='" + DropDownList2.SelectedValue + "' ");
        GridView2.DataBind();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Page.ClientScript.RegisterClientScriptBlock(GetType(), "dasd", "alert('asd')", true);
        GridView2.DataSource = DBManager.Query("select time.* from stufreetime,workreqtime,workinfo,student,time where stufreetime.tid=time.tid and stufreetime.tid=workreqtime.tid and workreqtime.postid=workinfo.postid and stufreetime.sid=student.sid and student.sname='" + DropDownList1.SelectedValue + "' and workinfo.post='" + DropDownList2.SelectedValue + "' ");
        GridView2.DataBind();
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Label13.Text = "";
        Timer1.Enabled = false;
    }
}