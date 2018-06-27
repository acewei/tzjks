<%@ Page Title="" Language="C#" MasterPageFile="MainForStudentWG.master" AutoEventWireup="true" CodeFile="StudentInfoMgr2.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        #left,#right,#denglu,#two
        {
            background-color:#ffffff;
            /*border:3px solid#3CB371;*/
            
        }
        #left{
            width:547px;
            float:left;
        }
        .auto-style6 {
            width: 220px;
        }
        .auto-style7 {
            width: 907px;
        }
        .auto-style8 {
            width: 318px;
        }
        </style>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset style="width:300px;">
            <legend class="text-center text-primary">学生基础信息管理</legend>

    <div id="first" class="auto-style7"> 

        <asp:Label ID="Label_pleaseinput" runat="server" Text="请输入搜索内容："></asp:Label>
        <asp:TextBox ID="TextBoxsearch" runat="server" Width="88px"></asp:TextBox>
        <asp:Button ID="Buttonsearch" class="btn btn-default"  data-loading-text="搜索"
   	               type="button" runat="server" Text="搜索学生" OnClick="Buttonsearch_Click" />
        <p></p>
        <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" 
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowDeleting="GridView1_RowDeleting" 
            OnRowEditing="GridView1_RowEditing" 
            OnRowUpdating="GridView1_RowUpdating" 
            DataKeyNames="SId" 
            AllowPaging="True" 
            OnPageIndexChanging="GridView1_PageIndexChanging" 
            AllowSorting="True" 
            OnRowDataBound="GridView1_RowDataBound"
            PageSize="10"
            CssClass="GridViewStyle" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="4" Width="928px" BorderStyle="None"
            >
   
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="SId" HeaderText="学号" ReadOnly="True" />
                <asp:BoundField DataField="Sname" HeaderText="姓名" />
                <asp:BoundField DataField="Ssex" HeaderText="性别" />
                <asp:BoundField DataField="Sey" HeaderText="入学时间" />
                <asp:BoundField DataField="BCname" HeaderText="银行" />
                <asp:BoundField DataField="BCid" HeaderText="银行卡号" />
                <asp:BoundField DataField="Class" HeaderText="班级" />
                <asp:BoundField DataField="Institute" HeaderText="学院" />
                <asp:BoundField DataField="SGid" HeaderText="上岗证号" />
                <asp:CommandField InsertVisible="false" ShowEditButton="True" />
                <asp:TemplateField HeaderText="操作" ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="delete" Text="删除"  OnClientClick="if(!confirm('确认删除此条记录吗?')) return false;"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" ForeColor="#003399" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#2461BF" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="#EFF3FB" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#CCFF99" Font-Bold="True" />
              <PagerTemplate>
                                    当前第:
                                     <%--//((GridView)Container.NamingContainer)就是为了得到当前的控件--%>
                                    <asp:Label ID="LabelCurrentPage" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>" ForeColor="#000066"></asp:Label>
                                    页/共:
                                    <%--//得到分页页面的总数--%>
                                    <asp:Label ID="LabelPageCount" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageCount %>"></asp:Label>
                                    页
                                    <%--//如果该分页是首分页，那么该连接就不会显示了.同时对应了自带识别的命令参数CommandArgument--%>
                                    <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                                        Visible='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>' ForeColor="Black">首页</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                                        CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>' ForeColor="#333333">上一页</asp:LinkButton>
                                    <%--//如果该分页是尾页，那么该连接就不会显示了--%>
                                    <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                                        Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>' ForeColor="Black">下一页</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                                        Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>' ForeColor="#333333">尾页</asp:LinkButton>
                                    转到第
                                    <asp:TextBox ID="txtNewPageIndex" runat="server" Width="20px" Text='<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>' />页
                                    <%--//这里将CommandArgument即使点击该按钮e.newIndex 值为3 --%>
                                    <asp:LinkButton ID="btnGo" runat="server" CausesValidation="False" CommandArgument="-2"
                                        CommandName="Page" Text="GO" ForeColor="#000066" />
              </PagerTemplate>

            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />

        </asp:GridView>

        <p> &nbsp;</p>

    </div>
            </fieldset>
            <asp:Button ID="Button3" style="margin-left:15px" class="btn btn-primary"  data-loading-text="导出"
   	               type="button" runat="server" OnClick="Button3_Click" Text="导出至excel" />
            </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
            <asp:PostBackTrigger ControlID="Button3" />
        </Triggers>
    </asp:UpdatePanel>
    <p></p>
    


</asp:Content>

