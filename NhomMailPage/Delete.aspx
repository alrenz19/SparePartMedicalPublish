
	  <%@ Page Title="Delete" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Delete.aspx.cs" Inherits="QlyMaint.NhomMailPage.Delete" EnableEventValidation="false" %>
  <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
		  
		  
		  <section class="content-header">
		  <h1> NhomMail <small></small> </h1>
		  <ol class="breadcrumb">
		   <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
		  <li class="active"> NhomMail</li>
		  </ol>
		   </section>
		  
		  <div class="content">
		  <h2>Confirm Deletion</h2>
		  <p>Are you sure you want to delete the following NhomMails?</p>
		   <div class="panel panel-warning">
		  <div class="panel-body">
			 <label>TenNhom</label>
			 <asp:Label ID="lblTenNhom" runat="server" CssClass="form-value"></asp:Label>
			 <br />
			 <label>UserID</label>
			 <asp:Label ID="lblUserID" runat="server" CssClass="form-value"></asp:Label>
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
	 
	 
