using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class _Default : System.Web.UI.Page
{
    public static bool flag =false ;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            
            bindgrid();
           
        }
    }

    protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        this.GridView1.EditIndex = e.NewEditIndex;
       
        bindgrid();
    }

    protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        this.GridView1.EditIndex = -1;
        bindgrid();
    }

    protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        
       // string sid=((DropDownList)GridView1.Rows[e.RowIndex].Cells[1].FindControl("DropDownList1")).SelectedValue;
         string wcid=GridView1.Rows[e.RowIndex].Cells[0].Text;
        bool isattend = ((CheckBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Checked;
         bool isfinish = ((CheckBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Checked;



        DBManager.Nonquery("update workcheck set isattend='"+isattend+"',isfinishwc='"+isfinish+"' where wcid='"+wcid+"'");
        
        
        
        GridView1.EditIndex = -1;
        bindgrid();
        
    }

    void bindgrid()
    {
        
        GridView1.DataSource = DBManager.Query("select * from workcheck,workinfo,employer where workcheck.postid=workinfo.postid and workinfo.belongunit=employername and employername='"+Session["remark"]+"'");
        GridView1.DataBind();
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindgrid();
    }



    protected void GridView1_DataBinding(object sender, EventArgs e)
    {
        recordCount.Text = DBManager.Query("select count(*) from workcheck").Tables[0].Rows[0][0].ToString();
        
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       
        string wcid=GridView1.Rows[e.RowIndex].Cells[0].Text;
       
        DBManager.Nonquery("delete from workcheck where wcid='"+wcid+"'");
        GridView1.EditIndex = -1;
        bindgrid();
        
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
      
        if (input1.Value == "") Page.ClientScript.RegisterClientScriptBlock(GetType(), "aa", "alert('请输入天数')", true);
        else
        {
            DBManager.Nonquery("exec createWC " + input1.Value+",'"+DBManager.Query("select employerid from employer where employername='"+Session["remark"]+"'").Tables[0].Rows[0][0].ToString()+"'");
            
            bindgrid();
           
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (!flag)
        {
          
          
            
            GridView1.DataSource = DBManager.Query("select * from workcheck where isfinishwc is null order by detaildate,tid");
            GridView1.DataBind();
        }
        else
        {
            bindgrid();
        }
        flag = !flag;
      
    }


    protected void Button1_Click(object sender, EventArgs e)
    {

        string sql = "select * from WorkCheck,WorkInfo,Student where WorkCheck.Postid=WorkInfo.postid and WorkCheck.SId=Student.SId and " +
            "WorkCheck.isfinishwc=1 and detaildate>='" + t1.Text + "' and detaildate<='" + t2.Text + "' order by detaildate";
        if (t1.Text != "" && t2.Text != "")
        {
            GridView1.DataSource = DBManager.Query(sql);

            GridView1.DataBind();
        }
        else
        {
            bindgrid();
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        GridView1.AllowPaging = false;
        GridView1.ShowFooter = false;

        //bindgrid();
        GridView1.DataSource = DBManager.Query("select * from workcheck where isfinishwc is null order by detaildate,tid");
        GridView1.DataBind();
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "utf-8";
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + System.Web.HttpUtility.UrlEncode("导出" + System.DateTime.Now.Date.ToString("yyyyMMdd")) + ".xls");
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("utf-8");//设置输出流为简体中文

        Response.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。 
        this.EnableViewState = false;
        System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);

        ClearControls(GridView1);
        this.GridView1.RenderControl(oHtmlTextWriter);
        Response.Write(oStringWriter.ToString());
        Response.End();

        //还原分页显示
        GridView1.AllowPaging = true;
        GridView1.ShowFooter = true;
        bindgrid();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        // Confirms that an HtmlForm control is rendered for
    }

    private void ClearControls(Control control)
    {
        for (int i = control.Controls.Count - 1; i >= 0; i--)
        {
            ClearControls(control.Controls[i]);
        }

        if (!(control is TableCell))
        {
            if (control.GetType().GetProperty("SelectedItem") != null)
            {
                LiteralControl literal = new LiteralControl();
                control.Parent.Controls.Add(literal);
                try
                {
                    literal.Text = (string)control.GetType().GetProperty("SelectedItem").GetValue(control, null);
                }
                catch
                {
                }
                control.Parent.Controls.Remove(control);
            }
            else if (control.GetType().GetProperty("Text") != null)
            {
                LiteralControl literal = new LiteralControl();
                control.Parent.Controls.Add(literal);
                literal.Text = (string)control.GetType().GetProperty("Text").GetValue(control, null);
                control.Parent.Controls.Remove(control);
            }
        }
        return;
    }
}