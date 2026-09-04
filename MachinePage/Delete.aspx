
	  <%@ Page Title="Delete" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Delete.aspx.cs" Inherits="QlyMain.MachinePage.Delete" EnableEventValidation="false" %>
  <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
		  
		  
		  <section class="content-header">
		  <h1> Machine <small></small> </h1>
		  <ol class="breadcrumb">
		   <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
		  <li class="active"> Machine</li>
		  </ol>
		   </section>
		  
		  <div class="content">
		  <h2>Confirm Deletion</h2>
		  <p>Are you sure you want to delete the following Machines?</p>
		   <div class="panel panel-warning">
		  <div class="panel-body">
			 <label>CodeMachine</label>
			 <asp:Label ID="lblCodeMachine" runat="server" CssClass="form-value"></asp:Label>
			 <br />
			 <label>Status</label>
			 <asp:Label ID="lblStatus" runat="server" CssClass="form-value"></asp:Label>
			 <br />
			 <label>Type</label>
			 <asp:Label ID="lblType" runat="server" CssClass="form-value"></asp:Label>
			 <br />
			 <label>MachineName</label>
			 <asp:Label ID="lblMachineName" runat="server" CssClass="form-value"></asp:Label>
			 <br />
			 <label>Group</label>
			 <asp:Label ID="lblGroup" runat="server" CssClass="form-value"></asp:Label>
			 <br />
			 <label>DepartmentCode</label>
			 <asp:Label ID="lblDepartmentCode" runat="server" CssClass="form-value"></asp:Label>
			 <br />
			 <label>DepartmentID</label>
			 <asp:Label ID="lblDepartmentID" runat="server" CssClass="form-value"></asp:Label>
			 <br />
			   <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
			    <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
		 </div>
			 <div class="panel-footer">
			 <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="btn btn-warning" />
			 <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-default" />
			 </div>
		 </div>
	 </div>
 </asp:Content>
	 
	 
