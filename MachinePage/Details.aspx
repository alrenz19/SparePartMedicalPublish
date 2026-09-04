<%@ Page Title="List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Details.aspx.cs" Inherits="QlyMain.MachinePage.Details" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="content-header">
        <h1>Machine <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Machine</li>
        </ol>
    </section>

    <!-- content -->
    <div class="content">
        <div class="panel panel-default">
            <div class="panel-heading">Details </div>
            <div class="panel-body">
                <label>Code Machine</label>
                <asp:Label ID="lblCodeMachine" runat="server" CssClass="form-value"></asp:Label>
                <br />

                <label>Machine Type</label>
                <asp:Label ID="lblType" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Machine Name</label>
                <asp:Label ID="lblMachineName" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Machine Group</label>
                <asp:Label ID="lblGroup" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Department Code</label>
                <asp:Label ID="lblDepartmentCode" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Fixed Asset Code</label>
                <asp:Label ID="lblSapCode" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Department</label>
                <asp:Label ID="lblDepartmentName" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Section</label>
                <asp:Label ID="lblBoPhan" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Status</label>
                <asp:Label ID="lblStatus" runat="server" CssClass="form-value"></asp:Label>
                <br />

                <label>Created Date</label>
                <asp:Label ID="lblCreatedDate" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Created By</label>
                <asp:Label ID="lblCreatedBy" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Last Modified Date</label>
                <asp:Label ID="lblModifiedDate" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Last Modified By</label>
                <asp:Label ID="lblModifiedBy" runat="server" CssClass="form-value"></asp:Label>
                <br />

                <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
                <div class="panel-footer">
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="btn btn-warning" Visible="false" />
                    <asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" CssClass="btn btn-default" />
                </div>
            </div>
        </div>
    </div>
    <!--# content -->

</asp:Content>
