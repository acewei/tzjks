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
                    时间:<asp:TextBox ID="t1" runat="server"></asp:TextBox>
                    &nbsp;到&nbsp;
                  <asp:TextBox ID="t2" runat="server"></asp:TextBox>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnDataBinding="GridView1_DataBinding" OnRowDeleting="GridView1_RowDeleting" ShowFooter="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

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
            
        </asp:Panel>
                 
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="select sid from student"></asp:SqlDataSource>
    </div>
</asp:Content>












