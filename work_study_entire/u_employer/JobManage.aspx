<%@ Page Title="" Language="C#" MasterPageFile="~/u_employer/MainForEmployer.master" AutoEventWireup="true" CodeFile="JobManage.aspx.cs" Inherits="u_employer_JobManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    </div>
    <div class="container">

        <div class="row clearfix">
            <div>
                <div class="modal fade" id="modal-container" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">

                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title" id="myModalLabel">新增工作安排
                                </h4>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:Table ID="Table1" runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="Label4" runat="server" Text="学号：">
                                                    </asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="Label1" runat="server" Text="未获取" />
                                                </asp:TableCell></asp:TableRow><asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="Label3" runat="server" Text="姓名：">
                                                    </asp:Label>
                                                </asp:TableCell><asp:TableCell>
                                                    <asp:Label ID="Label10" runat="server" Text="未获取" />
                                                </asp:TableCell></asp:TableRow><asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="aaa" runat="server" Text="岗位：">
                                                    </asp:Label>
                                                </asp:TableCell><asp:TableCell>
                                                    <asp:Label ID="post" runat="server" Text="未获取" />
                                                </asp:TableCell></asp:TableRow><asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="Label6" runat="server" Text="选择空闲时间：">
                                                    </asp:Label>
                                                </asp:TableCell><asp:TableCell>
                                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="tid">
                                                        <Columns>
                                                            <asp:BoundField DataField="whatday" HeaderText="星期" />
                                                            <asp:BoundField DataField="starttime" HeaderText="开始时间" />
                                                            <asp:BoundField DataField="endtime" HeaderText="结束时间" />
                                                            <asp:BoundField DataField="timelength" HeaderText="时长" />
                                                            <asp:TemplateField>

                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </asp:TableCell></asp:TableRow><asp:TableRow>
                                                <asp:TableCell>填写申请理由：</asp:TableCell><asp:TableCell>
                                                    <textarea id="applyreason" rows="5" cols="20" runat="server">

                                                    </textarea>
                                                </asp:TableCell></asp:TableRow></asp:Table></ContentTemplate></asp:UpdatePanel></div><asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="note" CssClass="label-danger" runat="server" Text="" />

                                </ContentTemplate>
                                <Triggers>
                                    <%--<asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />--%>
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>


                                    <div class="modal-footer">


                                        <%--<button id="cls" type="button" class="btn btn-default" data-dismiss="modal">关闭</button><asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="保存" OnClick="Button2_Click" />--%>

                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <%--<asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>--%>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
</asp:Content>

