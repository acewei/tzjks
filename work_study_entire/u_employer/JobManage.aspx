<%@ Page Title="" Language="C#" MasterPageFile="~/u_employer/MainForEmployer.master" AutoEventWireup="true" CodeFile="JobManage.aspx.cs" Inherits="u_employer_JobManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>


            <asp:Button ID="newsc" href="#modal-container" runat="server" Text="添加岗位" data-toggle="modal" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <div>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>


                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="postid" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="postid" HeaderText="岗位编号" />
                        <asp:BoundField DataField="post" HeaderText="岗位名" />
                        <asp:BoundField DataField="workplace" HeaderText="工作地点" />
                        <asp:BoundField DataField="hourlywage" HeaderText="时薪" />
                        <asp:TemplateField HeaderText="性别要求">
                            <EditItemTemplate>
                                <asp:DropDownList ID="xb" runat="server">
                                    <asp:ListItem>男</asp:ListItem>
                                    <asp:ListItem>女</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("genderreq") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="年级要求">
                            <EditItemTemplate>
                                <asp:CheckBoxList ID="gradeadd0" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem>大一</asp:ListItem>
                                    <asp:ListItem>大二</asp:ListItem>
                                    <asp:ListItem>大三</asp:ListItem>
                                    <asp:ListItem>大四</asp:ListItem>
                                </asp:CheckBoxList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("gradereq") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="lossforabsence" HeaderText="缺勤扣薪" />
                        <asp:TemplateField HeaderText="工作描述">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("jobdescription") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("jobdescription") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="人数需求">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" TextMode="Number" runat="server" Text='<%# Bind("peonumberdemand") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("peonumberdemand") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="开始申请时间">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4"  TextMode="Date" runat="server" Text='<%# Bind("applytimebe") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("applytimebe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="结束申请时间">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5"  TextMode="Date" runat="server" Text='<%# Bind("applytimefi") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("applytimefi") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>


            <asp:Label ID="warn" runat="server" Text="Label"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div>
        查看时间要求详情：
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
            <ContentTemplate>

                <asp:GridView ID="workreqtimev" runat="server" AutoGenerateColumns="False" DataKeyNames="tid">
                    <Columns>
                        <asp:BoundField DataField="tid" HeaderText="时间编号" />
                        <asp:BoundField DataField="whatday" HeaderText="星期" />
                        <asp:BoundField DataField="starttime" HeaderText="开始时间" />
                        <asp:BoundField DataField="endtime" HeaderText="结束时间" />
                        <asp:BoundField DataField="timelength" HeaderText="时长" />
                        <asp:TemplateField>
                            
                            <ItemTemplate>
                                <asp:CheckBox Visible="false" ID="checktime" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="container">

        <div class="row clearfix">
            <div>
                <div class="modal fade" id="modal-container" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">

                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title" id="myModalLabel">新增岗位
                                </h4>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:Table ID="Table1" runat="server">
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="Label4" runat="server" Text="岗位名称：">
                                                    </asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="postname" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="Label3" runat="server" Text="工作地点：">
                                                    </asp:Label>
                                                </asp:TableCell><asp:TableCell>
                                                    <asp:TextBox ID="workplace1" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="aaa" runat="server" Text="时薪：">
                                                    </asp:Label>
                                                </asp:TableCell><asp:TableCell>
                                                    <asp:TextBox ID="shixin" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="Label6" runat="server" Text="性别要求：">
                                                    </asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:DropDownList ID="genderreq1" runat="server">
                                                        <asp:ListItem>男</asp:ListItem>
                                                        <asp:ListItem>女</asp:ListItem>
                                                        <asp:ListItem></asp:ListItem>
                                                    </asp:DropDownList>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>年级要求：</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:CheckBoxList ID="gradeadd" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem>大一</asp:ListItem>
                                                        <asp:ListItem>大二</asp:ListItem>
                                                        <asp:ListItem>大三</asp:ListItem>
                                                        <asp:ListItem>大四</asp:ListItem>
                                                    </asp:CheckBoxList>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="Label1" runat="server" Text="缺勤扣薪"></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="loss1" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="Label2" runat="server" Text="工作描述："></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox TextMode="MultiLine" ID="description" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="Label15" runat="server" Text="人数要求："></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox TextMode="Number" ID="peonum" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="Label9" runat="server" Text="选择要求时间："></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:GridView ID="workreqtime" runat="server" AutoGenerateColumns="False" DataKeyNames="tid">
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
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="Label7" runat="server" Text="开始申请时间："></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox TextMode="Date" ID="betime" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Label ID="Label8" runat="server" Text="结束申请时间："></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox TextMode="Date" ID="fitime" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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

