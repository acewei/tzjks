using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StuInfoAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["Sid"] != null)
            {
                Student student = new Student();
                StudentData[] studentData = student.Select(Request.QueryString["SId"]);
                TextBox1.Text = studentData[0].SId;
                TextBox2.Text = studentData[0].Sname;
                TextBox3.Text = studentData[0].Ssex;
                TextBox4.Text = studentData[0].Sey;
                TextBox5.Text = studentData[0].BCname;
                TextBox6.Text = studentData[0].BCid;
                TextBox7.Text = studentData[0].Class;
                TextBox8.Text = studentData[0].Institute;
                TextBox9.Text = studentData[0].SGid;
                student = null;
                studentData = null;
            }
        }
    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        Student student = new Student();
        StudentData studentData = new StudentData();
        studentData.SId = TextBox1.Text.Trim();
        studentData.Sname = TextBox2.Text.Trim();
        studentData.Ssex = TextBox3.Text.Trim();
        studentData.Sey = TextBox4.Text.Trim();
        studentData.BCname = TextBox5.Text.Trim();
        studentData.BCid = TextBox6.Text.Trim();
        studentData.Class = TextBox7.Text.Trim();
        studentData.Institute = TextBox8.Text.Trim();
        studentData.SGid = TextBox6.Text.Trim();
        if (Request.QueryString["SId"] != null)
        {
            studentData.SId = Request.QueryString["SId"];
            student.Modify(studentData);
        }
        else
        {
            student.Insert(studentData);
        }
        student = null;
        studentData = null;
        Response.Redirect("StuInfoMaintain.aspx");
    }
}