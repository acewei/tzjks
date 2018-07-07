<%@ Page Title="" Language="C#" MasterPageFile="~/u_fmc/MainForFMC.master" AutoEventWireup="true" CodeFile="WorkInfoMaintain.aspx.cs" Inherits="WorkInfoMaintain" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>

    <div>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="postid" AllowPaging="True" 
            OnPageIndexChanging="GridView1_PageIndexChanging" 
            AllowSorting="True"
            PageSize="10" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <%--<asp:TemplateField HeaderText="确认发布">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" Checked='<%# Bind("isconfirm") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:BoundField DataField="postid" HeaderText="岗位编号" />
                        <asp:BoundField DataField="post" HeaderText="岗位名" />
                        <asp:BoundField DataField="workplace" HeaderText="工作地点" />
                        <asp:BoundField DataField="hourlywage" HeaderText="时薪" />
                        <asp:TemplateField HeaderText="性别要求">
                            <EditItemTemplate>
                                <asp:DropDownList ID="xb" runat="server">
                                    <asp:ListItem>无</asp:ListItem>
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
                        <asp:TemplateField HeaderText="结束申请时间">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" TextMode="Date" Text='<%# Bind("applytimefi") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("applytimefi") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="开始申请时间">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" TextMode="Date" runat="server" Text='<%# Bind("applytimebe") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("applytimebe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CheckBoxField DataField="isconfirm" HeaderText="确认发布" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
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
                <asp:GridView ID="workreqtimev" runat="server" AutoGenerateColumns="False" DataKeyNames="tid" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
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
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
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
</asp:Content>

