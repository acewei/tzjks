<%@ Page Title="" Language="C#" MasterPageFile="MainForStudent.master" AutoEventWireup="true" CodeFile="StudentInfo.aspx.cs" Inherits="Apply2" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        td{
            margin:30px
        }
    </style>
    <div class="modal-body" style="padding:20px">
       
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="left">
                          
                            </td>
                        </tr>
                        <tr>
                            <td width="100%">
                                <fieldset style="height: 100%;">
                                    <legend class="auto-style6">个人基础信息</legend>
                                    
                                    <br />
                                    <br />
                                    <table border="0" cellpadding="2" cellspacing="1" style="width: 100%; font-size: large;">
                                        <tr height="35px">
                                            <td nowrap align="right" width="15%">学号:
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="tbsid" runat="server" Style="width: 250px" type="text" size="40"
                                                    CssClass="text" Height="30px" ReadOnly="True" Enabled="False"></asp:TextBox>

                                            </td>
                                            <td align="right" width="15%">开户行:
                                            </td>
                                            <td width="45%">
                                                <asp:TextBox ID="tbbc" runat="server" Style="width: 250px" type="text" size="40"
                                                    CssClass="text" Height="30px"></asp:TextBox>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td nowrap align="right" width="15%" class="auto-style7">姓名:
                                            </td>
                                            <td width="25%" class="auto-style7">
                                                <asp:TextBox ID="tbname" runat="server" Style="width: 250px" type="text" size="40"
                                                    CssClass="text" Height="30px" ReadOnly="True" Enabled="False"></asp:TextBox>

                                            </td>
                                            <td align="right" width="15%" class="auto-style7">银行卡号:
                                            </td>
                                            <td width="45%" class="auto-style7">
                                                <asp:TextBox ID="tbbcid" runat="server" Style="width: 250px" type="text" size="40"
                                                    CssClass="text" Height="30px"></asp:TextBox>

                                            </td>
                                        </tr>


                                        <tr>
                                            <td nowrap align="right" width="15%" class="auto-style7">性别:
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="tbsex" runat="server" Style="width: 250px" type="text" size="40"
                                                    CssClass="text" Height="30px" ReadOnly="True" Enabled="False"></asp:TextBox>

                                            </td>
                                            <td align="right" width="15%" class="auto-style7">入学时间:
                                            </td>
                                            <td width="45%">
                                                <asp:TextBox ID="tbsey" runat="server" Style="width: 250px" type="text" size="40"
                                                    CssClass="text" Height="30px" ReadOnly="True" Enabled="False"></asp:TextBox>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td nowrap align="right" width="15%" class="auto-style7">学院:
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="tbins" runat="server" Style="width: 250px" type="text" size="40"
                                                    CssClass="text" Height="30px" ReadOnly="True" Enabled="False"></asp:TextBox>

                                            </td>
                                            <td align="right" width="15%" class="auto-style7">上岗证号:
                                            </td>
                                            <td width="45%">
                                                <asp:TextBox ID="tbsg" runat="server" Style="width: 250px" type="text" size="40"
                                                    CssClass="text" Height="30px" ReadOnly="True" Enabled="False"></asp:TextBox>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td nowrap align="right" width="15%" class="auto-style7">班级:
                                            </td>
                                            <td width="25%">
                                                <asp:TextBox ID="tbclass" runat="server" Style="width: 250px" type="text" size="40"
                                                    CssClass="text" Height="30px" ReadOnly="True" Enabled="False"></asp:TextBox>

                                            </td>

                                            <td align="right" width="15%">&nbsp;</td>
                                            <td width="45%">&nbsp;</td>

                                        </tr>
                                        <tr height="35px">
                                            <td nowrap align="right" width="15%">&nbsp;</td>
                                            <td width="25%">&nbsp;</td>
                                            <td align="right" width="15%">&nbsp;</td>
                                            <td width="45%">&nbsp;</td>
                                        </tr>


                                        <tr height="70px">
                                            <td nowrap align="right" width="15%">
                                               

                                                        <asp:Button ID="Button1" runat="server" Height="36px" Text="保存" Width="60px" OnClick="Button1_Click" />
                                                  
                                                &nbsp;</td>
                                            <td width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button2" runat="server" Height="36px" Text="取消" Width="55px" OnClick="Button2_Click" />

                                            </td>

                                        </tr>

                                    </table>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <br />
                                    <br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <br />
                                </fieldset>
                            </td>
                        </tr>
                    </table>

             
    </div>
</asp:Content>

