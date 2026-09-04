
	  <%@ Page Title="List" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Delete.aspx.cs" Inherits="QlyMain.MaintenanceConfims.Delete" EnableEventValidation="false" %>
  <asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
		  
		  
		  <section class="content-header">
		  <h1> MaintenanceConfim <small></small> </h1>
		  <ol class="breadcrumb">
		   <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
		  <li class="active"> MaintenanceConfim</li>
		   </section>
		  
		  <div class="content">
		  <h2>Confirm Deletion</h2>
		  <p>Are you sure you want to delete the following MaintenanceConfims?</p>
			 <label class="form-label" for="txtRequestID">RequestID<span class="required-field">*</span></label>
			 <asp:Label ID="lblRequestID" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtUserID">UserID<span class="required-field">*</span></label>
			 <asp:Label ID="lblUserID" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtThoiGianDuKienSua">ThoiGianDuKienSua<span class="required-field">*</span></label>
			 <asp:Label ID="lblThoiGianDuKienSua" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtCreateDate">CreateDate<span class="required-field">*</span></label>
			 <asp:Label ID="lblCreateDate" runat="server" CssClass="form-value"></asp:Label>
			   <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
			    <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
			  <div class="form-button-container">
			 <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="form-button delete-button" />
			 <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="form-button cancel-button" />
			 </div>
	 </div>
 </asp:Content>
	 
	 
