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
            <asp:Label ID="Label1" Text="afafsdf" runat="server"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="sid" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="sid" HeaderText="fsf" />
                    <asp:BoundField DataField="sname" HeaderText="esfseg" />
                    <asp:BoundField DataField="ssex" HeaderText="sgegs" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="xs" Text="按钮"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>请问</asp:ListItem>
                <asp:ListItem>请问</asp:ListItem>
                <asp:ListItem>千万人</asp:ListItem>
            </asp:DropDownList>
            <br />
        </div>
    </form>
</body>
</html>
