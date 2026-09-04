<%@ Page Title="Edit" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Edit.aspx.cs" Inherits="QlyMaint.MaintenanceLeaderPage.Edit" EnableEventValidation="false" %>

<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>
<%@ Register Src="~/ucControl/ucCommentDoiSach.ascx" TagPrefix="uc1" TagName="ucCommentDoiSach" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <section class="content-header">
        <h1>MaintenanceLeader <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">MaintenanceLeader</li>
        </ol>
    </section>

    <div class="content">
        <uc1:ucRequestInfor runat="server" ID="ucRequestInfor" />

        <div class="panel panel-info">
            <div class="panel-heading">
                Cập nhật đối sách
			
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label for="txtLeaderName">Phụ trách</label>
                    <asp:TextBox ID="txtLeaderName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtPolicyDescription">Đối sách</label>
                    <asp:TextBox ID="txtPolicyDescription" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtNoteForProduct">Ghi chú cho sản xuất</label>
                    <asp:TextBox ID="txtNoteForProduct" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtConfirmDate">Ngày xác nhận</label>
                    <asp:TextBox ID="txtConfirmDate" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Hiện Trạng Đối Sách</label>
                    <asp:CheckBox ID="chkFlowDoiSach" runat="server" Text="" AutoPostBack="True" OnCheckedChanged="chkFlowDoiSach_CheckedChanged" Style="font-weight: 700" />
                </div>
            </div>
            <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
            <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
            <div class="panel-footer">
                <asp:Button ID="btnSave" runat="server" Text="Lưu lại" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Đóng" OnClick="btnCancel_Click" CssClass="btn btn-default" CausesValidation="false" />
            </div>
        </div>

        <uc1:ucCommentDoiSach runat="server" ID="ucCommentDoiSach" />
    </div>
</asp:Content>


