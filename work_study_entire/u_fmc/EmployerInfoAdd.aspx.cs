using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmployerInfoAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["EmployerId"] != null)
            {
                Employer employer = new Employer();
                EmployerData[] Employerdata = employer.Select(Request.QueryString["EmployerId"]);
                TextBox1.Text = Employerdata[0].EmployerId;
                TextBox2.Text = Employerdata[0].EmployerName;
                TextBox3.Text = Employerdata[0].EmployerSite;
                employer = null;
                Employerdata = null;
            }
        }
    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        Employer employer = new Employer();
        EmployerData employerData = new EmployerData();
        employerData.EmployerId = TextBox1.Text.Trim();
        employerData.EmployerName = TextBox2.Text.Trim();
        employerData.EmployerSite = TextBox3.Text.Trim();
        if (Request.QueryString["EmployerId"] != null)
        {
            employerData.EmployerId = Request.QueryString["EmployerId"];
            employer.Modify(employerData);
        }
        else
        {
            employer.Insert(employerData);
        }
        employer = null;
        employerData = null;
        Response.Redirect("EmployerInfoMaintain.aspx");
    }
}