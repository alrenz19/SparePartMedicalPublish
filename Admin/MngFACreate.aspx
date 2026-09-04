<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MngFACreate.aspx.cs" Inherits="QlyMain.Admin.MngFACreate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .boxshadow {
            box-shadow: 1px 3px 6px #dadada00 !important;
        }

        .StyleClose {
            color: white;
            font-size: 34px;
            padding: 5px;
            box-shadow: 1px 2px 3px 4px #ffffff;
        }

        .box-shadow1 {
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
            margin-top: 1%;
            margin-bottom: 1%;
            margin-right: 1%;
            padding: 0.5%;
            background-color: white;
            border-radius: 2px;
            border-collapse: collapse;
        }

        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            padding: 10px 10px 8px 10px;
        }

        .textStyle {
            font-weight: 600;
            color: #607D8B;
        }

        .fixed-header {
            position: sticky;
            top: 50px;
            background-color: white;
            z-index: 100;
        }

        .Top0 {
            top: 0px !important;
        }

        .box {
            background: white;
            box-shadow: 0 4px 8px 0 rgb(67 65 65 / 20%), 0 6px 20px 0 rgb(255 255 255 / 0%);
            padding: 2px 0 2px 0;
            width: 100%;
            zoom: 96%;
            padding: 0 15px 0 15px;
            margin-bottom: 2px;
            border-bottom: 2px solid #8cb6ca;
        }

        .ShadowBtn {
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
        }

        .btn-st {
            color: white;
            background: #607d8b;
        }

        .Heigh35 {
            height: 35px;
        }

        html {
            scroll-behavior: smooth;
        }

        .font27 {
            font-size: 27px;
        }

        body {
            background-color: #ececec;
        }

        .center {
            text-align: center;
        }

        .positon0 {
            top: 0;
            bottom: 0;
        }

        @media screen and (max-width: 720px) {
            html {
                scroll-behavior: smooth;
                font-size: 12px;
            }

            .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
                padding: 6px 7px 7px 6px;
                font-size: 11px;
                border: 1px solid #e6e4e4;
            }

            .font27 {
                font-size: 14px;
            }

            .Heigh35 {
                height: 27px;
                font-size: 10px;
            }

            .Top0 {
                top: 0px !important;
            }
        }

        @media screen and (-webkit-min-device-pixel-ratio: 0) {
            .effects {
                position: relative;
                overflow: hidden;
            }

            .fallback {
                opacity: 0;
            }
        }
    </style>
    <link href="../Content/css/bootstrap-multiselect.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap-multiselect.js"></script>
    <script type="text/javascript">       
        $('[id*=ddType]').multiselect({
            includeSelectAllOption: true
        });
        function dateselect_txtUpdate(ev) {
            var calendarBehavior1 = $find("txtUpdate_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            calendarBehavior1.get_element().value = d.format("dd-MMM-yyyy");
        }
    </script>
    <section class="content">
        <div class="row">
            <div>
                <div class="col-sm-1 col-md-1 col-lg-1"></div>
                <div class="col-sm-10 col-md-10 col-lg-10">
                    <div class="messagealert" id="alert_container">
                    </div>
                    <div class="intro1">
                        <div>
                            <div style="text-align: center">
                                <asp:Label Text="Create New" CssClass="center font27" ForeColor="#607D8B" Font-Bold="true" runat="server" />
                            </div>
                            <table class="table box-shadow1" style="border-radius: 5px;">
                                <tr>
                                    <td style="width: 50%;">
                                        <asp:Label Text="Asset Class" CssClass="textStyle" runat="server" /><br />
                                        <asp:DropDownList runat="server" ID="ddAsset_Classs" CssClass="selectAssetClass" Width="300px"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddAsset_Classs_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <%-- <input list="MainContent_Asset_Classs" required name="myAsset_Class"
                                    id="txtAsset_Class" class="form-control Heigh35" placeholder="Asset Class" runat="server">
                                <datalist id="Asset_Classs" runat="server">
                                </datalist>--%>
                                    </td>
                                    <td style="width: 50%;" colspan="2">
                                        <asp:Label Text="SAP Code" CssClass="textStyle" runat="server" />
                                        <asp:Label Text="" ForeColor="#ff0000" ID="lblLastest" runat="server" />
                                        <br />
                                        <div class="input-group">
                                            <input list="MainContent_SAP_codes" required name="mySAP_code"
                                                id="txtSAP_code" class="form-control Heigh35" placeholder="SAP Code" runat="server">
                                            <datalist id="SAP_codes" runat="server">
                                            </datalist>
                                            <span class="input-group-btn" style="display: none">
                                                <asp:LinkButton Text="" runat="server" ID="lbkCheckSC" ForeColor="#00bcd4" CssClass="positon0 btn btn-default glyphicon glyphicon-leaf" OnClick="lbkCheckSC_Click" />
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%;">
                                        <asp:Label Text="Asset Name" CssClass="textStyle" runat="server" /><br />
                                        <input list="MainContent_Asset_Names" required name="myAsset_Name"
                                            id="txtAsset_Name" class="form-control Heigh35" placeholder="Asset Name" runat="server">
                                        <datalist id="Asset_Names" runat="server">
                                        </datalist>
                                    </td>
                                    <td style="width: 50%;" colspan="2">
                                        <asp:Label Text="Name2" CssClass="textStyle" runat="server" /><br />
                                        <input list="MainContent_Name2s" required name="myName2"
                                            id="txtName2" class="form-control Heigh35" placeholder="Name2" runat="server">
                                        <datalist id="Name2s" runat="server">
                                        </datalist>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%;">
                                        <asp:Label Text="Original Asset" CssClass="textStyle" runat="server" /><br />
                                        <input list="MainContent_Original_Assets" required name="myOriginal_Asset"
                                            id="txtOriginal_Asset" class="form-control Heigh35" placeholder="Original Asset" runat="server">
                                        <datalist id="Original_Assets" runat="server">
                                        </datalist>
                                    </td>
                                    <td style="width: 50%;" colspan="2">
                                        <asp:Label Text="Serial Number" CssClass="textStyle" runat="server" /><br />
                                        <input list="MainContent_SerialNumbers" required name="mySerialNumber"
                                            id="txtSerialNumber" class="form-control Heigh35" placeholder="Serial Number" runat="server">
                                        <datalist id="SerialNumbers" runat="server">
                                        </datalist>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%;">
                                        <asp:Label Text="Profit Center" CssClass="textStyle" runat="server" /><br />
                                        <input list="MainContent_ProfitCenters" required name="myProfitCenter"
                                            id="txtProfitCenter" class="form-control Heigh35" placeholder="Profit Center" runat="server">
                                        <datalist id="ProfitCenters" runat="server">
                                        </datalist>
                                    </td>
                                    <td style="width: 50%;" colspan="2">
                                        <asp:Label Text="ProfitCenter Name" CssClass="textStyle" runat="server" /><br />
                                        <input list="MainContent_ProfitCenterNames" required name="myProfitCenterName"
                                            id="txtProfitCenterName" class="form-control Heigh35" placeholder="ProfitCenter Name" runat="server">
                                        <datalist id="ProfitCenterNames" runat="server">
                                        </datalist>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%;">
                                        <asp:Label Text="Location" CssClass="textStyle" runat="server" /><br />
                                        <input list="MainContent_Locations" required name="myLocation"
                                            id="txtLocation" class="form-control Heigh35" placeholder="Location" runat="server">
                                        <datalist id="Locations" runat="server">
                                        </datalist>
                                    </td>
                                    <td style="width: 50%;" colspan="2">
                                        <asp:Label Text="Update Date" CssClass="textStyle" runat="server" /><br />
                                        <asp:TextBox runat="server" ID="txtUpdate" CssClass="form-control Heigh35" placeholder="Update Date" />
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server"
                                            OnClientDateSelectionChanged="dateselect_txtUpdate"
                                            BehaviorID="txtUpdate_CalendarExtender" TargetControlID="txtUpdate" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%;">
                                        <asp:Label Text="Received Amount" CssClass="textStyle" runat="server" /><br />
                                        <input list="MainContent_ReceivedAmounts" required name="myReceivedAmount"
                                            id="txtReceivedAmount" class="form-control Heigh35" placeholder="Received Amount" runat="server">
                                        <datalist id="ReceivedAmounts" runat="server">
                                        </datalist>
                                    </td>
                                    <td style="width: 50%;" colspan="2">
                                        <asp:Label Text="Book Amount" CssClass="textStyle" runat="server" /><br />
                                        <input list="MainContent_BookAmounts" required name="myBookAmount"
                                            id="txtBookAmount" class="form-control Heigh35" placeholder="Book Amount" runat="server">
                                        <datalist id="BookAmounts" runat="server">
                                        </datalist>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%;">
                                        <asp:Label Text="lifeTimeYear" CssClass="textStyle" runat="server" /><br />
                                        <input list="MainContent_lifeTimeYears" oninput="calculateMonths()" onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                                            required name="mylifeTimeYear"
                                            id="txtlifeTimeYear" class="form-control Heigh35" placeholder="Life Time Year" runat="server">
                                        <datalist id="lifeTimeYears" runat="server">
                                        </datalist>
                                    </td>
                                    <td style="width: 50%;" colspan="2">
                                        <asp:Label Text="lifeTimeMonth" CssClass="textStyle" runat="server" /><br />
                                        <input list="MainContent_lifeTimeMonths" name="mylifeTimeMonth" onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                                            id="txtlifeTimeMonth" class="form-control Heigh35" placeholder="Life Time Month" runat="server">
                                        <datalist id="lifeTimeMonths" runat="server">
                                        </datalist>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%;">
                                        <asp:Label Text="Invoice" CssClass="textStyle" runat="server" /><br />
                                        <input list="MainContent_Invoices" required name="myInvoice"
                                            id="txtInvoice" class="form-control Heigh35" placeholder="Invoice" runat="server">
                                        <datalist id="Invoices" runat="server">
                                        </datalist>
                                    </td>
                                    <td style="width: 50%;" colspan="2">
                                        <asp:Label Text="Remark" CssClass="textStyle" runat="server" /><br />
                                        <textarea id="txtRemark" required class="form-control Heigh35" placeholder="Remark" runat="server" cols="35" wrap="soft"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DropDownList runat="server" ID="dlType" CssClass="btn btn-default" onchange="showHideRingNo()">
                                            <asp:ListItem Text="--N/A--" Value="N/A" />
                                            <asp:ListItem Text="New" Value="New" />
                                            <asp:ListItem Text="Add Part" Value="AddPart" />
                                            <asp:ListItem Text="Waiting IQ" Value="WaitingIQ" />
                                            <asp:ListItem Text="Finish IQ" Value="FinishIQ" />
                                            <asp:ListItem Text="Using" Value="Using" />
                                            <asp:ListItem Text="Stop Using" Value="StopUsing" />
                                            <asp:ListItem Text="Shipping for repair" Value="Shipping" />
                                            <asp:ListItem Text="Disposal" Value="Disposal" />
                                            <asp:ListItem Text="Sale" Value="Sale" />
                                            <asp:ListItem Text="Change Section" Value="ChangeSection" />
                                            <asp:ListItem Text="Change Location" Value="ChangeLocation" />
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <div>
                                            <asp:Label Text="Ring No 1" CssClass="textStyle" runat="server" />
                                            <input list="MainContent_RingNo1s" required name="myRingNo1"
                                                id="txtRingNo1" class="form-control Heigh35" placeholder="Ring No 1" runat="server">
                                            <datalist id="RingNo1s" runat="server">
                                            </datalist>
                                        </div>
                                    </td>
                                    <td>
                                        <div id="ringNoContainer" style="display: none;">
                                            <asp:Label Text="Ring No 2" CssClass="textStyle" runat="server" />
                                            <input list="MainContent_RingNos" required name="myRingNo"
                                                id="txtRingNo" class="form-control Heigh35" placeholder="Ring No 2" runat="server">
                                            <datalist id="RingNos" runat="server">
                                            </datalist>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="margin-bottom: 20px">
                                        <asp:Label Text="Section Stock Check" CssClass="textStyle" runat="server" /><br />
                                        <input list="MainContent_SectionStockChecks" name="mySectionStockCheck"
                                            id="txtSectionStockCheck" class="form-control Heigh35" placeholder="" runat="server">
                                        <datalist id="SectionStockChecks" runat="server">
                                        </datalist>
                                    </td>
                                    <td colspan="2">
                                        <asp:Label Text="QRCode" CssClass="textStyle" runat="server" /><br />
                                        <asp:DropDownList runat="server" ID="ddQRCode" CssClass="btn btn-default">
                                            <asp:ListItem Text="--N/A--" Value="N/A" />
                                            <asp:ListItem Text="Can generate QRCode" Value="Y" />
                                            <asp:ListItem Text="Do not generate QRCode" Value="N" />
                                        </asp:DropDownList><br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                            <table style="margin-left: 10px">
                                <tr>
                                    <td>
                                        <asp:LinkButton Text="Save" CssClass="btn btn-default btn-st ShadowBtn" ID="lbkAdd" OnClick="lbkAdd_CLick" runat="server"><i class="fa fa-check"></i> Save </asp:LinkButton></td>
                                    <td>
                                        <asp:HyperLink ID="hyperlink2" CssClass="btn btn-default ShadowBtn" NavigateUrl="~/Admin/MngFA.aspx" runat="server"><i class="fa fa-remove"></i> Cancel </asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
                <div class="col-sm-1 col-md-1 col-lg-1"></div>
            </div>
            <asp:Panel runat="server">
                <div class="card-body ">
                    <asp:Panel ID="panelcheckEditSC" runat="server"
                        CssClass="modalPopup1 boxshadow Top0"
                        Style="display: none; width: 50%; height: 30%; background-color: #ffffff00">
                        <div class="col-md-12">
                            <div class="header" style="float: right">
                                <asp:LinkButton Text="X" Font-Size="20px" CssClass="StyleClose" ID="lbkClose" runat="server" />
                            </div>
                            <div class="popbody">
                                <div class="col-md-12" style="padding: 5px">
                                    <asp:GridView runat="server" ID="gvSC" AutoGenerateColumns="False" DataKeyNames="id"
                                        AllowPaging="True" PageSize="10" EnableViewState="true" ShowHeaderWhenEmpty="true"
                                        CssClass="table grStyle box-shadow1 center">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Asset_Class">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbAsset_Class" runat="server" Text='<%# Bind("Asset_Class") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SAP code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbSAP_code" runat="server" Text='<%# Bind("SAP_code") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Location">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbLocation" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Section Stock Check">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbSectionStockCheck" runat="server" Text='<%# Bind("SectionStockCheck") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton Text="Edit" runat="server" CssClass="btn btn-default btn-st ShadowBtn" />
                                                    <asp:LinkButton Text="Closed" runat="server" CssClass="btn btn-default btn-st ShadowBtn" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:LinkButton Text="" ID="lkEditSC" runat="server" />
                    <ajaxToolkit:ModalPopupExtender ID="MEditSC"
                        runat="server"
                        CancelControlID="lbkClose"
                        PopupControlID="panelcheckEditSC"
                        TargetControlID="lkEditSC"
                        BackgroundCssClass="modalBackground1">
                    </ajaxToolkit:ModalPopupExtender>
                </div>
            </asp:Panel>
        </div>
    </section>
    <script type="text/javascript">
        function showHideRingNo() {
            var dlType = document.getElementById('<%= dlType.ClientID %>');
            var txtRingNo = document.getElementById('<%= txtRingNo.ClientID %>');
            var ringNoContainer = document.getElementById('ringNoContainer');
            // Lấy giá trị đã chọn trong DropDownList
            var selectedValue = dlType.options[dlType.selectedIndex].value;
            // Kiểm tra giá trị và ẩn/hiển thị txtRingNo và ringNoContainer
            if (selectedValue == "AddPart" || selectedValue == "Disposal" || selectedValue == "Sale" || selectedValue == "ChangeSection" || selectedValue == "ChangeLocation") {
                txtRingNo.style.display = 'block';
                ringNoContainer.style.display = 'block';
                txtRingNo.focus();
            } else {
                txtRingNo.style.display = 'none';
                ringNoContainer.style.display = 'none';
            }
        }
        function calculateMonths() {
            var yearInput = document.getElementById('<%= txtlifeTimeYear.ClientID %>');
            var monthInput = document.getElementById('<%= txtlifeTimeMonth.ClientID %>');

            // Lấy giá trị nhập vào trường year
            var yearValue = parseInt(yearInput.value);

            // Tính giá trị tháng và gán vào trường month
            var monthValue = yearValue * 12;
            if (!isNaN(monthValue)) {
                monthInput.value = monthValue;
            }
        }
        $(function () {
            $('.selectAssetClass').select2();
        });
    </script>
</asp:Content>
