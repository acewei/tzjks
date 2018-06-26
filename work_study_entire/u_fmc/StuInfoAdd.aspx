<%@ Page Title="" Language="C#" MasterPageFile="MainForFMC.master" AutoEventWireup="true" CodeFile="StuInfoAdd.aspx.cs" Inherits="StuInfoAdd" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="MainDiv">
        <table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
            <tr>
                <th class="tablestyle_title">
                    学生信息管理
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
                                                学生学号: 
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="TextBox1" runat="server" type="text" size="40" CssClass="text" 
                                                    Width="245px"></asp:TextBox>
                                                <span class="red">*</span>
                                            </td>
                                            <td align="right" width="15%">
                                                学生姓名:
                                            </td>
                                            <td width="45%">
                                                <asp:TextBox ID="TextBox2" runat="server" style="width: 250px" type="text" size="40" CssClass="text"></asp:TextBox>
                                                <span class="red">*</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" width="15%">
                                                性别:
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="TextBox3" runat="server" type="text" size="40" CssClass="text" 
                                                    Width="245px"></asp:TextBox>
                                                <span class="red">*</span>
                                            </td>
                                            <td align="right" width="15%">
                                                入学时间:
                                            </td>
                                            <td width="45%">
                                                <asp:TextBox ID="TextBox4" runat="server" style="width: 250px" type="text" size="40" CssClass="text"></asp:TextBox>
                                                <span class="red">*</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" width="15%">
                                                银行名称:
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="TextBox5" runat="server" type="text" size="40" CssClass="text" 
                                                    Width="245px"></asp:TextBox>
                                                <span class="red">*</span>
                                            </td>
                                            <td align="right" width="15%">
                                                银行卡号:
                                            </td>
                                            <td width="45%">
                                                <asp:TextBox ID="TextBox6" runat="server" style="width: 250px" type="text" size="40" CssClass="text"></asp:TextBox>
                                                <span class="red">*</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" width="15%">
                                                班级:
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="TextBox7" runat="server" type="text" size="40" CssClass="text" 
                                                    Width="245px"></asp:TextBox>
                                                <span class="red">*</span>
                                            </td>
                                            <td align="right" width="15%">
                                                学院:
                                            </td>
                                            <td width="45%">
                                                <asp:TextBox ID="TextBox8" runat="server" style="width: 250px" type="text" size="40" CssClass="text"></asp:TextBox>
                                                <span class="red">*</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td nowrap align="right" width="15%">
                                                上岗证号:
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="TextBox9" runat="server" type="text" size="40" CssClass="text" 
                                                    Width="245px"></asp:TextBox>
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

