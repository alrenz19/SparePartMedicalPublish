<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTimelineMaintConfirm.ascx.cs" Inherits="QlyMain.ucControl.ucTimelineMaintConfirm" %>

<asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>

<ul class="timeline">


    <!-- timeline time label -->
    <li class="time-label">
        <span class="bg-red">
            <asp:Label ID="lblCreateDate" runat="server" Text=""></asp:Label>

        </span>
    </li>
    <!-- timeline item -->
    <li>
        <i class="fa fa-user bg-blue"></i>
        <div class="timeline-item">
            <span class="time"><i class="fa fa-clock"></i>
                <asp:Label ID="lblPastTimeConfirm" runat="server" Text=""></asp:Label>
            </span>
            <h3 class="timeline-header"><a href="#">Theo dõi thời gian Maintenance đến sửa</a>
                <asp:Label ID="lblStatusConfirm" runat="server" Text="" Font-Bold="True"></asp:Label>
            </h3>
            <div class="timeline-body">
                <label>Người nhập: </label>
                <asp:Label ID="lblNguoiXacNhan" runat="server"></asp:Label>
                <br />
                <label>Code người nhập: </label>
                <asp:Label ID="lblCodeNguoiXacNhan" runat="server"></asp:Label>
                <br />
                <label>Máy hỏng lúc: </label>
                <asp:Label ID="lblThoiGianMayHong" runat="server" CssClass="label label-success"></asp:Label>
                <br />

                <label>Thời gian maint đến sửa :</label>
                <asp:Label ID="lblThoiGianDuKienSua" runat="server" CssClass="label label-success"></asp:Label>
                <br />


                <label>Từ lúc máy hỏng đến lúc maint đến sửa: </label>
                <asp:Label ID="lblTongThoiGian" runat="server" CssClass="badge label-primary"></asp:Label>
                <br />
                <label>PR gửi yêu cầu lúc: </label>
                <asp:Label ID="lblThoigianPRGuiYeuCau" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                <asp:Literal ID="Literal1" runat="server"> </asp:Literal>
                <br />
                <div class="form-button-container">
                    <asp:Button ID="btnDetails" runat="server" Text="Xem thêm" OnClick="btnDetails_Click" CssClass="btn btn-primary btn-sm" />


                </div>

            </div>
        </div>
    </li>
    <!-- END timeline item -->
</ul>
