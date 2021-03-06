﻿using System;
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
        GridView1.DataSource = DBManager.Query("select schedule.* from schedule,employer where left(schedule.postid,2)=employer.employerid and employername='"+Session["remark"]+"' order by validstart desc");
        GridView1.DataBind();
    }



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
        try
        {
            int cou = 0;
            sid = DBManager.Query("select sid from student where sname='" + DropDownList1.SelectedValue + "'").Tables[0].Rows[0][0].ToString();
            postid = DBManager.Query("select postid from workinfo where post='" + DropDownList2.SelectedValue + "' and belongunit='" + Session["remark"] + "'").Tables[0].Rows[0][0].ToString();

            d1 = t1.Text;
            d2 = t2.Text;
            int allar = Convert.ToInt32(DBManager.Query("select count(*) from stufreetime,workreqtime,workinfo,student,time where stufreetime.tid=time.tid and stufreetime.tid=workreqtime.tid and workreqtime.postid=workinfo.postid and stufreetime.sid=student.sid and student.sname='" + DropDownList1.SelectedValue + "' and workinfo.post='" + DropDownList2.SelectedValue + "' ").Tables[0].Rows[0][0].ToString());
            for (int i = 0; i < allar; i++)//ok

                if (((CheckBox)GridView2.Rows[i].Cells[5].FindControl("CheckBox1")).Checked)

                    if (DBManager.Nonquery("exec arrangework '" + sid + "','" + postid + "','" + GridView2.DataKeys[i].Value.ToString() + "','" + d1 + "','" + d2 + "'") >= 1) cou++;


            bindgrid();
            if (cou > 0)
                Label13.Text = "成功添加" + cou + "条记录！";
            else Label13.Text = "没有添加...";
            Timer1.Enabled = true;
        }catch(Exception af)
        {
            warn.Text = af.ToString();
        }
    }


    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView2.DataSource = DBManager.Query("select time.* from stufreetime,workreqtime,workinfo,student,time where stufreetime.tid=time.tid and stufreetime.tid=workreqtime.tid and workreqtime.postid=workinfo.postid and stufreetime.sid=student.sid and student.sname='" + DropDownList1.SelectedValue + "' and workinfo.post='" + DropDownList2.SelectedValue + "' ");
        GridView2.DataBind();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Page.ClientScript.RegisterClientScriptBlock(GetType(), "dasd", "alert('asd')", true);
        
       
        
        DropDownList2.DataSource = DBManager.Query("select * from workinfo,apply,shinfo,student where apply.applyid=shinfo.applyid and apply.sid=student.sid and apply.postid=workinfo.postid and student.sname='" + DropDownList1.SelectedValue + "'");
        DropDownList2.DataBind();
        //warn.Text = DropDownList2.SelectedValue;
        GridView2.DataSource = DBManager.Query("select time.* from stufreetime,workreqtime,workinfo,student,time where stufreetime.tid=time.tid and stufreetime.tid=workreqtime.tid and workreqtime.postid=workinfo.postid and stufreetime.sid=student.sid and student.sname='" + DropDownList1.SelectedValue + "' and workinfo.post='" + DropDownList2.SelectedValue + "' ");
        GridView2.DataBind();
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Label13.Text = "";
        Timer1.Enabled = false;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
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
    public override void VerifyRenderingInServerForm(Control control)
    {
        // Confirms that an HtmlForm control is rendered for
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}