<%@ Page Title="Xem" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="ProductConfirmPageView.aspx.cs" Inherits="QlyMain.MaintenanceRequest.ProductConfirmPageView" %>

<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="page-heading">
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server">Dashboard</a></li>
            <li>
                <a href="~/MaintenanceRequest/RepairRequestPage.aspx" runat="server">Danh sách request </a>

            </li>

            <li class="active">Sửa máy</li>
        </ol>

        <h1>Maint leader confirm</h1>
        <div class="options">
            <div class="btn-toolbar">

                <asp:LinkButton Text="Trở lại" runat="server" ID="lbtBack" OnClick="lbtBack_Click">
                <i class="fa fa-backward"></i> Trở lại
                </asp:LinkButton>

            </div>
        </div>
    </div>
    <div class="container">
         <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
        <uc1:ucRequestInfor runat="server" id="ucRequestInfor" />

        <div class="row">
            <asp:LinkButton ID="lbtCreateProductionConfirm" OnClick="lbtCreateProductionConfirm_Click" Text="Tạo mới" runat="server">
                <span class="glyphicon glyphicon-play-circle"></span> Tạo xác nhận
            </asp:LinkButton>

            <asp:Panel ID="PanelModify" runat="server">
                <table class="table table-bordered">
                     
                    <tr>
                        <td>Nhập thông tin xác nhận:</td>
                        <td>
                            <asp:TextBox ID="txtProductComment" runat="server" class="form-control"></asp:TextBox>
                       <small>Nhập bình luận của sản xuất về đối sách, nhập những gì mà bạn muốn lưu lại,...</small>
                            </td>
                    </tr>
                    
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
                            <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>



        </div>
    </div>
</asp:Content>
