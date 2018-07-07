<%@ Page Title="" Language="C#" MasterPageFile="~/u_fmc/MainForFMC.master" AutoEventWireup="true" CodeFile="WorkInfoMaintain.aspx.cs" Inherits="WorkInfoMaintain" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>

    <div>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="postid" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
</asp:Content>

