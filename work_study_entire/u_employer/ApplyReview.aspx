<%@ Page Title="" Language="C#" MasterPageFile="MainForEmployer.master" AutoEventWireup="true" CodeFile="ApplyReview.aspx.cs" Inherits="u_employer_ApplyReview" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="applyid" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    该生所申请该岗位可安排时间如下：<asp:GridView ID="GridView2" runat="server"></asp:GridView>
</asp:Content>

