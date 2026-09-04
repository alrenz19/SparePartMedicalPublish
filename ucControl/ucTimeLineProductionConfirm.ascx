<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTimeLineProductionConfirm.ascx.cs" Inherits="QlyMain.ucControl.ucTimeLineProductionConfirm" %>

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
            <span class="time"><i class="fas fa-clock"></i>
                <asp:Label ID="lblProductionConfirmPastTime" runat="server"></asp:Label>
            </span>
            <h3 class="timeline-header"><a href="#"> Nội dung xác nhận của bộ phận gửi yêu cầu sửa chữa </a>
                <asp:Label runat="server" ID="lblStatus"  Font-Bold="True"></asp:Label>
            </h3>

            <div class="timeline-body">
                 
                    <asp:Panel ID="PanelModify" runat="server">
                        <table class="table-condensed">

                            <tr>
                                <th>Nội dung:</th>
                                <td>
                                    <asp:Label ID="lblProductComment" runat="server"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <th>Xác nhận bởi:</th>
                                <td>
                                    <asp:Label ID="lblFullName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <th>Code:</th>
                                <td>
                                    <asp:Label ID="lblCode" runat="server"></asp:Label>
                                </td>
                            </tr>
                             

                        </table>
                    </asp:Panel>

                
            </div>
            <div class="timeline-footer">

                <asp:LinkButton Text="Xem thêm" runat="server" ID="lbtProductionConfirm" CssClass="btn btn-primary btn-sm"
                    OnClick="lbtProductionConfirm_Click">Xem thêm</asp:LinkButton>

            </div>
        </div>
    </li>

    <!-- END timeline item -->
</ul>
