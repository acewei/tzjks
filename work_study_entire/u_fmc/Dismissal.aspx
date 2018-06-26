<%@ Page Title="" Language="C#" MasterPageFile="MainForFMC.master" AutoEventWireup="true" CodeFile="Dismissal.aspx.cs" Inherits="Dismissal" %>

<asp:content id="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
        <div>
            在岗学生信息如下：
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" OnSorting="GridView1_Sorting1" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="sid" HeaderText="学号" SortExpression="sid" />
                    <asp:BoundField DataField="sname" HeaderText="姓名" />
                    <asp:BoundField DataField="ssex" HeaderText="性别" />
                    <asp:BoundField DataField="institute" HeaderText="学院" SortExpression="institute" />
                    <asp:BoundField DataField="class" HeaderText="班级" SortExpression="class" />
                    <asp:BoundField DataField="belongunit" HeaderText="所属单位" SortExpression="belongunit" />
                    <asp:BoundField DataField="post" HeaderText="岗位" />
                    <asp:BoundField DataField="sgid" HeaderText="上岗证号" />
                    <asp:TemplateField HeaderText="操作" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" OnClientClick='return confirm("确定撤销该学生职务吗？")' runat="server" CausesValidation="False" CommandName="Delete" Text="撤销职务"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <PagerSettings FirstPageText="第一页" LastPageText="最后一页" Mode="NextPreviousFirstLast" NextPageText="下一页" PreviousPageText="上一页" />
                <SortedAscendingCellStyle BackColor="#FF99FF" BorderStyle="Double" />
                <SortedAscendingHeaderStyle BorderStyle="Double" />
                <SortedDescendingCellStyle BackColor="#99CCFF" BorderStyle="Dashed" />
                <SortedDescendingHeaderStyle BorderStyle="Dashed" />
            </asp:GridView>
            <br />
            选定学生的考勤情况：<br />
           
          <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging" >
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                <Columns>
                    <asp:BoundField DataField="wcid" HeaderText="考勤号" ReadOnly="True" />
                    <asp:TemplateField HeaderText="学号" ControlStyle-Width="100px" FooterStyle-Width="100px" HeaderStyle-Width="100px" ItemStyle-Width="50px">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" Visible="true" DataSourceID="SqlDataSource1" DataTextField="sid" DataValueField="sid">
                            </asp:DropDownList>
                        </EditItemTemplate>
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
            
            <br />
            已考勤：<asp:Label ID="recordCount" runat="server" Text="Label"></asp:Label>
&nbsp;次&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 缺勤：<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
&nbsp;次&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 缺勤率：<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            %</div>
   
  </asp:content>
