<%@ Page Title="List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Details.aspx.cs" Inherits="QlyMaint.MaintenanceLeaderPage.Details" EnableEventValidation="false" %>

<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>
<%@ Register Src="~/ucControl/ucCommentDoiSach.ascx" TagPrefix="uc1" TagName="ucCommentDoiSach" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <section class="content-header">
        <h1>Maintenance Leader Theo Quản lý đối sách <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">MaintenanceLeader</li>
        </ol>
    </section>

    <!-- content -->
    <div class="content">

        <uc1:ucRequestInfor runat="server" ID="ucRequestInfor" />
        <div class="panel panel-default">
            <div class="panel-heading">Thông tin đối sách </div>
            <div class="panel-body">
                <label>Phụ trách</label>
                <asp:Label ID="lblLeaderName" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Đối sách</label>
                <asp:Label ID="lblPolicyDescription" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Ghi chú cho sản xuất</label>
                <asp:Label ID="lblNoteForProduct" runat="server" CssClass="form-value"></asp:Label>
                <br />
                <label>Ngày xác nhận</label>
                <asp:Label ID="lblConfirmDate" runat="server" CssClass="form-value"></asp:Label>
                <br />

                <label>Hiện Trạng Đối Sách</label>
                <asp:CheckBox ID="chkFlowDoiSach" runat="server" />
                <br />
                <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
                <div class="panel-footer">
                    <asp:Button ID="btnEdit" runat="server" Text="Sửa" OnClick="btnEdit_Click" CssClass="btn btn-warning" />
                    &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Đóng" OnClick="btnCancel_Click" CssClass="btn btn-default" />
                </div>
            </div>
        </div>

        <uc1:ucCommentDoiSach runat="server" id="ucCommentDoiSach" />
    </div>
    <!--# content -->

</asp:Content>



