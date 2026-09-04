<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Inventory.aspx.cs" Inherits="QlyMain.Accounting.Inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .blink {
            animation: blinker 1s linear infinite;
        }

        @keyframes blinker {
            50% {
                opacity: 0;
            }
        }

        .box-shadow1 {
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
            background-color: white;
            border-radius: 2px;
            border-collapse: collapse;
            /*  border: 1px solid black;*/
        }

        .textStyle {
            font-weight: 600;
            color: #607D8B;
        }

        .floatRight {
            float: right;
        }

        .form-control {
            height: 30px;
            font-size: 13px;
        }
    </style>
    <script type="text/javascript">
        function dateselect_txtDeprStartDate(ev) {
            var calendarBehavior1 = $find("txtDeprStartDate_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            calendarBehavior1.get_element().value = d.format("dd.MMM.yyyy")
        }
        <%--window.onload = function () {
            var currentTime = new Date();
            var forbiddenTime = new Date('2024-01-10T11:31:00'); // Thời gian cần kiểm tra

            if (currentTime > forbiddenTime) {
                var lbkKiemKeElement = document.getElementById('<%= lbkKiemKe.ClientID %>');
                var lbtSaveElement = document.getElementById('<%= lbtSave.ClientID %>');

                // Ngăn chặn sự kiện click trên các nút khi vượt quá thời gian cần kiểm tra
                lbkKiemKeElement.addEventListener("click", function (event) {
                    event.preventDefault(); // Ngăn chặn hành động mặc định của sự kiện click
                    alert("Xin lỗi, Thời gian kiểm kê đã kết thúc [ từ 27.Dec.2023 đến 10.Jan.2024 ].");
                });

                lbtSaveElement.addEventListener("click", function (event) {
                    event.preventDefault(); // Ngăn chặn hành động mặc định của sự kiện click
                    alert("Xin lỗi, Thời gian kiểm kê đã kết thúc [ từ 27.Dec.2023 đến 10.Jan.2024 ].");
                });
            }
        };--%>
    </script>
    <div class="container box-shadow1">
        <br />
        <div class="row">
            <div class="col-md-12">
                <asp:HyperLink ID="hlkBack1" NavigateUrl="~/Admin/MngFA.aspx" Text="" ForeColor="#83959d" Font-Bold="true" runat="server"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i> Back</asp:HyperLink>
                <asp:Panel runat="server" CssClass="box-shadow2" DefaultButton="lbkFind">
                    <table class="table table-bordered">
                        <tr>
                            <td>
                                <asp:TextBox runat="server" CssClass="form-control"
                                    autocomplete="off"
                                    ID="txtFind" />
                            </td>
                            <td>
                                <asp:LinkButton ID="lbkFind" Height="35px"
                                    CssClass="btn btn-default btn-st" runat="server" OnClick="lbkFind_Click"> Search
                                        <i class="fa fa-search"></i>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <asp:Label ID="lblQRcode" CssClass="alert-warning" Font-Size="12px" runat="server"></asp:Label>
                    <span class="pull-left blink">
                        <asp:Label ID="lblThongbaoKQ" CssClass="alert-info blink" Font-Size="X-Large" runat="server" />
                    </span>
                </asp:Panel>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-xs-12">
                <asp:Label Text="Information item" runat="server" />
                <asp:Label ID="lblCountQRcode" CssClass="alert-success floatRight" runat="server"></asp:Label>
                <br />
                <div class="table-responsive">
                    <table class="table table-bordered table-condensed table-sm">
                        <tbody>
                            <tr>
                                <th style="width: 50%">Asset Class:</th>
                                <td>
                                    <asp:TextBox ID="txtAsset_Class"
                                        runat="server" CssClass="form-control"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th>Sap Code:</th>
                                <td>
                                    <asp:TextBox ID="txtSAP_code" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th>Asset Name:</th>

                                <td>
                                    <%-- <asp:TextBox ID="txtAsset_Name" CssClass="form-control"
                                        runat="server"></asp:TextBox>--%>
                                    <textarea id="trAsset_Name" required class="form-control" placeholder="Asset_Name" runat="server" rows="3" cols="36" wrap="soft"></textarea>

                                </td>
                            </tr>
                            <tr>
                                <th>Name2:
                                </th>
                                <td>
                                    <asp:TextBox ID="txtName2" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <th>Original Asset:  
                                </th>
                                <td>
                                    <asp:TextBox ID="txtOriginal_Asset" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <th>Serial Number:
                                </th>
                                <td>
                                    <asp:TextBox ID="txtSerialNumber" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <th>Profit Center:</th>
                                <td>
                                    <asp:TextBox ID="txtProfitCenter" CssClass="form-control" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <th>Profit Center Name:</th>
                                <td>
                                    <asp:TextBox ID="txtProfitCenterName" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <th>Location:       
                                </th>
                                <td>
                                    <asp:TextBox ID="txtLocation" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <th>Depr Start Date: </th>
                                <td>
                                    <asp:TextBox ID="txtDeprStartDate" CssClass="form-control" runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server"
                                        OnClientDateSelectionChanged="dateselect_txtDeprStartDate"
                                        BehaviorID="txtDeprStartDate_CalendarExtender" TargetControlID="txtDeprStartDate" />
                                </td>
                            </tr>
                            <tr>
                                <th>Update Date: </th>
                                <td>
                                    <asp:TextBox ID="txtUpdateDate" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <th>Received Amount:</th>

                                <td>
                                    <asp:TextBox ID="txtReceivedAmount" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <th>BookAmount :</th>
                                <td>
                                    <asp:TextBox ID="txtBookAmount" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <th>Remark :</th>
                                <td>
                                    <asp:TextBox ID="txtRemark" CssClass="form-control" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr style="display: none">
                                <th>State :</th>
                                <td>
                                    <asp:TextBox ID="txtStatus" Visible="false" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr style="display: none">
                                <th>Id :</th>
                                <td>
                                    <asp:Label ID="lblid" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <th>Inventory latest :</th>
                                <td>
                                    <asp:Label ID="lblInventoryLatest" CssClass="alert-error" runat="server"></asp:Label></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <asp:Label Text="Chưa kiểm kê" Visible="false" CssClass="alert alert-error" ID="lblNotInvent" runat="server" />
                <asp:LinkButton Text="Confirm Inventoried" ID="lbkKiemKe" CssClass="btn btn-info btn-st" runat="server" OnClick="lbkKiemKe_Click" />
                <asp:LinkButton Text="Save" ID="lbtSave" CssClass="btn btn-default btn-st" runat="server" OnClick="lbtSave_Click" />
                <br />
                <br />
                <asp:HyperLink ID="hlkBack2" Text="" ForeColor="#83959d" Font-Bold="true" runat="server">
                    <i class="fa fa-arrow-circle-left" aria-hidden="true"></i> Back</asp:HyperLink>
            </div>
        </div>
        <div class="messagealert" id="alert_container">
        </div>
    </div>
    <asp:HiddenField ID="_Machine" runat="server" />
    <asp:HiddenField ID="_scan" runat="server" />
    <asp:HiddenField ID="_SectionStockCheck" runat="server" />

</asp:Content>
