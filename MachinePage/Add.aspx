<%@ Page Title="Add" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Add.aspx.cs" Inherits="QlyMain.MachinePage.Add" EnableEventValidation="false" %>

<%@ Register Src="~/MachinePage/ucLoadSapCode.ascx" TagPrefix="uc1" TagName="ucLoadSapCode" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <section class="content-header">
        <h1>Machine <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Machine</li>
        </ol>
    </section>
    <section class="content">
        <asp:Panel ID="PanelModify" runat="server">
            <div class="panel panel-success">
                <div class="panel-heading">Add New </div>
                <div class="panel-body">
                    <label>CodeMachine</label>
                    <asp:TextBox ID="txtCodeMachine" runat="server" class="form-control"></asp:TextBox>
                    <label>Status</label>
                    <asp:TextBox ID="txtStatus" runat="server" class="form-control"></asp:TextBox>
                    <label>Type</label>
                    <asp:TextBox ID="txtType" runat="server" class="form-control"></asp:TextBox>
                    <label>MachineName</label>
                    <asp:TextBox ID="txtMachineName" runat="server" class="form-control"></asp:TextBox>
                    <label>Group</label>
                    <asp:TextBox ID="txtGroup" runat="server" class="form-control"></asp:TextBox>
                    <label>DepartmentCode</label>
                    <asp:TextBox ID="txtDepartmentCode" runat="server" class="form-control"></asp:TextBox>
                    <label>DepartmentID</label>
                    <asp:TextBox ID="txtDepartmentID" runat="server" class="form-control"></asp:TextBox>
                    <hr />
                    <uc1:ucLoadSapCode runat="server" id="ucLoadSapCode" />
                    <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                    <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
                </div>


                <div class="panel-footer">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" CssClass="btn btn-success" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-default" />
                </div>
            </div>
        </asp:Panel>
    </section>

</asp:Content>

