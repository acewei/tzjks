<%@ Page Title="" Language="C#" MasterPageFile="MainForStudent.master" AutoEventWireup="true" CodeFile="Apply.aspx.cs" Inherits="u_student_Apply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="auto-style6">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="postid" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="PostId" HeaderText="岗位号" />
                <asp:BoundField DataField="Post" HeaderText="岗位名" />
                <asp:BoundField DataField="WorkPlace" HeaderText="地点" />
                <asp:BoundField DataField="HourlyWage" HeaderText="时薪" />
                <asp:BoundField DataField="GenderReq" HeaderText="性别要求" />
                <asp:BoundField DataField="BelongUnit" HeaderText="所属单位" />
                <asp:BoundField DataField="gradeReq" HeaderText="年级要求" />
                <asp:BoundField DataField="LossForAbsence" HeaderText="缺勤每小时倒扣工资" />
                <asp:BoundField DataField="PeoNumberDemand" HeaderText="人数需求" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" BorderColor="#666699" BorderStyle="Double" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        详细描述：<br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BorderStyle="Groove" Height="50px" Width="436px" DataKeyNames="postid">
            <Fields>
                <asp:BoundField DataField="applytimebe" HeaderText="开始申请时间">
                    <HeaderStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="applytimefi" HeaderText="结束申请时间">
                    <HeaderStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="jobdescription" HeaderText="工作描述">
                    <HeaderStyle Width="150px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="工作要求时间">
                    <ItemTemplate>
                        <asp:GridView ID="GridView3" runat="server"></asp:GridView>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
        <br />

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>


                <asp:Button ID="newsc" href="#modal-container" runat="server" Text="申请该岗位" data-toggle="modal" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <%--<asp:GridView ID="applystatus" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="applyid" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="applyid" HeaderText="申请编号" ReadOnly="True" />
            <asp:BoundField DataField="sname" HeaderText="学生姓名" />
            <asp:BoundField DataField="post" HeaderText="申请岗位" />
            <asp:TemplateField HeaderText="申请状态">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>通过</asp:ListItem>
                        <asp:ListItem>不通过</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("reviewresult") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="reviewtime" HeaderText="审核时间" />
            <asp:BoundField DataField="reviewer" HeaderText="审核人" />
            <asp:CommandField HeaderText="操作" ShowEditButton="True" />
        </Columns>
    </asp:GridView>--%>
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
                                                   
                                                    <asp:TextBox TextMode="MultiLine" ID="applyreason" runat="server"></asp:TextBox>
                                                </asp:TableCell></asp:TableRow></asp:Table></ContentTemplate></asp:UpdatePanel></div><asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="note" CssClass="label-danger" runat="server" Text="" />

                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>


                                    <div class="modal-footer">


                                        <button id="cls" type="button" class="btn btn-default" data-dismiss="modal">关闭</button><asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="保存" OnClick="Button2_Click" />

                                    </div>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>
</asp:Content>

