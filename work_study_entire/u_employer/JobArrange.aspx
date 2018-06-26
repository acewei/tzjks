<%@ Page Title="" Language="C#" MasterPageFile="MainForEmployer.master" AutoEventWireup="true" CodeFile="JobArrange.aspx.cs" Inherits="u_employer_JobArrange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<div>
        &nbsp;学生：<asp:DropDownList ID="DropDownList1" runat="server" DataTextField="sname" DataValueField="sname" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        &nbsp;&nbsp; 岗位：<asp:DropDownList ID="DropDownList2" runat="server" DataTextField="post" DataValueField="post" Enabled="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>

        &nbsp;&nbsp;
                
           
        <asp:Button ID="newsc" href="#modal-container-22" runat="server" Text="新增" data-toggle="modal" />


        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 共<asp:Label ID="recordCount" runat="server"></asp:Label>
        条记录
           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
               <ContentTemplate>
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="20" OnDataBinding="GridView1_DataBinding" OnRowDeleting="GridView1_RowDeleting">
                       <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                       <Columns>
                           <asp:BoundField DataField="scid" HeaderText="安排号" ReadOnly="True" />
                           <asp:TemplateField HeaderText="学号">

                               <ItemTemplate>
                                   <asp:Label ID="Label1" runat="server" Text='<%# Bind("sid") %>'></asp:Label>
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="岗位号">

                               <ItemTemplate>
                                   <asp:Label ID="Label2" runat="server" Text='<%# Bind("postid") %>'></asp:Label>
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="时间编号">

                               <ItemTemplate>
                                   <asp:Label ID="Label3" runat="server" Text='<%# Bind("tid") %>'></asp:Label>
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="有效期">

                               <ItemTemplate>
                                   <asp:Label ID="Label12" runat="server" Text='from' ForeColor="#6600ff"></asp:Label>
                                   <asp:Label ID="Label4" runat="server" Text='<%# Bind("validstart")%>'></asp:Label>
                                   <asp:Label ID="Label11" runat="server" Text='to' ForeColor="#6600ff"></asp:Label>
                                   <asp:Label ID="Label10" runat="server" Text='<%# Bind("validend")%>'></asp:Label>
                               </ItemTemplate>
                           </asp:TemplateField>


                           <asp:TemplateField HeaderText="操作" ShowHeader="False">
                               <ItemTemplate>
                                   <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" ForeColor="Red"></asp:LinkButton>
                               </ItemTemplate>
                           </asp:TemplateField>

                       </Columns>
                       <EditRowStyle BackColor="#999999" />
                       <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                       <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                       <PagerSettings FirstPageText="第一页" LastPageText="最后一页" NextPageText="下一页" PreviousPageText="上一页" />
                       <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" Font-Size="Larger" />
                       <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                       <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                       <SortedAscendingCellStyle BackColor="#E9E7E2" />
                       <SortedAscendingHeaderStyle BackColor="#506C8C" />
                       <SortedDescendingCellStyle BackColor="#FFFDF8" />
                       <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                   </asp:GridView>
               </ContentTemplate>
           </asp:UpdatePanel>

    </div>    
    
    


            
            
        
    
            <div class="container">
                
                <div class="row clearfix">
                    <div>
                        
                        <div class="modal fade" id="modal-container-22" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            
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
                                                            <asp:Label ID="Label7" runat="server" Text="选择时间：">
                                                            </asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="tid">
                                                                <Columns>
                                                                    <asp:BoundField DataField="tid" HeaderText="时间编号" />
                                                                    <asp:BoundField DataField="whatday" HeaderText="星期" />
                                                                    <asp:BoundField DataField="starttime" HeaderText="开始时间" />
                                                                    <asp:BoundField DataField="endtime" HeaderText="结束时间" />
                                                                    <asp:BoundField DataField="timelength" HeaderText="时长" />
                                                                    <asp:TemplateField>
                                                                        <EditItemTemplate>
                                                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                                                        </EditItemTemplate>
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

                                                            <asp:Label ID="Label8" runat="server" Text="有效开始：">
                                                            </asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell>

                                                            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>

                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                    <asp:TableRow>
                                                        <asp:TableCell>
                                                            <asp:Label ID="Label9" runat="server" Text="有效结束：">
                                                            </asp:Label>
                                                        </asp:TableCell>
                                                        <asp:TableCell>
                                                            <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
                                                        </asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </ContentTemplate>

                                        </asp:UpdatePanel>
                                    </div>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="Label13" runat="server"></asp:Label>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="保存" OnClick="Button1_Click" />

                                            </div>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
            </div>
       
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>

       
    <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000" Enabled="false"></asp:Timer>
     </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

