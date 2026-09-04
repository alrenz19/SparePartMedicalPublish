<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HistoryStatistical.aspx.cs" Inherits="QlyMain.History.HistoryStatistical" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background: #80808024;
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
        }
    </style>
    <div>
        <div class="page-header" style="text-align: center; margin: 0px; padding: 0px">
            <h2>Statistical charts
                          <small>
                              <asp:Label Text="" ID="lblOfMachine" runat="server" /></small>
            </h2>
        </div>
        <div>
            <div class="col-sm-5 col-md-5 col-lg-5">
                <div class="box-shadow1">
                    <h4 style="text-align: center"><b>Filter machine failures</b></h4>
                    <table class="table table">
                        <tr>
                            <td><b>Machine</b></td>
                            <td>
                                <%--                                <asp:TextBox runat="server" ID="txtMachineCode" autocomplete="off" />--%>
                                <input list="MainContent_myMachineCode" required name="myMachineCode"
                                    id="ttMachineCode" placeholder="Code/Name Machine..." runat="server"
                                    autocomplete="off">
                                <datalist id="myMachineCode" runat="server">
                                </datalist>
                            </td>
                           
                            <td>
                                <asp:LinkButton Text="Search" runat="server" ID="lbtSearchHistoryMachine" OnClick="lbtSearchHistoryMachine_Click"
                                    CssClass="btn btn-primary">
                        <span class="glyphicon glyphicon-search"></span> SEARCH
                                </asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                               <b> Group Machine</b>
                            </td>
                             <td>
                                <input list="MainContent_myMachineGroup" required name="myMachineGroup"
                                    id="txtGroupMachine" placeholder="Group Machine..." runat="server"
                                    autocomplete="off">
                                <datalist id="myMachineGroup" runat="server">
                                </datalist>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Div/Sec</b></td>
                            <td>
                                <%--                                <asp:TextBox runat="server" ID="txtDiv" autocomplete="off" />--%>
                                <input list="MainContent_myDiv" required name="myDiv"
                                    id="ttDiv" placeholder="Div..." runat="server"
                                    autocomplete="off">
                                <datalist id="myDiv" runat="server">
                                </datalist>
                            </td>
                        </tr>
                        <tr>
                            <td><b>Problem </b></td>
                            <td>
                                <asp:TextBox runat="server" ID="txtMaLoi" placeholder="Code/Name Problem..." autocomplete="off" />
                            </td>
                        </tr>
                        <tr>
                            <td><b>Group Name</b></td>
                            <td>
                                <asp:TextBox runat="server" ID="txtGroup" placeholder="AUTO LINE 1..." autocomplete="off" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label Text="" ID="lblThongbao" runat="server" />
                                <table>
                                    <tr>
                                        <td><b>From date:<sub style="color: red">*</sub></b> </td>
                                        <td>&nbsp;&nbsp;
                                <asp:TextBox runat="server" ID="txtFromDate" autocomplete="off" />

                                            <ajaxToolkit:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" TargetControlID="txtFromDate" />

                                        </td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp; <b>To Date :<sub style="color: red">*</sub> </b></td>
                                        <td>&nbsp;&nbsp;
                                <asp:TextBox runat="server" ID="txtToDate" autocomplete="off" />
                                            <ajaxToolkit:CalendarExtender ID="txtToDate_CalendarExtender" runat="server" TargetControlID="txtToDate" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-sm-7 col-md-7 col-lg-7" style="overflow: scroll">
                <asp:Panel Style="text-align: center;" runat="server" ID="pnChart1" Visible="false">
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
                <asp:Panel runat="server" ID="pnChart2" Visible="false">
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
                </asp:Panel>

            </div>
        </div>
        <div class="col-sm-1 col-md-1 col-lg-1">
        </div>
        <asp:HiddenField ID="_IdCodeMachine" runat="server" />
        <br />
        <div class="row">
            <div class="col-md-12">
            </div>
        </div>
        <div class="box-shadow1" style="display: none">
            <asp:LinkButton Text="" Visible="false" ID="lbkThongkeChart" runat="server" OnClick="lbkThongkeChart_Click">Link Chart</asp:LinkButton>
            <div class="col-md-4">
                <asp:Panel runat="server" ID="pnShowDong" Visible="false">
                    Number of lines displayed:
            <asp:DropDownList ID="ddlDong" runat="server"
                CssClass="dropdown" AutoPostBack="true"
                OnSelectedIndexChanged="ddlDong_SelectedIndexChanged">
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
                <asp:ListItem>100</asp:ListItem>
            </asp:DropDownList>
                </asp:Panel>
            </div>
            <asp:GridView runat="server" ID="gvListHistory"
                AutoGenerateColumns="False" CssClass="table table-bordered"
                CellPadding="4" ForeColor="#333333" GridLines="None"
                OnPageIndexChanging="gvListHistory_PageIndexChanging" AllowPaging="True"
                OnRowDataBound="gvListHistory_RowDataBound"
                EmptyDataText="Chưa có dữ liệu">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="CodeProblem">
                        <%-- <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CodeProblem") %>'></asp:TextBox>
                        </EditItemTemplate>--%>
                        <ItemTemplate>
                            <asp:Label Text="" ID="lblCodeProplem" runat="server" />
                            <asp:Label ID="lblCodeP" runat="server" Text='<%# Bind("CodeProblem") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lblMota" runat="server" Text='<%# Bind("Mota") %>' Visible="false"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Solan" HeaderText="Number of appearances" />
                    <asp:BoundField DataField="Time" HeaderText="Total Time" />
                    <asp:BoundField DataField="CodeMachine" HeaderText="Machine code" />
                    <asp:BoundField DataField="CodeProblem" HeaderText="Error code" />
                    <asp:BoundField DataField="ProblemName" HeaderText="Problem Name" />
                    <asp:BoundField DataField="NameMachine" HeaderText="Machine name" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle Font-Bold="True" ForeColor="DarkBlue" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                <PagerSettings Mode="NumericFirstLast" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

            </asp:GridView>
        </div>
        <div class="box-shadow1">
            <asp:LinkButton Text="Export Excel" Visible="false" runat="server" ID="lbkExportExcel"
                OnClick="lbkExportExcel_Click" />
            <asp:LinkButton Text="Export Excel" CssClass="btn btn-default" runat="server" ID="lbkExport" OnClick="lbkExport_Click" />
            <asp:Panel ID="PanelShow" runat="server">
                <div>
                    Number of lines displayed:
            <asp:DropDownList ID="ddlSoDong" runat="server"
                CssClass="dropdown" AutoPostBack="true"
                OnSelectedIndexChanged="ddlSoDong_SelectedIndexChanged">
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
                <asp:ListItem>100</asp:ListItem>
            </asp:DropDownList>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView ID="gvListHistoryByDate" runat="server"
                            AutoGenerateColumns="False" CellPadding="4"
                            OnPageIndexChanging="gvListHistoryByDate_PageIndexChanging"
                            EmptyDataText="Chưa có dữ liệu" AllowPaging="True"
                            CssClass="table table-bordered col-sm-12 col-md-12 col-lg-12"
                            OnRowDataBound="gvListHistoryByDate_RowDataBound">
                            <Columns>
                                <%--   <asp:BoundField DataField="ProblemIMG" HeaderText="ProblemIMG" />--%><%-- <asp:BoundField DataField="HandlingIMG" HeaderText="HandlingIMG" />--%><%--  <asp:BoundField DataField="ProblemURL" HeaderText="ProblemURL" />
                    <asp:BoundField DataField="HandlingURL" HeaderText="HandlingURL" />--%>
                                <%-- <asp:BoundField DataField="CodeMachineID" HeaderText="Code Machine ID" />--%>
                                <asp:TemplateField HeaderText=" + ">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                    <ItemStyle Width="10px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="id_History" HeaderText="id_History" Visible="False" />
                                <asp:BoundField DataField="CodeMachine" HeaderText="Machine Code" />
                                <asp:BoundField DataField="MachineName" HeaderText="Machine Name" />
                                <asp:BoundField DataField="Group" HeaderText="Group Name" />
                                <asp:BoundField DataField="DivSec" HeaderText="Div Sec" />
                                <asp:BoundField DataField="CodeProblem" HeaderText="CodeProblem" />
                                <asp:BoundField DataField="Problem" HeaderText="Problem" />
                                <asp:BoundField DataField="Reason" HeaderText="Reason" />
                                <asp:BoundField DataField="Handling" HeaderText="Handling" />
                                <asp:TemplateField HeaderText="Before Time">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBeforeTime" Text='<%# FormatDate(DataBinder.Eval(Container.DataItem, "BeforeTime").ToString()) %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="After Time">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAfterTime" Text='<%# FormatDate(DataBinder.Eval(Container.DataItem, "AfterTime").ToString()) %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Repair Time">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RepairTime") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblRepairTime" runat="server" Text='<%# Bind("RepairTime") %>' Visible="false"></asp:Label>
                                        <asp:Label Text="" ID="lblTimeRe" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Repairer" HeaderText="Repairer" />
                                <asp:TemplateField HeaderText="CreatedDate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCreatedDate" Text='<%# FormatDate(DataBinder.Eval(Container.DataItem, "CreatedDate").ToString()) %>' runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Remark" HeaderText="Remark" />
                            </Columns>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
    <script type="text/javascript">
        function dateselect_txtNgayThang(ev) {
            var calendarBehavior1 = $find("txtNgayThang_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("MMM.yyyy")
        }
        $(function () {
            $('.select2').select2()
        });
        $(function () {
            $('.selectCodeppCMHistory').select2()
        });
    </script>
</asp:Content>

