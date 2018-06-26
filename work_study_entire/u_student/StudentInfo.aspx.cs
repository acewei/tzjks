using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Apply2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)bindtext();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int a = DBManager.Nonquery("update student set bcname='" + tbbc.Text + "',bcid='" + tbbcid.Text + "' where sid='" + Session["username"] + "'");
       
        
        
       bindtext();

    }
    void bindtext()
    {
        tbbc.Text = DBManager.Query("select bcname from student where sid='" + Session["username"] + "'").Tables[0].Rows[0][0].ToString();
        tbbcid.Text = DBManager.Query("select bcid from student where sid='" + Session["username"] + "'").Tables[0].Rows[0][0].ToString();
        tbclass.Text = DBManager.Query("select class from student where sid='" + Session["username"] + "'").Tables[0].Rows[0][0].ToString();
        tbins.Text = DBManager.Query("select institute from student where sid='" + Session["username"] + "'").Tables[0].Rows[0][0].ToString();
        tbname.Text = DBManager.Query("select sname from student where sid='" + Session["username"] + "'").Tables[0].Rows[0][0].ToString();
        tbsex.Text = DBManager.Query("select ssex from student where sid='" + Session["username"] + "'").Tables[0].Rows[0][0].ToString();
        tbsey.Text = DBManager.Query("select sey from student where sid='" + Session["username"] + "'").Tables[0].Rows[0][0].ToString();
        tbsg.Text = DBManager.Query("select sgid from student where sid='" + Session["username"] + "'").Tables[0].Rows[0][0].ToString();
        tbsid.Text = Session["username"].ToString();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        bindtext();
    }
}
