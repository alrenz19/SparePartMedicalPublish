
	  <%@ Page Title="Edit" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Edit.aspx.cs" Inherits="QlyMaint.RepairRequestEmailPage.Edit" EnableEventValidation="false" %>
	  <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
		  
		  
		   <section class="content-header">
		  <h1> RepairRequestEmail <small></small> </h1>
		  <ol class="breadcrumb">
		   <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
		  <li class="active"> RepairRequestEmail</li>
		  </ol>
		   </section>
		  
		  <div class="content">
			  <div class="panel panel-info">
			 <div class="panel-heading">  
			  Edit RepairRequestEmail
			 </div>
			  <div class="panel-body">
			 <label>RequestID</label>
			 <asp:TextBox ID="txtRequestID" runat="server" CssClass="form-control" />
			 <label>UserID</label>
			 <asp:TextBox ID="txtUserID" runat="server" CssClass="form-control" />
			 <label>IsSendmail</label>
			 <asp:CheckBox ID="chkIsSendmail" runat="server" />
			 <label>CreateDate</label>
			 <asp:TextBox ID="txtCreateDate" runat="server" CssClass="form-control" />
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
	 
	 
