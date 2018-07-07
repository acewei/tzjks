using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class _Default : System.Web.UI.Page
{
    
    public static bool flag =false ;
    public static string Caluser = "";
    public static DateTime a, b;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            
            bindgrid();
            DropDownList2.DataSource = DBManager.Query("select distinct institute from student");
            DropDownList2.DataTextField = "institute";
            DropDownList2.DataBind();
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
        
         string wcid=GridView1.Rows[e.RowIndex].Cells[0].Text;
        bool isattend = ((CheckBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Checked;
         bool isfinish = ((CheckBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Checked;



        DBManager.Nonquery("update workcheck set isattend='"+isattend+"',isfinishwc='"+isfinish+"' where wcid='"+wcid+"'");
        
        
        
        GridView1.EditIndex = -1;
        bindgrid();
        
    }

    void bindgrid()
    {
        GridView1.DataSource = DBManager.Query("select * from workcheck,workinfo,employer where workcheck.postid=workinfo.postid and workinfo.belongunit=employername order by detaildate");
        GridView1.DataBind();
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

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
        Caluser = ImageButton1.ID;

    }

    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
        Caluser = ImageButton2.ID;

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

        if (Caluser == ImageButton1.ID)
        {

            Label2.Text = Calendar1.SelectedDate.ToString();
            a = Calendar1.SelectedDate;
        }
        else if (Caluser == ImageButton2.ID)
        {
            Label3.Text = Calendar1.SelectedDate.ToString();
            b = Calendar1.SelectedDate;
        }
        Calendar1.Visible = false;
        Calendar1.SelectedDate = DateTime.Now;
        //Page.ClientScript.RegisterClientScriptBlock(GetType(),"asa","alert('"+Label2.Text+"')",true);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sql = "select * from WorkCheck,WorkInfo,Student where WorkCheck.Postid=WorkInfo.postid and WorkCheck.SId=Student.SId and " +
            "WorkCheck.isfinishwc=1 and detaildate>='" + a + "' and detaildate<='" + b + "' "+((DropDownList2.SelectedValue != null)?"and institute='"+DropDownList2.SelectedValue+"'":"")+" order by detaildate";
        //Response.Write("sadsad"+new Random().Next());
        //GridView2.Visible = !GridView2.Visible;
        //Page.ClientScript.RegisterClientScriptBlock(GetType(), "asa", "alert('" + Label2.Text + "')", true);
        GridView1.DataSource = DBManager.Query(sql);
        //GridView2.DataSource = DBManager.Query("select Student.SId,WorkInfo.Post,WorkCheck.IsAttend,WorkCheck.IsSettle,WorkCheck.DetailDate from WorkCheck,WorkInfo,Student where WorkCheck.Postid=WorkInfo.postid and WorkCheck.SId=Student.SId and " +
        //    "WorkCheck.isfinishwc=1 and sid='1511240145'");
        GridView1.DataBind();
        //DBManager.Nonquery("insert into stufreetime values('1511240142','33','151124014233')");
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