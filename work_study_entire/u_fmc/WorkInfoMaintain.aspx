﻿<%@ Page Title="" Language="C#" MasterPageFile="MainForFMC.master" AutoEventWireup="true" CodeFile="WorkInfoMaintain.aspx.cs" Inherits="WorkInfoMaintain" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
        #left,#right,#denglu,#two
        {
            background-color:#ffffff;
            /*border:3px solid#3CB371;*/
            
        }
        #left{
            width:547px;
            float:left;
        }
        .auto-style6 {
            width: 220px;
        }
        .auto-style7 {
            width: 907px;
        }
        .auto-style8 {
            width: 318px;
        }
    </style>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset style="width:300px;">
            <legend class="text-center text-primary">岗位信息管理</legend>

    <div id="first" class="auto-style7"> 

        <asp:Label ID="Label_pleaseinput" runat="server" Text="请输入搜索内容："></asp:Label>
        <asp:TextBox ID="TextBoxsearch" runat="server" Width="88px"></asp:TextBox>
        <asp:Button ID="Buttonsearch" class="btn btn-default"  data-loading-text="搜索"
   	               type="button" runat="server" Text="搜索" OnClick="Buttonsearch_Click" />
        <p></p>
        <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" 
            OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowDeleting="GridView1_RowDeleting" 
            OnRowEditing="GridView1_RowEditing" 
            OnRowUpdating="GridView1_RowUpdating" 
            DataKeyNames="PostId" 
            AllowPaging="True" 
            OnPageIndexChanging="GridView1_PageIndexChanging" 
            AllowSorting="True" 
            OnRowDataBound="GridView1_RowDataBound"
            PageSize="10"
            CssClass="GridViewStyle" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="4" Width="928px" BorderStyle="None"
            >
   
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="PostId" HeaderText="岗位号" ReadOnly="True" />
                <asp:BoundField DataField="Post" HeaderText="岗位名" />
                <asp:BoundField DataField="WorkPlace" HeaderText="工作地" />
                <asp:BoundField DataField="HourlyWage" HeaderText="时薪" />
                <asp:BoundField DataField="GenderReq" HeaderText="性别要求" />
                <asp:BoundField DataField="BelongUnit" HeaderText="所属单位" />
                <asp:BoundField DataField="GradeReq" HeaderText="年级要求" />
                <asp:BoundField DataField="LossForAbsence" HeaderText="缺勤扣钱" />
                <asp:BoundField DataField="JobDescription" HeaderText="岗位描述" />
                <asp:BoundField DataField="ApplyTimeBe" HeaderText="申请开始时间" />
                <asp:BoundField DataField="ApplyTimeFi" HeaderText="申请结束时间" />
                <asp:BoundField DataField="PeoNumberDemand" HeaderText="招人数" />
                <asp:CommandField InsertVisible="false" ShowEditButton="True" />
                <asp:TemplateField HeaderText="操作" ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="delete" Text="删除"  OnClientClick="if(!confirm('确认删除此条记录吗?')) return false;"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" ForeColor="#003399" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#2461BF" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="#EFF3FB" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#CCFF99" Font-Bold="True" />
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

            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />

        </asp:GridView>

        <p> &nbsp;</p>

    </div>
            </fieldset>
            <asp:Button ID="Button3" style="margin-left:15px" class="btn btn-primary"  data-loading-text="导出"
   	               type="button" runat="server" OnClick="Button3_Click" Text="导出至excel" />
            </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
            <asp:PostBackTrigger ControlID="Button3" />
        </Triggers>
    </asp:UpdatePanel>
    <p></p>
    <div class="container" style="margin-left:0px;">
	<div class="row clearfix">
		<div class="col-md-12 column" >
			<button id="modal-874515"  href="#modal-container-874515" role="button" type="button" data-toggle="modal" class="btn btn-primary"><span class="glyphicon glyphicon-user"></span>添加新岗位信息</button>
			<div class="modal fade" id="modal-container-874515" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content" style="height:650px;width:450px;text-align:center;">
						<div class="modal-header" style="height:50px">
                            <h4 class="modal-title" id="myModalLabel">
								添加岗位
							</h4>
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						</div>
						<div class="modal-body" style="height:300px;">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
             <fieldset style="width:380px;">
            <legend class="text-center text-primary ">请输入</legend>
    
     <table style="width: 400px; height: 350px;background-color:lavenderblush;margin:0px auto;">
     <tr>
     <td style="width: 400px; text-align: right"> 岗位号：</td>
     <td class="auto-style6"> 
     <asp:TextBox ID="TextBox1" runat="server" Width="230px"></asp:TextBox></td> 
     </tr>
     <tr>
     <td style="width: 400px; text-align: right"> 岗位名：</td>
     <td class="auto-style6">
     <asp:TextBox ID="TextBox2" runat="server" Width="230px"></asp:TextBox></td> 
     </tr>
     <tr>
     <td style="width: 400px; text-align: right">  工作地：</td>
     <td class="auto-style6">
     <asp:TextBox ID="TextBox3" runat="server" Width="230px"></asp:TextBox></td> 
     </tr>
     <tr>
     <td style="width: 400px; text-align: right"> 时薪：</td>
     <td class="auto-style6">
     <asp:TextBox ID="TextBox4" runat="server" Width="230px"></asp:TextBox></td>  
     </tr>
     <tr>
     <td style="width: 400px; text-align: right"> 性别要求：</td>
     <td class="auto-style6">
     <asp:TextBox ID="TextBox5" runat="server" Width="230px"></asp:TextBox></td>  
     </tr>
     <tr>
     <td style="width: 400px; text-align: right"> 所属单位：</td>
     <td class="auto-style6">
     <asp:TextBox ID="TextBox6" runat="server" Width="230px"></asp:TextBox></td>  
     </tr>
     <tr>
     <td style="width: 400px; text-align: right"> 年级要求：</td>
     <td class="auto-style6">
     <asp:TextBox ID="TextBox7" runat="server" Width="230px"></asp:TextBox></td>  
     </tr>
     <tr>
     <td style="width: 400px; text-align: right"> 缺勤扣钱：</td>
     <td class="auto-style6">
     <asp:TextBox ID="TextBox8" runat="server" Width="230px"></asp:TextBox></td>  
     </tr>
     <tr>
     <td style="width: 400px; text-align: right"> 岗位描述：</td>
     <td class="auto-style6">
     <asp:TextBox ID="TextBox9" runat="server" TextMode="MultiLine" Width="230px"></asp:TextBox></td>  
     </tr>
         <tr>
     <td style="width: 400px; text-align: right"> 申请开始时间：</td>
     <td class="auto-style6">
     <asp:TextBox ID="TextBox10" runat="server" TextMode="Date" Width="230px"></asp:TextBox></td>  
     </tr>
         <tr>
     <td style="width: 400px; text-align: right" > 申请结束时间：</td>
     <td class="auto-style6">
     <asp:TextBox ID="TextBox11" runat="server" TextMode="Date" Width="230px"></asp:TextBox></td>  
     </tr>
         <tr>
     <td style="width: 120px; text-align: right"> 招人数：</td>
     <td class="auto-style6">
     <asp:TextBox ID="TextBox12" runat="server" TextMode="Number" Width="230px"></asp:TextBox></td>  
     </tr>
     <tr>
     <td colspan="2" style="text-align: center"> </td> 
     </tr>
   </table>
   <asp:Label ID="Label2" runat="server" Text="状态"></asp:Label>
  
                 </fieldset>
            </ContentTemplate>
    </asp:UpdatePanel>
						   <div class="modal-footer" style="height:50px">
                            <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="添加" OnClick="Button1_Click" />&nbsp
                            <asp:Button ID="Button2" class="btn btn-default" runat="server" Text="关闭" OnClick="Button2_Click" />
						   </div>
						</div>
						
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>                                           
</asp:Content>

