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
using System.Security.Cryptography;

public partial class UserInfoMaintain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) bindgrid();
        //设置数据库连接
        string sqlconnstr = ConfigurationManager.ConnectionStrings["WSConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        sqlconn.Open();
    }
    void bindgrid()
    {
        string sqlconnstr = ConfigurationManager.ConnectionStrings["WSConnectionString"].ConnectionString;
        DataSet ds = new DataSet();
        using (SqlConnection sqlconn = new SqlConnection(sqlconnstr))
        {
            SqlDataAdapter sqld = new SqlDataAdapter("select UserName,Password,UserId,Remark from [User]", sqlconn);
            sqld.Fill(ds, "tabUser");
        }
        GridView1.DataSource = ds.Tables["tabUser"].DefaultView;
        GridView1.DataBind();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bindgrid();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //设置数据库连接
        string sqlconnstr = ConfigurationManager.ConnectionStrings["WSConnectionString"].ConnectionString; ;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        sqlconn.Open();
        //删除行处理
        String sql = "delete from [User] where UserName='" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "'";
        SqlCommand Comm = new SqlCommand(sql, sqlconn);
        Comm.ExecuteNonQuery();
        sqlconn.Close();
        sqlconn = null;
        Comm = null;
        GridView1.EditIndex = -1;
        bindgrid();
        
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bindgrid();
    }


    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string sqlconnstr = ConfigurationManager.ConnectionStrings["WSConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        //提交行修改
        sqlconn.Open();
        SqlCommand Comm = new SqlCommand();
        Comm.Connection = sqlconn;
        Comm.CommandText = "update [User] set UserId=@UserId, Remark=@Remark where UserName=@UserName";
        Comm.Parameters.AddWithValue("@UserName", GridView1.DataKeys[e.RowIndex].Value.ToString());
        Comm.Parameters.AddWithValue("@UserId", ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text);
        Comm.Parameters.AddWithValue("@Remark", ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text);
        Comm.ExecuteNonQuery();
        sqlconn.Close();
        sqlconn = null;
        Comm = null;
        GridView1.EditIndex = -1;
        bindgrid();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        
            string sqlconnstr = ConfigurationManager.ConnectionStrings["WSConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(sqlconnstr);
        //建立Command对象
        SqlCommand sqlcommand = new SqlCommand();
        sqlcommand.Connection = sqlconn;
        //把SQL语句赋给Command对象
       
            sqlcommand.CommandText = "insert into [User](UserName,Password,UserId,Remark)values (@UserName,@Password,@UserId,@Remark)";
        sqlcommand.Parameters.AddWithValue("@UserName", TextBox1.Text);
        sqlcommand.Parameters.AddWithValue("@Password", GetStrMd5(TextBox2.Text));
        sqlcommand.Parameters.AddWithValue("@UserId", TextBox3.SelectedValue);
        sqlcommand.Parameters.AddWithValue("@Remark", TextBox4.Text);
        try
        {
            //打开连接
            sqlconn.Open();
            //执行SQL命令
            sqlcommand.ExecuteNonQuery();
            Label2.Text = "成功增加记录";
            TextBox1.Text = String.Empty;
            
            TextBox3.Text = String.Empty;
            TextBox4.Text = String.Empty;
        }
        catch (Exception ex)
        {
            Label2.Text = "错误原因：" + ex.Message;
        }
        finally
        {
            sqlcommand = null;
            sqlconn.Close();
            sqlconn = null;
            GridView1.EditIndex = -1;
            bindgrid();
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = String.Empty;
        TextBox2.Text = String.Empty;
        TextBox3.Text = String.Empty;
        TextBox4.Text = String.Empty;
        
    }

    /// <summary>
    /// 翻页操作
    /// 在GridView当前索引正在更改时触发
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        #region 方法1 废弃

        //txtName.Text = "翻页操作";
        //int index = e.NewPageIndex+1;
        //DataSet ds = SplitDataSet(index);
        //DataTable dt = ds.Tables[0];
        ////DataGrid1.DataSource = dt;
        ////DataGrid1.DataBind();
        //GridView1.DataSource = dt;
        //GridView1.DataBind();
        //ClearDisplay();
        //GridView1.AllowCustomPaging = false;         

        #endregion

        #region 方法2

        //GridView1.PageIndex = e.NewPageIndex;
        //InitGridView();

        #endregion

        #region 方法3

        #region 前台

        //<PagerTemplate>
        //    当前第:
        //     <%--//((GridView)Container.NamingContainer)就是为了得到当前的控件--%>
        //    <asp:Label ID="LabelCurrentPage" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>"></asp:Label>
        //    页/共:
        //    <%--//得到分页页面的总数--%>
        //    <asp:Label ID="LabelPageCount" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageCount %>"></asp:Label>
        //    页
        //    <%--//如果该分页是首分页，那么该连接就不会显示了.同时对应了自带识别的命令参数CommandArgument--%>
        //    <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
        //        Visible='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>'>首页</asp:LinkButton>
        //    <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
        //        CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>'>上一页</asp:LinkButton>
        //    <%--//如果该分页是尾页，那么该连接就不会显示了--%>
        //    <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
        //        Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>下一页</asp:LinkButton>
        //    <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
        //        Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>'>尾页</asp:LinkButton>
        //    转到第
        //    <asp:TextBox ID="txtNewPageIndex" runat="server" Width="20px" Text='<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>' />页
        //    <%--//这里将CommandArgument即使点击该按钮e.newIndex 值为3 --%>
        //    <asp:LinkButton ID="btnGo" runat="server" CausesValidation="False" CommandArgument="-2"
        //        CommandName="Page" Text="GO" />
        //</PagerTemplate>

        #endregion

        // 得到该控件
        GridView theGrid = sender as GridView;
        int newPageIndex = 0;
        if (e.NewPageIndex == -3)
        {
            //点击了Go按钮
            TextBox txtNewPageIndex = null;

            //GridView较DataGrid提供了更多的API，获取分页块可以使用BottomPagerRow 或者TopPagerRow，当然还增加了HeaderRow和FooterRow
            GridViewRow pagerRow = theGrid.BottomPagerRow;

            if (pagerRow != null)
            {
                //得到text控件
                txtNewPageIndex = pagerRow.FindControl("txtNewPageIndex") as TextBox;
            }
            if (txtNewPageIndex != null)
            {
                //得到索引
                newPageIndex = int.Parse(txtNewPageIndex.Text) - 1;
            }
        }
        else
        {
            //点击了其他的按钮
            newPageIndex = e.NewPageIndex;
        }
        //防止新索引溢出
        newPageIndex = newPageIndex < 0 ? 0 : newPageIndex;
        newPageIndex = newPageIndex >= theGrid.PageCount ? theGrid.PageCount - 1 : newPageIndex;

        //得到新的值
        theGrid.PageIndex = newPageIndex;

        //重新绑定
        GridView1.EditIndex = -1;
        bindgrid();
        #endregion


    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //如果是绑定数据行 
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //当鼠标停留时更改背景色
            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='AliceBlue';this.style.cursor='pointer'");
            //当鼠标移开时还原背景色
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
            //当有编辑列时，避免出错，要加的RowState判断 
            //if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            // {
            //    ((Button)e.Row.Cells[6].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[1].Text + "\"吗?')");               
            //}

        }
        //自动编号功能
        //if (e.Row.RowIndex != -1)
        // {
        //    int id = e.Row.RowIndex + 1;
        //     e.Row.Cells[0].Text = id.ToString();
        // }


    }
    /// <summary>
    /// 导出Excel功能
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button3_Click(object sender, EventArgs e)
    {
        //导出全部数据，取消分页
        GridView1.AllowPaging = false;
        GridView1.ShowFooter = false;

        bindgrid();

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

    /// <summary>
    /// GridView如果需要实现导出Excel功能，则该函数需要重载
    /// </summary>
    /// <param name="control"></param>
    public override void VerifyRenderingInServerForm(Control control)
    {
        // Confirms that an HtmlForm control is rendered for
    }

    /// <summary>
    /// 清除控件中的所有控件，以便导出Excel
    /// </summary>
    /// <param name="control"></param>
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
    protected void Buttonsearch_Click(object sender, EventArgs e)
    {
        TestCon();
    }
    private void TestCon()
    {
        string sqlconnstr = ConfigurationManager.ConnectionStrings["WSConnectionString"].ConnectionString;
        DataSet ds = new DataSet();
        //自定义查询SQL字符串
        string strTemp = TextBoxsearch.Text;  //需要查寻的数据，从TextBox中读取 
        using (SqlConnection sqlconn = new SqlConnection(sqlconnstr))
        {
            SqlDataAdapter sqld = new SqlDataAdapter("SELECT * FROM [User] WHERE (( UserName like '%" + TextBoxsearch.Text.ToString() + "%') or (UserId like '%" + TextBoxsearch.Text.ToString() + "%')) Order by UserName Desc", sqlconn);
            sqld.Fill(ds, "tabUser");
        }
        GridView1.DataSource = ds.Tables["tabUser"].DefaultView;
        GridView1.DataBind();

    }




    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "myreset")
            {
                int row = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                DBManager.Nonquery("update [user] set Password='" + GetStrMd5("123456") + "' where username='" + GridView1.DataKeys[row].Value.ToString() + "'");
            }
        }catch(Exception zf)
        {
            warn.Text = zf.ToString();
        }
        bindgrid();
    }

    public static string GetStrMd5(string ConvertString)
    {
        MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
        string t2 = BitConverter.ToString(md5.ComputeHash(UTF8Encoding.Default.GetBytes(ConvertString)));
        t2 = t2.Replace("-", "");
        return t2.ToLower();

    }
}