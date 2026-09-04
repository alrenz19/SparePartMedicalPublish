<%@ Page Title="Edit" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Edit.aspx.cs" Inherits="QlyMain.MachinePage.Edit" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <h1>Machine <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Machine</li>
        </ol>
    </section>

    <div class="content">
        <div class="panel panel-info">
            <div class="panel-heading">
                Edit Machine
			
            </div>
            <div class="panel-body">
                <label>CodeMachine</label>
                <asp:TextBox ID="txtCodeMachine" runat="server" CssClass="form-control" />
                <label>Status</label>
                <asp:TextBox ID="txtStatus" runat="server" CssClass="form-control" />
                <label>Type</label>
                <asp:TextBox ID="txtType" runat="server" CssClass="form-control" />
                <label>MachineName</label>
                <asp:TextBox ID="txtMachineName" runat="server" CssClass="form-control" />
                <label>Group</label>
                <asp:TextBox ID="txtGroup" runat="server" CssClass="form-control" />
                <label>DepartmentCode</label>
                <asp:TextBox ID="txtDepartmentCode" runat="server" CssClass="form-control" />
                <label>DepartmentID</label>
                <asp:TextBox ID="txtDepartmentID" runat="server" CssClass="form-control" />
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


