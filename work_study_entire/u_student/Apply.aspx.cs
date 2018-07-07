using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;


public partial class u_student_Apply : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null) Response.Redirect("~/login.aspx");
        if (!Page.IsPostBack)
        {
            
            bindstatus();
            if (DetailsView1.DataItemCount == 0)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("applytimebe");
                dt.Columns.Add("applytimefi");
                dt.Columns.Add("postid");
                dt.Columns.Add("jobdescription");
              
                if (dt.Rows.Count == 0)
                {
                    dt.Rows.Add(dt.NewRow());
                }
                DetailsView1.DataSource = dt;
                DetailsView1.DataBind();
            }
            bindgrid();
            //设置数据库连接
            Label1.Text = Session["username"].ToString();
            Label10.Text = DBManager.Query("select sname from student where sid='" + Session["username"].ToString() + "'").Tables[0].Rows[0][0].ToString();
            GridView2.DataSource = DBManager.Query("select * from time");
            GridView2.DataBind();
        }
    }
    void bindgrid()
    {

        GridView1.DataSource = DBManager.Query("select * from workinfo where applytimebe<'"+DateTime.Now.Date+"' and applytimefi>'"+DateTime.Now.Date+"' and isconfirm=1");
        GridView1.DataBind();

    }

    void bindstatus()
    {
        applystatus.DataSource = DBManager.Query("select * from shinfo,workinfo,apply where sid='" + Session["username"] + "' and apply.applyid=shinfo.applyid and apply.postid=workinfo.postid");
        applystatus.DataBind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "ddk")
        {
            //Page.ClientScript.RegisterClientScriptBlock(GetType(), "asdad", "alert('ad')", true);
            

        }

    }





    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        //Page.ClientScript.RegisterClientScriptBlock(GetType(), "asdad", "alert('"+ GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text + "')", true);
        string postid = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
        //note.Text = String.Empty;
        DetailsView1.DataSource = DBManager.Query("select * from workinfo where postid='" + postid + "'");
        DetailsView1.DataBind();
        GridView g3 = (GridView)DetailsView1.FindControl("GridView3");
        g3.DataSource = DBManager.Query("select time.tid,whatday,starttime,endtime from WorkReqTime,time where postid='" + postid + "' and WorkReqTime.tid=time.tid");
        string[] x = new string[1];
        x[0] = "tid";
        g3.DataKeyNames = x;
        g3.DataBind();
        post.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[5].Text + "-" + GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        
        string postid = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
        string allgrade= GridView1.Rows[GridView1.SelectedIndex].Cells[6].Text;
        string mygra = "";
        bool suitsex=false, suitgrade=false, suittime = false;
        string[] gradearr = Regex.Split(allgrade, ",", RegexOptions.IgnoreCase);
        
        switch (Convert.ToInt32(Convert.ToInt32((DateTime.Now.Date - Convert.ToDateTime(DBManager.Query("select sey from student where sid='" + Session["username"] + "'").Tables[0].Rows[0][0])).Days) / 365))
        {
            case 0:mygra = "大一";break;
            case 1: mygra = "大二"; break;
            case 2: mygra = "大三"; break;
            case 4: mygra = "大四"; break;
        }
        foreach(string onegra in gradearr)
        {
            if (onegra == mygra) suitgrade = true;
        }
        GridView g3 = (GridView)DetailsView1.FindControl("GridView3");
        int alltime = Convert.ToInt32(DBManager.Query("select count(*) from time").Tables[0].Rows[0][0].ToString());
        int fl = 0;
        int reqtime = Convert.ToInt32(DBManager.Query("select count(*) from workreqtime where postid='" + GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString() + "'").Tables[0].Rows[0][0].ToString());

        for (int i = 0; i < alltime; i++)
        {

            if (((CheckBox)GridView2.Rows[i].Cells[4].FindControl("CheckBox1")).Checked)
            {

                for (int j = 0; j < reqtime; j++)
                {


                    if (g3.DataKeys[j].Value.ToString() == GridView2.DataKeys[i].Value.ToString())
                    {
                        fl++;

                    }
                }
            }
        }
        if (fl >= 1) suittime = true;
        if (GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text == DBManager.Query("select ssex from student where sid='" + Label1.Text + "'").Tables[0].Rows[0][0].ToString()|| GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text=="无") suitsex = true;

        if (suittime)
        {
            if (suitsex)
            {
                if(suitgrade)
                {
                    if (DBManager.Query("select count(*) from apply,workinfo where sid='" + Session["username"] + "' and apply.postid='" + postid + "' and apply.postid=workinfo.postid and applytime > applytimebe and applytime<applytimefi").Tables[0].Rows[0][0].ToString() == "0")
                    {
                        DBManager.Nonquery("delete from stufreetime where sid='" + Session["username"] + "'");
                        for (int i = 0; i < alltime; i++)
                        {
                            if (((CheckBox)GridView2.Rows[i].Cells[4].FindControl("CheckBox1")).Checked)
                                DBManager.Nonquery("insert into stufreetime(sfid,sid,tid) values('" + Label1.Text + GridView2.DataKeys[i].Value.ToString() + "','" + Label1.Text + "','" + GridView2.DataKeys[i].Value.ToString() + "')");

                        }
                        try
                        {

                            DBManager.Nonquery("insert into apply values('" + Label1.Text + GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString() + DateTime.Now.ToString("yyyyMMdd") + "','" + applyreason.Text + "','" + DateTime.Now + "','" + Label1.Text + "','" + GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text + "')");
                        }
                        catch (Exception ec)
                        {
                            note.Text = ec.ToString();
                        }
                        note.Text = "申请成功!";
                        Timer1.Enabled = true;
                    }
                    else
                    {
                        note.Text = "已经申请该岗位.....";
                        Timer1.Enabled = true;
                    }

                }
                else
                {
                    note.Text = "年级不符合要求.....";
                    Timer1.Enabled = true;
                }
            }
            else
            {
                note.Text = "不符合性别要求.....";
                Timer1.Enabled = true;
            }
        }
        else
        {
            note.Text = "提交失败,时间不符合.....";
            Timer1.Enabled = true;
        }
        bindstatus();
    }



    protected void Timer1_Tick(object sender, EventArgs e)
    {
        note.Text =String.Empty;
        Timer1.Enabled = false;
    }

    protected void applystatus_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
            string applyid = applystatus.DataKeys[e.RowIndex].Value.ToString();

            DBManager.Nonquery("delete from apply where applyid='" + applyid + "'");
            bindstatus();
      
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

    protected void applystatus_PageIndexChanging(object sender, GridViewPageEventArgs e)
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
        applystatus.EditIndex = -1;
        bindstatus();
        #endregion


    }

}