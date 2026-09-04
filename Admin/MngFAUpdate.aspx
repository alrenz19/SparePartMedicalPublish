<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="MngFAUpdate.aspx.cs" Inherits="QlyMain.Admin.MngFAUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/MngFA.css" rel="stylesheet" />
    <style>
        .marginLeft {
            margin-left: 10px;
        }

        .textStyle {
            font-weight: 600;
            color: #607D8B;
        }
        /*   html {
            scroll-behavior: smooth;
        }*/
        .Heigh35 {
            height: 35px;
        }

        .padding100 {
            padding: 100px;
        }

        body {
            background-color: #ececec;
        }

        .center {
            text-align: center;
        }

        .disable {
            pointer-events: none;
            background-color: #9e9e9e2e;
        }

        .imgSize {
            width: 150px;
            height: 150px;
        }

        .font25 {
            font-size: 25px;
        }

        @media screen and (max-width: 720px) {
            .font25 {
                font-size: 20px;
            }

            .Heigh35 {
                height: 27px;
                font-size: 10px;
            }

            .padding100 {
                padding: 2px;
            }

            .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
                padding: 4px;
                line-height: 1.428571;
                vertical-align: top;
                border-top: 1px solid #ddd;
                font-size: 10px;
            }

            .imgSize {
                width: 90px;
                height: 90px;
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
            /*
            .intro1 {
                -webkit-animation: slidetop1 2s ease;
                -webkit-transition-timing-function: linear;
            }
            @-webkit-keyframes slidetop1 {
                0% {
                    -webkit-transform: translateY(-100px);
                }

                20% {
                    -webkit-transform: translateY(-90px);
                }

                100% {
                    -webkit-transform: translateY(0px);
                }
            }*/
        }
    </style>
    <script type="text/javascript">
        function dateselect_txtUpdate(ev) {
            var calendarBehavior1 = $find("txtUpdate_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("dd.MMM.yyyy") + " " + now.format("HH:mm:ss")
        }
        $(window).bind('load', function () {
            var headerChk = $(".chkheader input");
            var itemChk = $(".chkitems input");
            headerChk.bind("click", function () {
                itemChk.each(function () { this.checked = headerChk[0].checked; })
            });
            itemChk.bind("click", function () { if ($(this).checked == false) headerChk[0].checked = false; });
        });
    </script>
    <div class="padding100">
        <div class="messagealert" id="alert_container">
        </div>
        <%-- Edit --%>
        <div class="intro1">
            <div style="text-align: center">
                <asp:Label Text="Update data " CssClass="font25" ForeColor="#006666" runat="server" /><br />
                <asp:Label Text="" ID="lblIDEdit" Visible="false" runat="server" />
                <asp:Image ID="imgFA" runat="server" CssClass="image-zoom marginLeft imgSize" onclick="zoomImage(this);" />
            </div>
            <asp:DataList runat="server" ID="dtlFA" OnItemDataBound="dtlFA_ItemDataBound" CssClass="table"
                OnItemCommand="dtlFA_ItemCommand" DataKeyField="id" Style="left: 0px; top: 0px">
                <ItemTemplate>
                    <table class="table">
                        <tr>
                            <td>
                                <asp:Label Text="Asset Class" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblAssetClass" runat="server" Text='<%# Bind("Asset_Class") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label Text="SAP Code" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblSAP_code" runat="server" Text='<%# Bind("SAP_code") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label Text="Asset Name" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblAsset_Name" runat="server" Text='<%# Bind("SAP_code") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text="Name2" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblName2" runat="server" Text='<%# Bind("Name2") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label Text="Original Asset" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblOriginal_Asset" runat="server" Text='<%# Bind("Original_Asset") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label Text="Serial Number" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblSerialNumber" runat="server" Text='<%# Bind("SerialNumber") %>'></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label Text="Profit Center" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblProfitCenter" runat="server" Text='<%# Bind("ProfitCenter") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label Text="ProfitCenter Name" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblProfitCenterName" runat="server" Text='<%# Bind("ProfitCenterName") %>'></asp:Label>
                            </td>

                            <td>
                                <asp:Label Text="Location" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text="Update Date" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblDeprStartDate" runat="server" Text='<%# Bind("DeprStartDate") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label Text="Received Amount" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblReceivedAmount" runat="server" Text='<%# Bind("ReceivedAmount") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label Text="Book Amount" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblBookAmount" runat="server" Text='<%# Bind("BookAmount") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text="Invoice" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblInvoice" runat="server" Text='<%# Bind("Invoice") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label Text="Life Time Year" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lbllifeTimeYear" runat="server" Text='<%# Bind("lifeTimeYear") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label Text="Life Time Month" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lbllifeTimeMonth" runat="server" Text='<%# Bind("lifeTimeMonth") %>'></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label Text="Remark" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label Text="Ring No 1" CssClass="textStyle" runat="server" />
                                <asp:Label ID="lblRingNo1" runat="server" Text='<%# Bind("RingNo") %>'></asp:Label>
                            </td>
                            <td id="ringNoContainer" style="display: none">
                                <asp:Label Text="Ring No 2" CssClass="textStyle" runat="server" />
                                <asp:Label ID="lblRingNo" runat="server" Text='<%# Bind("RingNo2") %>'></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Label ID="lblStatus" Visible="false" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                <asp:HyperLink ID="hklink" CssClass="width100" Text='<%# Bind("Status") %>' runat="server" />
                            </td>
                            <td>
                                <asp:Label Text="Section Stock Check" CssClass="textStyle" runat="server" /><br />
                                <asp:Label ID="lblSectionStockCheck" runat="server" Text='<%# Bind("SectionStockCheck") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:LinkButton Text="Edit" ID="lbkEdit" CssClass="btn btn-default btn-st" CommandName="Edit" runat="server" />
                                <asp:LinkButton Text="Inventoried" ID="lbkKiemKe" CssClass="btn btn-default btn-st" CommandName="Inventory" runat="server" />
                                <asp:HyperLink ID="hyblBackToDe" CssClass="btn btn-default" Text="" runat="server">
                                    <span class="glyphicon glyphicon-menu-left">Back</span></asp:HyperLink>
                                <%-- <asp:LinkButton ID="lbtCancel" runat="server" CommandName="Cancel"
                                    class="btn btn-default"
                                    data-dismiss="modal">Cancel</asp:LinkButton>--%>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <EditItemTemplate>
                    <table class="table">
                        <tr>
                            <td>
                                <asp:Label Text="Asset Class" CssClass="textStyle" runat="server" />
                                <br />
                                <input list="MainContent_Asset_Classs" required name="myAsset_Class"
                                    id="txtAsset_Class" value='<%# Bind("Asset_Class") %>' class="form-control Heigh35" placeholder="Asset Class" runat="server">
                                <datalist id="Asset_Classs" runat="server">
                                </datalist>
                            </td>
                            <td colspan="2">
                                <asp:Label Text="SAP Code" CssClass="textStyle" runat="server" /><br />
                                <input list="MainContent_SAP_codes" required name="mySAP_code" value='<%# Bind("SAP_code") %>'
                                    id="txtSAP_code" class="form-control Heigh35" placeholder="SAP Code" runat="server">
                                <datalist id="SAP_codes" runat="server">
                                </datalist>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text="Asset Name" CssClass="textStyle" runat="server" /><br />
                                <input list="MainContent_Asset_Names" required name="myAsset_Name" value='<%# Bind("Asset_Name") %>'
                                    id="txtAsset_Name" class="form-control Heigh35" placeholder="Asset Name" runat="server">
                                <datalist id="Asset_Names" runat="server">
                                </datalist>
                            </td>
                            <td colspan="2">
                                <asp:Label Text="Name2" CssClass="textStyle" runat="server" /><br />
                                <input list="MainContent_Name2s" required name="myName2" value='<%# Bind("Name2") %>'
                                    id="txtName2" class="form-control Heigh35" placeholder="Name2" runat="server">
                                <datalist id="Name2s" runat="server">
                                </datalist>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text="Original Asset" CssClass="textStyle" runat="server" /><br />
                                <input list="MainContent_Original_Assets" required name="myOriginal_Asset" value='<%# Bind("Original_Asset") %>'
                                    id="txtOriginal_Asset" class="form-control Heigh35" placeholder="Original Asset" runat="server">
                                <datalist id="Original_Assets" runat="server">
                                </datalist>
                            </td>
                            <td colspan="2">
                                <asp:Label Text="Serial Number" CssClass="textStyle" runat="server" /><br />
                                <input list="MainContent_SerialNumbers" required name="mySerialNumber" value='<%# Bind("SerialNumber") %>'
                                    id="txtSerialNumber" class="form-control Heigh35" placeholder="Serial Number" runat="server">
                                <datalist id="SerialNumbers" runat="server">
                                </datalist>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text="Profit Center" CssClass="textStyle" runat="server" /><br />
                                <input list="MainContent_ProfitCenters" required name="myProfitCenter" value='<%# Bind("ProfitCenter") %>'
                                    id="txtProfitCenter" class="form-control Heigh35" placeholder="Profit Center" runat="server">
                                <datalist id="ProfitCenters" runat="server">
                                </datalist>
                            </td>
                            <td colspan="2">
                                <asp:Label Text="ProfitCenter Name" CssClass="textStyle" runat="server" /><br />
                                <input list="MainContent_ProfitCenterNames" required name="myProfitCenterName" value='<%# Bind("ProfitCenterName") %>'
                                    id="txtProfitCenterName" class="form-control Heigh35" placeholder="ProfitCenter Name" runat="server">
                                <datalist id="ProfitCenterNames" runat="server">
                                </datalist>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text="Location" CssClass="textStyle" runat="server" /><br />
                                <input list="MainContent_Locations" required name="myLocation" value='<%# Bind("Location") %>'
                                    id="txtLocation" class="form-control Heigh35" placeholder="Location" runat="server">
                                <datalist id="Locations" runat="server">
                                </datalist>
                            </td>
                            <td colspan="2">
                                <asp:Label Text="Update Date" CssClass="textStyle" runat="server" /><br />
                                <asp:TextBox runat="server" ID="txtUpdate" CssClass="form-control Heigh35" Text='<%# Bind("DeprStartDate") %>' placeholder="Update Date" />
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                                    OnClientDateSelectionChanged="dateselect_txtUpdate"
                                    BehaviorID="txtUpdate_CalendarExtender" TargetControlID="txtUpdate" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text="Received Amount" CssClass="textStyle" runat="server" /><br />
                                <input list="MainContent_ReceivedAmounts" required name="myReceivedAmount" value='<%# Bind("ReceivedAmount") %>'
                                    id="txtReceivedAmount" class="form-control Heigh35" placeholder="Received Amount" runat="server">
                                <datalist id="ReceivedAmounts" runat="server">
                                </datalist>
                                </datalist>
                            </td>
                            <td colspan="2">
                                <asp:Label Text="Book Amount" CssClass="textStyle" runat="server" /><br />
                                <input list="MainContent_BookAmounts" required name="myBookAmount" value='<%# Bind("BookAmount") %>'
                                    id="txtBookAmount" class="form-control Heigh35" placeholder="Book Amount" runat="server">
                                <datalist id="BookAmounts" runat="server">
                                </datalist>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%;">
                                <asp:Label Text="lifeTimeYear" CssClass="textStyle" runat="server" /><br />
                                <input list="MainContent_lifeTimeYears" oninput="calculateMonths(this)" required name="mylifeTimeYear" onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                                    class="form-control Heigh35 lifeTimeInput" id="txtlifeTimeYear" data-target="txtlifeTimeYear" placeholder="life Time Year" runat="server">
                                <datalist id="lifeTimeYears" runat="server">
                                </datalist>
                            </td>
                            <td style="width: 50%;" colspan="2">
                                <asp:Label Text="lifeTimeMonth" CssClass="textStyle" runat="server" /><br />
                                <input list="MainContent_lifeTimeMonths" required name="mylifeTimeMonth" onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                                    class="form-control Heigh35 lifeTimeInput" id="txtlifeTimeMonth" data-target="txtlifeTimeMonth" placeholder="life Time Month" runat="server">
                                <datalist id="lifeTimeMonths" runat="server">
                                </datalist>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label Text="Invoice" CssClass="textStyle" runat="server" /><br />
                                <input list="MainContent_Invoices" required name="myInvoice" value='<%# Bind("Invoice") %>'
                                    id="txtInvoice" class="form-control Heigh35" placeholder="Invoice" runat="server">
                                <datalist id="Invoices" runat="server">
                                </datalist>
                            </td>
                            <td colspan="2">
                                <asp:Label Text="Remark" CssClass="textStyle" runat="server" /><br />
                                <textarea id="txtRemark" required class="form-control Heigh35" value='<%# Bind("Remark") %>' placeholder="Remark" runat="server" cols="35" wrap="soft"></textarea>
                            </td>
                        </tr>
                        <tr style="padding-bottom: 10px">
                            <td>
                                <asp:Label ID="lblStatusEdit" Visible="false" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                <asp:DropDownList runat="server" ID="dlType" CssClass="btn btn-default" OnSelectedIndexChanged="dlType_Changed" AutoPostBack="true">
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
                                <asp:Label Text="Ring No 1" CssClass="textStyle" runat="server" />
                                <input list="MainContent_RingNo1s" required name="myRingNo1" value='<%# Bind("RingNo") %>'
                                    id="Text1" class="form-control Heigh35" placeholder="Ring No 1" runat="server">
                                <datalist id="RingNos1" runat="server">
                                </datalist>
                            </td>
                            <td>
                                <asp:Panel runat="server" ID="pnRingNo" Visible="false">
                                    <asp:Label Text="Ring No 2" CssClass="textStyle" runat="server" />
                                    <input list="MainContent_RingNos" required name="myRingNo" value='<%# Bind("RingNo2") %>'
                                        id="txtRingNo2" class="form-control Heigh35" placeholder="Ring No 2" runat="server">
                                    <datalist id="RingNos" runat="server">
                                    </datalist>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Text="Section Stock Check" CssClass="textStyle" runat="server" /><br />
                                <asp:TextBox runat="server" ID="txtSectionStockCheck" CssClass="form-control Heigh35" Text='<%# Bind("SectionStockCheck") %>' placeholder="Update Date" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:LinkButton Text="Save" ID="lbkSave" CssClass="btn btn-default btn-st" CommandName="Update" runat="server" />
                                <asp:LinkButton ID="lbtCancelEdit" runat="server" CommandName="Cancel"
                                    class="btn btn-default"
                                    data-dismiss="modal">Cancel</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:DataList>
        </div>
    </div>
    <script type="text/javascript">
        function calculateMonths(input) {
            var row = input.closest('tr'); // Tìm hàng chứa input được thay đổi
            var yearValue = parseInt(input.value);

            var targetInput = row.querySelector('.lifeTimeInput[data-target="txtlifeTimeMonth"]');
            var monthValue = yearValue * 12;

            if (!isNaN(monthValue) && targetInput) {
                targetInput.value = monthValue;
            }
        }
    </script>
    <asp:HiddenField ID="_id" runat="server" />
</asp:Content>
