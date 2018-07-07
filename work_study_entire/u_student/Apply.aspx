<%@ Page Title="" Language="C#" MasterPageFile="MainForStudent.master" AutoEventWireup="true" CodeFile="Apply.aspx.cs" Inherits="u_student_Apply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="auto-style6">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="postid" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" AllowPaging="True" 
            OnPageIndexChanging="GridView1_PageIndexChanging" 
            AllowSorting="True"
            PageSize="5">
            <AlternatingRowStyle BackColor="White" />
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
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" BorderColor="#666699" BorderStyle="Double" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
            <PagerTemplate>
                                    当前第:
                                     <%--//((GridView)Container.NamingContainer)就是为了得到当前的控件--%>
                                    <asp:Label ID="LabelCurrentPage" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>" ForeColor="#000066"></asp:Label>
                                    页/共:
                                    <%--//得到分页页面的总数--%>
                                    <asp:Label ID="LabelPageCount" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageCount %>"></asp:Label>
                                    页
                                    <%--//如果该分页是首分页，那么该连接就不会显示了.同时对应了自带识别的命令参数CommandArgument--%>
                                    <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                                        Visible='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>' ForeColor="Black">首页</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                                        CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>' ForeColor="#333333">上一页</asp:LinkButton>
                                    <%--//如果该分页是尾页，那么该连接就不会显示了--%>
                                    <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                                        Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>' ForeColor="Black">下一页</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                                        Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>' ForeColor="#333333">尾页</asp:LinkButton>
                                    转到第
                                    <asp:TextBox ID="txtNewPageIndex" runat="server" Width="20px" Text='<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>' />页
                                    <%--//这里将CommandArgument即使点击该按钮e.newIndex 值为3 --%>
                                    <asp:LinkButton ID="btnGo" runat="server" CausesValidation="False" CommandArgument="-2"
                                        CommandName="Page" Text="GO" ForeColor="#000066" />
              </PagerTemplate>
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
                        <asp:GridView ID="GridView3" BorderStyle="None" BorderColor="#ffffff" runat="server"></asp:GridView>
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

        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>

                <asp:GridView ID="applystatus" runat="server" OnRowDeleting="applystatus_RowDeleting" AutoGenerateColumns="False" DataKeyNames="applyid" AllowPaging="True" 
            OnPageIndexChanging="applystatus_PageIndexChanging" 
            AllowSorting="True" 
            PageSize="3" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="applyid" HeaderText="申请编号" ReadOnly="True" />
                        <asp:BoundField DataField="post" HeaderText="申请岗位" />
                        <asp:BoundField DataField="belongunit" HeaderText="所属单位" />
                        <asp:BoundField DataField="applytime" HeaderText="申请时间" />
                        <asp:BoundField DataField="reviewresult" HeaderText="审核状态">
                        <ItemStyle ForeColor="Red" />
                        </asp:BoundField>
                        <asp:BoundField DataField="reviewtime" HeaderText="审核时间" />
                        <asp:BoundField DataField="reviewer" HeaderText="审核人" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="取消申请" OnClientClick="return confirm('确认取消？(审核通过无法删除)')"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <PagerTemplate>
                                    当前第:
                                     <%--//((GridView)Container.NamingContainer)就是为了得到当前的控件--%>
                                    <asp:Label ID="LabelCurrentPage" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>" ForeColor="#000066"></asp:Label>
                                    页/共:
                                    <%--//得到分页页面的总数--%>
                                    <asp:Label ID="LabelPageCount" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageCount %>"></asp:Label>
                                    页
                                    <%--//如果该分页是首分页，那么该连接就不会显示了.同时对应了自带识别的命令参数CommandArgument--%>
                                    <asp:LinkButton ID="LinkButtonFirstPage" runat="server" CommandArgument="First" CommandName="Page"
                                        Visible='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>' ForeColor="Black">首页</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonPreviousPage" runat="server" CommandArgument="Prev"
                                        CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>' ForeColor="#333333">上一页</asp:LinkButton>
                                    <%--//如果该分页是尾页，那么该连接就不会显示了--%>
                                    <asp:LinkButton ID="LinkButtonNextPage" runat="server" CommandArgument="Next" CommandName="Page"
                                        Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>' ForeColor="Black">下一页</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonLastPage" runat="server" CommandArgument="Last" CommandName="Page"
                                        Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>' ForeColor="#333333">尾页</asp:LinkButton>
                                    转到第
                                    <asp:TextBox ID="txtNewPageIndex" runat="server" Width="20px" Text='<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>' />页
                                    <%--//这里将CommandArgument即使点击该按钮e.newIndex 值为3 --%>
                                    <asp:LinkButton ID="btnGo" runat="server" CausesValidation="False" CommandArgument="-2"
                                        CommandName="Page" Text="GO" ForeColor="#000066" />
              </PagerTemplate>
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
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
                                <h4 class="modal-title" id="myModalLabel">申请岗位
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

