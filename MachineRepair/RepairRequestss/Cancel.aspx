<%@ Page Title="" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true" CodeBehind="Cancel.aspx.cs" Inherits="QlyMain.MachineRepair.RepairRequestss.Cancel" %>

<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">

        <style>
        .form-value {
            display: block;
            margin-bottom: 5px;
        }
    </style>
   <%-- <section class="content-header">
        <h1>Repair Requests <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">RepairRequests</li>
        </ol>
    </section>--%>

    <div class="content">
        <h2>Cancel repair request</h2>
        <p>Are you sure you want to cancel this repair request?</p>
        <div class="panel panel-warning">
            <div class="panel-body">
                <uc1:ucRequestInfor runat="server" ID="ucRequestInfor" />
                  
                <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
            </div>
            <div class="panel-footer">
               
                <asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" CssClass="btn btn-default" />

                 <asp:Button ID="btnCancelRequest" runat="server" Text="Cancel request" OnClick="btnCancelRequest_Click" CssClass="btn btn-warning" />
            </div>
        </div>
    </div>
</asp:Content>
