<%@ Page Title="Machine Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MachineInfo.aspx.cs"
    Inherits="QlyMain.Baocao.MachineInfo" %>
<%@ Register Src="~/ucControl/ucSparepartRepairByMachine.ascx" TagPrefix="uc1" TagName="ucSparepartRepairByMachine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/chart.js"></script>
    <script src="../Scripts/chartjs-plugin-datalabels.js"></script>
    <style>
        .box-shadow {
            box-shadow: 1px 1px 1px 0 rgba(0, 0, 0, 0.2), 0 1px 1px 0 rgba(0, 0, 0, 0.19);
            margin-top: 1%;
            margin-bottom: 1%;
            margin-right: 1%;
            padding: 0.5%;
            background-color: white;
            border-radius: 2px;
            border-collapse: collapse;
        }

        .chart-container {
            position: relative;
            width: 100%;
            height: 100%;
            /*max-width: 600px;*/ /* Bạn có thể đặt kích thước tối đa tùy ý */
            min-height: 420px; /* Bạn có thể đặt kích thước tối đa tùy ý */
        }
    </style>
    <link href="../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="../Content/plugins/bootstrap-datetimepicker/moment-with-locales.min.js"></script>
    <script src="../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <section class="content-header">
        <h1>Machine information        
        </h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">MachineInfo</li>
        </ol>
    </section>
    <asp:Literal ID="LiteralThongBao" runat="server"></asp:Literal>
    <section class="invoice">
        <!-- title row -->
        <div class="row">
            <div class="col-sm-12 invoice-col">
                <table class="no-border">
                    <tr>
                        <td>From date   
                                <br />
                            <asp:TextBox runat="server" ID="txtFromDate" CssClass="form-control input-sm txtFromDate" placeholder="From date.." Width="200px"></asp:TextBox>
                        </td>
                        <td>To date  
                                <br />
                            <asp:TextBox runat="server" ID="txtTodate" CssClass="form-control input-sm txtTodate" placeholder="To date.."></asp:TextBox></td>
                        <td>
                            <br />

                            <span class="input-group-btn">&nbsp;
                          
                            <asp:LinkButton ID="lbtSearch" runat="server" OnClick="lbtSearch_Click" CssClass="btn btn-info btn-flat btn-sm">
                                               <span class="glyphicon glyphicon-search"></span> Search 
                            </asp:LinkButton>

                            </span>

                        </td>

                    </tr>
                    <tr>
                        <td>Enter Machine Code (EB1-xxx):
                            <br />
                            <asp:TextBox runat="server" ID="txtMachineCode" CssClass="form-control"
                                placeholder="" Width="200px"></asp:TextBox>
                            (Or select Machine code in the list)
                            <br />
                            <asp:DropDownList runat="server" ID="ddlMachine" AutoPostBack="true" Width="150" CssClass="selectType" OnSelectedIndexChanged="ddlMachine_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:TextBox runat="server" ID="txtMachineID" Visible="false"></asp:TextBox>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
                <hr />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4">
                <h2 class="page-header">
                    <i class="fa fa-caret-right"></i>Machine code:
                    <asp:Label runat="server" ID="lblCodeMachine" Font-Bold="true" CssClass=""></asp:Label>
                </h2>
            </div>

            <!-- /.col -->
        </div>
        <!-- info row -->
        <div class="row invoice-info">

            <div class="col-sm-4 invoice-col">

                <b>Machine name:</b>
                <asp:Label runat="server" ID="lblMachineName"></asp:Label>
                <br />
                <b>Machine group:</b>
                <asp:Label runat="server" ID="lblMachineGroup"></asp:Label>
                <br />
                <b>Department Name:</b>
                <asp:Label runat="server" ID="lblDeparmentName"></asp:Label>
                <br />
                <b>Department Group:</b>
                <asp:Label runat="server" ID="lblDeparmentGroup"></asp:Label>
                <br />

            </div>


            <!-- /.col -->
        </div>
        <br />
        <!-- /.row -->

        <!-- Table row -->

        <div class="row">
            <div class="box-body no-padding">
                <div class="chart-container">
                    <canvas id="myChart"></canvas>
                </div>
                Chart type
               
                <asp:DropDownList ID="ddlChartType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlChartType_SelectedIndexChanged">
                    <asp:ListItem Text="Bar" Value="bar"></asp:ListItem>
                    <asp:ListItem Text="Line" Value="line"></asp:ListItem>
                </asp:DropDownList>
                /
                                <asp:CheckBox ID="cbShowDataLabels" runat="server" Text="Show values on columns"
                                    AutoPostBack="True"
                                    OnCheckedChanged="cbShowDataLabels_CheckedChanged" />
                /
       Unit:
                    <asp:DropDownList ID="ddlChonGioPhut" runat="server" OnSelectedIndexChanged="ddlChonGioPhut_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="Hour" Selected="True">Hour</asp:ListItem>
                        <asp:ListItem Value="Minute">Minute</asp:ListItem>
                    </asp:DropDownList>
            </div>
            <%--    <div class="col-md-12 col-xs-12 table-responsive" style="overflow: scroll">
                <asp:Chart ID="Chart1" runat="server" Height="600px" Width="1200px">
                    <Titles>
                        <asp:Title ShadowOffset="3" Name="Items" />
                    </Titles>
                    <Legends>
                        <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                            LegendStyle="Row" />
                    </Legends>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1" BorderColor="Transparent">
                            <AxisX TitleAlignment="Far" ArrowStyle="None" LineWidth="1">
                                <MajorGrid LineWidth="1" LineColor="WhiteSmoke" />
                            </AxisX>
                            <AxisY Title="(Hr)" TitleAlignment="Far" ArrowStyle="None" TextOrientation="Auto">
                                <MajorGrid LineWidth="1" LineColor="WhiteSmoke" />
                            </AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>

                <asp:LinkButton Text="ALL" ID="lbkAll" CssClass="btn btn-success" runat="server" OnClick="lbkAll_Click" />
                <asp:LinkButton Text="Downtime" ID="lbkDowntime" CssClass="btn btn-primary" runat="server" OnClick="lbkDowntime_Click" />
                <asp:LinkButton Text="Fixtime" ID="lbkFixtime" CssClass="btn btn-warning" runat="server" OnClick="lbkFixtime_Click" />
            </div>--%>
            <div class="col-md-6 col-xs-6 table-responsive">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Incident history</h3>
                    </div>
                    <div class="box-body">


                        <asp:GridView runat="server" ID="gvMayHong" AutoGenerateColumns="False"
                            CssClass="table table-striped">
                            <Columns>
                                <asp:TemplateField HeaderText="No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MachineId" HeaderText="MachineId" Visible="false" />
                                <asp:TemplateField HeaderText="Code machine">

                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLinkCodeMachine" runat="server" Font-Bold="true"
                                            NavigateUrl='<%# String.Format("~/Baocao/MachineInfo.aspx?MachineId={0}&CodeMachine={1}",Eval("MachineId"), Eval("CodeMachine")) %>'
                                            Text='<%# Bind("CodeMachine") %>'> 
                                        </asp:HyperLink>


                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Machine stop date">
                                    <HeaderTemplate>
                                        <asp:Label ID="TextBoxHeadtotal_downtime_minutes" runat="server" Text="Date" ToolTip="Machine stop date">
            <i class="fa fa-info-circle" aria-hidden="true" ></i> Date
                                        </asp:Label>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Font-Bold="true" Text='<%# Eval("NgayLoi") == null ? "N/A" : Eval("NgayLoi", "{0: dd.MMM.yy}") %>'> 
                                        </asp:Label>

                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Right" />

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Total (Minutes) Stop">
                                    <HeaderTemplate>
                                        <asp:Label ID="TextBoxHeadtotal_downtime_minutes" runat="server" Text="Total (Minutes) Stop" ToolTip="Total downtime">
            <i class="fa fa-info-circle" aria-hidden="true" ></i> Stop Time (Minutes)
                                        </asp:Label>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("total_downtime_minutes") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Total (Minutes) Edited">
                                    <HeaderTemplate>
                                        <asp:Label ID="TextBoxHeadtotal_fix_time_minutes" runat="server" Text="Total (Minutes) Edited" ToolTip="Total machine repair time">
            <i class="fa fa-info-circle" aria-hidden="true" ></i> Edit Time (Minutes)
                                        </asp:Label>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <asp:Label ID="lbltotal_Fixtime_minutes" runat="server" Text='<%# Bind("total_Fixtime_minutes") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CodeSuCo" HeaderText="Mã Sự cố" />
                                <asp:TemplateField HeaderText="Request No">
                                    <ItemTemplate>

                                        <asp:HyperLink ID="HyperLinkRequestNo" runat="server" Font-Bold="true"
                                            NavigateUrl='<%# String.Format("~/MachineRepair/RepairRequestss/Details.aspx?RequestID={0}&RequestNo={1}",Eval("RequestID"), Eval("RequestNo")) %>'
                                            Text='<%# Bind("RequestNo") %>'> 
                                        </asp:HyperLink>
                                    </ItemTemplate>

                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>
                    </div>
                </div>

            </div>
            <div class="col-1-md-6 col-sm-6">

                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Spare used for repair</h3>
                    </div>
                    <div class="box-body">
                        <uc1:ucSparepartRepairByMachine runat="server" ID="ucSparepartRepairByMachine" />
                    </div>
                    <!-- /.box-body -->
                </div>

            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-1-md-6 col-sm-6 table-responsive">

                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Manual</h3>
                    </div>
                    <div class="box-body box-shadow">
                        <asp:DataList runat="server" ID="dlManual" CssClass="table-bordered">
                            <ItemTemplate>
                                <asp:HyperLink ID="headlineLink" runat="server" Text='<%# Eval("ManunalName") %>' NavigateUrl='<%# Eval("ManunalURL") %>' />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <!-- /.box-body -->
                </div>

            </div>
            <div class="col-1-md-6 col-sm-6 table-responsive">

                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">SOP</h3>
                    </div>
                    <div class="box-body box-shadow">
                        <asp:DataList runat="server" ID="dlSOP" CssClass="table-bordered table-hover scr">
                            <ItemTemplate>
                                <asp:HyperLink ID="headlineLink" runat="server" Text='<%# Eval("SOPName") %>' NavigateUrl='<%# Eval("SOP_URL") %>' />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <!-- /.box-body -->
                </div>

            </div>
        </div>

        <!-- /.row -->
        <div class="row">
            <div class="col-1-md-6 col-sm-6 table-responsive">

                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Plan</h3>
                    </div>
                    <div class="box-body box-shadow">
                        <asp:DataList runat="server" ID="dlPlan" CssClass="table-bordered">
                            <ItemTemplate>
                                <asp:HyperLink ID="headlineLink" runat="server" Text='<%# Eval("PlanName") %>' NavigateUrl='<%# Eval("PlanURL") %>' />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <!-- /.box-body -->
                </div>

            </div>
            <div class="col-1-md-6 col-sm-6 table-responsive">

                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Check Sheet (System)</h3>
                    </div>
                    <div class="box-body box-shadow">
                        <asp:DataList runat="server" ID="dlCheckSheet" CssClass="table-bordered">
                            <ItemTemplate>
                                <asp:HyperLink ID="headlineLink" runat="server" Text='<%# Eval("CheckSheetName") %>' NavigateUrl='<%# Eval("CheckSheetURL") %>' />
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <!-- /.box-body -->
                </div>

            </div>
        </div>
    </section>





    <%--    <asp:Chart ID="ChartTheoThang" runat="server" Width="400" Height="200" >
        <Series>
            <asp:Series Name="Series1" ChartType="Column">
                <Points>
                    <asp:DataPoint XValue="1" YValues="5" />
                    <asp:DataPoint XValue="2" YValues="8" />
                    <asp:DataPoint XValue="3" YValues="10" />
                    <asp:DataPoint XValue="4" YValues="6" />
                    <asp:DataPoint XValue="5" YValues="12" />
                    <asp:DataPoint XValue="6" YValues="9" />
                </Points>
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1" >
                <AxisY Title="Số lượng máy hỏng" />
                <AxisX Title="Tháng" Interval="1" />
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>--%>




    <script>  
        $(function () {
            $('.txtFromDate').datetimepicker({
                format: 'MM/DD/yyyy'
            });
            $('.txtTodate').datetimepicker({
                format: 'MM/DD/yyyy'
            });
            $(function () {
                $('.selectType').select2();
            });
        });

    </script>

    <script>
        window.onload = function () {
            var labels = <%= Labels %>;
            var _fixTime = <%= Fixtime %>;
            var _downTime = <%= Downtime %>;
            var _waitTime = <%= Waittime %>;
            var maxYAxisValue = <%= MaxYAxisValue %>;

            var showDataLabels = <%= ShowDataLabels.ToString().ToLower() %>;

            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [
                        {
                            label: 'Thời gian dừng',
                            data: _downTime,
                            backgroundColor: 'rgba(65, 140, 240, 0.8)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 0
                        },
                        {
                            label: 'Thời gian sửa',
                            data: _fixTime,
                            backgroundColor: 'rgba(60, 179, 113, 0.8)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 0
                        },
                        {
                            label: 'Thời gian chờ',
                            data: _waitTime,
                            backgroundColor: 'rgba(252, 180, 65, 0.8)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 0
                        }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            //suggestedMax: maxYAxisValue // Thiết lập giá trị tối đa của trục Y
                        }
                    },
                    plugins:
                    {
                        legend: {
                            position: 'bottom' // Đặt vị trí của legend ở phía dưới
                        },
                        datalabels: {
                            display: showDataLabels,
                            color: 'black',
                            align: 'top',
                            anchor: 'end'
                        }
                    }

                },
                plugins: [ChartDataLabels]
            });
        };
   </script>
</asp:Content>
