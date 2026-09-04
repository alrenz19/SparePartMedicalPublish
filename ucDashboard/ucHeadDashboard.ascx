<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucHeadDashboard.ascx.cs" Inherits="QlyMain.ucDashboard.ucHeadDashboard" %>

 <script type="text/javascript">
     $(document).ready(function () {
     // Effect for lblMayDangDungChoLinhKien
            <%--var lblMayDangDungChoLinhKien = $('#<%= lblMayDangSua.ClientID %>');
            lblMayDangDungChoLinhKien.animate({ fontSize: "1.2em" }, 1500).slideUp(2000).slideDown(2000);--%>

            var lblMayDangSua = $('#<%= lblMayDangSua.ClientID %>');
            lblMayDangSua.animate({ fontSize: "1.1em" }, 1500).slideDown(2000);

            var lblMayDangDungChoLinhKien = $('#<%= lblMayDangDungChoLinhKien.ClientID %>');
            lblMayDangDungChoLinhKien.slideUp(1000).slideDown(1000);

            // Effect for lblSparePartDaHet
            var lblSparePartDaHet = $('#<%= lblSparePartDaHet.ClientID %>');
           /* lblSparePartDaHet.css("color", "white").slideUp(1000).slideDown(1000);*/
            lblSparePartDaHet.slideToggle(1000).slideToggle(1000);

            var lblSparePartDuoiAnToanKho = $('#<%=lblSparePartDuoiAnToanKho.ClientID %>');
            lblSparePartDuoiAnToanKho.slideUp(1000).slideDown(1000);

            <%--// Effect for lblSparePartDuoiAnToanKho
            var lblSparePartDuoiAnToanKho = $('#<%= lblSparePartDuoiAnToanKho.ClientID %>');
            lblSparePartDuoiAnToanKho.animate({ fontSize: "1.1em" }, 1500);--%>
        });
 </script>

<div class="box box-info">
    <div class="box-header ui-sortable-handle">
         <h3 class="box-title">NOTIFICATION</h3>
        <!-- tools box -->
        <div class="pull-right box-tools">

            <button type="button" class="btn btn-box-tool btn-sm" data-widget="collapse" data-toggle="tooltip" title="View Report" style="margin-right: 5px;" data-original-title="Collapse">
                <i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                <i class="fa fa-times"></i>
            </button>

        </div>
    </div>
    <div class="box-body">
 
        <div class="row">
            <div class="col-lg-3 col-md-3 col-xs-4">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="lblMayDangSua" Text="text" runat="server" />
                        </h3>

                        <p>Machines stopped, under repair</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a href="~/MachineRepair/RepairRequestss/List.aspx?phong=AIH&bophan=ALL&trangthai=Confirmed" class="small-box-footer" runat="server">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <div class="col-lg-3 col-md-3 col-xs-4">
                <!-- small box -->
                <div class="small-box bg-orange">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="lblMayDangDungChoLinhKien" Text="0" runat="server" />
                        </h3>

                        <p>Machines stopped waiting for spare parts</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a href="~/MachineRepair/RepairRequestss/List.aspx?phong=AIH&bophan=ALL&trangthai=Pending" class="small-box-footer" runat="server">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
        <%--    <div class="col-lg-3 col-md-3 col-xs-4">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <h3>
                            <asp:Label Text="text" ID="lblSparePartQuanTrongDuoiAnToanKho" runat="server" />
                            <sup style="font-size: 20px"></sup></h3>

                        <p>Critical spare parts have quantities below safety stock</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>--%>
            <!-- ./col -->
            <div class="col-lg-3 col-md-3 col-xs-4">
                <!-- small box -->
                <div class="small-box bg-yellow">
                    <div class="inner">
                        <h3>
                            <asp:Label ID="lblSparePartDaHet" Text="0" runat="server" /></h3>

                        <p>Spare parts out of stock</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>
                    <a href="~/Sparepart/SparepartMenu?all=all&filter=2" class="small-box-footer" runat="server">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-md-3 col-xs-4">
                <!-- small box -->
                <div class="small-box bg-green">
                    <div class="inner">
                        <h3>
                            <asp:Label Text="text" ID="lblSparePartDuoiAnToanKho" runat="server" />
                            <sup style="font-size: 20px"></sup>

                        </h3>

                        <p>Spare parts below safety stock</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-pie-graph"></i>
                    </div>
                    <a href="~/Sparepart/SparepartMenu?all=all&filter=1" runat="server" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->


        </div>

    </div>
</div>
