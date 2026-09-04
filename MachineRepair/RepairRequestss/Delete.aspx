<%@ Page Title="Delete" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Delete.aspx.cs" Inherits="QlyMain.RepairRequestss.Delete" %>

<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
    <style>
        .form-value {
            display: block;
            margin-bottom: 5px;
        }
    </style>
    <section class="content-header">
        <h1>RepairRequests <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">RepairRequests</li>
        </ol>
    </section>

    <div class="content">
        <h2>Delete repair request</h2>
        <p>Are you sure you want to delete the following RepairRequests?</p>
        <div class="panel panel-warning">
            <div class="panel-body">
                <uc1:ucRequestInfor runat="server" ID="ucRequestInfor" />
                  
                <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
            </div>
            <div class="panel-footer">
                <asp:Button ID="btnDelete" runat="server" Text="Delete request" OnClick="btnDelete_Click" CssClass="btn btn-warning" />
                <asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" CssClass="btn btn-default" />
            </div>
        </div>
    </div>

</asp:Content>
