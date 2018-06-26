﻿<%@ Page Title="" Language="C#" MasterPageFile="MainForFMC.master" AutoEventWireup="true" CodeFile="WorkInfoMaintain.aspx.cs" Inherits="WorkInfoMaintain" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="30">
                &nbsp;</td>
        </tr>
        <table id="subtree1" style="display: " width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td height="20">
                            </td>
                        </tr>
                        <tr>
                            <td height="40" class="font42">
                                <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646"
                                    class="newfont03">
                                    <tr class="CTitle">
                                        <td height="22" colspan="8" align="center" style="font-size: 16px">
                                            管理详细列表
                                        </td>
                                    </tr>
                                    <tr bgcolor="#EEEEEE">
                                        <td width=60px" align="center" class="auto-style6">
                                            岗位号
                                        </td>
                                        <td style="text-align: center;" class="auto-style6">
                                            岗位名称 
                                        </td>
                                        <td style="text-align: center;" class="auto-style6">
                                            工作地点
                                        </td>
                                        <td style="text-align: center;" class="auto-style6">
                                            时薪
                                        </td>
                                        <td style="text-align: center;" class="auto-style6">
                                            性别要求
                                        </td>
                                        <td style="text-align: center;" class="auto-style6">
                                            所属单位
                                        </td>
                                        <td style="text-align: center;" class="auto-style6">
                                            年级要求
                                        </td>
                                        <td style="text-align: center;" class="auto-style6">
                                            缺勤每小时扣除工资
                                        </td>
                                        <td style="text-align: center;" class="auto-style6">
                                            工作描述
                                        </td>
                                         <td style="text-align: center;" class="auto-style6">
                                            申请开始时间
                                        </td>
                                        <td style="text-align: center;" class="auto-style6">
                                            申请结束时间
                                        </td>
                                         <td style="text-align: center;" class="auto-style6">
                                            招收人数
                                        </td>
                                        <td width="150px;" style="text-align: center;" class="auto-style6">
                                            操作
                                        </td>
                                    </tr>
                                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                        <ItemTemplate>
                                            <tr bgcolor="#FFFFFF">
                                              <td style="text-align: center;">
                                                    <%#Eval("PostId")%>
                                                </td>
                                                <td style="text-align: center;">
                                                    <%#Eval("Post")%> 
                                                </td>
                                                <td style="text-align: center;">
                                                    <%#Eval("WorkPlace")%>
                                                </td>
                                                <td style="text-align: center;">
                                                    <%#Eval("HourlyWage")%>
                                                </td>
                                                <td style="text-align: center;">
                                                    <%#Eval("GenderReq")%>
                                                </td>
                                                 <td style="text-align: center;">
                                                    <%#Eval("BelongUnit")%>
                                                </td>
                                                <td style="text-align: center;">
                                                    <%#Eval("GradeReq")%>
                                                </td>
                                                 <td style="text-align: center;">
                                                    <%#Eval("LossForAbsence")%>
                                                </td>
                                                 <td style="text-align: center;">
                                                    <%#Eval("JobDescription")%>
                                                </td>
                                                 <td style="text-align: center;">
                                                    <%#Eval("ApplyTimeBe")%>
                                                </td>
                                                 <td style="text-align: center;">
                                                    <%#Eval("ApplyTimeFi")%>
                                                </td>
                                                 <td style="text-align: center;">
                                                    <%#Eval("PeoNumberDemand")%>
                                                </td>
                                                <td style="text-align: center;">
                                                    <a href='WorkInfoAdd.aspx?id=<%#Eval("PostId")%>' style="font-family: 微软雅黑;">修改</a>
                                                    <asp:LinkButton Style="padding-left: 5px; padding-right: 5px" ID="LinkButton1" runat="server"
                                                        CommandName='<%#Eval("PostId")%>' CommandArgument="1" OnClientClick="return confirm('确认要删除该信息吗？');"><span style="font-family:微软雅黑;">删除</span></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td height="6">
                                <img src="images/spacer.gif" width="1" height="1" />
                            </td>
                        </tr>
                        <tr>
                            <td height="33">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
                                    <tr>
                                        <td width="50%">
                                            共 <span class="right-text09">1</span> 页 | 第 <span class="right-text09">1</span>
                                            页
                                        </td>
                                        <td width="49%" align="right">
                                            [<a href="#" class="right-font08">首页</a> | <a href="#" class="right-font08">上一页</a>
                                            | <a href="#" class="right-font08">下一页</a> | <a href="#" class="right-font08">末页</a>]
                                            转至：
                                        </td>
                                        <td width="1%">
                                            <table width="20" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="1%">
                                                        <input name="textfield3" type="text" class="right-textfield03" size="1" />
                                                    </td>
                                                    <td width="87%">
                                                        <input name="Submit23222" type="submit" class="right-button06" value=" go" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </table>
</asp:Content>

