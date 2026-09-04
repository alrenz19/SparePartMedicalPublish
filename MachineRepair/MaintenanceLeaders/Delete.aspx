<%@ Page Title="List" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Delete.aspx.cs" Inherits="QlyMain.MaintenanceLeaders.Delete" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">

    <section class="content-header">
        <h1>MaintenanceLeader <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">MaintenanceLeader</li>
        </ol>
    </section>

    <div class="content">
        <h2>Confirm Deletion</h2>
        <p>Are you sure you want to delete the following MaintenanceLeaders?</p>
        < div class="panel">
		  <div class="panel-body">
              <label class="form-label" for="txtLeaderName">LeaderName<span class="required-field">*</span></label>
              <asp:Label ID="lblLeaderName" runat="server" CssClass="form-value"></asp:Label>
              <label class="form-label" for="txtPolicyDescription">PolicyDescription<span class="required-field">*</span></label>
              <asp:Label ID="lblPolicyDescription" runat="server" CssClass="form-value"></asp:Label>
              <label class="form-label" for="txtNoteForProduct">NoteForProduct<span class="required-field">*</span></label>
              <asp:Label ID="lblNoteForProduct" runat="server" CssClass="form-value"></asp:Label>
              <label class="form-label" for="txtConfirmDate">ConfirmDate<span class="required-field">*</span></label>
              <asp:Label ID="lblConfirmDate" runat="server" CssClass="form-value"></asp:Label>
              <label class="form-label" for="txtRequestID">RequestID<span class="required-field">*</span></label>
              <asp:Label ID="lblRequestID" runat="server" CssClass="form-value"></asp:Label>
              <label class="form-label" for="txtUserID">UserID<span class="required-field">*</span></label>
              <asp:Label ID="lblUserID" runat="server" CssClass="form-value"></asp:Label>
              <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
              <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
          </div>
        <div class="panel-footer">
            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="form-button delete-button" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="form-button cancel-button" />
        </div>
    </div>


</asp:Content>


