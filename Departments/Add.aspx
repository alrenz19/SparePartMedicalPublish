<%@ Page Title="Add" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Add.aspx.cs" Inherits="QlyMain.Departments.Add" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <section class="content-header">
        <h1>Department <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Department</li>
        </ol>
    </section>
    <div class="content">
        <asp:Panel ID="PanelModify" runat="server">
            <div class="panel panel-success">
                <div class="panel-heading">Add New </div>
                <div class="panel-body">
                    <label>Department name</label>
                    <asp:TextBox ID="txtDepartmentName" runat="server" class="form-control"></asp:TextBox>
                    <label>Group name</label>
                    <asp:TextBox ID="txtDepartmentCode" runat="server" class="form-control"></asp:TextBox>
                    <label>Tlip</label>
 
                    <asp:DropDownList ID="ddlTlip" runat="server" CssClass="form-control">
                        <asp:ListItem Value="TLIP1" Text="TLIP1"></asp:ListItem>
                        <asp:ListItem Value="TLIP3" Text="TLIP3"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                    <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
                </div>


                <div class="panel-footer">
                    <asp:Button ID="btnAdd" runat="server" Text="Add new" OnClick="btnAdd_Click" CssClass="btn btn-success" />
                    <asp:Button ID="btnAddAndContinue" runat="server" Text="Add and continue entering" OnClick="btnAddAndContinue_Click" CssClass="btn btn-success" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-default" />
                </div>
            </div>
        </asp:Panel>
    </div>

</asp:Content>

