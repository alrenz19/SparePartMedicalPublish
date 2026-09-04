<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTongGioLoiCacThangTrongNam.ascx.cs" Inherits="QlyMain.ucDashboard.ucTongGioLoiCacThangTrongNam" %>



<div class="box box-solid">
    <div class="box-header with-border">
        <h3 class="box-title"><i class="fa fa-industry"></i>Total errors per month in the year</h3>

        <div class="pull-right box-tools">

            <button type="button" class="btn btn-box-tool btn-sm" data-widget="collapse" data-toggle="tooltip" title="View Report" style="margin-right: 5px;" data-original-title="Collapse">
                <i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                <i class="fa fa-times"></i>
            </button>

            <asp:HyperLink NavigateUrl="~/Baocao/DepartmentReport.aspx" runat="server">
                        <i class="fa fa-bar-chart"></i>View Report
            </asp:HyperLink>
        </div>
        <!-- /. tools -->




    </div>
    <div class="box-body no-padding">
        <div class="" style="overflow: scroll">
            <asp:Chart ID="Chart1" runat="server" Height="500px" Width="600px">
                <Titles>
                    <asp:Title ShadowOffset="3" Name="Items" />
                </Titles>
                <Legends>
                    <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                        LegendStyle="Row" />
                </Legends>
                <ChartAreas>
                    <%--                <asp:ChartArea Name="ChartArea1" BorderWidth="0" />--%>

                    <asp:ChartArea Name="ChartArea1" BorderColor="Transparent">
                        <AxisX TitleAlignment="Far" ArrowStyle="Triangle" LineWidth="1">
                            <MajorGrid LineWidth="0" />
                        </AxisX>
                        <AxisY Title="(Hr)" TitleAlignment="Far" ArrowStyle="Triangle" LineWidth="1" TextOrientation="Auto">
                            <MajorGrid LineWidth="0" />
                        </AxisY>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
        <asp:GridView ID="GridViewShow" runat="server"
            AutoGenerateColumns="False" GridLines="None"
            CssClass="table table-bordered table-striped table-condensed col-xs-12 table-responsive"
            ShowHeaderWhenEmpty="true"
            EmptyDataText="No machines are currently down"
            EmptyDataRowStyle-HorizontalAlign="Center" OnPageIndexChanging="GridViewShow_PageIndexChanging">


            <Columns>
                <asp:TemplateField HeaderText="Month">

                    <ItemTemplate>



                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("myMonth") %>'> 
                        </asp:Label>

                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="total_Fixtime_minutes" HeaderText="Repair time" />
                <asp:BoundField DataField="total_downtime_minutes" HeaderText="Downtime" />
                <asp:BoundField DataField="total_Waittime_minutes" HeaderText="Waiting time until repair" />




            </Columns>
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="pagination-ys" />
        </asp:GridView>




    </div>
    <!-- /.box-body -->
</div>
<!-- /. box -->




