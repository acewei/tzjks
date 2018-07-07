<%@ Page Title="" Language="C#" MasterPageFile="MainForFMC.master" AutoEventWireup="true" CodeFile="CountSalary.aspx.cs" Inherits="CountSalary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>当前时间：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <fieldset style="width:300px;">
            <legend class="text-center text-primary">计算学生工资(建议每月最后一天计算）<asp:Button ID="Count" runat="server" Text="计算" OnClick="Count_Click" />
                </legend>

    <div id="first" class="auto-style7"> 

        <asp:Label ID="Label_pleaseinput" runat="server" Text="请输入查询内容："></asp:Label>
        <asp:TextBox ID="TextBoxsearch" runat="server" Width="88px"></asp:TextBox>
        <asp:Button ID="Buttonsearch" class="btn btn-default"  data-loading-text="搜索"
   	               type="button" runat="server" Text="搜索" OnClick="Buttonsearch_Click" />
 
        <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" 
            DataKeyNames="SId" 
            AllowPaging="True" 
            OnPageIndexChanging="GridView1_PageIndexChanging" 
            AllowSorting="True" 
            PageSize="10"
            OnRowDataBound="GridView1_RowDataBound"
            CssClass="GridViewStyle" BackColor="White" BorderColor="#DEDFDE" BorderWidth="1px" CellPadding="4" Width="928px" BorderStyle="None" ForeColor="Black" GridLines="Vertical"
            >
   
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="SalaryId" HeaderText="工资编号" ReadOnly="True" />
                <asp:BoundField DataField="SId" HeaderText="学号" />
                <asp:BoundField DataField="PostId" HeaderText="岗位号" />
                <asp:BoundField DataField="EmployerId" HeaderText="所属单位编号" />
                <asp:BoundField DataField="bcid" HeaderText="银行卡号" />
                <asp:BoundField DataField="RealTotalHour" HeaderText="实际工时" />
                <asp:BoundField DataField="ShouldHour" HeaderText="应做工时" />
                <asp:BoundField DataField="LossHour" HeaderText="缺勤时长" />
                <asp:BoundField DataField="TotalPay" HeaderText="应发工资" />
                <asp:BoundField DataField="FinalPay" HeaderText="实发工资" />
                <asp:BoundField DataField="Payday" HeaderText="结算时间" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" ForeColor="White" Font-Bold="True" />
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

            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />

        </asp:GridView>

        <p> &nbsp;</p>

    </div>
            </fieldset>
            <asp:Button ID="Button3" style="margin-left:15px" class="btn btn-primary"  data-loading-text="导出"
   	               type="button" runat="server" OnClick="Button3_Click" Text="导出至excel" />
            </ContentTemplate>
        <Triggers>
            <%--<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />--%>
            <asp:PostBackTrigger ControlID="Button3" />
        </Triggers>
    </asp:UpdatePanel>
    <p></p>
    
</asp:Content>

