using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class u_employer_JobManage : System.Web.UI.Page
{
    int alltimecount = Convert.ToInt32(DBManager.Query("select count(*) from time").Tables[0].Rows[0][0].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
       
        //begin
        if (!IsPostBack)
        {
            workreqtime.DataSource = DBManager.Query("select * from time");
            workreqtime.DataBind();
            bindgrid();
        }
    }
    void bindgrid()
    {

        GridView1.DataSource = DBManager.Query("select * from workinfo where belongunit='" + Session["remark"] + "'");
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
        //Page.ClientScript.RegisterClientScriptBlock(GetType(), "as", "alert('"+post+workplace+loss+applybe+hourwage+"')", true);
        DBManager.Nonquery("update workinfo set workplace='" + workplace + "',hourlywage='" + hourwage + "',genderreq='" + genderreq + "',lossforabsence='" + loss + "'," +
            "jobdescription='" + descri + "', PeoNumberDemand='" + peoneed + "',applytimebe='" + applybe + "',gradereq='" + gradereq + "', ApplyTimeFi='" + applyfi + "' where postid='" + postid + "'");
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

    protected void Button2_Click(object sender, EventArgs e)
    {
       
            string gradereq = "";
            foreach (ListItem x in gradeadd.Items)
            {
                if (x.Selected) gradereq += ("," + x.Text.Trim());
            }
            if (gradereq.Length > 0)
                gradereq = gradereq.Substring(1);
            
            string post = postname.Text;
            string workplace = workplace1.Text;
            string hourwage = shixin.Text;
            string genderreq = genderreq1.SelectedValue;
       

            int alltime = Convert.ToInt32(DBManager.Query("select count(*) from time").Tables[0].Rows[0][0].ToString());
            string loss = loss1.Text;
            string descri = description.Text;
            string peoneed = peonum.Text;
            string applybe = betime.Text;
            string applyfi = fitime.Text;
            string newpostid = DBManager.Query("SELECT dbo.newpostid('" + Session["remark"] + "')").Tables[0].Rows[0][0].ToString();
        try
        {
           
        
            if (DBManager.Nonquery("exec addwork '" + post + "','" + workplace + "','" + hourwage + "','" + genderreq + "','" + Session["remark"] + "','" + gradereq + "'," +
                "'" + loss + "','" + descri + "','" + applybe + "','" + applyfi + "','" + peoneed + "'") > 0)
            {
                note.Text = "添加成功！";
                Timer1.Enabled = true;
                bindgrid();
            }
            else
            {
                note.Text = "添加失败,岗位名不能重复...";
                Timer1.Enabled = true;
            }
            for (int i = 0; i < alltime; i++)
            {
                if (((CheckBox)workreqtime.Rows[i].Cells[4].FindControl("CheckBox1")).Checked)
                    DBManager.Nonquery("insert into workreqtime(wrid,postid,tid) values('" + newpostid + workreqtime.DataKeys[i].Value.ToString() + "','" + newpostid + "','" + workreqtime.DataKeys[i].Value.ToString() + "')");

            }

        }
        catch (Exception dsf)
        {
          
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        note.Text = String.Empty;
        Timer1.Enabled = false;
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
          
        }

    }
    void bindtimev()
    {
        string postid = GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString();
        workreqtimev.DataSource = DBManager.Query("select * from workreqtime,time where time.tid=workreqtime.tid and postid='" + postid + "'");

        workreqtimev.DataBind();
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindgrid();
    }
}