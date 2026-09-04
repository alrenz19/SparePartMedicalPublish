
	  <%@ Page Title="Add" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Add.aspx.cs" Inherits="QlyMaint.MaintenanceLeaderPage.Add" EnableEventValidation="false" %>
			  
	  <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
		  
		  
		   <section class="content-header">
		  <h1> MaintenanceLeader <small></small> </h1>
		  <ol class="breadcrumb">
		   <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
		  <li class="active"> MaintenanceLeader</li>
		   </ol>
		   </section>
		  <div class="content">
		  <asp:Panel ID="PanelModify" runat="server">
		  <div class="panel panel-success">
		  <div class="panel-heading"> Add New </div>
		   <div class="panel-body">
			 <label>LeaderName</label>
			 <asp:TextBox ID="txtLeaderName" runat="server" class="form-control"></asp:TextBox>
			 <label>PolicyDescription</label>
			 <asp:TextBox ID="txtPolicyDescription" runat="server" class="form-control"></asp:TextBox>
			 <label>NoteForProduct</label>
			 <asp:TextBox ID="txtNoteForProduct" runat="server" class="form-control"></asp:TextBox>
			 <label>ConfirmDate</label>
			 <asp:TextBox ID="txtConfirmDate" runat="server" class="form-control"></asp:TextBox>
			 <label>RequestID</label>
			 <asp:TextBox ID="txtRequestID" runat="server" class="form-control"></asp:TextBox>
			 <label>UserID</label>
			 <asp:TextBox ID="txtUserID" runat="server" class="form-control"></asp:TextBox>
			 <label>FlowDoiSach</label>
			 <asp:CheckBox ID="chkFlowDoiSach" runat="server"></asp:CheckBox>
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
 
