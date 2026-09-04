<%@ Page Title="ASSET DATA MANAGEMENT" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    MaintainScrollPositionOnPostback="true" CodeBehind="MngFA.aspx.cs" EnableEventValidation="false" Inherits="QlyMain.Admin.MngFA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/MngFA.css" rel="stylesheet" />
    <style>
        .gridview-container {
            height: 560px;
            padding: 0 5px 0px 5px;
        }

        .GvGrid:hover {
            background-color: white;
            border-top: solid;
            color: #9C6500;
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
        }

        html {
            scroll-behavior: smooth;
            scroll-padding-top: 50px;
        }
    </style>
    <script type="text/javascript">
        function dateselect_txtUpdate(ev) {
            var calendarBehavior1 = $find("txtUpdate_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("dd.MMM.yyyy") + " " + now.format("HH:mm:ss")
        }
        function dateselect_txtFromDate(ev) {
            var calendarBehavior1 = $find("txtFromDate_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            calendarBehavior1.get_element().value = d.format("dd.MMM.yyyy")
        }
        function dateselect_txtToDate(ev) {
            var calendarBehavior1 = $find("txtToDate_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            calendarBehavior1.get_element().value = d.format("dd.MMM.yyyy")
        }
        $(window).bind('load', function () {
            var headerChk = $(".chkheader input");
            var itemChk = $(".chkitems input");
            headerChk.bind("click", function () {
                itemChk.each(function () { this.checked = headerChk[0].checked; })
            });
            itemChk.bind("click", function () { if ($(this).checked == false) headerChk[0].checked = false; });
            document.getElementById("txtFind").focus();
        });
    </script>
    <div class="messagealert" id="alert_container">
    </div>
    <section class="content-header">
        <h1>ASSET DATA MANAGEMENT
        <small>Control fixed asset</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Fixed asset</li>
        </ol>
    </section>
    <section class="content" id="content" style="background-color: white">
        <div class="row">
        </div>
        <div class="row" style="border-bottom: 1px solid #d2d6de">
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="col-sm-2 col-md-5 col-lg-3">
                    <div style="color: #676363">
                        Showing:
                    <asp:DropDownList ID="ddlDong" runat="server"
                        CssClass="dropdown" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlDong_SelectedIndexChanged">
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>70</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                        <asp:ListItem>200</asp:ListItem>
                    </asp:DropDownList>
                        <asp:Label Text="" ID="lblMessSearch" runat="server" />
                    </div>

                    <div class="dropdown">
                        <button class="btn btn-default btn-st" type="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                            <h6 style="margin: 0px"><i class="fa fa-question-circle" aria-hidden="true">Search Instructions </i></h6>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="ddButton" style="width: 400px">
                            <div class="input-group">
                                <ul>
                                    <li>Relative search: enter the data value you want to find in the first text box and then press the search button. </li>
                                    <li>Absolute search: enter the first text box with the data value exactly as the name in Section Stock Check
                                       -> then click the check box -> Click the search button
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-9 col-md-7 col-lg-7 PaddingLeftRight">
                    <div style="float: right">
                        <table>

                            <tr>
                                <td>
                                    <div class="dropdown">
                                        <button class="btn btn-default btn-st dropdown-toggle" onclick="toggleDropdown()" type="button" data-toggle="dropdown">
                                            <i class="fa fa-filter" aria-hidden="true">Filter</i>
                                            <span class="caret"></span>
                                        </button>
                                        <div class="dropdown-menu" id="filterDropdown" style="width: 600px">
                                            <asp:Panel runat="server" CssClass="box-shadow2" DefaultButton="lbkFind">
                                                <table class="table table-bordered">
                                                    <tr>
                                                        <td><b>Relative search</b>
                                                            <%-- <asp:TextBox runat="server" CssClass="form-control" placeholder="SAP code, Original Asset, Asset Class,... "
                                    Height="35px" autocomplete="off"
                                    ID="txtFind" />--%>
                                                            <input list="MainContent_Searchs" style="color: #ab6900" required name="Search"
                                                                id="txtSearchs" class="form-control" placeholder="SAP code, Original Asset, Asset Class,..." runat="server">
                                                            <datalist id="Searchs" runat="server" autocomplete="off">
                                                            </datalist>
                                                        </td>

                                                        <td><b>Absolute</b><br />
                                                            <asp:CheckBox ID="chkSingleValue" Height="35px" runat="server" Text="" CssClass="btn btn-default BorderStyle" /></td>

                                                    </tr>
                                                    <tr>
                                                        <td><b>Status</b>
                                                            <asp:DropDownList runat="server" ID="ddlStateFind" CssClass="btn-st btn-st btn-default">
                                                                <asp:ListItem Text="All" Value="All" />
                                                                <asp:ListItem Text="Inventoried" Value="1" />
                                                                <asp:ListItem Text="Not yet inventoried" Value="2" />
                                                                <asp:ListItem Text="Disposal" Value="Disposal" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 17%"><b>From date</b>
                                                            <asp:TextBox runat="server" ForeColor="#ab6900" CssClass="form-control" placeholder="From Date"
                                                                Height="35px" autocomplete="off"
                                                                ID="txtFromDate" />
                                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server"
                                                                OnClientDateSelectionChanged="dateselect_txtFromDate"
                                                                BehaviorID="txtFromDate_CalendarExtender" TargetControlID="txtFromDate" />
                                                        </td>
                                                        <td style="width: 17%"><b>To date</b>
                                                            <asp:TextBox runat="server" ForeColor="#ab6900" CssClass="form-control" placeholder="To Date"
                                                                Height="35px" autocomplete="off"
                                                                ID="txtToDate" />
                                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server"
                                                                OnClientDateSelectionChanged="dateselect_txtToDate"
                                                                BehaviorID="txtToDate_CalendarExtender" TargetControlID="txtToDate" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton ID="lbkFind" Height="35px"
                                                                CssClass="btn btn-default btn-st1" runat="server" OnClick="lbkFind_Click"> 
                                                            <i class="fa fa-search"> Search</i>
                                                            </asp:LinkButton>
                                                            <asp:Button runat="server" Text="Close" CssClass="btn btn-default" OnClientClick="toggleDropdown()" />

                                                        </td>
                                                    </tr>
                                                </table>
                                                <div class="input-group" style="width: max-content">
                                                    <span class="input-group-btn"></span>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button class="btn btn-default btn-st" type="button" id="dropdownMenuButtonExt" style="height: 33px" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <h6 style="margin: 0px"><i class="fa fa-file-excel-o" aria-hidden="true">Export Excel</i>  <span class="caret"></span></h6>
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButtonExt" style="width: 270px; padding: 14px">
                                            <div class="input-group">
                                                <asp:LinkButton Text="text" runat="server" ID="lbkImgExport" CssClass="btn btn-default btn-st" Height="33px" OnClick="lbkImgExport_Click">
                          <i class="glyphicon glyphicon-download-alt" aria-hidden="true"> Export</i> 
                                                </asp:LinkButton>
                                                <asp:LinkButton Text="text" runat="server" ID="lbkImgExportQRcode" CssClass="btn btn-default btn-st" Height="33px" OnClick="lbkImgExportQRcode_Click">
                          <i class="fa fa-file-excel-o" aria-hidden="true"></i> Export Inventory
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="dropdown">
                                        <button class="btn btn-default btn-st" type="button" id="dropdownMenuButton" style="height: 33px" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <h6 style="margin: 0px"><i class="fa fa-qrcode" aria-hidden="true">Create QRCode</i>  <span class="caret"></span></h6>
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="width: 200px; padding: 14px">
                                            <div class="input-group">
                                                <asp:LinkButton Text="text" runat="server" ID="lbkCreateQRCodePDF" CssClass="btn btn-default btn-st" Height="33px" OnClick="lbkCreateQRCodePDF_Click">
                          <i class="fa fa-qrcode" aria-hidden="true"></i> PDF
                                                </asp:LinkButton>
                                                <asp:LinkButton Text="text" runat="server" ID="lbkCreateQRCodeTEPRA" CssClass="btn btn-default btn-st" Height="33px" OnClick="lbkCreateQRCodeTEPRA_Click">
                          <i class="fa fa-qrcode" aria-hidden="true"></i> TEPRA
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:LinkButton runat="server" CssClass="btn btn-default btn-st" ID="lbkAdd" OnClick="lbkAdd_CLick">
                                             <i class="fa fa-plus-circle" aria-hidden="true"> Create New</i></asp:LinkButton></td>
                                <td>
                                    <div class="dropdown">
                                        <button class="btn btn-default btn-st" type="button" id="ddButton" data-toggle="dropdown" style="height: 33px" aria-haspopup="true" aria-expanded="false">
                                            <h6 style="margin: 0px"><i class="fa fa-cloud-upload" aria-hidden="true">Upload</i>  <span class="caret"></span></h6>
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="ddButton" style="width: 300px; padding: 10px">
                                            <div class="input-group">
                                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-primary" />
                                                <asp:LinkButton Text="text" runat="server" ID="lbkUpload" CssClass="btn btn-default btn-st" Height="33px" OnClick="lbkUpload_Click">
                                                              Upload Data
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:LinkButton runat="server" CssClass="btn btn-default btn-st" ID="lbkStartInventory" OnClientClick="if(!confirm('Bạn có chắc muốn cài đặt lại số lượng kiểm kê về ban đầu không ?')) return false;"
                                        OnClick="lbkStartInventory_CLick">
                                    <i class="fa fa-calendar-check-o" aria-hidden="true"> Start Inventory </i></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <asp:Label Text="" ID="lblThongbaoKQ" CssClass="floatRight" runat="server" Font-Size="13px" ForeColor="Gray" Font-Italic="true" />
                    </div>

                </div>
                <div class="col-lg-2 PaddingLeftRight">
                    <div style="float: right">
                        Count :
                                <asp:Label Text="" ID="lblCount" Font-Bold="true" Font-Size="Large" ForeColor="#c00000" runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12 PaddingLeftRight left-panel"
                style="overflow-x: scroll">
                <div id="main">
                    <div id="GridViewContainer" class="gridview-container">
                        <asp:GridView runat="server" ID="gvFA" AutoGenerateColumns="False" DataKeyNames="id" ClientIDMode="Static"
                            OnRowDataBound="gvFA_RowDataBound" OnPageIndexChanging="gvFA_PageIndexChanging"
                            HeaderStyle-CssClass="gridview-header" BorderColor="#d2d6de" AllowPaging="True"
                            PageSize="30" EnableViewState="true" ShowHeaderWhenEmpty="true" RowStyle-CssClass="GvGrid"
                            FooterStyle-CssClass="gridview-header" CssClass="table grStyle gridview-header box-shadow1 center"
                            OnRowCommand="gvFA_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="No">
                                    <HeaderTemplate>
                                        <%-- <asp:CheckBox ID="chkboxSelectAll"
                            CssClass="chkheader"
                            runat="server" Text=" All" />--%>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%--<asp:CheckBox ID="SelectCheckBox" runat="server" CssClass="chkitems" />--%>
                                        <%# Container.DataItemIndex+1 %>
                                        <asp:Label ID="lblQR" runat="server" Visible="false" Text='<%# Bind("QRcodeOrNot") %>'></asp:Label>
                                        <asp:Label ID="lblID" runat="server" Visible="false" Text='<%# Bind("id") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Asset_Class">
                                    <HeaderTemplate>
                                        <span class="bold-first-two-char">A</span>sset <span class="bold-first-two-char">C</span>lass
                                    </HeaderTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtAsset_Class" runat="server" Text='<%# Bind("Asset_Class") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblAsset_Class" runat="server" Text='<%# Bind("Asset_Class") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SAP code">
                                    <HeaderTemplate>
                                        <span class="bold-first-two-char">S</span>AP <span class="bold-first-two-char">C</span>ode
                                    </HeaderTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtSAP_code" runat="server" Text='<%# Bind("SAP_code") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblSAP_code" runat="server" Text='<%# Bind("SAP_code") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Asset Name">
                                    <HeaderTemplate>
                                        <span class="bold-first-two-char">A</span>sset  <span class="bold-first-two-char">N</span>ame
                                    </HeaderTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtAsset_Name" runat="server" Text='<%# Bind("Asset_Name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblAsset_Name" runat="server" Text='<%# Bind("Asset_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="true" Width="290px" />
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RingNo" Visible="false">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtName2" runat="server" Text='<%# Bind("RingNo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblName2" runat="server" Text='<%# Bind("RingNo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Original Asset">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtOriginal_Asset" runat="server" Text='<%# Bind("Original_Asset") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblOriginal_Asset" runat="server" Text='<%# Bind("Original_Asset") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Serial Number">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtSerialNumber" runat="server" Text='<%# Bind("SerialNumber") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblSerialNumber" runat="server" Text='<%# Bind("SerialNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Profit Center">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtProfitCenter" runat="server" Text='<%# Bind("ProfitCenter") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblProfitCenter" runat="server" Text='<%# Bind("ProfitCenter") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Profit Center Name" Visible="false">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtProfitCenterName" runat="server" Text='<%# Bind("ProfitCenterName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblProfitCenterName" runat="server" Text='<%# Bind("ProfitCenterName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Location">
                                    <HeaderTemplate>
                                        <span class="bold-first-two-char">L</span>ocation
                                    </HeaderTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtLocation" runat="server" Text='<%# Bind("Location") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Update Date">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtUpdateDate" runat="server" Text='<%# FormatDeprStartDate(Eval("DeprStartDate")) %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblUpdateDate" runat="server" Text='<%# FormatDeprStartDate(Eval("DeprStartDate")) %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Received Amount">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtReceivedAmount" runat="server" Text='<%# FormatCurrency(Eval("ReceivedAmount")) %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblReceivedAmount" runat="server" Text='<%# FormatCurrency(Eval("ReceivedAmount")) %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Book Amount">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtBookAmount" runat="server" Text='<%# FormatCurrency(Eval("BookAmount")) %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblBookAmount" runat="server" Text='<%# FormatCurrency(Eval("BookAmount")) %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remark" Visible="false">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtRemark" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Section Stock Check" Visible="false">
                                    <HeaderTemplate>
                                        <span class="bold-first-two-char">S</span>ection   <span class="bold-first-two-char">S</span>tock<span class="bold-first-two-char">C</span>heck
                                    </HeaderTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtSectionStockCheck" runat="server" Text='<%# Bind("SectionStockCheck") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblSectionStockCheck" runat="server" Text='<%# Bind("SectionStockCheck") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="QRCode" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblQRCode" runat="server" Text='<%# Bind("QRcodeOrNot") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="State">
                                    <ItemTemplate>
                                        <asp:Label ID="lblState" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RingNo2" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRingNo" runat="server" Text='<%# Bind("RingNo2") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="History">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" Visible="false" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                        <asp:HyperLink ID="hklink" CssClass="width100" Text='<%# Bind("Status") %>' runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowId" runat="server" Text='<%# Eval("id") %>' CssClass="btn btn-default" Style="display: none;"></asp:Label>
                                        <asp:LinkButton Text="Update" ToolTip="Sửa dữ liệu" CssClass="btn-st btn btn-default" CommandArgument="<%#Container.DataItemIndex%>" CommandName='<%#"EDIT|"+Eval("id")%>'
                                            ID="lblUpdate" runat="server"> <i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                                        <asp:LinkButton Text="Delete" ToolTip="Xóa dữ liệu" CssClass="btn-st btn btn-default" CommandArgument="<%#Container.DataItemIndex%>" CommandName='<%#"DEL|"+Eval("id")%>'
                                            ID="lblDelete" runat="server"
                                            OnClientClick="if(!confirm('Are you sure you want delete')) return false;"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                        <asp:LinkButton Text="Details" ToolTip="Show details" CommandArgument="<%#Container.DataItemIndex%>" CommandName='<%#"Detail|"+Eval("id")%>'
                                            ID="btnDetails" runat="server" CssClass="btn-details btn btn-st btn-default"> <i class="fa fa-info-circle" aria-hidden="true"></i></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle CssClass="pagination-ys gridview-header" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <asp:Panel runat="server" ID="pnDetail" Visible="false" CssClass="GvGrid">
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">
                            <asp:Label Text="Detail" ID="lblTitile" ForeColor="gray" Font-Bold="true" runat="server" />
                        </h3>
                        <div class="pull-right box-tools">
                            <div id="detailContainer" runat="server">
                                <button type="button" class="btn btn-box-tool btn-sm" data-widget="collapse"
                                    data-toggle="tooltip" style="margin-right: 5px;" data-original-title="Collapse"
                                    id="btnCollapse" runat="server">
                                    <i class="fa fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove" id="btnRemove" runat="server">
                                    <i class="fa fa-times"></i>
                                </button>

                                <!-- Your other content -->
                            </div>
                        </div>
                        <!-- /. tools -->
                    </div>
                    <div class="box-body no-padding">
                        <table class="table table-bordered">
                            <tr>
                                <td>
                                    <b>Asset Class :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblAssetClass" runat="server" />
                                </td>
                                <td><b>SAP Code :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblSAPCode" runat="server" />
                                </td>
                                <td><b>Asset Name :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblAssetName" runat="server" />
                                </td>
                                <td><b>RingNo :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblRingNo" runat="server" />
                                </td>
                                <td><b>Original Asset :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblOriginalAsset" runat="server" />
                                </td>
                                <td><b>Serial Number :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblSerialNumber" runat="server" />
                                </td>
                                <td><b>Profit Center :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblProfitCenter" runat="server" />
                                </td>
                                <td><b>Profit Center Name :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblProfitCenterName" runat="server" />
                                </td>
                                <td><b>State :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblState" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td><b>Location :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblLocation" runat="server" />
                                </td>
                                <td><b>Update Date :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblUpdateDate" runat="server" />
                                </td>
                                <td><b>Received Amount :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblReceivedAmount" runat="server" />
                                </td>
                                <td><b>Book Amount :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblBookAmount" runat="server" />
                                </td>
                                <td><b>Remark :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblRemark" runat="server" />
                                </td>
                                <td><b>Section StockCheck :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblSectionStockCheck" runat="server" />
                                </td>
                                <td><b>QRCode :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblQRCode" runat="server" />
                                </td>
                                <td><b>RingNo2 :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblRingNo2" runat="server" />
                                </td>
                                <td><b>History :</b>
                                    <asp:Label Text="" ForeColor="#ae6b00" ID="lblHistory" runat="server" />
                                </td>

                            </tr>

                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
            </asp:Panel>
        </div>
    </section>
    <script type="text/javascript">   
        $(document).ready(function () {
            // Vị trí cần đến
            var targetElement = $('.selected-row');

            // Vị trí đối tượng div bao ngoài
            var container = $('#GridViewContainer');

            // Tính toán vị trí của targetElement trong container
            var offset = targetElement.offset().top - container.offset().top + container.scrollTop();

            // Scroll đến vị trí cần đến trong container
            container.animate({
                scrollTop: offset
            }, 'slow');
        });

        document.addEventListener("DOMContentLoaded", function () {
            var targetElement = document.querySelector('.selected-row');
            var container = document.getElementById('GridViewContainer');

            if (targetElement && container) {
                var elementOffsetTop = targetElement.offsetTop;
                var containerOffsetTop = container.offsetTop;
                var scrollTop = elementOffsetTop - containerOffsetTop;

                container.scrollTo({
                    top: scrollTop,
                    behavior: 'smooth'
                });
            }
        });
        function toggleDropdown() {
            var dropdownMenu = document.getElementById('filterDropdown');
            if (dropdownMenu.style.display === 'block') {
                dropdownMenu.style.display = 'none';
            } else {
                dropdownMenu.style.display = 'block';
            }
        }
        // Đóng dropdown khi nhấn nút upload
        $('#<%= lbkUpload.ClientID %>').click(function () {
            $('.dropdown-menu').parent().removeClass('open');
        });
        function scrollToRow(rowId) {
            var rowLabels = document.getElementsByClassName('row-id');
            for (var i = 0; i < rowLabels.length; i++) {
                var label = rowLabels[i];
                console.log("label:", label);
                console.log("rowId:", rowId);
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
    </script>
</asp:Content>
