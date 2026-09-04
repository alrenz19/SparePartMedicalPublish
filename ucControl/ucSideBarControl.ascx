<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSideBarControl.ascx.cs"
    Inherits="QlyMain.ucControl.ucSideBarControl" %>

<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">


        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="treeview">
                <a href="~/index.aspx" runat="server">
                    <i class="fa fa-dashboard"></i><span>Dashboard</span>
                </a>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-lg fa-fw fa-table"></i><span>Máy và bảo dưỡng</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="~/MachinePage/List.aspx" runat="server"><i class="fa fa-circle-o"></i>Quản lý Máy</a></li> 
                    <li><a href="~/Admin/Scheduler" runat="server"><i class="fa fa-circle-o"></i>Kế hoạch bảo dưỡng</a></li>
                 </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-lg fa-fw fa-cogs"></i>
                    <span>Spare part</span>
                    <span class="label label-primary pull-right"></span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="~/Sparepart/SparepartMenu.aspx?all=all" runat="server"><i class="fa fa-circle-o"></i>Quản lý </a></li>
                    <li><a href="~/Sparepart/SafeStockHistory.aspx" runat="server"><i class="fa fa-circle-o"></i>Lịch sử an toàn kho</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-lg fa-fw fa-pie-chart"></i>
                    <span>Báo cáo Máy</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="~/Baocao/DepartmentReport.aspx" runat="server"><i class="fa fa-circle-o"></i>Theo Phòng</a></li>
                   <li><a href="~/Baocao/MachineInfo.aspx" runat="server"><i class="fa fa-circle-o"></i>Theo Máy</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="~/MachineRepair/RepairRequestss/List" runat="server">
                    <i class="fa fa-lg fa-fw fa-briefcase"></i><span>Yêu cầu sửa máy</span>
                </a>
            </li>
            <li class="treeview">
                <a href="~/MaintenanceLeaderPage/List" runat="server">
                    <i class="fa fa-lg fa-fw fa-bullhorn"></i><span> Đối sách của Main </span>
                </a>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-lg fa-fw fa-cube"></i>
                    <span>Fixed Assets</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="~/Accounting/Inventory" runat="server"><i class="fa fa-circle-o"></i>Inventory</a></li>
                    <li><a href="~/Admin/MngFA" runat="server"><i class="fa fa-circle-o"></i>ASSET DATA</a></li>
 
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-circle"></i>
                    <span>Quản lý khác</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="~/Sparepart/Sparepart_Machine" runat="server"><i class="fa fa-circle-o"></i>
                        Linking SP vs Machine
                    </a>

                    </li>
                    <li><a href="~/Departments/List.aspx" runat="server"><i class="fa fa-circle-o"></i>
                        Phòng</a></li>
                    <li><a href="~/UsersPage/List.aspx" runat="server"><i class="fa fa-user"></i>
                        Tài khoản</a></li> 
                    
                 
                    
                    <li><a href="~/MachineGroupPage/List.aspx" runat="server"><i class="fa fa-user"></i>
                        Nhóm máy</a></li>

                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-cutlery"></i>
                    <span>Công cụ</span>
                    <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="~/CreateQRCode/CreateQRCode.aspx" runat="server"><i class="fa fa-circle-o"></i>
                        Tạo mã QRCode
                    </a>
                    </li>
                </ul>
            </li>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
