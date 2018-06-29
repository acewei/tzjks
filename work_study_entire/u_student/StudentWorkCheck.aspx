<%@ Page Title="" Language="C#" MasterPageFile="MainForStudent.master" AutoEventWireup="true" CodeFile="StudentWorkCheck.aspx.cs" Inherits="StudentWorkCheck" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .auto-style6 {
            font-size: x-large;
        }

        .auto-style7 {
            width: 100%;
            border: 1px solid #808080;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <fieldset style="height: 100%;">
        <legend class="auto-style6">考勤情况查询</legend>
        <br />
        <br />

        <p>
            &nbsp;
        </p>
              
                <div style="float: none; clear: right">
                   
                    <asp:TextBox ID="TextBox1" TextMode="Date" runat="server"></asp:TextBox>
                   
                    &nbsp;到&nbsp;
                     <asp:TextBox ID="TextBox2" TextMode="Date" runat="server"></asp:TextBox>
             
    <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
                </div>

            &nbsp;
        
        <p>
            &nbsp;
        </p>
        <table class="auto-style7" style="width: 50%; background-color: #CCCCFF;">
            <tr>
                <td>&nbsp;
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>

                     
                    
                    <asp:Panel ID="Panel2" runat="server">
                    <br />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>

                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </asp:Panel>
                               </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
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

