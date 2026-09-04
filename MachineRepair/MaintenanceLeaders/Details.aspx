<%@ Page Title="List" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Details.aspx.cs" Inherits="QlyMain.MaintenanceLeaders.Details" EnableEventValidation="false" %>

<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">


    <section class="content-header">
        <h1>Maintenance Leader <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">MaintenanceLeader</li>
        </ol>
    </section>

    <div class="content">
        <uc1:ucrequestinfor runat="server" id="ucRequestInfor" />

        <div class="panel panel-default">
            <div class="panel-heading">
                Details
            </div>
            <div class="panel-body">
                <label>Name of confirming leader: </label>
                <asp:Label ID="lblLeaderName" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Long-term countermeasure: </label>
                <asp:Label ID="lblPolicyDescription" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Note for production: </label>
                <asp:Label ID="lblNoteForProduct" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Confirmation date: </label>
                <asp:Label ID="lblConfirmDate" runat="server" CssClass="form-value"></asp:Label>

                <br />
                <label>Confirmer:</label>
                <asp:Label ID="lblUserID" runat="server" CssClass="form-value"></asp:Label>
                <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
            </div>

            <div class="panel-footer">
                <asp:Button ID="btnAdd" runat="server" Text="Add new" OnClick="btnAdd_Click" CssClass="btn btn-success" />
                <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="btn btn-warning" />
                <asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" CssClass="btn btn-default" />
            </div>
        </div>



    </div>
</asp:Content>
