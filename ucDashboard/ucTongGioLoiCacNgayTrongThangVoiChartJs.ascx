<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTongGioLoiCacNgayTrongThangVoiChartJs.ascx.cs"
    Inherits="QlyMain.ucDashboard.ucTongGioLoiCacNgayTrongThangVoiChartJs" %>



<style>
    .chart-container {
        position: relative;
        width: 100%;
        height: 100%;
        /*max-width: 600px;*/ /* You can set any maximum size */
        min-height: 420px; /* You can set any maximum size */
    }
</style>
<div class="box box-info">
    <div class="box-header ui-sortable-handle" style="cursor: move;">
        <i class="fa fa-envelope"></i>

        <h3 class="box-title">REPAIR TIME AND MACHINE DOWNTIME </h3>
        <!-- tools box -->
        <div class="pull-right box-tools">
             <asp:DropDownList ID="ddlChonGioPhut" runat="server" OnSelectedIndexChanged="ddlChonGioPhut_SelectedIndexChanged" AutoPostBack="true">
     <asp:ListItem Value="Hour" Selected="True">Hour</asp:ListItem>
     <asp:ListItem Value="Minute">Minute</asp:ListItem>
 </asp:DropDownList>
            <button type="button" class="btn btn-box-tool btn-sm" data-widget="collapse" data-toggle="tooltip" title="View Report" style="margin-right: 5px;" data-original-title="Collapse">
                <i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                <i class="fa fa-times"></i>
            </button>
            <asp:HyperLink NavigateUrl="~/Baocao/DepartmentReport.aspx" runat="server" ID="HyperLinkViewReport">
              <i class="fa fa-bar-chart"></i>View Report
            </asp:HyperLink>
        </div>
    </div>
    <div class="box-body">

        <div class="chart-container">
            <canvas id="myChart"></canvas>
        </div>
        <asp:CheckBox ID="cbShowDataLabels" runat="server" Text="Show values on columns"
            AutoPostBack="True"
            OnCheckedChanged="cbShowDataLabels_CheckedChanged" />
      
         
    </div>
</div>
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
                        label: 'Downtime',
                        data: _downTime,
                        backgroundColor: 'rgba(65, 140, 240, 0.8)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 0
                    },
                    {
                        label: 'Repair time',
                        data: _fixTime,
                        backgroundColor: 'rgba(60, 179, 113, 0.8)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 0
                    },
                    {
                        label: 'Waiting time',
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
                        max: maxYAxisValue // Set the maximum value of the Y axis
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
