<%@ Page Title="" Language="C#" MasterPageFile="MainForFMC.master" AutoEventWireup="true" CodeFile="UserInfoAdd.aspx.cs" Inherits="UserInfoAdd" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="MainDiv">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title">
                    用户信息管理
                </th>
            </tr>
            <tr>
                <td class="CPanel">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="left">
                                <asp:Button ID="BtnOk" runat="server" Text="保存" CssClass="button" OnClick="BtnOk_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td width="100%">
                                <fieldset style="height: 100%;">
                                    <legend>添加管理</legend>
                                    <table border="0" cellpadding="2" cellspacing="1" style="width: 100%">
                                        <tr>
                                            <td nowrap align="right" width="15%">
                                                用户名: 
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="TextBox1" runat="server" type="text" size="40" CssClass="text" 
                                                    Width="245px"></asp:TextBox>
                                                <span class="red">*</span>
                                            </td>
                                            <td align="right" width="15%">
                                                密码:
                                            </td>
                                            <td width="45%">
                                                <asp:TextBox ID="TextBox2" runat="server" style="width: 250px" type="text" size="40" CssClass="text"></asp:TextBox>
                                                <span class="red">*</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" width="15%">
                                                用户ID:
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="TextBox3" runat="server" type="text" size="40" CssClass="text" 
                                                    Width="245px"></asp:TextBox>
                                                <span class="red">*</span>
                                            </td>
                                            <td align="right" width="15%">
                                                备注:
                                            </td>
                                            <td width="45%">
                                                <asp:TextBox ID="TextBox4" runat="server" style="width: 250px" type="text" size="40" CssClass="text"></asp:TextBox>
                                                <span class="red">*</span>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </fieldset>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

