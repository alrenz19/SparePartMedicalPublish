<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucRequestInfor.ascx.cs" Inherits="QlyMain.ucControl.ucRequestInfor" %>

<asp:Literal ID="LiteralThongBao222" runat="server"> </asp:Literal>
<div class="box box-info">
    <div class="box-header with-border">
        <h3 class="box-title">Yêu cầu sửa chữa </h3>

        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                <i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
        </div>
    </div>
    <!-- /.box-header -->
    <div class="box-body" style="display: block;">
        <div class="table-responsive">
            <table class="table no-margin">
                <thead>
                    <tr>
                        <th>Mã YC</th>
                        <th>Mã máy</th>
                        <th>Tên máy</th>
                        <th>Vị trí</th>
                        <th>Sự cố</th>
                        <th>Thời gian máy hỏng</th>
                        <th>Gửi yêu cầu lúc</th>
                        <th>Trạng thái</th>
                        <th>Người gửi</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>

                            <asp:Label ID="lblRequestNo" runat="server" autocomplete="off"></asp:Label></td>
                        <td><span class="label label-success">
                            <asp:Label ID="lblMachineCode" runat="server"></asp:Label></span>
                            <asp:Label ID="lblMaintenanceConfirmID"
                                runat="server" Visible="false"></asp:Label>

                        </td>
                        <td>

                            <asp:Label ID="lblMachineName" runat="server" autocomplete="off"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblViTri" runat="server" autocomplete="off"></asp:Label>

                        </td>
                        <td>
                            <asp:Label ID="lblProblemName" runat="server" autocomplete="off"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblNgayLoi" runat="server" autocomplete="off" ReadOnly="true"></asp:Label>

                        </td> 
                        
                        <td>
                            <asp:Label ID="lblCreateDate" runat="server" autocomplete="off" ReadOnly="true"></asp:Label>

                        </td>
                        <td>
                            <asp:Label ID="lblStatus" runat="server" autocomplete="off" ReadOnly="true"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblNguoiRequest" runat="server" autocomplete="off" ReadOnly="true"></asp:Label>
                        </td>
                    </tr>


                </tbody>
            </table>
            <br />
             <ul class="pull-right text-sm">
                 <li> Vị trí: <asp:Label ID="lblVitriLoi" runat="server" autocomplete="off" ReadOnly="true"></asp:Label></li>
                 <li> Ghi chú: <asp:Label ID="lblRemark" runat="server" autocomplete="off" ReadOnly="true"></asp:Label></li>
             </ul>
               
                
             
        </div>
        <!-- /.table-responsive -->
    </div>
    <!-- /.box-body -->
    
    <!-- /.box-footer -->
</div>



