using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

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

}