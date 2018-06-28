<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" OnTextChanged="CheckBoxList1_TextChanged" RepeatDirection="Horizontal">
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
                <asp:ListItem>13</asp:ListItem>
                <asp:ListItem>45</asp:ListItem>
            </asp:CheckBoxList>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ApplyId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ApplyId" HeaderText="ApplyId" ReadOnly="True" SortExpression="ApplyId" />
                    <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
                    <asp:BoundField DataField="ApplyTime" HeaderText="ApplyTime" SortExpression="ApplyTime" />
                    <asp:BoundField DataField="SId" HeaderText="SId" SortExpression="SId" />
                    <asp:BoundField DataField="PostId" HeaderText="PostId" SortExpression="PostId" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="SELECT * FROM [Apply]"></asp:SqlDataSource>
            <asp:CheckBox ID="CheckBox1" runat="server" />
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
