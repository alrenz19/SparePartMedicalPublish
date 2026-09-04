<%@ Page Title="Statistical analysis of machine downtime" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HistoryChart.aspx.cs" Inherits="QlyMain.History.HistoryChart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #f3f6f9;
        }

        span.select2-selection.select2-selection--single {
            height: 35px;
        }

        .marginLeft150 {
            margin-left: 150px;
        }

        .box-shadow1 {
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
            margin-top: 1%;
            border: 1px solid #c09b9b;
            margin-bottom: 1%;
            margin-right: 1%;
            padding: 0.5%;
            background-color: white;
            border-radius: 2px;
            border-collapse: collapse;
            /*  border: 1px solid black;*/
        }
    </style>
    <script type="text/javascript">
        function dateselect_txtNgayThang(ev) {
            var calendarBehavior1 = $find("txtNgayThang_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("MMM.yyyy")
        }
        function dateselect_txtTimeFind(ev) {
            var calendarBehavior1 = $find("txtTimeFind_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            calendarBehavior1.get_element().value = d.format("MMM.yyyy")
        }
    </script>
    <div class="row">
        <div class="col-sm-1 col-md-1 col-lg-1"></div>
        <div class="col-sm-10 col-md-10 col-lg-10">
            <%--<div class="col-sm-2 col-md-2 col-lg-2">
                <div class="alert-info box-shadow1">
                    <span>
                        <i class="fa fa-bar-chart"></i>
                        <asp:Label Text="Biểu đồ thống kê lịch sử sửa máy" Font-Bold="true" CssClass="center" runat="server" />
                    </span>
                    <br />
                    <br />
                    <asp:LinkButton Text="text" runat="server" CssClass="alert-info">
                               Dữ liệu đồ thị
                    </asp:LinkButton>
                </div>
            </div>--%>
            <div>
                <div style="text-align: center">
                    <div class="page-header" style="text-align: center; margin: 0px; padding: 0px">
                        <h2><i class="fa fa-bar-chart" style="color: #218cbf; font-size: 30px"></i>Statistical analysis of machine downtime 
                          <small>
                              <asp:Label Text="" ID="lblOfMachine" runat="server" /></small>
                        </h2>
                        <span>

                            <label style="font-size: 20px; font-weight: bold; color: #607d8b" class="center">
                            </label>
                        </span>
                    </div>
                </div>
                <div style="text-align: center; width: auto; margin: 0" class="box-shadow1">
                    <table>
                        <tr>
                            <td><b>Machine</b><br />
                                <asp:DropDownList runat="server" ID="ddType" Height="35px" CssClass="btn btn-default selectType Height30">
                                </asp:DropDownList>
                            </td>
                            <td style="padding-left: 10px"><b>Time</b><br />
                                <asp:TextBox runat="server" Height="35px" autocomplete="off" placeholder="Select Time"
                                    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                                    ID="txtTimeFind" CssClass="form-control" />
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender" runat="server"
                                    OnClientDateSelectionChanged="dateselect_txtTimeFind"
                                    BehaviorID="txtTimeFind_CalendarExtender" TargetControlID="txtTimeFind" />
                            </td>
                            <td>
                                <br />
                                <asp:LinkButton Text="Search" Height="35px" CssClass="btn btn-default" runat="server" ID="lbkSearch" OnClick="lbkSearch_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <div style="margin: 0" class="box-shadow1">
                    <h4 style="font-weight: bold">1. Analysis trouble on monthly.</h4>
                    <div class="box-shadow1">
                        <asp:Panel Style="text-align: center; overflow: scroll;" runat="server" ID="pnChart3">
                            <asp:Chart ID="Chart3" runat="server">
                                <Series>
                                    <asp:Series Name="Series2" XValueMember="0" YValueMembers="2">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea3" BorderWidth="0">
                                        <AxisX TitleAlignment="Far" ArrowStyle="Lines">
                                            <MajorGrid LineWidth="0" />
                                        </AxisX>
                                        <AxisY Title="(Hr)" TitleAlignment="Far" TextOrientation="Auto" ArrowStyle="Lines">
                                            <MajorGrid LineWidth="0" />
                                        </AxisY>
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </asp:Panel>
                        <br />
                        <asp:Panel runat="server">
                            <div style="overflow:scroll">
                                <asp:Label Text="" ID="lblChart3" runat="server" />
                                <asp:GridView runat="server" Width="80%" Height="400px" 
                                    CssClass="table table-bordered marginLeft150 box-shadow1 center"
                                    ID="gvChart3">
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </div>
                    <hr style="border: 2px" />
                    <div class="box-shadow1">
                        <asp:Panel Style="text-align: center;overflow: scroll;" runat="server" ID="pnChart1">
                            <asp:Chart ID="Chart1" runat="server">
                                <Series>
                                    <asp:Series Name="Series1" XValueMember="0" YValueMembers="2">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BorderWidth="0">
                                        <AxisX TitleAlignment="Far" ArrowStyle="Lines">
                                            <MajorGrid LineWidth="0" />
                                        </AxisX>
                                        <AxisY Title="(Hr)" TitleAlignment="Far" ArrowStyle="Lines" TextOrientation="Auto">
                                            <MajorGrid LineWidth="0" />
                                        </AxisY>
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </asp:Panel>
                        <br />
                        <asp:Panel runat="server">
                            <asp:Label Text="" ID="lblChart1" runat="server" />
                            <asp:GridView runat="server" Width="80%" CssClass="table table-bordered marginLeft150 box-shadow1 center"
                                ID="gvChart1">
                            </asp:GridView>
                        </asp:Panel>
                    </div>
                </div>
                <div style="overflow: scroll; margin: 0" class="box-shadow1">
                    <h4 style="font-weight: bold">2. Analysis for each machine.</h4>
                    <div style="text-align: center;overflow: scroll;">
                        <asp:Chart ID="Chart2" runat="server" Height="550px">
                            <Titles>
                                <asp:Title ShadowOffset="3" Name="Items" />
                            </Titles>
                            <Legends>
                                <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                    LegendStyle="Row" />
                            </Legends>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea2" BorderColor="Transparent">
                                    <AxisX TitleAlignment="Far" ArrowStyle="Lines">
                                        <MajorGrid LineWidth="0" />
                                    </AxisX>
                                    <AxisY Title="(Hr)" TitleAlignment="Far" ArrowStyle="Lines" TextOrientation="Auto">
                                        <MajorGrid LineWidth="0" />
                                    </AxisY>
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </div>
                    <asp:GridView runat="server" Width="80%" CssClass="table table-bordered marginLeft150 box-shadow1 center"
                        ID="gvChart2">
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="col-sm-1 col-md-1 col-lg-1"></div>
    </div>
    <asp:HiddenField ID="_IdCodeMachine" runat="server" />
    <asp:HiddenField ID="_TypeCodeMachine" runat="server" />
    <script type="text/javascript">
        $(function () {
            $('.selectCodeppCMHistory').select2()
        });
        $(function () {
            $('.selectType').select2()
        });
    </script>
</asp:Content>
