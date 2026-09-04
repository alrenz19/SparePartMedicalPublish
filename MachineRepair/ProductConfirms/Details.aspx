<%@ Page Title="List" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Details.aspx.cs" Inherits="QlyMain.ProductConfirms.Details" EnableEventValidation="false" %>
<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">


    <section class="content-header">
        <h1>ProductConfirm <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">ProductConfirm</li>
        </ol>
    </section>

    <!-- content -->
    <div class="content">
          <uc1:ucRequestInfor runat="server" ID="ucRequestInfor" />

        <div class="panel panel-default">
            <div class="panel-heading">Details </div>
            <div class="panel-body">
               
                <label>Confirmed by:</label>
                <asp:Label ID="lblFullName" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Product Comment</label>
                <asp:Label ID="lblProductComment" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Create Date</label>
                <asp:Label ID="lblCreateDate" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
                <div class="panel-footer">
                    <asp:Button ID="btnAdd" runat="server" Text="Enter Confirmation" OnClick="btnAdd_Click" CssClass="btn btn-success" />
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="btn btn-warning" />
                    <asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" CssClass="btn btn-default" />
                </div>
            </div>
        </div>
    </div>
    <!--# content -->

</asp:Content>
