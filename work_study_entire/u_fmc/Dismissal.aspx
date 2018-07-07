<%@ Page Title="" Language="C#" MasterPageFile="MainForFMC.master" AutoEventWireup="true" CodeFile="Dismissal.aspx.cs" Inherits="Dismissal" %>

<asp:content id="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
        <div>
            在岗学生信息如下：
            <asp:GridView ID="GridView1" runat="server"  AllowPaging="True" 
            OnPageIndexChanging="GridView1_PageIndexChanging" 
            AllowSorting="True"
            PageSize="10" AutoGenerateColumns="False"  OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="sid" HeaderText="学号" SortExpression="sid" />
                    <asp:BoundField DataField="sname" HeaderText="姓名" />
                    <asp:BoundField DataField="ssex" HeaderText="性别" />
                    <asp:BoundField DataField="institute" HeaderText="学院" SortExpression="institute" />
                    <asp:BoundField DataField="class" HeaderText="班级" SortExpression="class" />
                    <asp:BoundField DataField="belongunit" HeaderText="所属单位" SortExpression="belongunit" />
                    <asp:BoundField DataField="post" HeaderText="岗位" />
                    <asp:BoundField DataField="sgid" HeaderText="上岗证号" />
                    <asp:TemplateField HeaderText="操作" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" OnClientClick='return confirm("确定撤销该学生职务吗？")' runat="server" CausesValidation="False" CommandName="Delete" Text="撤销职务"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" BorderStyle="Double" />
                <SortedAscendingHeaderStyle BorderStyle="Double" BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" BorderStyle="Dashed" />
                <SortedDescendingHeaderStyle BorderStyle="Dashed" BackColor="#575357" />
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
            <br />
            选定学生的考勤情况：<br />
           
          <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" AllowPaging="True" 
            OnPageIndexChanging="GridView2_PageIndexChanging" 
            AllowSorting="True"
            PageSize="10" CellPadding="4" ForeColor="Black" GridLines="Vertical"  BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" >
                <AlternatingRowStyle BackColor="White" />

                <Columns>
                    <asp:BoundField DataField="wcid" HeaderText="考勤号" ReadOnly="True" />
                    <asp:TemplateField HeaderText="学号" ControlStyle-Width="100px" FooterStyle-Width="100px" HeaderStyle-Width="100px" ItemStyle-Width="50px">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" Visible="true" DataSourceID="SqlDataSource1" DataTextField="sid" DataValueField="sid">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("sid") %>'></asp:Label>                          
                        </ItemTemplate>

<ControlStyle Width="100px"></ControlStyle>

<FooterStyle Width="100px"></FooterStyle>

<HeaderStyle Width="100px"></HeaderStyle>

<ItemStyle Width="50px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:BoundField DataField="postid" HeaderText="岗位号" ReadOnly="True" />
                    <asp:BoundField DataField="tid" HeaderText="时间编号" ReadOnly="True" />
                    <asp:CheckBoxField DataField="isattend" HeaderText="是否到岗" />
                    <asp:CheckBoxField DataField="isfinishwc" HeaderText="是否完成考勤" />
                    <asp:CheckBoxField DataField="issettle" HeaderText="是否已结算" ReadOnly="True" />
                    <asp:BoundField DataField="detaildate" HeaderText="考勤具体日期" ReadOnly="True" />
                    <asp:BoundField DataField="inputtime" HeaderText="考勤录入时间" ReadOnly="True" />
                   
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" Font-Size="Larger" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
              <PagerTemplate>
                                    当前第:
                                     <%--//((GridView)Container.NamingContainer)就是为了得到当前的控件--%>
                                    <asp:Label ID="Label4" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageIndex + 1 %>" ForeColor="#000066"></asp:Label>
                                    页/共:
                                    <%--//得到分页页面的总数--%>
                                    <asp:Label ID="Label5" runat="server" Text="<%# ((GridView)Container.NamingContainer).PageCount %>"></asp:Label>
                                    页
                                    <%--//如果该分页是首分页，那么该连接就不会显示了.同时对应了自带识别的命令参数CommandArgument--%>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument="First" CommandName="Page"
                                        Visible='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>' ForeColor="Black">首页</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument="Prev"
                                        CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>' ForeColor="#333333">上一页</asp:LinkButton>
                                    <%--//如果该分页是尾页，那么该连接就不会显示了--%>
                                    <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument="Next" CommandName="Page"
                                        Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>' ForeColor="Black">下一页</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument="Last" CommandName="Page"
                                        Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>' ForeColor="#333333">尾页</asp:LinkButton>
                                    转到第
                                    <asp:TextBox ID="TextBox1" runat="server" Width="20px" Text='<%# ((GridView)Container.Parent.Parent).PageIndex + 1 %>' />页
                                    <%--//这里将CommandArgument即使点击该按钮e.newIndex 值为3 --%>
                                    <asp:LinkButton ID="LinkButton6" runat="server" CausesValidation="False" CommandArgument="-2"
                                        CommandName="Page" Text="GO" ForeColor="#000066" />
              </PagerTemplate>
            </asp:GridView>
            
            <br />
            已考勤：<asp:Label ID="recordCount" runat="server" Text="Label"></asp:Label>
&nbsp;次&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 缺勤：<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
&nbsp;次&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 缺勤率：<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            %</div>
   
  </asp:content>
