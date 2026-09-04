
	  <%@ Page Title="Edit" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Edit.aspx.cs" Inherits="QlyMaint.MachineGroupPage.Edit" EnableEventValidation="false" %>
	  <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
		  
		  
		   <section class="content-header">
		  <h1> MachineGroup <small></small> </h1>
		  <ol class="breadcrumb">
		   <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
		  <li class="active"> MachineGroup</li>
		  </ol>
		   </section>
		  
		  <div class="content">
			  <div class="panel panel-info">
			 <div class="panel-heading">  
			  Edit MachineGroup
			 </div>
			  <div class="panel-body">
			 <label>GroupName</label>
			 <asp:TextBox ID="txtGroupName" runat="server" CssClass="form-control" />
			  </div>
			   <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
			    <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
			 <div class="panel-footer">
			 <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary" />
			 <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-default" CausesValidation="false" />
			 </div>
			 </div>
		  </div>
	 </asp:Content>
	 
	 
