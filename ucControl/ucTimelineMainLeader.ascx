<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTimelineMainLeader.ascx.cs" Inherits="QlyMain.ucControl.ucTimelineMainLeader" %>


<asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>


<ul class="timeline">
    <!-- timeline time label -->
    <li class="time-label">
        <span class="bg-red">
            <asp:Label Text="" runat="server" ID="lblCreateDate" />
        </span>
    </li>
    <!-- /.timeline-label -->
    <!-- timeline item -->
    <li>
        <i class="fa fa-user bg-blue"></i>
        <div class="timeline-item">
            <span class="time"><i class="fas fa-clock"></i>12:05 ago</span>
            <h3 class="timeline-header"><a href="#">Maintenance Leader</a>
                <asp:Label runat="server" ID="lblTrangThaiXacNhan"
                     Font-Bold="True"></asp:Label>
            </h3>

            <div class="timeline-body">
                <table class="table-condensed">
                    <tr>
                        <th>Leader:

                        </th>
                        <td>
                            <asp:Label ID="lblLeaderName" runat="server"></asp:Label>
                            <asp:Label ID="lblLeaderID" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblRequestID" runat="server"></asp:Label>
                            <asp:Label ID="lblUserID" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>Đối sách lâu dài:</th>
                        <td>
                            <asp:Label ID="lblPolicyDescription" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>Ghi chú cho Sản xuất:</th>
                        <td>
                            <asp:Label ID="lblNoteForProduct" runat="server"></asp:Label>
                        </td>
                    </tr>



                </table>
            </div>
            <div class="timeline-footer">
                <asp:LinkButton ID="lbtLeaderViewMore"
                    runat="server" OnClick="lbtLeaderViewMore_Click"
                    class="btn btn-primary btn-sm"> Xem thêm
                </asp:LinkButton>

            </div>
        </div>
    </li>
    <!-- END timeline item -->
</ul>
