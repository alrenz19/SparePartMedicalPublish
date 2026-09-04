<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DepartmentReport.aspx.cs" Inherits="QlyMain.Baocao.DepartmentReport" %>

<%@ Register Src="~/ucDashboard/ucTongGioLoiCacNgayTrongThangTheoPhong.ascx" TagPrefix="uc1" TagName="ucTongGioLoiCacNgayTrongThangTheoPhong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="../Content/plugins/bootstrap-datetimepicker/moment-with-locales.min.js"></script>
    <script src="../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
    
    <script src="../Scripts/chart.js"></script>
    <script src="../Scripts/chartjs-plugin-datalabels.js"></script>



    <section class="content-header">
        <h1>Machine repair report <b style="color: red">.</b>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-2 col-sm-6 col-xs-6">
                Select Department: 
                            <asp:DropDownList ID="ddlColDiv" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlColDiv_SelectedIndexChanged"
                                CssClass="form-control">
                            </asp:DropDownList>
            </div>

            <div class="col-md-2 col-sm-6 col-xs-6">
                Section:  
                <asp:DropDownList ID="ddlColSec" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlColSec_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="col-md-2 col-sm-6 col-xs-6">
                From date
            <asp:TextBox runat="server" ID="txtFromDate" CssClass="form-control input-sm txtFromDate" placeholder="From Date.."></asp:TextBox>
            </div>
            <div class="col-md-2 col-sm-6 col-xs-6">
                To date
             <asp:TextBox runat="server" ID="txtTodate" CssClass="form-control input-sm txtTodate" placeholder="To Date.."></asp:TextBox>
            </div>
            <div class="col-md-2 col-sm-6 col-xs-6">
                <br />
                <div class="input-group input-group">


                    <span class="input-group-btn">
                        <asp:LinkButton ID="lbtSearch" runat="server" OnClick="lbtSearch_Click" CssClass="btn btn-info btn-flat btn-sm">
                                               <span class="glyphicon glyphicon-search"></span> Search 
                        </asp:LinkButton>

                        <asp:LinkButton ID="lbkEport" runat="server" OnClick="lbkEport_CLick" CssClass="btn btn-default btn-flat btn-sm">
                            <span class="glyphicon glyphicon-save"></span> Export Excel 
                        </asp:LinkButton>
                        <asp:LinkButton ID="lbkEportFull" runat="server" OnClick="lbkEportFull_CLick" CssClass="btn btn-default btn-flat btn-sm">
                            <span class="glyphicon glyphicon-export"></span> Export Excel Full 
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButtonClear" runat="server" OnClick="lbtClear_Click" Visible="false" CssClass="btn btn-default btn-flat btn-sm">
                                <span class="glyphicon glyphicon-trash"></span> clear 
                        </asp:LinkButton>
                    </span>


                </div>
            </div>
        </div>
        <!--Tổng hợp lỗi theo từng ngày trong tháng-->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <uc1:ucTongGioLoiCacNgayTrongThangTheoPhong runat="server" ID="ucTongGioLoiCacNgayTrongThangTheoPhong" />
            </div>
        </div>
        <!--#Tổng hợp lỗi theo từng ngày trong tháng-->

        <br />
        <div class="row">
            <div class="col-md-12 ol-xs-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-industry"></i>Machine repair report</h3>
                        <div class="pull-right box-tools">
                            <button type="button" class="btn btn-box-tool btn-sm" data-widget="collapse" data-toggle="tooltip" title="View Report" style="margin-right: 5px;" data-original-title="Collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                                <i class="fa fa-times"></i>
                            </button>
                        </div>
                        <!-- /. tools -->
                    </div>
                    <div class="box-body" style="overflow: auto">
                        <asp:GridView runat="server" ID="GridViewFullReport" AutoGenerateColumns="False" AllowPaging="true"
                            OnPageIndexChanging="GridViewFullReport_PageIndexChanging"
                            CssClass="table table-striped">
                            <Columns>
                                <asp:TemplateField HeaderText="No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MachineId" HeaderText="MachineId" Visible="false" />
                                <asp:TemplateField HeaderText="Machine code">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLinkCodeMachine" runat="server" Font-Bold="true"
                                            NavigateUrl='<%# String.Format("~/Baocao/MachineInfo.aspx?MachineId={0}&CodeMachine={1}",Eval("MachineId"), Eval("CodeMachine")) %>'
                                            Text='<%# Bind("CodeMachine") %>'> 
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MachineName" HeaderText="Machine name" />
                                <asp:BoundField DataField="MachineGroup" HeaderText="Machine group" />
                                <asp:BoundField DataField="ProblemName" HeaderText="Problem" />
                                <asp:BoundField DataField="NguyenNhanLoi" HeaderText="Reason" />
                                <asp:BoundField DataField="HangDongKhacPhuc" HeaderText="Fix" />

                                <asp:BoundField DataField="ThoiGianBatDauSua" HeaderText="Start time" />
                                <asp:BoundField DataField="ThoiGianKetThuc" HeaderText="End time" />
                                <asp:BoundField DataField="ThoiGianSua" HeaderText="Repair time" />
                                <asp:BoundField DataField="NguoiSua" HeaderText="Repairer" />
                                <asp:BoundField DataField="NgayLoi" HeaderText="Date created" />

                                <asp:BoundField DataField="CodeSuCo" HeaderText="Trouble Code" />
                                <asp:BoundField DataField="DepartmentName" HeaderText="Department Name" />
                                <asp:BoundField DataField="DepartmentCode" HeaderText="Department Group" />
                                <asp:BoundField DataField="CreatedMonth" HeaderText="Month" />
                                <asp:BoundField DataField="CreatedYear" HeaderText="Year" />
                                <asp:BoundField DataField="Remark" HeaderText="Remark" />

                            </Columns>
                            <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle CssClass="pagination-ys" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 ol-xs-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-industry"></i>Machine downtime</h3>
                        <div class="pull-right box-tools">
                            <button type="button" class="btn btn-box-tool btn-sm" data-widget="collapse" data-toggle="tooltip" title="View Report" style="margin-right: 5px;" data-original-title="Collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                                <i class="fa fa-times"></i>
                            </button>


                        </div>
                        <!-- /. tools -->

                    </div>
                    <div class="box-body">
                        <asp:GridView runat="server" ID="gvMayHong" AutoGenerateColumns="False"
                            AllowPaging="True" OnPageIndexChanging="gvMayHong_PageIndexChanging"
                            CssClass="table table-striped">
                            <Columns>
                                <asp:TemplateField HeaderText="No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MachineId" HeaderText="MachineId" Visible="false" />
                                <asp:TemplateField HeaderText="Machine code">

                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLinkCodeMachine" runat="server" Target="_blank" Font-Bold="true"
                                            NavigateUrl='<%# String.Format("~/Baocao/MachineInfo.aspx?MachineId={0}&CodeMachine={1}",Eval("MachineId"), Eval("CodeMachine")) %>'
                                            Text='<%# Bind("CodeMachine") %>'> 
                                        </asp:HyperLink>


                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MachineName" HeaderText="Machine name" />
                                <asp:BoundField DataField="total_downtime_hours" HeaderText="Stop time" Visible="false" />
                                <asp:TemplateField HeaderText="Repair time">
                                    <HeaderTemplate>
                                        <asp:Label ID="TextBoxHeadtotal_Fixtime_minutes" runat="server" Text="Waiting time" ToolTip="&#105; Total machine repair time">
                                            <i class="fa fa-info-circle" aria-hidden="true" ></i>  Repair time
                                        </asp:Label>
                                    </HeaderTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("total_Fixtime_minutes") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("total_Fixtime_minutes") %>' ToolTip="Total machine repair time">

                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Waiting time">
                                    <HeaderTemplate>
                                        <asp:Label ID="TextBoxHeadtotal_Waittime_minutes" runat="server" Text="Waiting time" ToolTip="Waiting time for maint to come and fix the machine after it breaks down">
                                            <i class="fa fa-info-circle" aria-hidden="true" ></i> Waiting time
                                        </asp:Label>
                                    </HeaderTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("total_Waittime_minutes") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("total_Waittime_minutes") %>' ToolTip="Waiting time for maint to come and fix the machine after it breaks down"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total (Minutes) Stop">
                                    <HeaderTemplate>
                                        <asp:Label ID="TextBoxHeadtotal_downtime_minutes" runat="server" Text="Total (Minutes) Stop" ToolTip="Total downtime">
                                             <i class="fa fa-info-circle" aria-hidden="true" ></i> Stop Time (Minutes)
                                        </asp:Label>
                                    </HeaderTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("total_downtime_minutes") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("total_downtime_minutes") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Right" />
                                    <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Total number of machine stops">
                                    <HeaderTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("error_count") %>' ToolTip="Number of machine stops">
                                             <i class="fa fa-info-circle" aria-hidden="true" ></i> Number of stops

                                        </asp:Label>

                                    </HeaderTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("error_count") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblError_count" runat="server" Text='<%# Bind("error_count") %>'></asp:Label>

                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                                </asp:TemplateField>

                            </Columns>
                            <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle CssClass="pagination-ys" />
                        </asp:GridView>
                    </div>
                </div>

            </div>
            <div class="col-md-6 ol-xs-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-industry"></i>Top 10 errors</h3>
                        <div class="pull-right box-tools">
                            <button type="button" class="btn btn-box-tool btn-sm" data-widget="collapse" data-toggle="tooltip" title="View Report" style="margin-right: 5px;" data-original-title="Collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                                <i class="fa fa-times"></i>
                            </button>


                        </div>
                        <!-- /. tools -->

                    </div>
                    <div class="box-body">
                        <asp:GridView runat="server" ID="gvTopLoi" AutoGenerateColumns="False"
                            AllowPaging="true" OnPageIndexChanging="gvTopLoi_PageIndexChanging"
                            CssClass="table table-striped">
                            <Columns>
                                <asp:TemplateField HeaderText="No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MachineId" HeaderText="MachineId" Visible="false" />
                                <asp:TemplateField HeaderText="Mã máy">

                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLinkCodeMachine" runat="server" Target="_blank" Font-Bold="true"
                                            NavigateUrl='<%# String.Format("~/Baocao/MachineInfo.aspx?MachineId={0}&CodeMachine={1}",Eval("MachineId"), Eval("CodeMachine")) %>'
                                            Text='<%# Bind("CodeMachine") %>'> 
                                        </asp:HyperLink>


                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MachineName" HeaderText="Machine name" />
                                <asp:BoundField DataField="CodeSuCo" HeaderText="Trouble Code" />
                                <asp:BoundField DataField="SoLan" HeaderText="Number of times" />


                            </Columns>
                            <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle CssClass="pagination-ys" />
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </div>
    </section>




    <script>  
        $(function () {
            $('.txtFromDate').datetimepicker({
                format: 'MM/DD/yyyy'
            });
            $('.txtTodate').datetimepicker({
                format: 'MM/DD/yyyy'
            });
        });

    </script>
</asp:Content>
