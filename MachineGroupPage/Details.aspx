
	  <%@ Page Title="List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Details.aspx.cs" Inherits="QlyMaint.MachineGroupPage.Details" EnableEventValidation="false" %>
	  <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
		  
		  
	   <section class="content-header">
		  <h1> MachineGroup <small></small> </h1>
		  <ol class="breadcrumb">
		   <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
		  <li class="active"> MachineGroup</li>
		    </ol>
	   </section>
	   
	   <!-- content -->
	  <div class="content">
		   <div class="panel panel-default">
		  <div class="panel-heading"> Details </div>
		   <div class="panel-body">
			 <label>GroupName</label>
			 <asp:Label ID="lblGroupName" runat="server" CssClass="form-value"></asp:Label>
			 <br />
			   <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
			   <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
			  <div class="panel-footer">
			 <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="btn btn-warning" />
			 <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-default" />
			 </div>
		 </div>
		 </div>
	 </div>
		  <!--# content -->
			 
	 </asp:Content>
			 
			 
			 
