<%@ Page Title="Edit" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Edit.aspx.cs" Inherits="QlyMain.Departments.Edit" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <section class="content-header">
        <h1>Department <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Department</li>
        </ol>
    </section>

    <div class="content">
        <div class="panel panel-info">
            <div class="panel-heading">
                Edit Department
            </div>
            <div class="panel-body">
                <label>Department Name</label>
                <asp:TextBox ID="txtDepartmentName" runat="server" CssClass="form-control" />
                <label>Group Name</label>
                <asp:TextBox ID="txtDepartmentCode" runat="server" CssClass="form-control" />
                <label>Tlip</label>
                <asp:DropDownList ID="ddlTlip" runat="server" CssClass="form-control">
                    <asp:ListItem Value="" Text="No select"></asp:ListItem>
                    <asp:ListItem Value="TLIP1" Text="TLIP1"></asp:ListItem>
                    <asp:ListItem Value="TLIP3" Text="TLIP3"></asp:ListItem>
                </asp:DropDownList>
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


