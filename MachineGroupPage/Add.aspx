
	  <%@ Page Title="Add" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Add.aspx.cs" Inherits="QlyMaint.MachineGroupPage.Add" EnableEventValidation="false" %>
			  
	  <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
		  
		  
		   <section class="content-header">
		  <h1> MachineGroup <small></small> </h1>
		  <ol class="breadcrumb">
		   <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
		  <li class="active"> MachineGroup</li>
		   </ol>
		   </section>
		  <div class="content">
		  <asp:Panel ID="PanelModify" runat="server">
		  <div class="panel panel-success">
		  <div class="panel-heading"> Add New </div>
		   <div class="panel-body">
			<label>Machine Group</label>
			 <asp:TextBox ID="txtGroupName" runat="server" class="form-control"></asp:TextBox>
			   <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
			    <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
			 </div>
		  
		  
			  <div class="panel-footer">
			 <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" CssClass="btn btn-success" />
			 <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-default" />
			 </div>
		 </div>
		 </asp:Panel>
			 </div>
			  
	 </asp:Content>
 
