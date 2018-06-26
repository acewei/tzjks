using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WorkInfoAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["PostId"] != null)
            {
                WorkInfo workInfo = new WorkInfo();
                WorkInfoData[] workInfoData = workInfo.Select(Request.QueryString["PostId"]);
                TextBox1.Text = workInfoData[0].PostId;
                TextBox2.Text = workInfoData[0].Post;
                TextBox3.Text = workInfoData[0].WorkPlace;
                TextBox4.Text = workInfoData[0].HourlyWage;
                TextBox5.Text = workInfoData[0].GenderReq;
                TextBox6.Text = workInfoData[0].BelongUnit;
                TextBox7.Text = workInfoData[0].GradeReq;
                TextBox8.Text = workInfoData[0].LossForAbsence;
                TextBox9.Text = workInfoData[0].JobDescription;
                TextBox10.Text = workInfoData[0].ApplyTimeBe;
                TextBox11.Text = workInfoData[0].ApplyTimeFi;
                TextBox12.Text = workInfoData[0].PeoNumberDemand;
                workInfo = null;
                workInfoData = null;
            }
        }
    }

    protected void BtnOk_Click(object sender, EventArgs e)
    {
        WorkInfo workInfo = new WorkInfo();
        WorkInfoData workInfoData = new WorkInfoData();
        workInfoData.PostId = TextBox1.Text.Trim();
        workInfoData.Post = TextBox2.Text.Trim();
        workInfoData.WorkPlace = TextBox3.Text.Trim();
        workInfoData.HourlyWage = TextBox4.Text.Trim();
        workInfoData.GenderReq = TextBox5.Text.Trim();
        workInfoData.BelongUnit = TextBox6.Text.Trim();
        workInfoData.GradeReq = TextBox7.Text.Trim();
        workInfoData.LossForAbsence = TextBox8.Text.Trim();
        workInfoData.JobDescription = TextBox9.Text.Trim();
        workInfoData.ApplyTimeBe = TextBox10.Text.Trim();
        workInfoData.ApplyTimeFi = TextBox11.Text.Trim();
        workInfoData.PeoNumberDemand = TextBox12.Text.Trim();
        if (Request.QueryString["PostId"] != null)
        {
            workInfoData.PostId = Request.QueryString["PostId"];
            workInfo.Modify(workInfoData);
        }
        else
        {
            workInfo.Insert(workInfoData);
        }
        workInfo = null;
        workInfoData = null;
        Response.Redirect("WorkInfoMaintain.aspx");
    }
}