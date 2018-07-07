﻿<%@ Page Title="" Language="C#" MasterPageFile="MainForEmployer.master" AutoEventWireup="true" CodeFile="AttendanceMgr.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    
    <div>

        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">生成考勤</asp:LinkButton><input id="input1" type="number" runat="server" />天考勤量&nbsp; 
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">显示未考勤</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 共<asp:Label ID="recordCount" runat="server"></asp:Label>
        条记录<br />
        <asp:Panel ID="Panel1" runat="server" GroupingText="按条件查询" BorderStyle="Solid">


            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    时间:<asp:TextBox ID="t1" runat="server" TextMode="Date"></asp:TextBox>
                    &nbsp;到&nbsp;
                  <asp:TextBox ID="t2" runat="server" TextMode="Date"></asp:TextBox>
                    &nbsp;
             
                <asp:Button ID="Button3" style="margin-left:15px" class="btn btn-primary"  data-loading-text="导出"
   	               type="button" runat="server" OnClick="Button3_Click" Text="打印考勤表" />
                </ContentTemplate>
               
        <Triggers>
            <asp:PostBackTrigger ControlID="Button3" />
        </Triggers>
            </asp:UpdatePanel>
            <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
            &nbsp;
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" 
            OnPageIndexChanging="GridView1_PageIndexChanging" 
            AllowSorting="True"
            PageSize="10" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"  OnDataBinding="GridView1_DataBinding" OnRowDeleting="GridView1_RowDeleting"  BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle BackColor="White" />

            <Columns>
                <asp:BoundField DataField="wcid" HeaderText="考勤号" ReadOnly="True" />
                <asp:TemplateField HeaderText="学号" ControlStyle-Width="100px" FooterStyle-Width="100px" HeaderStyle-Width="100px" ItemStyle-Width="50px">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("sid") %>'></asp:Label>
                    </ItemTemplate>

                    <ControlStyle Width="100px"></ControlStyle>

                    <FooterStyle Width="100px"></FooterStyle>

                    <HeaderStyle Width="100px"></HeaderStyle>

                    <ItemStyle Width="50px"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="postid" HeaderText="岗位号" ReadOnly="True" />
                <asp:BoundField DataField="tid" HeaderText="时间编号" ReadOnly="True" />
                <asp:CheckBoxField DataField="isattend" HeaderText="是否到岗" />
                <asp:CheckBoxField DataField="isfinishwc" HeaderText="是否完成考勤" />
                <asp:CheckBoxField DataField="issettle" HeaderText="是否已结算" ReadOnly="True" />
                <asp:BoundField DataField="detaildate" HeaderText="考勤具体日期" ReadOnly="True" />
                <asp:BoundField DataField="inputtime" HeaderText="考勤录入时间" ReadOnly="True" />
                <asp:CommandField HeaderText="操作" ShowEditButton="True" />

                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" OnClientClick='return confirm("确认删除吗？")'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="第一页" LastPageText="最后一页" NextPageText="下一页" PreviousPageText="上一页" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" Font-Size="Larger" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
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

        </asp:GridView>
            
        </asp:Panel>
                 
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="select sid from student"></asp:SqlDataSource>
    </div>
</asp:Content>












