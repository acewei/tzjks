<%@ Page Title="" Language="C#" MasterPageFile="MainForFMC.master" AutoEventWireup="true" CodeFile="DataBackRestore.aspx.cs" Inherits="DataBackRestore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset style="width:300px;">
            <legend class="text-center text-primary">数据库备份</legend>
                <div class="beifei">
            <table>
            <tr>
            <td style="width: 100px"><span style="font-size: 9pt">操 作 数 据 库</span></td>
            <td><asp:DropDownList ID="DropDownList1" runat="server" Font-Size="9pt" Width="124px"></asp:DropDownList></td>
            <td style="width: 100px"></td>
            </tr>
            <tr>
            <td style="width: 100px"><span style="font-size: 9pt">备份名称和位置</span></td>
            <td style="width: 100px"><asp:TextBox ID="TextBox1" runat="server" Font-Size="9pt" Width="117px"></asp:TextBox></td>
            <td style="width: 100px"><span style="font-size: 9pt; color: #ff3300">（如D:\beifen）</span></td>
            </tr>
            <tr>
            <td colspan="3"><asp:Button ID="Button1" runat="server" Font-Size="9pt" OnClick="Button1_Click" Text="备份数据库" /></td>
            </tr>
            </table>
        </div>
                </fieldset>             
            </ContentTemplate>
        <Triggers>           
            <asp:PostBackTrigger ControlID="Button1" />
        </Triggers>

    </asp:UpdatePanel>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
             <fieldset style="width:300px;">
            <legend class="text-center text-primary ">恢复数据库</legend>
                 <div class="huanyuan">
            <table>
            <tr>
            <td style="width: 100px; height: 21px"><span style="font-size: 9pt">操 作 数 据 库</span></td>
            <td><asp:DropDownList ID="DropDownList2" runat="server" Font-Size="9pt" Width="124px"></asp:DropDownList></td>
            <td style="width: 100px; height: 21px"></td>
            </tr>
            <tr>
            <td style="width: 100px"><span style="font-size: 9pt">操 作 数 据 库</span></td>
            <td style="width: 100px"><asp:FileUpload ID="FileUpload1" runat="server" Font-Size="9pt" Width="190px" /></td>
            <td style="width: 100px">
            </td>
            </tr>
            <tr>
            <td colspan="3"><asp:Button ID="Button2" runat="server" Font-Size="9pt" OnClick="Button2_Click" Text="恢复数据库" /></td>
            </tr>
            </table>
        </div>
 </fieldset>
            </ContentTemplate>
        <Triggers>          
            <asp:PostBackTrigger ControlID="Button2" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>

