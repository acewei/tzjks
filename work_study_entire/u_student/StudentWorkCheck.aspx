<%@ Page Title="" Language="C#" MasterPageFile="MainForStudent.master" AutoEventWireup="true" CodeFile="StudentWorkCheck.aspx.cs" Inherits="StudentWorkCheck" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .auto-style6 {
            font-size: x-large;
        }

        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <fieldset style="height: 100%;">
        <legend class="auto-style6">考勤情况查询</legend>
        

       
              
                <div style="float: none; clear: right">
                   
                   时间： <asp:TextBox ID="TextBox1" TextMode="Date" runat="server"></asp:TextBox>
                   
                    &nbsp;到&nbsp;
                     <asp:TextBox ID="TextBox2" TextMode="Date" runat="server"></asp:TextBox>
             
    <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
                </div>

            &nbsp;
        
     
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnPageIndexChanging="GridView2_PageIndexChanging"  AllowPaging="True" Width="570px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="SId" HeaderText="学号">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="岗位名" DataField="Post">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="IsAttend" HeaderText="是否到岗">
                                <ItemStyle Width="50px" />
                            </asp:CheckBoxField>
                            <asp:CheckBoxField DataField="IsSettle" HeaderText="是否结算">
                                <ItemStyle Width="50px" />
                            </asp:CheckBoxField>
                            <asp:BoundField DataField="DetailDate" HeaderText="详细时间">
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
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

                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
               
                               </ContentTemplate>
                    </asp:UpdatePanel>
            
    </fieldset>



    <p>
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
    </p>


</asp:Content>

