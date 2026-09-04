<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MngFAInventoryDetail.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="QlyMain.Admin.MngFAInventoryDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        html {
            scroll-behavior: smooth;
            scroll-padding-top: 50px;
        }

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
        }

        .textStyle {
            font-weight: bolder;
            color: #607D8B;
        }

        .grStyle th {
            color: white;
            background: #607d8b;
            border: 1px solid #b5ccd6;
            vertical-align: middle;
            text-align: center;
        }

        .paddingTh {
            padding-top: 3px !important;
            padding-bottom: 0 !important;
        }

        .colorTT {
            color: #e6135b;
        }

        .font14 {
            font-size: 14px;
        }

        .height630 {
            height: 630px;
        }

        .IsInventory {
            padding: 5px;
            background-color: #00BCD4;
            color: white;
            border-radius: 5px;
        }

        .IsNotInventory {
            padding: 5px;
            background-color: #9e9e9e;
            color: white;
            border-radius: 5px;
        }

        .btn-st {
            color: white;
            background: #607d8b;
        }

        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            padding: 8px;
            line-height: 1.42857143;
            vertical-align: top;
            border-top: 1px solid #ddd;
        }

        .marginTop {
            /* margin-top: 2%;*/
        }

        .width20 {
            width: 20px;
        }

        @media screen and (max-width: 720px) {
            .marginTop {
                /*margin-top: 8%;*/
            }
        }
        /* Responsive table CSS */
        /* Thiết lập bảng để phản hồi với các thiết bị nhỏ hơn */
        @media only screen and (max-width: 768px) {
            .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
                padding: 2px;
                line-height: 1.428571;
                vertical-align: top;
                font-size: 7px;
                border-top: 1px solid #ddd;
            }

            .font14 {
                font-size: 11px;
            }

            .width20 {
                width: 13px;
            }

            .IsInventory {
                padding: 2px;
                background-color: #00BCD4;
                color: white;
                font-size: 7px;
                border-radius: 5px;
            }

            .IsNotInventory {
                padding: 2px;
                background-color: #9e9e9e;
                color: white;
                border-radius: 5px;
                font-size: 7px;
            }

            .btn-st {
                color: white;
                background: #607d8b;
                font-size: 9px;
                padding: 4px;
            }
             .height630 {
            height: 500px;
        }
        }
    </style>
    <script type="text/javascript">
        $(window).bind('load', function () {
            var headerChk = $(".chkheader input");
            var itemChk = $(".chkitems input");
            headerChk.bind("click", function () {
                itemChk.each(function () { this.checked = headerChk[0].checked; })
            });
            itemChk.bind("click", function () { if ($(this).checked == false) headerChk[0].checked = false; });
        });
        function dateselect_txtDeprStartDate(ev) {
            var calendarBehavior1 = $find("txtDeprStartDate_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("dd.MMM.yyyy")
        }
    </script>
    <div class="col-sm-12 col-md-12 col-lg-12 marginTop">
        <div class="messagealert" id="alert_container">
        </div>
        <br />
        <asp:Label Text="INVENTORY DETAIL" ForeColor="#555c5f" Font-Size="20px" runat="server" />
        <br />
        <div class="col-sm-6 col-md-6 col-lg-6 alert-info">
            <div class="row">
                <div class="col-sm-3 col-md-6 col-lg-3">
                    <b>Inventory Code :</b>
                    <asp:Label ID="lblInventoryCode" CssClass="colorTT" runat="server" />
                </div>
                <div class="col-sm-9 col-md-6 col-lg-9">
                    <b>Inventory Name :</b>
                    <asp:Label ID="lblInventoryName" runat="server" CssClass="colorTT" />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-md-3 col-lg-3">
                    <b>User Code :</b>
                    <asp:Label ID="lblUserCode" runat="server" CssClass="colorTT" />
                </div>
                <div class="col-sm-9 col-md-9 col-lg-9">
                    <b>Div :</b>
                    <asp:Label ID="lblDiv" runat="server" CssClass="colorTT" />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-md-3 col-lg-3">
                    <b>Created date:</b>
                    <asp:Label ID="lblDatecreate" runat="server" CssClass="colorTT" />
                </div>
                <div class="col-sm-9 col-md-9 col-lg-9">
                    <b>Count :</b>
                    <asp:Label ID="lblCount" runat="server" ForeColor="#FF5722" />
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-8 col-md-8 col-lg-8"></div>
        <div class="col-sm-4 col-md-4 col-lg-4">
            <div style="float: left">
                <asp:Panel runat="server" DefaultButton="lbkScan">
                    <div class="input-group">
                        <asp:TextBox runat="server" ID="txtScan" autocomplete="off" CssClass="form-control" />
                        <span class="input-group-btn">
                            <asp:LinkButton Text="" ID="lbkScan" runat="server" CssClass="btn btn-default" OnClick="lbkScan_Click">
                    <i class="fa fa-qrcode" aria-hidden="true"></i>
                            </asp:LinkButton>
                        </span>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
    <asp:GridView ID="gvDetail" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true"
        DataKeyNames="id" CssClass="table grStyle box-shadow1 center responsive-table"
        OnRowCommand="gvDetail_RowCommand" OnRowDataBound="gvDetail_DataBound">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="lblID" runat="server" Text='<%# Bind("id") %>' CssClass="row-id" Visible="false"></asp:Label>
                    <img alt="" class="width20" style="cursor: pointer;" src="../Img/plus.png" />
                    <img alt="" class="width20" style="cursor: pointer; display: none;" src="../Img/minus.png" />
                    <asp:Panel ID="pnlInvs" runat="server" Style="display: none;">
                        <asp:DataList runat="server" ID="dtlInvs" CssClass="col-sm-12 col-md-12 col-lg-12 table">
                            <ItemTemplate>
                                <table class="table table-bordered">
                                    <tr>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Asset Class :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ID="lblChildAssetClass" ForeColor="#c07272" Text='<%# Bind("Asset_Class") %>'></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="SAP Code :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ForeColor="#c07272" ID="lblChildSAP_code" Text='<%# Eval("SAP_code") %>'></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Asset Name :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ForeColor="#c07272" ID="lblAsset_Name" Text='<%# Bind("Asset_Name") %>'></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Name2 :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ForeColor="#c07272" ID="lblName2" Text='<%# Bind("Name2") %>'></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Original Asset :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ID="lblOriginal_Asset" ForeColor="#c07272" Text='<%# Bind("Original_Asset") %>'></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Serial Number :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ID="lblSerialNumber" ForeColor="#c07272" Text='<%# Bind("SerialNumber") %>'></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Profit Center :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ID="lblProfitCenter" ForeColor="#c07272" Text='<%# Bind("ProfitCenter") %>'></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="ProfitCenter Name :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ID="lblProfitCenterName" ForeColor="#c07272" Text='<%# Bind("ProfitCenterName") %>'></asp:Label>
                                            </div>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Location :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ID="lblLocation" ForeColor="#c07272" Text='<%# Bind("Location") %>'></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Update Date :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ID="lblDeprStartDate" ForeColor="#c07272" Text='<%# Bind("DeprStartDate") %>'></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Received Amount :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ID="lblReceivedAmount" ForeColor="#c07272" Text='<%# Bind("ReceivedAmount") %>'></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Book Amount :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ID="lblBookAmount" ForeColor="#c07272" Text='<%# Bind("BookAmount") %>'></asp:Label>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Life Time Year :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ID="lbllifeTimeYear" ForeColor="#c07272" Text='<%# Bind("lifeTimeYear") %>'></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Life Time Month :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ID="lbllifeTimeMonth" ForeColor="#c07272" Text='<%# Bind("lifeTimeMonth") %>'></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Invoice :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ID="lblInvoice" ForeColor="#c07272" Text='<%# Bind("Invoice") %>'></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Remark :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ID="lblRemark" ForeColor="#c07272" Text='<%# Bind("Remark") %>'></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="ringNoContainer" style="display: none">
                                            <div class="col-sm-3 col-md-3 col-lg-3">
                                                <asp:Label Text="Ring No :" CssClass="textStyle" runat="server" />
                                            </div>
                                            <div class="col-sm-9 col-md-9 col-lg-9">
                                                <asp:Label runat="server" ID="lblRingNo" ForeColor="#c07272" Text='<%# Bind("RingNo") %>'></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Label runat="server" ID="lblID" Text='<%# Bind("id") %>' Visible="false"></asp:Label>
                                            <asp:LinkButton Text="Save" ID="lbkSaveChild" OnClick="lbkSaveChild_Click" CssClass="btn btn-default btn-st" runat="server">
                                                            <i class="fa fa-pencil" aria-hidden="true"></i> Edit
                                            </asp:LinkButton>

                                            <asp:LinkButton ID="lbkInventory" runat="server" OnClick="lbkInventory_Click"
                                                class="btn btn-default btn-st"
                                                data-dismiss="modal">Inventory</asp:LinkButton>

                                            <asp:LinkButton ID="lbtCancel" runat="server" CommandName="Cancel"
                                                class="btn btn-default btn-st"
                                                data-dismiss="modal">Cancel</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </asp:Panel>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField Visible="false" DataField="id" HeaderText="id" />
            <asp:TemplateField HeaderText="SAP Code">
                <EditItemTemplate>
                    <asp:Label ID="txtSAP_codeEdit" runat="server" Text='<%# Bind("SAP_code") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtSAP_code" runat="server" Text='<%# Bind("SAP_code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Asset Name">
                <EditItemTemplate>
                    <asp:Label ID="txtAsset_NameEdit" runat="server" Text='<%# Bind("Asset_Name") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtAsset_Name" runat="server" Text='<%# Bind("Asset_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SerialNumber">
                <EditItemTemplate>
                    <asp:Label ID="txtSerialNumberEdit" runat="server" Text='<%# Bind("SerialNumber") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtSerialNumber" runat="server" Text='<%# Bind("SerialNumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ProfitCenter">
                <EditItemTemplate>
                    <asp:Label ID="txtProfitCenterEdit" runat="server" Text='<%# Bind("ProfitCenter") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="txtProfitCenter" runat="server" Text='<%# Bind("ProfitCenter") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:Label ID="lblState" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <HeaderStyle Width="40px" />
                <HeaderTemplate>
                    <asp:Panel runat="server" ID="pnAll">
                        <asp:CheckBox ID="chkboxSelectAll" AutoPostBack="true"
                            CssClass="chkheader" OnCheckedChanged="chkboxSelectAll_CheckedChanged"
                            runat="server" Text="All" />
                    </asp:Panel>
                </HeaderTemplate>
                <EditItemTemplate>
                    <asp:Label ID="lblStatusEdit" runat="server"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="SelectCheckBox" AutoPostBack="true"
                        runat="server" CssClass="chkitems" OnCheckedChanged="SelectCheckBox_CheckedChanged" />
                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <ItemStyle Width="50px" />
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False"
                        CommandName="Delete1" Text="Delete" OnClientClick="if(!confirm('Are you sure you want delete')) return false;" CssClass="padding5 font14">
                             <span class="glyphicon glyphicon-trash"></span>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <div id="OpenInven">
        <asp:LinkButton ID="lbkInven" runat="server"></asp:LinkButton>
        <ajaxToolkit:ModalPopupExtender ID="popupInven"
            runat="server" PopupControlID="pnInven" TargetControlID="lbkInven" CancelControlID="lbtCancelInven"
            BackgroundCssClass="modalBackground" DropShadow="false">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel ID="pnInven" CssClass="popupInven" runat="server" Style="display: none;">
            <div id="InvenModal">
                <div class="modalmail">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="col-sm-11 col-md-11 col-lg-11">
                                <asp:Label Text="UPDATE INFORMATION" ForeColor="#555c5f" CssClass="PaddingLeft" Font-Bold="true" Font-Size="18px" runat="server" />
                            </div>
                            <div class="col-sm-1 col-md-1 col-lg-1" style="float: right; font-size: large">
                                <asp:LinkButton ID="lbtCancelInven" runat="server"
                                    data-dismiss="modal" Font-Bold="true"><i class="fa fa-times" aria-hidden="true" style="color:#849aac"></i></asp:LinkButton>
                            </div>
                        </div>
                        <div class="modal-body height630" style="overflow-y: scroll">
                            <table class="table table-bordered">
                                <tr>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Asset Class" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">

                                            <asp:TextBox runat="server" ID="txtAssetPP" CssClass="form-control font14" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="SAP Code" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtSAP_codePP" CssClass="form-control font14" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Asset Name" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtAsset_Name" CssClass="form-control font14" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Name2" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtName2" CssClass="form-control font14" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Original Asset" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtOriginal_Asset" CssClass="form-control font14" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Serial Number" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtSerialNumber" CssClass="form-control font14" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Profit Center" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtProfitCenter" CssClass="form-control font14" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="ProfitCenter Name" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtProfitCenterName" CssClass="form-control font14" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Location" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtLocation" CssClass="form-control font14" />

                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Update Date" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtDeprStartDate" CssClass="form-control font14" />
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                                                OnClientDateSelectionChanged="dateselect_txtDeprStartDate"
                                                BehaviorID="txtDeprStartDate_CalendarExtender" TargetControlID="txtDeprStartDate" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Received Amount" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtReceivedAmount" CssClass="form-control font14" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Book Amount" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtBookAmount" CssClass="form-control font14" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Life Time Year" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtlifeTimeYear" CssClass="form-control font14" oninput="calculateMonths()" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />

                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Life Time Month" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtlifeTimeMonth" CssClass="form-control font14" onkeypress="return event.charCode >= 48 && event.charCode <= 57" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Invoice" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtInvoice" CssClass="form-control font14" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Remark" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtRemark" CssClass="form-control font14" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="ringNoContainer" style="display: none">
                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                            <asp:Label Text="Ring No" CssClass="textStyle font14" runat="server" />
                                        </div>
                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                            <asp:TextBox runat="server" ID="txtRingNo" CssClass="form-control font14" />

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:LinkButton Text="Save" ID="lbkOK" OnClick="lbkOK_Click" CssClass="btn btn-default btn-st" runat="server" />
                                        <asp:LinkButton ID="lbtCancel" runat="server"
                                            class="btn btn-default"
                                            data-dismiss="modal">Cancel</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>

    <div class="col-sm-12 col-md-12 col-lg-12">
        <asp:LinkButton Text="Save to MasterList" runat="server" ID="lbkSaveToDB" CssClass="btn btn-default btn-st marginLeft17" OnClick="lbkSaveToDB_Click" />
        <asp:LinkButton Text="" ID="lbkBack" OnClick="lbkBack_Click" CssClass="btn btn-default btn-st marginLeft17" runat="server"><i class="fa fa-backward" aria-hidden="true"></i> Back</asp:LinkButton>
    </div>

    <asp:HiddenField ID="_id" runat="server" />
    <asp:HiddenField ID="_InvCode" runat="server" />
    <asp:HiddenField ID="_InventoryID" runat="server" />
    <script type="text/javascript">
        $("[src*=plus]").on("click", function () {
            $(this).closest("tr").after("<tr><td></td><td class='Invs' colspan = '999'>" + $(this).closest("tr").find("[id*=Invs]").html() + "</td></tr>");
            $(this).closest("tr").find("[src*=minus]").show();
            $(this).hide();
        });
        $("[src*=minus]").on("click", function () {
            $(this).closest("tr").next().remove();
            $(this).closest("tr").find("[src*=plus]").show();
            $(this).hide();
        });
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
            function scrollToRow(rowId) {
                var rowLabels = document.getElementsByClassName('row-id');
                for (var i = 0; i < rowLabels.length; i++) {
                    var label = rowLabels[i];
                    console.log("label:", label);
                    console.log("lblID:", rowId);
                    if (label.textContent === rowId) {
                        label.parentElement.parentElement.classList.add('<%= Session["SelectedRowCssClass"] %>'); // Thêm lớp CSS từ Session
                        label.parentElement.parentElement.scrollIntoView({ behavior: 'smooth', block: 'center' });
                        break;
                    }
                }
            }
            function scrollToRowById() {
                var selectedRowId = '<%= Session["selectedIndex"] %>';
                scrollToRow(selectedRowId);
                console.log("ss:", selectedRowId);
            }
            window.onload = function () {
                scrollToRowById();
            };
        };
    </script>
</asp:Content>
