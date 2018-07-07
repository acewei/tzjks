using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class u_employer_ApplyReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack) bindgrid();
    }

    

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string applyid = GridView1.Rows[e.RowIndex].Cells[0].Text;
        string peo = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[0])).Text;
        string status = ((DropDownList)(GridView1.Rows[e.RowIndex].Cells[3].FindControl("DropDownList1"))).SelectedValue;
        //Page.ClientScript.RegisterClientScriptBlock(GetType(),"sd","alert('"+applyid+"')",true);
        //DBManager.Nonquery("delete shinfo");
        DBManager.Nonquery("update shinfo set reviewer='"+peo+"',reviewtime=getdate(),reviewresult='"+status+"' where applyid='"+applyid+"'");
        GridView1.EditIndex = -1;
        bindgrid();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }
    void bindgrid()
    {
        GridView1.DataSource = DBManager.Query("select apply.applyid,sname,post,reviewresult,reviewtime,reviewer from student,apply,shinfo,workinfo,employer where left(workinfo.postid,2)=employer.employerid and apply.applyid=shinfo.applyid and student.sid=apply.sid and workinfo.postid=apply.postid and employername='"+Session["remark"]+"'");
        GridView1.DataBind();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {


    }
}