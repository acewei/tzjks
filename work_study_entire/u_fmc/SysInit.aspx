<%@ Page Title="" Language="C#" MasterPageFile="MainForFMC.master" AutoEventWireup="true" CodeFile="SysInit.aspx.cs" Inherits="SysInit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="jumbotron">
				<h1>
					注意!
				</h1>
				<p>
					初始化将删除所有数据！请谨慎操作！
				</p>
				<p>
                    <asp:Button ID="Button1" class="btn btn-primary btn-large" runat="server" Text="开始初始化" OnClientClick="if(!confirm('数据将丢失，确认继续初始化吗？')) return false;" />
				</p>
			</div>
		</div>
	</div>
</div>
</asp:Content>

