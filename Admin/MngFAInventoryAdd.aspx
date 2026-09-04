<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="MngFAInventoryAdd.aspx.cs"
    Inherits="QlyMain.Admin.MngFAInventoryAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        span.select2-selection.select2-selection--single {
            height: 28px;
            font-size: 11px;
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

        .btn-st {
            color: white;
            background: #607d8b;
        }

        .PaddingLeft {
            padding-left: 10px;
        }

        .textStyle {
            font-weight: bolder;
            color: #607D8B;
        }

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
        }

        .input-group-addon {
            background-color: white;
        }

        .font20 {
            font-size: 20px;
        }

        .font15 {
            font-size: 15px;
        }

        .font14 {
            font-size: 15px;
        }

        .height630 {
            height: 630px;
        }

        .margin-top2 {
            /*   margin-top: 2%;*/
        }

        .marginLeft17 {
            margin-left: 17px;
        }
        /* Media query cho màn hình nhỏ hơn 720px */
        @media screen and (max-width: 720px) {
            .font20 {
                font-size: 15px;
            }

            .font15 {
                font-size: 12px;
            }

            .font14 {
                font-size: 10px;
            }

            .height630 {
                height: 300px;
            }

            .margin-top2 {
                /*                margin-top: 9%;*/
            }
        }
    </style>
    <script type="text/javascript">
        function dateselect_txtDeprStartDate(ev) {
            var calendarBehavior1 = $find("txtDeprStartDate_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("dd.MMM.yyyy")
        }
    </script>

    <div class="col-sm-12 col-md-12 col-lg-12 margin-top2" style="padding: 20px;">
        <div class="content" style="padding: 5px">
            <div class="messagealert" id="alert_container">
            </div>
            <asp:Label Text="◆ CREATE INVENTORY SHEET" ForeColor="#555c5f" CssClass="PaddingLeft font20" runat="server" /><br />
            <asp:Label Text="▶ I. Inventory record information" Font-Italic="true" ForeColor="#ba2d00" CssClass="PaddingLeft font15"
                Font-Bold="true" runat="server" />
            <br />
            <div class="col-sm-12 col-md-12 col-lg-12" style="padding-bottom: 10px; padding-top: 10px">
                <div class="input-group">
                    <span class="input-group-addon">
                        <asp:Label Text="Div" CssClass="textStyle font14" runat="server" />
                    </span>
                    <asp:TextBox runat="server" CssClass="font14" ID="txtDiv" Height="28px" Width="192px" placeholder="Department" />
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        <asp:Label Text="User" CssClass="textStyle font14" runat="server" /></span>
                    <asp:TextBox runat="server" CssClass="font14" ID="txtUser" Height="28px" Width="185px" placeholder="User" />
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        <asp:Label Text="Create date" CssClass="textStyle font14" runat="server" /></span>
                    <asp:TextBox runat="server" CssClass="font14" ID="txtCreateDate" Height="28px" Width="145px" Enabled="false" placeholder="Date created" />
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        <asp:Label Text="Inventory Name" CssClass="textStyle font14" runat="server" /></span>
                    <asp:TextBox runat="server" CssClass="font14" ID="txtName" Height="28px" Width="145px"
                        placeholder="Tên phiếu kiểm kê" />
                </div>
            </div>
            <br />
            <asp:Label Text="▶ I. Create an inventory record" Font-Italic="true" ForeColor="#ba2d00" CssClass="PaddingLeft font15" Font-Bold="true" runat="server" />
            <br />
            <div class="col-sm-3 col-md-3 col-lg-3"></div>
            <div class="col-sm-6 col-md-6 col-lg-6">
                <asp:Panel runat="server" CssClass="box-shadow2" DefaultButton="lbkScan">
                    <div class="input-group">
                        <%-- <asp:TextBox ID="txtInput" runat="server" CssClass="form-control" placeholder="Scan / Enter data" autocomplete="off"></asp:TextBox>--%>
                        <input list="MainContent_SAP_codes" required name="mySAP_code" height="43px" placeholder="Scan / Enter data"
                            id="txtSAP_code" class="form-control font14" runat="server" autocomplete="off">
                        <datalist id="SAP_codes" runat="server">
                        </datalist>
                        <span class="input-group-addon" style="padding: 0">
                            <asp:DropDownList runat="server" ID="ddListSec" CssClass="selectListSec" Height="35px" Width="165px">
                            </asp:DropDownList>
                        </span>
                        <span class="input-group-btn">
                            <asp:LinkButton ID="lbkScan" Height="35px"
                                CssClass="btn btn-default btn-st" runat="server" OnClick="lbkScan_Click"> Search
                                      <i class="fa fa-search"></i>
                            </asp:LinkButton>
                            <asp:LinkButton Text="Refresh" runat="server" OnClick="lbkRefresh_Click" ID="lbkRefresh" CssClass="btn btn-default">
                                <i class="fa fa-refresh" aria-hidden="true"></i> Refresh</asp:LinkButton>
                        </span>
                    </div>
                </asp:Panel>
                <br />
                <asp:Label Text="" ID="lblThongbao" ForeColor="#be7100" Font-Bold="true" Font-Size="12px" runat="server" />
            </div>
            <br />
            <div class="col-sm-3 col-md-3 col-lg-3"></div>
            <div>
                <br />
                <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" AutoGenerateColumns="false"
                    CssClass="table grStyle box-shadow1 center font14" ShowHeaderWhenEmpty="true"
                    OnRowDataBound="GridView1_DataBound">
                    <Columns>
                        <asp:TemplateField ControlStyle-BackColor="#f0f8ff">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>' CssClass="row-id" Visible="false"></asp:Label>
                                <img alt="" style="cursor: pointer; width: 20px" src="../Img/plus.png" />
                                <img alt="" style="cursor: pointer; display: none; width: 20px" src="../Img/minus.png" />
                                <asp:Panel ID="pnlInvs" runat="server" Style="display: none;">
                                    <asp:DataList runat="server" ID="dtlInvs" CssClass="col-sm-12 col-md-12 col-lg-12 table">
                                        <ItemTemplate>
                                            <table class="table table-bordered">
                                                <tr>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Asset Class" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblChildAssetClass" Text='<%# Bind("Asset_Class") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="SAP Code" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblChildSAP_code" Text='<%# Eval("SAP_code") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Asset Name" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblAsset_Name" Text='<%# Bind("Asset_Name") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Name2" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblName2" Text='<%# Bind("Name2") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Original Asset" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblOriginal_Asset" Text='<%# Bind("Original_Asset") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Serial Number" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblSerialNumber" Text='<%# Bind("SerialNumber") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Profit Center" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblProfitCenter" Text='<%# Bind("ProfitCenter") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="ProfitCenter Name" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblProfitCenterName" Text='<%# Bind("ProfitCenterName") %>'></asp:Label>
                                                        </div>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Location" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblLocation" Text='<%# Bind("Location") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Update Date" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblDeprStartDate" Text='<%# Bind("DeprStartDate") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Received Amount" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblReceivedAmount" Text='<%# Bind("ReceivedAmount") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Book Amount" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblBookAmount" Text='<%# Bind("BookAmount") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Life Time Year" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lbllifeTimeYear" Text='<%# Bind("lifeTimeYear") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Life Time Month" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lbllifeTimeMonth" Text='<%# Bind("lifeTimeMonth") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Invoice" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblInvoice" Text='<%# Bind("Invoice") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Remark" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblRemark" Text='<%# Bind("Remark") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="ringNoContainer" style="display: none">
                                                        <div class="col-sm-3 col-md-3 col-lg-3">
                                                            <asp:Label Text="Ring No" CssClass="textStyle font14" runat="server" />
                                                        </div>
                                                        <div class="col-sm-9 col-md-9 col-lg-9">
                                                            <asp:Label runat="server" ID="lblRingNo" Text='<%# Bind("RingNo") %>'></asp:Label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server" ID="lblID" Text='<%# Bind("ID") %>' Visible="false"></asp:Label>
                                                        <asp:LinkButton Text="Save" ID="lbkSaveChild" OnClick="lbkSaveChild_Click" CssClass="btn btn-default btn-st" runat="server">
                                                            <i class="fa fa-pencil" aria-hidden="true"></i> Edit
                                                        </asp:LinkButton>
                                                        <asp:LinkButton ID="lbtCancel" runat="server" CommandName="Cancel"
                                                            class="btn btn-default"
                                                            data-dismiss="modal">Cancel</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SAP code">
                            <ItemTemplate>
                                <asp:Label ID="lblSAP_code" CssClass="font14" runat="server" Text='<%# Bind("SAP_code") %>'></asp:Label>
                                <%--<asp:TextBox ID="txtSAP_code" runat="server" CssClass="form-control"
                                    Text='<%# Bind("SAP_code") %>'></asp:TextBox>--%>
                            </ItemTemplate>
                            <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Serial Number">
                            <ItemTemplate>
                                <asp:Label ID="lblSerialNumber" CssClass="font14" runat="server" Text='<%# Bind("SerialNumber") %>'></asp:Label>
                                <%-- <asp:TextBox ID="txtAsset_Class" runat="server" CssClass="form-control"
                                    Text='<%# Bind("Asset_Class") %>'></asp:TextBox>--%>
                            </ItemTemplate>
                            <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Asset Name">
                            <ItemTemplate>
                                <asp:Label ID="lblAsset_Name" CssClass="font14" runat="server" Text='<%# Bind("Asset_Name") %>'></asp:Label>
                                <%-- <asp:TextBox ID="txtAsset_Name" runat="server" CssClass="form-control" Text='<%# Bind("Asset_Name") %>'></asp:TextBox>--%>
                            </ItemTemplate>
                            <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Original Asset">
                            <ItemTemplate>
                                <asp:Label ID="lblOriginal_Asset" CssClass="font14" runat="server" Text='<%# Bind("Original_Asset") %>'></asp:Label>
                                <%--<asp:TextBox ID="txtProfitCenter" CssClass="form-control" runat="server" Text='<%# Bind("ProfitCenter") %>'></asp:TextBox>--%>
                            </ItemTemplate>
                            <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Profit Center">
                            <ItemTemplate>
                                <asp:Label ID="lblProfitCenter" CssClass="font14" runat="server" Text='<%# Bind("ProfitCenter") %>'></asp:Label>
                                <%--<asp:TextBox ID="txtProfitCenter" CssClass="form-control" runat="server" Text='<%# Bind("ProfitCenter") %>'></asp:TextBox>--%>
                            </ItemTemplate>
                            <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Profit Center Name">
                            <ItemTemplate>
                                <asp:Label ID="lblProfitCenterName" CssClass="font14" runat="server" Text='<%# Bind("ProfitCenterName") %>'></asp:Label>
                                <%-- <asp:TextBox ID="txtProfitCenterName" runat="server" CssClass="form-control" Text='<%# Bind("ProfitCenterName") %>'></asp:TextBox>--%>
                            </ItemTemplate>
                            <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Location">
                            <ItemTemplate>
                                <asp:Label ID="lblLocation" CssClass="font14" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <asp:LinkButton Text="Save" runat="server" CssClass="btn btn-default btn-st box-shadow1" ID="lbkSaveAll" OnClick="lbkSaveAll_Click" />
            </div>
        </div>
    </div>
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
                                            <%--<asp:Label ID="lblSAP_code" runat="server" Text='<%# Bind("SAP_code") %>'></asp:Label>
                                            <asp:Label ID="lblIDs" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                            --%>
                                            <asp:TextBox runat="server" ID="txtSAP_codePP" CssClass="form-control font14" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Code :13:24-30 : </td>
                                    <td>Co 20:28 : </td>
                                    <td>Output Ed : 34 :25 20:28 : </td>
                                    <td>Ephe 1:7 Ay la trong dang chr chung ta duoc cuu chuoc boi huyet ngai, duoc tha tou boi an dien ngai</td>
                                    <td>HT kho g le y</td>
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
        <asp:LinkButton Text="" ID="lbkBack" OnClick="lbkBack_Click" CssClass="btn btn-default btn-st marginLeft17" runat="server"><i class="fa fa-backward" aria-hidden="true"></i> Back</asp:LinkButton>
    </div>
    <script type="text/javascript">
        $("[src*=plus]").on("click", function () {
            $(this).closest("tr").after("<tr><td></td><td class='Invs' colspan = '999'>" + $(this).closest("tr").find("[id*=Invs]").html() + "</td></tr>");
            $(this).closest("tr").find("[src*=minus]").show();
            $(this).hide();
            var txtChildAssetClassValue = $("#txtChildAssetClass").val(); // Lấy giá trị của TextBox txtChildAssetClass
            console.log("Giá trị của txtChildAssetClass trước khi thay đổi: " + txtChildAssetClassValue);
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
        $(function () {
            $('.selectListSec').select2();
        });
    </script>

    <asp:HiddenField ID="_ID" runat="server" />
</asp:Content>
