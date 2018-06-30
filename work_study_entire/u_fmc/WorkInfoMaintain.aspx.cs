using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Text;
using System.Data.OleDb;
using System.Reflection;

public partial class WorkInfoMaintain : System.Web.UI.Page
{
    int alltimecount = Convert.ToInt32(DBManager.Query("select count(*) from time").Tables[0].Rows[0][0].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        //begin
        if (!IsPostBack)
        {
            bindgrid();
        }
    }
    void bindgrid()
    {

        GridView1.DataSource = DBManager.Query("select * from workinfo ");
        GridView1.DataBind();

    }


    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
        bindtimev();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string postid = GridView1.DataKeys[e.RowIndex].Value.ToString();
        DBManager.Nonquery("delete from workinfo where postid='" + postid + "'");
        DBManager.Nonquery("delete from workreqtime where postid='" + postid + "'");
        bindgrid();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.SelectedIndex = e.NewEditIndex;
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();

        string postid = GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString();

        try
        {


            DataTable ds = DBManager.Query("select tid from workreqtime where postid='" + postid + "'").Tables[0];

            workreqtimev.DataSource = DBManager.Query("select * from time");
            workreqtimev.DataBind();

            //((CheckBox)workreqtimev.FindControl("checktime")).Visible = true;



            for (int i = 0; i < alltimecount; i++)
            {
                ((CheckBox)workreqtimev.Rows[i].Cells[5].FindControl("checktime")).Visible = true;
                foreach (DataRow x in ds.Rows)
                {
                    if (x[0].ToString() == workreqtimev.DataKeys[i].Value.ToString())
                        ((CheckBox)workreqtimev.Rows[i].Cells[5].FindControl("checktime")).Checked = true;
                }
            }
        }
        catch (Exception aa)
        {
            warn.Text = aa.ToString();
        }
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string gradereq = "";
        CheckBoxList gradecl = (CheckBoxList)(GridView1.Rows[e.RowIndex].Cells[5].FindControl("gradeadd0"));
        foreach (ListItem x in gradecl.Items)
        {
            if (x.Selected) gradereq += "," + x.Text.Trim();
        }
        if (gradereq.Length != 0)
            gradereq = gradereq.Substring(1);
        string postid = GridView1.DataKeys[e.RowIndex].Value.ToString();
        string post = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
        string workplace = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        string hourwage = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
        string genderreq = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[4].FindControl("xb")).SelectedValue;

        string loss = ((TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
        string descri = ((TextBox)GridView1.Rows[e.RowIndex].Cells[7].FindControl("TextBox1")).Text;
        //((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text
        string peoneed = ((TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[1]).Text;
        string applybe = ((TextBox)GridView1.Rows[e.RowIndex].Cells[9].Controls[1]).Text;
        string applyfi = ((TextBox)GridView1.Rows[e.RowIndex].Cells[10].Controls[1]).Text;
        bool isconfirm = ((CheckBox)GridView1.Rows[e.RowIndex].Cells[11].Controls[0]).Checked;
        //Page.ClientScript.RegisterClientScriptBlock(GetType(), "as", "alert('"+post+workplace+loss+applybe+hourwage+"')", true);
        DBManager.Nonquery("update workinfo set workplace='" + workplace + "',hourlywage='" + hourwage + "',genderreq='" + genderreq + "',lossforabsence='" + loss + "'," +
            "jobdescription='" + descri + "', PeoNumberDemand='" + peoneed + "',applytimebe='" + applybe + "',gradereq='" + gradereq + "', ApplyTimeFi='" + applyfi + "',IsConfirm='" + isconfirm + "' where postid='" + postid + "'");
        DBManager.Nonquery("delete from workreqtime where postid='" + GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString() + "'");
        for (int i = 0; i < alltimecount; i++)
        {

            if (((CheckBox)workreqtimev.Rows[i].Cells[4].FindControl("checktime")).Checked)
            {
                DBManager.Nonquery("insert into workreqtime(wrid,postid,tid) values('" + GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString() + workreqtimev.DataKeys[i].Value.ToString() + "','" + GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString() + "','" + workreqtimev.DataKeys[i].Value.ToString() + "')");

            }
        }
        GridView1.EditIndex = -1;

        bindgrid();
        bindtimev();
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        string postid = GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString();
        try
        {
            bindtimev();
        }
        catch (Exception ef)
        {
            warn.Text = ef.ToString();
        }

    }
    void bindtimev()
    {
        string postid = GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString();
        workreqtimev.DataSource = DBManager.Query("select * from workreqtime,time where time.tid=workreqtime.tid and postid='" + postid + "'");

        workreqtimev.DataBind();
    }
}