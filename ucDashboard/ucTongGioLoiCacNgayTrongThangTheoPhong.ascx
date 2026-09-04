<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTongGioLoiCacNgayTrongThangTheoPhong.ascx.cs"
    Inherits="QlyMain.ucDashboard.ucTongGioLoiCacNgayTrongThangTheoPhong" %>
<style>
    .chart-container {
        position: relative;
        width: 100%;
        height: 100%;
        /*max-width: 600px;*/ /* You can set any maximum size */
        min-height: 420px; /* You can set any maximum size */
    }
</style>
<div class="box box-solid">
    <div class="box-header with-border">
        <h3 class="box-title"><i class="fa fa-industry"></i>Chart Summary of errors by day in the month
            <asp:Label runat="server" ID="lblCurrentMonth" Text=""></asp:Label>
        </h3>
        <div class="pull-right box-tools">
            <button type="button" class="btn btn-box-tool btn-sm" data-widget="collapse" data-toggle="tooltip" title="View Report" style="margin-right: 5px;"
                data-original-title="Collapse">
                <i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                <i class="fa fa-times"></i>
            </button>

        </div>
        <!-- /. tools -->

    </div>
    <div class="box-body no-padding">
        <div class="chart-container">
            <canvas id="myChart"></canvas>
        </div>
        Chart type:
        <asp:DropDownList ID="ddlChartType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlChartType_SelectedIndexChanged">
            <asp:ListItem Text="Bar" Value="bar"></asp:ListItem>
            <asp:ListItem Text="Line" Value="line"></asp:ListItem>
        </asp:DropDownList> /
                <asp:CheckBox ID="cbShowDataLabels" runat="server" Text="Show values on columns"
    AutoPostBack="True"
    OnCheckedChanged="cbShowDataLabels_CheckedChanged" /> /
        Unit:
                    <asp:DropDownList ID="ddlChonGioPhut" runat="server" OnSelectedIndexChanged="ddlChonGioPhut_SelectedIndexChanged" AutoPostBack="true">
    <asp:ListItem Value="Hour" Selected="True">Hour</asp:ListItem>
    <asp:ListItem Value="Minute">Minute</asp:ListItem>
</asp:DropDownList>
        

    </div>
    <!-- /.box-body -->
</div>

<div class="box box-solid collapsed-box"">
    <div class="box-header with-border">
        <h3 class="box-title"><i class="fa fa-table"></i>Daily error summary data
            <asp:Label runat="server" ID="Label2" Text=""></asp:Label>
        </h3>
        <div class="pull-right box-tools">
            <button type="button" class="btn btn-box-tool btn-sm" data-widget="collapse" data-toggle="tooltip" title="View Report" style="margin-right: 5px;"
                data-original-title="Collapse">
                <i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                <i class="fa fa-times"></i>
            </button>

        </div>
        <!-- /. tools -->

    </div>
    <div class="box-body no-padding" style="display: none;">
        <asp:GridView ID="GridViewShow" runat="server" Visible="false"
            AutoGenerateColumns="False" GridLines="None"
            CssClass="table table-bordered table-striped table-condensed col-xs-12 table-responsive"
            ShowHeaderWhenEmpty="true"
            EmptyDataText="No machines are currently down"
            EmptyDataRowStyle-HorizontalAlign="Center" OnPageIndexChanging="GridViewShow_PageIndexChanging">


            <Columns>
                <asp:TemplateField HeaderText="Day/Month">

                    <ItemTemplate>
                        <b>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("myDay") %>'> 
                            </asp:Label>/<asp:Label ID="Label3" runat="server" Text='<%# Eval("myMonth") %>'> 
                            </asp:Label>
                        </b>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="total_Waittime_minutes" HeaderText="Waiting time for technician to arrive (Minutes)" />
                <asp:BoundField DataField="total_Fixtime_minutes" HeaderText="Repair time (Minutes)" />
                <asp:BoundField DataField="total_downtime_minutes" HeaderText="Machine downtime (Minutes)" />
                <asp:BoundField DataField="error_count" HeaderText="Number of downtimes" />

            </Columns>
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="pagination-ys" />
        </asp:GridView>


    </div>
</div>

