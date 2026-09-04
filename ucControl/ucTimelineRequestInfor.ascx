<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTimelineRequestInfor.ascx.cs" Inherits="QlyMain.ucControl.ucTimelineRequestInfor" %>

<asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>

<ul class="timeline">
    <!-- timeline time label -->
    <li class="time-label">
        <span class="bg-red">
            <asp:Label ID="lblRequestDate" runat="server" Text=""></asp:Label>

        </span>
    </li>
    <!-- /.timeline-label -->
    <!-- timeline item -->
    <li>
        <i class="fa fa-camera bg-purple"></i>
        <div class="timeline-item">
            <span class="time"><i class="fas fa-clock"></i>
                <asp:Label ID="lblPastTimeRequest" runat="server" Text=""></asp:Label>
            </span>
            <h3 class="timeline-header">
                <a href="#">Nội dung bộ phận yêu cầu sửa chữa</a>


            </h3>
            <div class="timeline-body">
                <p>
                    <b>Request No:</b>
                    <asp:Label ID="lblRequesterNo" runat="server" Text=""></asp:Label>
                </p>
                <p>
                    <b>Người request:</b>
                    <asp:Label ID="lblRequester" runat="server" Text=""></asp:Label>
                </p>
                <p>
                    <b>Nội dung:
                    </b>
                    <asp:Label ID="lblRequestContent" runat="server" Text=""></asp:Label>
                </p>

                <p>
                    <b>Máy:
                    </b>
                    <asp:Label ID="lblMachineName" runat="server" Text=""></asp:Label>
                </p>
                <p>
                    <b>Group:
                    </b>
                    <asp:Label ID="lblGroup" runat="server" Text=""></asp:Label>
                </p>
                <p>
                    <b>Vị trí:
                    </b>
                    <asp:Label ID="lblViTri" runat="server" autocomplete="off"></asp:Label>
                </p>

                <p>
                    <b>Phòng/Bộ phận:
                    </b>
                    <asp:Label ID="lblPhong" runat="server" autocomplete="off"></asp:Label>
                </p>
                <p>
                    <b>Thời gian máy hỏng:
                    </b>

                    <asp:Label ID="lblThoiGianMayHong" runat="server" autocomplete="off" CssClass="label label-success"></asp:Label>
                </p>
                <p>
                    <b>Ngày tạo yêu cầu:
                    </b>
                    <asp:Label ID="lblDateCreate" runat="server" autocomplete="off"></asp:Label>
                </p>
                <div class="form-button-container">
                    <asp:Button ID="btnDetails" runat="server" Text="Xem thêm" OnClick="btnDetails_Click" CssClass="btn btn-default btn-sm" />


                </div>
            </div>
        </div>
    </li>
    <!-- END timeline item -->

    <li>
        <i class="fa fa-clock-o bg-gray"></i>
    </li>
</ul>
