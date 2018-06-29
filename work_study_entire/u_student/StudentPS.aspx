<%@ Page Title="" Language="C#" MasterPageFile="MainForStudent.master" AutoEventWireup="true" CodeFile="StudentPS.aspx.cs" Inherits="StudentPS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style6 {
            font-size: x-large;
        }

        .auto-style7 {
            width: 95%;
            border: 1px solid #808080;
            background-color: #C0C0C0;
        }

        .auto-style8 {
            width: 464px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <fieldset style="height: 100%; width: 100%">
        <legend class="auto-style6">工资查询</legend>
        <br />
        <br />
        <p>
            &nbsp;
        </p>
        <p>

            <span class="auto-style6">时间:&nbsp;&nbsp; </span>
            <asp:TextBox ID="TextBox1" TextMode="Date" runat="server" Height="25px" Width="158px"></asp:TextBox>

            &nbsp;到&nbsp;
                    <asp:TextBox ID="TextBox2" TextMode="Date" runat="server" Height="25px" Width="158px"></asp:TextBox>
            <asp:Button ID="Boxsearch" runat="server" Style="font-size: x-large" Text="查询" OnClick="Boxsearch_Click" />

        </p>
        <p>
            &nbsp;
        </p>
        <p>
            &nbsp;
        </p>
        <p>
        </p>

        <table align="left" class="auto-style7">
            <tr>
                <td class="auto-style8">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="SalaryId" HeaderText="工资计算编号" />
                            <asp:BoundField DataField="Post" HeaderText="岗位名" />
                            <asp:BoundField DataField="EmployerId" HeaderText="用人单位编号" />
                            <asp:BoundField DataField="RealTotalHour" HeaderText="实际总工时" />
                            <asp:BoundField DataField="ShouldHour" HeaderText="应到时长" />
                            <asp:BoundField DataField="LossHour" HeaderText="缺勤时长" />
                            <asp:BoundField DataField="TotalPay" HeaderText="应发工资" />
                            <asp:BoundField DataField="FinalPay" HeaderText="实发工资" />
                            <asp:BoundField DataField="Payday" HeaderText="发工资时间" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </fieldset>
    <p>
    </p>
</asp:Content>

