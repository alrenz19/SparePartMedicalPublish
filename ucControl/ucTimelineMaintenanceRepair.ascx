<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTimelineMaintenanceRepair.ascx.cs" Inherits="QlyMain.ucControl.ucTimelineMaintenanceRepair" %>

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
                 <asp:Label ID="lblPastTimeRepair" runat="server" Text=""></asp:Label>
             </span>
             <h3 class="timeline-header"><a href="#">Nội dung Maint sửa chữa</a>
                 <asp:Label ID="lblStatusRepair" runat="server" Text="" Font-Bold="true"></asp:Label>
             </h3>
             <div class="timeline-body">



                 <table class="table table-condensed">

                     <tr>
                         <td style="width: 30%">
                             <b>Người sửa:</b>

                         </td>
                         <td>
                             <asp:Label ID="lblNguoiSua" runat="server"></asp:Label>

                         </td>
                     </tr>

                     <tr>
                         <td style="font-weight: bold">Các hạng mục kiểm tra:

                         </td>
                         <td>

                             <asp:Label ID="lblCacHangMucKiemTra" runat="server"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td style="font-weight: bold">Nguyên nhân lỗi:</td>
                         <td>

                             <asp:Label ID="lblNguyenNhanLoi" runat="server"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td style="font-weight: bold">Hành động khắc phục:</td>
                         <td>

                             <asp:Label ID="lblHangDongKhacPhuc" runat="server"></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td style="font-weight: bold">Code sự cố:</td>
                         <td>

                             <asp:Label ID="lblCodeSuCo" runat="server"></asp:Label>
                         </td>
                     </tr>
                     <tr>

                         <td colspan="2">
                             <div class="row">
                                 <div class="col-md-6 col-sm-6">
                                     <div class="panel panel-default">
                                         <div class="panel-heading">
                                             Thời gian bắt đầu sửa
                                         </div>
                                         <div class="panel-body">
                                             <b>Ngày:</b>
                                             <asp:Label ID="lblNgayBatDauSua" runat="server" autocomplete="off"></asp:Label>
                                             <br />
                                             <b>Giờ: </b><asp:Label ID="lblGioBatDauSua" runat="server" TextMode="Time" autocomplete="off"></asp:Label>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="col-md-6 col-sm-6">
                                     <div class="panel panel-default">
                                         <div class="panel-heading">
                                             Thời gian sửa xong
                                         </div>
                                         <div class="panel-body">
                                             <b>Ngày:</b>
                                             <asp:Label ID="lblNgayKetThucSua" runat="server" autocomplete="off"></asp:Label>
                                             <br />
                                             <b>Giờ: </b>
                                             <asp:Label ID="lblGioKetThucSua" runat="server" TextMode="Time" autocomplete="off"></asp:Label>

                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </td>
                     </tr>
                     <tr>
                         <td style="font-weight: bold">Tổng thời gian sửa:</td>
                         <td>

                             <asp:Label ID="lblTotalTimeRepair" runat="server" CssClass="badge bg-green"></asp:Label>
                         </td>
                     </tr>
                 </table>
             </div>
             <div class="timeline-footer">
                 <asp:LinkButton ID="lbtRepairViewMore"
                     runat="server" OnClick="lbtRepairViewMore_Click"
                     class="btn btn-primary btn-sm"> Xem thêm
                 </asp:LinkButton>

             </div>
         </div>
     </li>

     <!-- END timeline item -->
    </ul>   