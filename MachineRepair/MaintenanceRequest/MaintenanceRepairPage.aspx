<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="MaintenanceRepairPage.aspx.cs" Inherits="QlyMain.MaintenanceRequest.MaintenanceRepairPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="page-heading">
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server">Dashboard</a></li>
            <li>
                <a href="~/MaintenanceRequest/RepairRequestPage.aspx" runat="server">Request list </a>

            </li>

            <li class="active">Machine repair</li>
        </ol>

        <h1>Information about machine repair</h1>
        <div class="options">
            <div class="btn-toolbar">

                <asp:LinkButton Text="Back" runat="server" ID="lbtBack" OnClick="lbtBack_Click">
                    <i class="fa fa-backward"></i> Back
                </asp:LinkButton>

            </div>
        </div>
    </div>
    <div class="container">
        <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary hidden">
                    <div class="panel-heading">
                        Incident information
                    </div>
                    <div class="panel-body" style="border-radius: 10px;">
                        <table class="table table-bordered table-condensed">
                            <tr>
                                <td style="width: 20%">Faulty machine code:</td>
                                <td>

                                    <asp:TextBox ID="txtMachineCode" runat="server" class="form-control"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td>Machine name</td>
                                <td>
                                    <asp:TextBox ID="txtMachineName" runat="server" class="form-control" autocomplete="off"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Problem name or description:</td>
                                <td>
                                    <asp:TextBox ID="txtProblemName" runat="server" class="form-control" autocomplete="off"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Time the machine broke down:</td>
                                <td>
                                    <asp:TextBox ID="txtNgayLoi" runat="server" class="form-control" Width="200px" autocomplete="off" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>


                            <tr>
                                <td>Quality impact:</td>
                                <td>
                                    <asp:CheckBox ID="chkAnhHuongChatLuong" runat="server" Enabled="false" TextAlign="Right"></asp:CheckBox>

                                    <asp:Panel ID="panelAnhHuongChatLuong" runat="server" Visible="false">
                                        NG rate:
                        <asp:TextBox ID="txtTiLeNG" runat="server" class="form-control"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                            </tr>

                            <tr>
                                <td>Does this error affect shipment:</td>
                                <td>
                                    <asp:CheckBox ID="chkAnhHuongXuatHang" runat="server" Enabled="false" Text="" TextAlign="Right"></asp:CheckBox>

                                    <asp:Panel ID="panelAnhHuongXuatHang" runat="server" Visible="false">
                                        Shipment date:
                         <asp:TextBox ID="txtNgayXuatHang" runat="server" class="form-control"></asp:TextBox>
                                    </asp:Panel>
                                </td>
                            </tr>


                        </table>

                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <asp:Panel ID="PanelModify" runat="server">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Enter maintenance repair information
                        </div>
                        <div class="panel-body">

                            <table class="table table-bordered">

                                <tr>
                                    <td>Repairer:</td>
                                    <td>
                                        <asp:TextBox ID="txtNguoiSua" runat="server" class="form-control"></asp:TextBox>
                                        <p>Please enter name and code <small>e.g., Tran Van A, 401x or A 4012</small> </p>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Inspection items:</td>
                                    <td>
                                        <asp:TextBox ID="txtCacHangMucKiemTra" runat="server" class="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Root cause:</td>
                                    <td>
                                        <asp:TextBox ID="txtNguyenNhanLoi" runat="server" class="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Corrective action:</td>
                                    <td>
                                        <asp:TextBox ID="txtHangDongKhacPhuc" runat="server" class="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Issue code:</td>
                                    <td>
                                        <asp:TextBox ID="txtCodeSuCo" runat="server" class="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>

                                    <td colspan="2">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        Start repair time
                                                    </div>
                                                    <div class="panel-body">
                                                        Date (month/day/year): 
                                                         <asp:TextBox ID="txtNgayBatDauSua" runat="server" class="form-control" autocomplete="off"></asp:TextBox>
                                                        Time:<asp:TextBox ID="txtGioBatDauSua" runat="server" TextMode="Time" class="form-control" autocomplete="off"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        Completion time
                                                    </div>
                                                    <div class="panel-body">
                                                        Date (month/day/year): 
                                                                    <asp:TextBox ID="txtNgayKetThucSua" runat="server" class="form-control" autocomplete="off"></asp:TextBox>
                                                        Time: 
                                                                    <asp:TextBox ID="txtGioKetThucSua" runat="server" TextMode="Time" class="form-control" autocomplete="off"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </td>
                                </tr>

                                <tr>
                                    <td>Assess whether repaired or not:</td>
                                    <td>
                                        <asp:CheckBox ID="chkSuaDuocHayKhong" runat="server" Checked="true" Text="Check if <b>repaired</b> or uncheck if <b>not repaired</b>" AutoPostBack="True" OnCheckedChanged="chkSuaDuocHayKhong_CheckedChanged"></asp:CheckBox>

                                        <asp:Panel ID="panelKhiKhongSuaDuoc" runat="server" Visible="false">
                                            <b>Estimated time to repair:</b>
                                            <asp:TextBox ID="txtThoiGianDuKien" runat="server" class="form-control"></asp:TextBox>
                                            <p>Enter the spare part arrival time or the date you estimate it can be repaired</p>
                                            <b>Reason not repaired: 
                                            </b>
                                            <asp:TextBox ID="txtLyDoKhongSuaDuoc" runat="server" class="form-control"></asp:TextBox>

                                        </asp:Panel>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Created date:</td>
                                    <td>
                                        <asp:TextBox ID="txtCreateDate" runat="server" class="form-control" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
                                        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Close" />
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </asp:Panel>
            </div>



            <asp:Panel ID="PanelShow" runat="server">
                <div class="row">
                    <div class="col-md-8">
                        <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" CssClass="btn btn-primary" Text="+ Enter machine repair information" />
                    </div>
                    <div class="col-md-4 hidden">
                        Rows to display:
  <asp:DropDownList ID="ddlSoDong" runat="server"
      CssClass="dropdown" AutoPostBack="true"
      OnSelectedIndexChanged="ddlSoDong_SelectedIndexChanged">
      <asp:ListItem>10</asp:ListItem>
      <asp:ListItem>30</asp:ListItem>
      <asp:ListItem>50</asp:ListItem>
      <asp:ListItem>100</asp:ListItem>
  </asp:DropDownList>
                    </div>
                </div>
                <br />
                <asp:GridView ID="GridViewShow" runat="server" AutoGenerateColumns="false"
                    AllowPaging="True" CssClass="table table-bordered"
                    OnPageIndexChanging="GridViewShow_PageIndexChanging"
                    EmptyDataText="No data" OnRowCommand="GridViewShowRowClick">
                    <Columns>

                        <asp:BoundField DataField="MaintenanceRepairID" HeaderText="MaintenanceRepairID" Visible="False" />
                        <asp:BoundField DataField="RequestID" HeaderText="RequestID" Visible="False" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" Visible="False" />
                        <asp:BoundField DataField="ThoiGianBatDauSua" HeaderText="Start time" />
                        <asp:BoundField DataField="ThoiGianKetThuc" HeaderText="End time" />
                        <asp:BoundField DataField="NguoiSua" HeaderText="Repairer" />
                        <asp:BoundField DataField="CodeSuCo" HeaderText="Issue code" />
                        <asp:BoundField DataField="CacHangMucKiemTra" HeaderText="Inspection items" />
                        <asp:BoundField DataField="NguyenNhanLoi" HeaderText="Root cause" />
                        <asp:BoundField DataField="HangDongKhacPhuc" HeaderText="Corrective action" />

                        <asp:TemplateField>
                            <HeaderTemplate>
                                Status
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelSuaDuocHayKhong" runat="server"
                                    Text='<%# Convert.ToBoolean(Eval("SuaDuocHayKhong"))? "Repaired" : "Not repaired yet" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ThoiGianDuKien" HeaderText="Estimated time" />
                        <asp:BoundField DataField="LyDoKhongSuaDuoc" HeaderText="Reason cannot be repaired immediately" />
                        <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" />
                        <asp:TemplateField HeaderText="View">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbXem" runat="server" CommandName='<%#"S|"+Eval("MaintenanceRepairID")%>' CssClass="btn btn-primary" Text="View details">
                                    
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbEdit" runat="server" CommandName='<%#"S|"+Eval("MaintenanceRepairID")%>' CssClass="btn btn-warning" Text="Edit"> </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbDelete" runat="server" CommandName='<%#"X|"+Eval("MaintenanceRepairID")%>' OnClientClick="return confirm('Do you want to delete?')" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField> 
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                </asp:GridView>
            </asp:Panel>
        </div>

    </div>
    <asp:Panel runat="server" ID="panelHide" Visible="false">
        MaintenanceRepairID:  
        <asp:TextBox ID="txtMaintenanceRepairID" runat="server" class="form-control"></asp:TextBox>
        RequestID: 
        <asp:TextBox ID="txtRequestID" runat="server" class="form-control"></asp:TextBox>
        User input ID: 
        <asp:TextBox ID="txtUserID" runat="server" class="form-control"></asp:TextBox>
    </asp:Panel>

    <script> 
        $(function () {
            $("#MainContent_txtNgayBatDauSua").datepicker({
                format: 'mm/dd/yyyy',
                todayHighlight: 'TRUE',
                autoclose: true,
            });

            $("#MainContent_txtNgayKetThucSua").datepicker({
                format: 'mm/dd/yyyy',
                todayHighlight: 'TRUE',
                autoclose: true,
            });
            $("#MainContent_txtThoiGianDuKien").datepicker({
                format: 'mm/dd/yyyy',
                todayHighlight: 'TRUE',
                autoclose: true,
            });
        });

    </script>
</asp:Content>
