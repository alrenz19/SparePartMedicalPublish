<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMainheader.ascx.cs" Inherits="QlyMain.ucControl.ucmainheader" %>



<header class="main-header">
    <!-- Logo -->
    <a href="~/index.aspx" class="logo" runat="server">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>AIH</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>AIH</b> CMMS</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>
        <div class="navbar-custom-menu">

            <ul class="nav navbar-nav">
                <!-- Messages: style can be found in dropdown.less-->
               
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="~/Content/dist/img/avatar5.png" runat="server" class="user-image" alt="User Image">
                        <span class="hidden-xs">
                            <asp:Literal ID="LiteralFullName" Text="text" runat="server" />
                        </span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <img src="~/Content/dist/img/avatar5.png" runat="server" class="img-circle" alt="User Image">

                            <p>
                                <asp:Literal ID="LiteralFullName2" Text="text" runat="server" />

                                <small>
                                    <asp:Literal ID="LiteralDeparmentName" Text="text" runat="server" />
                                </small>
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                            <%--<div class="col-xs-4 text-center">
                                <a href="#">Followers</a>
                            </div>
                            <div class="col-xs-4 text-center">
                                <a href="#">Sales</a>
                            </div>
                            <div class="col-xs-4 text-center">
                                <a href="#">Friends</a>
                            </div>--%>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <asp:HyperLink ID="HyperLinkProfile" NavigateUrl="~/UsersPage/Details2.aspx" runat="server"> Profile</asp:HyperLink>

                            </div>
                            <div class="pull-right">
                                <a href="~/Log.aspx" runat="server" class="btn btn-default btn-flat">Sign out</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- Control Sidebar Toggle Button -->
                <li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>
            </ul>
        </div>
    </nav>
</header>
