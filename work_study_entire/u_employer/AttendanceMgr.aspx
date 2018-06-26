<%@ Page Title="" Language="C#" MasterPageFile="MainForEmployer.master" AutoEventWireup="true" CodeFile="AttendanceMgr.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div>

        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">生成考勤</asp:LinkButton><input id="input1" type="number" runat="server" />天考勤量&nbsp; 
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">显示未考勤</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 共<asp:Label ID="recordCount" runat="server"></asp:Label>
        条记录<br />
        <asp:Panel ID="Panel1" runat="server" GroupingText="按条件查询" BorderStyle="Solid">


            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    时间:<asp:Label ID="Label2" runat="server" Text="选择日期"></asp:Label>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/日历.png" OnClick="ImageButton1_Click" />
                    &nbsp;到&nbsp;<asp:Label ID="Label3" runat="server" Text="选择日期"></asp:Label>
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/日历.png" OnClick="ImageButton2_Click" />
                    &nbsp;
             
    
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
            &nbsp;
        </asp:Panel>
         <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div style="position: absolute; float: right; margin-right: 60%; z-index: 333">
                        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px">
                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px"></DayHeaderStyle>

                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC"></NextPrevStyle>

                            <OtherMonthDayStyle ForeColor="#CC9966"></OtherMonthDayStyle>

                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True"></SelectedDayStyle>

                            <SelectorStyle BackColor="#FFCC66"></SelectorStyle>

                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC"></TitleStyle>

                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White"></TodayDayStyle>
                        </asp:Calendar>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="20" OnDataBinding="GridView1_DataBinding" OnRowDeleting="GridView1_RowDeleting">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

            <Columns>
                <asp:BoundField DataField="wcid" HeaderText="考勤号" ReadOnly="True" />
                <asp:TemplateField HeaderText="学号" ControlStyle-Width="100px" FooterStyle-Width="100px" HeaderStyle-Width="100px" ItemStyle-Width="50px">
                   <%-- <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" Visible="true" DataSourceID="SqlDataSource1" DataTextField="sid" DataValueField="sid">
                        </asp:DropDownList>
                    </EditItemTemplate>--%>
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
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="第一页" LastPageText="最后一页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
            <PagerStyle BackColor="#284775" ForeColor="#3366FF" HorizontalAlign="Center" Font-Size="Larger" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="select sid from student"></asp:SqlDataSource>

    </div>
</asp:Content>