<div class="box box-solid">
    <div class="box-header with-border">
        <h3 class="box-title"><i class="fa fa-table"></i>Daily error summary data  <b>by machine</b>
            <asp:Label runat="server" ID="Label4" Text=""></asp:Label>
        </h3>
        <div class="pull-right box-tools">
            <button type="button" class="btn btn-box-tool btn-sm" data-widget="collapse" data-toggle="tooltip" title="View Report" style="margin-right: 5px;"
                data-original-title="Collapse">
                <i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                <i class="fa fa-times"></i>
            </button>

        </div>
        <!-- /. tools -->

    </div>
    <div class="box-body no-padding">
        <asp:GridView ID="GridViewMachineErrorsByDay" runat="server"
            AutoGenerateColumns="False" GridLines="None"
            CssClass="table table-bordered table-striped table-condensed col-xs-12 table-responsive"
            ShowHeaderWhenEmpty="True"
            EmptyDataText="No machines are currently down"
            EmptyDataRowStyle-HorizontalAlign="Center" OnPageIndexChanging="GridViewMachineErrorsByDay_PageIndexChanging">


            <Columns>
                <asp:TemplateField HeaderText="Machine stopped">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CodeMachine") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLinkCodeMachine" runat="server" Font-Bold="true"
                            NavigateUrl='<%# String.Format("~/Baocao/MachineInfo.aspx?MachineId={0}&CodeMachine={1}",Eval("MachineId"), Eval("CodeMachine")) %>'
                            Text='<%# Bind("CodeMachine") %>'> 
                        </asp:HyperLink>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Day/Month">

                    <ItemTemplate>
                        <b>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("myDay") %>'> 
                            </asp:Label>/<asp:Label ID="Label3" runat="server" Text='<%# Eval("myMonth") %>'> 
                            </asp:Label>
                        </b>
                    </ItemTemplate>
                </asp:TemplateField>



                <asp:BoundField DataField="total_Waittime_minutes" HeaderText="Waiting time for technician to arrive (Minutes)" />
                <asp:BoundField DataField="total_Fixtime_minutes" HeaderText="Repair time (Minutes)" />
                <asp:BoundField DataField="total_downtime_minutes" HeaderText="Machine downtime (Minutes)" />
                <asp:BoundField DataField="error_count" HeaderText="Number of downtimes" />

            </Columns>

            <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>

            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="pagination-ys" />
        </asp:GridView>


    </div>
</div>
<!-- /. box -->


<script>
    window.onload = function () {
        var chartType = '<%= ChartType %>';
        var labels = <%= Labels %>;
        var _fixTime = <%= Fixtime %>;
        var _downTime = <%= Downtime %>;
        var _waitTime = <%= Waittime %>;
        ////////var maxYAxisValue = <%= MaxYAxisValue %>;
        var showDataLabels = <%= ShowDataLabels.ToString().ToLower() %>;
        var maxYAxisValue = Math.max(_downTime);
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            /*  type: 'bar',*/
            type: chartType,
            data: {
                labels: labels,
                datasets: [
                    {
                        /*  type: 'bar',*/
                        label: 'Downtime',
                        data: _downTime,
                        backgroundColor: 'rgba(65, 140, 240, 0.8)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1,
                        fill: chartType === 'line' ? false : true, // To not fill under the line if it's a line chart
                        tension: chartType === 'line' ? 0.1 : 0, // To make the line smoother if it's a line chart
                        //pointRadius: chartType === 'line' ? 0 : 3 // Hide markers if it's a line chart
                    },
                    {
                        /*type: 'line',*/
                        label: 'Repair time',
                        data: _fixTime,
                        backgroundColor: 'rgba(60, 179, 113, 0.8)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1,
                        fill: chartType === 'line' ? false : true, // To not fill under the line if it's a line chart
                        tension: chartType === 'line' ? 0.1 : 0, // To make the line smoother if it's a line chart
                        //pointRadius: chartType === 'line' ? 0 : 3 // Hide markers if it's a line chart
                    },
                    {

                        label: 'Waiting time',
                        data: _waitTime,
                        backgroundColor: 'rgba(252, 180, 65, 0.8)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1,
                        fill: chartType === 'line' ? false : true, // To not fill under the line if it's a line chart
                        tension: chartType === 'line' ? 0 : 0, // To make the line smoother if it's a line chart
                        //pointRadius: chartType === 'line' ? 0 : 3 // Hide markers if it's a line chart
                    }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        // max: maxYAxisValue // Set the maximum value of the Y axis
                        suggestedMax: maxYAxisValue // Set the maximum value of the Y axis to the largest value from the data 
                    }
                },
                plugins: {
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
