<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChPasswd.aspx.cs" Inherits="ChPasswd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="stylesheet" href="Content/bootstrap-theme.css" />
    <script type="text/javascript" src="Scripts/jquery-1.9.0.min.js"></script>
    <style>
        li {
            margin: 10px
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>


                <div class="panel-primary" style="width: 800px; height: 500px; border: groove; padding: 50px; background-color: azure; margin-left: 20%; margin-top: 5%">
                    <p class="panel-heading">修改密码</p>
                    <ul class="form-group" style="padding-left: 80px">
                        <li style="margin-top: 40px">用户名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="用户名不能为空" ValidationGroup="asb" ToolTip="用户名为空" ControlToValidate="TextBox1" EnableClientScript="False" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </li>
                        <li>旧密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" ValidationGroup="asb" ValidateRequestMode="Enabled">
                    </asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="密码不能为空" ValidationGroup="asb" ToolTip="密码不能为空" ControlToValidate="TextBox2" EnableClientScript="False" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </li>
                        <li>新密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="密码不能为空" ValidationGroup="asb" ToolTip="密码不能为空" ControlToValidate="TextBox3" EnableClientScript="False" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </li>
                        <li>确认新密码：<asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="密码不能为空" ValidationGroup="asb" ToolTip="密码不能为空" ControlToValidate="TextBox4" EnableClientScript="False" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </li>
                        <asp:CompareValidator ID="CompareValidator1" ControlToCompare="TextBox3" Display="None" ValidationGroup="asb" ControlToValidate="TextBox4" runat="server" EnableClientScript="False" ErrorMessage="密码不一致"></asp:CompareValidator>

                    </ul>
                    <br />
                    <asp:Label ID="tip" CssClass="control-label" runat="server" Text=""></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="asb" />
                    <br />
                    <div class="btn btn-primary" style="padding: 0px; margin-left: 150px">



                        <asp:Button ID="Button1" runat="server" Text="确认修改" OnClick="Button1_Click" ValidationGroup="asb" />
                    </div>
                    <div class="btn btn-primary" style="padding: 0px; margin-left: 150px">
                        <asp:Button ID="Button2" runat="server" Text="返回" OnClick="Button2_Click" />
                    </div>

                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
    </form>
</body>
</html>
