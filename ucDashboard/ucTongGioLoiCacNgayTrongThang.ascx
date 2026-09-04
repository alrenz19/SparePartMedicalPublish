<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTongGioLoiCacNgayTrongThang.ascx.cs" Inherits="QlyMain.ucDashboard.ucTongGioLoiCacNgayTrongThang" %>

<div class="box box-solid">
    <div class="box-header with-border">
        <h3 class="box-title"><i class="fa fa-industry"></i>Total errors by day in the month
            <asp:Label runat="server" ID="lblCurrentMonth"></asp:Label>
        </h3>
        <div class="pull-right box-tools">
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
        <!-- /. tools -->

    </div>
    <div class="box-body no-padding">
        <div class="" style="overflow: scroll; display:none;">
            <div id="chartContainer" class="chart-container">
                <asp:Chart ID="Chart1" runat="server" Height="600px" Width="1200px" Visible="false">
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
                            <AxisY Title="(Hr)" TitleAlignment="Far" ArrowStyle="None" LineWidth="1" TextOrientation="Auto">
                                <MajorGrid LineWidth="1" LineColor="WhiteSmoke" />
                            </AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
        </div>

        <asp:GridView ID="GridViewShow" runat="server" 
            AutoGenerateColumns="False" GridLines="None"
            CssClass="table table-bordered table-striped table-condensed col-xs-12 table-responsive"
            ShowHeaderWhenEmpty="true"
            EmptyDataText="No machines are currently down"
            EmptyDataRowStyle-HorizontalAlign="Center" OnPageIndexChanging="GridViewShow_PageIndexChanging">


            <Columns>
                <asp:TemplateField HeaderText="Day/Month">

                    <ItemTemplate>

                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("myDay") %>'> 
                        </asp:Label>
                        /
                     <asp:Label ID="Label3" runat="server" Text='<%# Eval("myMonth") %>'> 
                     </asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="total_Waittime_minutes" HeaderText="Waiting time for technician to arrive (Minutes)" />
                <asp:BoundField DataField="total_Fixtime_minutes" HeaderText="Repair time (Minutes)" />
                <asp:BoundField DataField="total_downtime_minutes" HeaderText="Machine downtime (Minutes)" />
            </Columns>
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="pagination-ys" />
        </asp:GridView>


    </div>
    <!-- /.box-body -->
</div>
<!-- /. box -->
