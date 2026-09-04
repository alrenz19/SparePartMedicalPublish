<%@ Page Title="Sparepart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" Async="true"
    CodeBehind="SparepartMenu2.aspx.cs" Inherits="QlyMain.Sparepart.SparepartMenu2" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .btn-st {
            background: white;
            border-radius: 0px;
        }

        .GvGrid:hover {
            background-color: white;
            border-top: solid;
            color: #9C6500;
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
        }

        .dropdown-menu {
            border: 1px solid #9c640b;
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

        html {
            scroll-behavior: smooth;
            scroll-padding-top: 50px;
        }

        .gridview-header {
            position: sticky;
            top: 0;
            background-color: #f9f9f9;
            z-index: 1;
        }

        .gridview-container {
            height: 700px;
            padding: 0 5px 0px 5px;
        }

        body {
            background: #80808024;
        }

        .select2-selection--single .select2-selection__arrow {
            height: 15px;
        }

        ul.multiselect-container.dropdown-menu {
            height: 160px;
            overflow: auto;
        }

        .table-bordered > tbody > tr > td, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > td, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > thead > tr > th {
            border: 1px solid #607d8b !important;
        }

        .box-shadow2 {
            background: white;
            padding: 2px 0 2px 0;
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
            background-color: white;
            border-radius: 2px;
        }

        .marginBottom3 {
            margin-bottom: 3px;
        }

        .styletr {
            border-bottom: 0.1px solid #607d8b4d;
        }

        .styletd {
            padding: 2px;
        }

        span.select2-dropdown.select2-dropdown--below {
            font-size: 12px;
            width: 130px !important;
        }

        span#select2-MainContent_ddType-container {
            font-size: 12px;
        }

        .paddingLeft5 {
            padding-left: 5px;
        }

        .modalPopup1 {
            background-color: #FFFFFF;
            width: 60%;
            height: auto;
            padding: 30px;
            box-shadow: 2px 4px 6px #888888;
        }

            .modalPopup1 .body {
                min-height: 50px;
                line-height: 30px;
                text-align: center;
                padding: 50px;
            }

            .modalPopup1 .footer {
                padding: 3px;
            }

            .modalPopup1 .button {
                height: 23px;
                color: White;
                line-height: 23px;
                text-align: center;
                font-weight: bold;
                cursor: pointer;
                background-color: #9F9F9F;
                border: 1px solid #2a502a;
            }

        .search_custom_loading {
            text-align: center;
            padding: 20px;
            font-size: 14px;
            color: #555;
        }

            .search_custom_loading img {
                animation: spin 1s linear infinite;
            }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

        .highlighted-row {
            border: 5px solid #55b5ec;
        }
    </style>
    <link href="../Content/css/ModalDrag.css" rel="stylesheet" />
    <link href="../Content/css/bootstrap-multiselect.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap-multiselect.js"></script>
    <script type="text/javascript">
        $(document).on('click', '.dropdown-menu', function (e) {
            e.stopPropagation();
        });
        function dateselect_txtFindFrom(ev) {
            var calendarBehavior1 = $find("txtFindFrom_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("MMM.yyyy")
        }
        function dateselect_txtFindTo(ev) {
            var calendarBehavior1 = $find("txtFindTo_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("MMM.yyyy")
        }

        // Hàm để reload GridView khi đóng tab mới
        function reloadGridView() {
            try {
                var parentGridView = window.opener.document.getElementById('<%= gvSP.ClientID %>');
            if (parentGridView != null) {
                window.opener.__doPostBack(parentGridView.id, '');
            } else {
                console.error("GridView not found in the parent window.");
            }
        } catch (error) {
            console.error('Error while reloading GridView:', error);
        }
    }

    </script>
    <%-- <div class="col-sm-1 col-md-1 col-lg-1">
    </div>--%>

    <section class="content-header">
        <h1>Quản lý Spare parts (Spare parts management) 
     <small>
         <asp:Label Text="" ID="lblOfMachine" runat="server" /></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Fixed asset</li>
        </ol>
    </section>
    <section class="content" id="content" style="background-color: white">
        <div>
            <div class="messagealert" id="alert_container">
            </div>
            <asp:LinkButton ID="lbk" runat="server" OnClick="lbk_Click" Visible="false">lbkQtyStock</asp:LinkButton>
            <asp:Label ID="lblThongbaoCM" Font-Size="Medium" runat="server" />
            <div class="row" style="border-bottom: 1px solid #d2d6de">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="col-sm-1 col-md-1 col-lg-1">
                        <div style="margin-left: 10px; margin-right: 10px;">
                            <div style="float: left">
                            </div>
                            <span>Số dòng hiển thị:
            <asp:DropDownList ID="ddlDong" runat="server"
                CssClass="dropdown" AutoPostBack="true"
                OnSelectedIndexChanged="ddlDong_SelectedIndexChanged">
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
                <asp:ListItem>100</asp:ListItem>
            </asp:DropDownList>
                            </span>
                            <asp:LinkButton Text="Export----" Visible="false" CssClass="btn btn-default btn-st" OnClick="lbkImgExportQRcode_Click" runat="server" />
                            <asp:LinkButton Text="Cập nhật lại dữ liệu tháng 1" ID="RefreshData" Visible="false" CssClass="btn btn-default btn-st" runat="server" OnClick="RefreshData_Click" />
                        </div>
                    </div>
                    <div class="col-sm-8 col-md-8 col-lg-8 PaddingLeftRight">
                        <div style="float: right">
                            <table>
                                <tr>
                                    <td>
                                        <div class="dropdown">
                                            <button class="btn btn-default btn-st" type="button" style="height: 34px" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <h6 style="margin: 0px">Export <span class="caret"></span></h6>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="width: 400px">
                                                <div class="input-group">
                                                    <asp:Panel ID="Panel1" runat="server" DefaultButton="lbkExportExcel">
                                                        <asp:TextBox ID="txtFindFrom" runat="server" autocomplete="off" Width="150px" Height="30px" BorderColor="#0099cc"
                                                            placeholder="From date,...." Class="form-control"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server"
                                                            OnClientDateSelectionChanged="dateselect_txtFindFrom"
                                                            BehaviorID="txtFindFrom_CalendarExtender" TargetControlID="txtFindFrom" />
                                                        <asp:TextBox ID="txtFindTo" runat="server" autocomplete="off" Width="150px" Height="30px" BorderColor="#0099cc"
                                                            placeholder="To date,...." Class="form-control"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server"
                                                            OnClientDateSelectionChanged="dateselect_txtFindTo"
                                                            BehaviorID="txtFindTo_CalendarExtender" TargetControlID="txtFindTo" />
                                                        <span class="input-group-btn">
                                                            <asp:LinkButton ID="lbkExportExcel" runat="server" Height="30px" BorderColor="#0099cc" OnClick="lbkExportExcel_Click"
                                                                class="btn btn-default btn-st"><span class="glyphicon glyphicon-search"></span>̀Export</asp:LinkButton>

                                                            <asp:LinkButton ID="lbkExportOut" runat="server" Height="30px" BorderColor="#0099cc" OnClick="lbkExportOut_CLick"
                                                                class="btn btn-default btn-st"><span class="glyphicon glyphicon-search"></span>̀Export Out</asp:LinkButton>
                                                        </span>
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </div>
                                    </td>

                                    <td style="padding-left: 10px">
                                        <asp:DropDownList runat="server" Font-Size="12px" ID="ddType" CssClass="selectSec" AutoPostBack="true"
                                            Height="34px" Width="150px" OnSelectedIndexChanged="ddType_SelectedIndexChanged">
                                        </asp:DropDownList>

                                    </td>
                                    <td style="padding-right: 10px">
                                        <div class="navbar-form" role="search" style="padding: 0px">
                                            <div class="input-group">
                                                <asp:Panel runat="server" DefaultButton="lbkSearch">
                                                    <asp:TextBox runat="server" Height="34px" Font-Size="11px" autocomplete="off" Width="150px" ID="txtSearchSP"
                                                        placeholder="Tìm kiếm " CssClass="form-control" />
                                                    <span class="input-group-btn">
                                                        <asp:LinkButton runat="server" ID="lbkSearch" Height="34px" Font-Size="12px" CssClass="btn btn-default btn-st"
                                                            OnClick="lbkSearch_OnClick">🔍</asp:LinkButton>
                                                    </span>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>
                                            <!-- Nút mở các modal khác nhau -->
                                            <button class="search_custom_open_button btn btn-default btn-st" data-target=".modal1">SafeStock Info 📝</button>
                                            <!-- Modal 1 -->
                                            <div class="search_custom_modal modal1">
                                                <div class="search_custom_header">
                                                    <h3 class="search_custom_title">Management information</h3>
                                                    <button class="search_custom_close">&times;</button>
                                                </div>
                                                <div class="search_custom_content">
                                                    <asp:UpdatePanel ID="UpdatePanelModal1" runat="server">
                                                        <ContentTemplate>
                                                            <asp:DropDownList runat="server" ID="ddFilter" CssClass="selecFilter"
                                                                OnSelectedIndexChanged="ddFilter_SelectedIndexChanged" AutoPostBack="true">
                                                                <asp:ListItem Text="--ALL-" Value="0" />
                                                                <asp:ListItem Text="Dưới an toàn kho" Value="1" />
                                                                <asp:ListItem Text="Sparepart đang hết" Value="2" />
                                                            </asp:DropDownList>
                                                            <br />
                                                            <!-- Icon loading -->
                                                            <asp:Label Text="" ID="lblUnderSafeSock" Font-Size="14px" Font-Bold="true" ForeColor="Gray" runat="server" />
                                                            <br />
                                                            <asp:LinkButton Text="Export" Visible="false" CssClass="btn btn-default btn-st" ID="btnExportSafeStock" OnClick="btnExportSafeStock_Click" runat="server" />
                                                            <br />
                                                            Count :
                                   <asp:Label Text="" ID="lblCount" Font-Bold="true" Font-Size="Large" ForeColor="#c00000" runat="server" />
                                                            <div id="loadingIcon" class="search_custom_loading" style="display: none;">
                                                                <img src="../Img/Iphone-spinner-2.gif" width="30" alt="Loading..." />
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:LinkButton Text="+ Add SparePart" Font-Size="12px" Height="34px" ID="btnOpenPnSparepart" runat="server" CssClass="btn btn-default btn-st"
                                            OnClick="OpenPnSparepart_Click" />
                                        <button class="search_custom_open_button btn btn-info" data-target=".modal2">+ Add SparePart</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <div style="float: right">
                                            <asp:Label Text="" ID="lblThongbaoKQ" CssClass="floatRight" runat="server" Font-Size="13px" ForeColor="Gray" Font-Italic="true" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col-lg-3 PaddingLeftRight">
                        <div style="float: right">
                            <table>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="hyperlink1" CssClass="liStyle btn btn-default btn-st" NavigateUrl="~/Admin/QtyHistory.aspx" Text="Lịch sử số lượng" runat="server" />
                                    </td>
                                    <td>
                                        <div class="alert-info">
                                            <ul>
                                                <li><span style="font-size: 10px">
                                                    <asp:Label ID="lblTitleStock" runat="server" />
                                                    <asp:Label Text="" ID="lblStockMess" Font-Bold="true" runat="server" />
                                                </span>
                                                </li>
                                                <li><span style="font-size: 10px">
                                                    <asp:Label ID="lblTitleIn" runat="server" />
                                                    <asp:Label Text="" ID="lblInMess" Font-Bold="true" runat="server" />
                                                </span></li>
                                                <li><span style="font-size: 10px">
                                                    <asp:Label ID="lblTitleOut" runat="server" />
                                                    <asp:Label Text="" ID="lblOutMess" Font-Bold="true" runat="server" />
                                                </span></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <%-- popup --%>
            <div id="OpenAdd">
                <asp:LinkButton ID="LinkButton3" runat="server"></asp:LinkButton>
                <ajaxToolkit:ModalPopupExtender ID="popupAdd"
                    runat="server" PopupControlID="pnAdd" TargetControlID="LinkButton7" CancelControlID="lbtCancelAdd"
                    BackgroundCssClass="modalBackground" DropShadow="false">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel ID="pnAdd" CssClass="popupmail" runat="server" Style="display: none;">
                    <div id="AddModal">
                        <div class="modalmail">
                            <div class="modal-content">
                                <div class="modal-header alert-info">
                                    <div>
                                        Add Spare part by UserCode :
                                    <asp:Label Text="" ID="lblUserCodeAdd" runat="server" />
                                    </div>
                                </div>
                                <div class="modal-body" style="height: 500px; overflow-y: scroll">
                                    <!--TBALE-->
                                    <%-- <asp:DropDownList runat="server" ID="ddPosition" CssClass="selectPos"
                                                Height="70px" Width="200px">
                                            </asp:DropDownList>--%>
                                </div>
                                <div class="modal-footer">
                                    <div class="row">
                                        <div class="col-md-6">
                                        </div>
                                        <div class="col-md-6">
                                            <asp:LinkButton ID="lbtCancelAdd" runat="server"
                                                CssClass="btn btn-default btn-st">Cancel</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <asp:Label ID="lblThongbaoAdd" runat="server"></asp:Label>
            <!--Pupub detail -->
            <div id="OpenOrder">
                <asp:LinkButton ID="lbkOrder" runat="server"></asp:LinkButton>
                <ajaxToolkit:ModalPopupExtender ID="popupOrder"
                    runat="server" PopupControlID="pnOrder" TargetControlID="lbkOrder" CancelControlID="lbtCancelOrder"
                    BackgroundCssClass="modalBackground" DropShadow="false">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel ID="pnOrder" CssClass="popupmail" runat="server" Style="display: none;">
                    <div id="OrderModal">
                        <div class="modalmail">
                            <div class="modal-content">
                                <div class="modal-header alert-info">
                                    <div>
                                        List lịch sử Order chi tiết  
                                    <asp:Label Text="" ID="lblUserCodeOrder" runat="server" />
                                    </div>
                                    <div style="float: right">
                                        <asp:LinkButton ID="lbtCancelOrder" runat="server"
                                            data-dismiss="modal" ForeColor="Red" Font-Bold="true" Font-Size="20px">X</asp:LinkButton>
                                    </div>
                                </div>
                                <div class="modal-body" style="height: 500px; overflow-y: scroll">
                                    <asp:GridView ID="gvOrderDetail" runat="server" CellSpacing="2" CellPadding="4" Width="100%" AutoGenerateColumns="False"
                                        CssClass="table" ShowHeaderWhenEmpty="True" BorderStyle="None" OnRowDataBound="gvOrderDetail_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <%#  (Container.DataItemIndex + 1) %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="STT">
                                                <ItemTemplate>
                                                    <asp:Label ID="LSTT" runat="server" Text='<%# Bind("STT") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Position Save">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtPositionSave" Width="120" runat="server"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PositionSave") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Part Name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtPartName" runat="server" Width="120"></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PartName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="User">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblOrderUser" runat="server" Text='<%# Bind("OrderUser") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldateMdf" runat="server" Text='<%# Bind("dateMdf") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Input">
                                                <ItemTemplate>
                                                    <asp:Label ID="lInNew" runat="server" Visible="false" Text='<%# Bind("InNew") %>'></asp:Label>
                                                    <asp:Label ID="lblInOld" runat="server" Visible="false" Text='<%# Bind("InOld") %>'></asp:Label>
                                                    <asp:Label Text="" ID="lblInputGap" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total OrderQty Old">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalOrderOld" runat="server" Text='<%# Bind("TotalOrderOld") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total OrderQty New">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalOrderNew" runat="server" Text='<%# Bind("TotalOrderNew") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>

                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <!--End Pupub detail -->
            <%-- Edit --%>
            <div id="OpenEdit">
                <asp:LinkButton ID="LinkButton7" runat="server"></asp:LinkButton>
                <ajaxToolkit:ModalPopupExtender ID="popupEdit"
                    runat="server" PopupControlID="pnEdit" TargetControlID="LinkButton7" CancelControlID="lbtCancelEdit"
                    BackgroundCssClass="modalBackground" DropShadow="false">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel ID="pnEdit" CssClass="popupmail" runat="server" Style="display: none;">
                    <div id="EditModal">
                        <div class="modalmail">
                            <div class="modal-content">
                                <div class="modal-header alert-info">
                                    <div>
                                        Edit Spare part by UserCode :
                                    <asp:Label Text="" ID="lblUserCodeEdit" runat="server" />
                                    </div>
                                </div>
                                <div class="modal-body" style="height: 500px; overflow-y: scroll">
                                    <table class="table" style="font-size: 11px; font-weight: bold">
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtPartIDEdit" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Position
                                            <asp:DropDownList runat="server" ID="ddPositionEdit" CssClass="selectPosEdit"
                                                Height="70px" Width="200px">
                                            </asp:DropDownList>
                                            </td>
                                            <td>Spare part name
                        <asp:TextBox runat="server" ID="txtSparepartEdit" CssClass="form-control" /></td>
                                            <td>Maker
                <asp:TextBox runat="server" ID="txtMakerEdit" CssClass="form-control" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Model
                <asp:TextBox runat="server" ID="txtModelEdit" CssClass="form-control" />
                                            </td>
                                            <td>Item code
                <asp:TextBox runat="server" ID="txtItemCodeEdit" CssClass="form-control" />
                                            </td>
                                            <td>Picture
                           <asp:FileUpload ID="FileUpload2" runat="server" />
                                                <asp:Image ID="imgEdit" runat="server" Width="80" Height="80" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Safety stock <sub style="color: red">*</sub>
                                                <asp:TextBox runat="server" ID="txtSafetyStockEdit" CssClass="form-control"
                                                    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />
                                                <asp:Label Text="" ID="Label11" runat="server" Visible="false" />
                                            </td>
                                            <td>QtyStock<sub style="color: red">*</sub>
                                                <asp:TextBox runat="server" ID="txtQtyStockEdit" CssClass="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />
                                                <asp:Label Text="" ID="Label12" runat="server" Visible="false" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Leadtime<sub style="color: red">*</sub>
                                                <asp:TextBox runat="server" ID="txtLeadtimeEdit" CssClass="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />
                                                <asp:Label Text="" ID="Label13" runat="server" Visible="false" />
                                            </td>
                                            <td>Price
                                          <asp:TextBox runat="server" ID="txtPrice_Edit" CssClass="form-control" />
                                            </td>
                                            <td>Supplier
                                          <asp:TextBox runat="server" ID="txtSupplier_Edit" CssClass="form-control" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>MOQ/SPQ
                                            <asp:TextBox runat="server" ID="txtMOQ_SPQEdit" CssClass="form-control" />
                                            </td>
                                            <td>Số Thứ tự
                                            <asp:TextBox runat="server" ID="txtSTT_Edit" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" CssClass="form-control" />
                                            </td>
                                            <td>Remark
                                             <asp:TextBox runat="server" ID="txtRemark_Edit" CssClass="form-control" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                                <asp:LinkButton Text="Save" CssClass="btn-default btn" runat="server" ID="LinkButton1"
                                                    OnClick="lbkEdit_Click" /></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <div class="row">
                                        <div class="col-md-6">
                                        </div>
                                        <div class="col-md-6">
                                            <asp:LinkButton ID="lbtCancelEdit" runat="server"
                                                class="btn btn-default"
                                                data-dismiss="modal">Cancel</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <!-- ADD -->
            <asp:UpdatePanel runat="server" ID="UpdatePanelModal2">
                <ContentTemplate>
                    <div class="search_custom_modal modal2">
                        <div class="search_custom_header">
                            <h3 class="search_custom_title">Thêm Sparepart</h3>
                            <button class="search_custom_close">&times;</button>
                        </div>
                        <div class="search_custom_content">
                            <table class="table" style="font-size: 11px; font-weight: bold">
                                <tr>
                                    <td>Position
                                                                       <asp:DropDownList runat="server" ID="ddPosition" CssClass="selectPos"
                                                                           Height="70px" Width="200px">
                                                                       </asp:DropDownList>
                                    </td>
                                    <td>Spare part name
                                    <asp:TextBox runat="server" ID="txtSparepartName" CssClass="form-control" /></td>
                                    <td>Maker
                                     <asp:TextBox runat="server" ID="txtMacker" CssClass="form-control" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Model
                                    <asp:TextBox runat="server" ID="txtModel" CssClass="form-control" />
                                    </td>
                                    <td>Item code
                                     <asp:TextBox runat="server" ID="txtItemCode" CssClass="form-control" />
                                    </td>
                                    <td>Picture
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Safety stock <sub style="color: red">*</sub>
                                        <%--<div class="navbar-form" role="search">
                                                <div class="input-group">
                                                    <asp:TextBox runat="server" ID="txtSafety"
                                                        oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" CssClass="form-control" />
                                                    <span class="input-group-btn">
                                                        <asp:TextBox runat="server" ID="txtSafetyRemark" placeholder="Remark" CssClass="form-control" />
                                                    </span>
                                                </div>
                                            </div>--%>
                                        <asp:TextBox runat="server" ID="txtSafety"
                                            oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" CssClass="form-control" />
                                        <asp:Label Text="" ID="lblThongbaoSafety" runat="server" Visible="false" />
                                    </td>
                                    <td>QtyStock<sub style="color: red">*</sub>
                                        <asp:TextBox runat="server" ID="txtQtyStock" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" CssClass="form-control" />
                                        <asp:Label Text="" ID="lblThongbaoQtyStock" runat="server" Visible="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>Leadtime<sub style="color: red">*</sub>
                                        <asp:TextBox runat="server" ID="txtLeadtime" CssClass="form-control" />
                                        <asp:Label Text="" ID="lblThongbaoLeadtime" runat="server" Visible="false" />
                                    </td>
                                    <td>Price
                                          <asp:TextBox runat="server" ID="txtPrice" CssClass="form-control" />
                                    </td>
                                    <td>Supplier
                                          <asp:TextBox runat="server" ID="txtSupplier" CssClass="form-control" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>MOQ/SPQ
                                          <asp:TextBox runat="server" ID="txtMOQ" CssClass="form-control" />
                                    </td>
                                    <td>Số thứ tự<sub style="color: red">*</sub>
                                        <asp:TextBox runat="server" ID="txtSTT" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" CssClass="form-control" />
                                    </td>
                                    <td>Remark
                                          <asp:TextBox runat="server" ID="txtRemarkSP" CssClass="form-control" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        <asp:LinkButton Text="Create" CssClass="btn btn-default btn-st" runat="server" ID="lbkCreateSP" OnClick="lbkCreateSP_Click" /></td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12 PaddingLeftRight left-panel"
                style="overflow-x: scroll">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div id="GridViewContainer" class="gridview-container">
                            <asp:GridView runat="server" AutoGenerateColumns="False" ID="gvSP"
                                CssClass="table table-bordered box-shadow1" OnRowDataBound="gvSP_RowDataBound"
                                DataKeyNames="PartID" RowStyle-CssClass="GvGrid"
                                OnRowCommand="gvSP_RowCommand" GridLines="None" Font-Size="13px"
                                OnPageIndexChanging="gvSP_PageIndexChanging" AllowPaging="True"
                                OnRowCancelingEdit="gvSP_RowCancelingEdit" OnRowEditing="gvSP_RowEditing"
                                OnRowUpdating="gvSP_RowUpdating">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <%#  (Container.DataItemIndex + 1) %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="STT">
                                        <ItemTemplate>
                                            <asp:Label ID="STT" runat="server" Text='<%# Bind("STT") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="btn_Update" runat="server" Text="Update" CommandName="Update" />
                                            <asp:LinkButton ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PartID" Visible="False">
                                        <EditItemTemplate>
                                            <asp:Label ID="lblPartID" runat="server" Text='<%# Bind("PartID") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblID" runat="server" Text='<%# Bind("PartID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Position Save">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtPositionSave" Width="120" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPositionSave" runat="server" Text='<%# Bind("PositionSave") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Part Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtPartName" runat="server" Width="120"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPartName" runat="server" Text='<%# Bind("PartName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Maker">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtMaker" runat="server" Width="120"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblMaker" runat="server" Text='<%# Bind("Maker") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Model">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtModel" runat="server" Width="120"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblModel" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ItemCode">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtItemCode" runat="server" Width="120"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblItemCode" runat="server" Text='<%# Bind("ItemCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Price" Visible="False">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtPrice" runat="server" Width="120"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Supplier" Visible="False">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtSupplier" runat="server" Width="120"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblSupplier" runat="server" Text='<%# Bind("Supplier") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PictureURL">
                                        <EditItemTemplate>
                                            <asp:FileUpload ID="FileUpload1" runat="server" Width="110" />
                                            <br />
                                            <asp:ImageButton CssClas="ImgbRadius margin" ID="ImgEdit" Width="80" Height="80"
                                                ImageUrl='<%# Bind("PictureURL") %>' runat="server" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <%--    <asp:Label ID="lblUrlPictrue" Visible="false" Text='<%# Eval("PictureURL") %>' runat="server" />
                                    <asp:Image ID="imgproblem" runat="server" ImageUrl='<%# Eval("PictureURL") %>'
                                        Width="80" Height="80" CssClass="image-zoom" onclick="zoomImage(this);" />--%>

                                            <asp:Label ID="lblUrlPictrue" Visible="false" Text='<%# Eval("PictureURL") %>' runat="server" />
                                            <%# string.IsNullOrEmpty(Eval("PictureURL")?.ToString()) ? "" : $"<img src='{Eval("PictureURL")}' width='80' height='80' class='image-zoom' onclick='zoomImage(this);' />" %>

                                            <%--       <asp:ImageButton CssClas="ImgbRadius margin"  ID="ImgbRadius" Width="80" Height="80"
                                    ImageUrl='<%# Bind("PictureURL") %>' runat="server" />--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Safety Stock">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label61" runat="server" Text='<%# Bind("SafetyStockShow") %>'></asp:Label>
                                            <%--   <asp:TextBox ID="txtSafety" runat="server" Width="120"></asp:TextBox>--%>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblSafetyStockShow" runat="server" Text='<%# Bind("SafetyStockShow") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Lead Time">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtLeadTime" runat="server" Width="120"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblLeadTime" runat="server" Text='<%# Bind("LeadTime") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MOQ_SPQ">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtMOQ_SPQ" runat="server" Width="120"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblMOQ_SPQ" runat="server" Text='<%# Bind("MOQ_SPQ") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Qty Stock">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtQty" runat="server" Width="120"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblQtyStock" runat="server" Text='<%# Bind("QtyStock") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remark">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtRemark" Text='<%# Bind("Remark") %>' runat="server" Width="120"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                            <asp:Label ID="OrderQty" runat="server" Visible="false" Text='<%# Bind("OrderQty") %>'></asp:Label>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:DataList runat="server" ID="ddChild" OnItemCommand="ddChild_ItemCommand">
                                                <ItemTemplate>
                                                    <asp:Label Text='<%# Bind("PartID") %>' Visible="false" ID="lblPartID" runat="server" />
                                                    <table>
                                                        <tr class="styletr">
                                                            <td class="styletd">Input: </td>
                                                            <td class="styletd">
                                                                <asp:Label ID="lblchildIn" runat="server" Text='<%# Bind("QtyInput") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr class="styletr">
                                                            <td class="styletd">Output: </td>
                                                            <td class="styletd">
                                                                <asp:Label ID="lblchildOut" runat="server" Text='<%# Bind("QtyOutput") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr class="styletr">
                                                            <td class="styletd">Stock: </td>
                                                            <td class="styletd">
                                                                <asp:Label ID="lblStock" runat="server" Text='<%# Bind("QtyStockNew") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr class="styletr">
                                                            <td class="styletd">Order: </td>
                                                            <td class="styletd">
                                                                <%--   <asp:Label ID="lblTotalOrderOfM" runat="server" Text='<%# Eval("TotalOrderOfMonth").ToString() == "0" ? 
                                        "" : Eval("TotalOrderOfMonth").ToString() %>'></asp:Label>--%>

                                                                <%# Eval("TotalOrderOfMonth") == DBNull.Value || Convert.ToInt32(Eval("TotalOrderOfMonth")) == 0 ? "" : Eval("TotalOrderOfMonth").ToString() %>
                                                                <%--  <asp:Label ID="lblTotalOrderOfM" runat="server"
                                                        Text='<%# Eval("TotalOrderOfMonth") == DBNull.Value || Convert.ToInt32(Eval("TotalOrderOfMonth")) == 0 ? "" : Eval("TotalOrderOfMonth").ToString() %>'>
                                                    </asp:Label>--%>
                                                                <asp:Label Text="" ID="lblTotalOrder" Visible="false" runat="server" />
                                                                <asp:LinkButton Text="" ID="lbkOpenListOrderDetail" CommandName="OpenOrderDetail" runat="server">
                                                        <span class="glyphicon glyphicon-tasks" style="color:grey"></span></asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                        <%-- <tr>
                                                <td colspan="2" style="padding: 0px">
                                                    <asp:Literal Text="" ID="lblShowOrder" runat="server" />
                                                </td>
                                            </tr>--%>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="dropdown">
                                                <asp:LinkButton CssClass="dropdown-toggle btn" type="button" data-toggle="dropdown" runat="server">     
                               infor
                              <span class="caret"></span>
                                                </asp:LinkButton>
                                                <ul class="dropdown-menu">
                                                    <li>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False"
                                                            CommandName='<%#"XEM|"+Eval("PartID")%>' Text="Đặt"> 
                                 Show
                                                        </asp:LinkButton>
                                                    </li>
                                                    <li>
                                                        <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False"
                                                            CommandName='<%#"ShowInHistory|"+Eval("PartID")%>' Text="Đặt"> 
                                 Input History
                                                        </asp:LinkButton></li>
                                                    <li><a href="#">
                                                        <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False"
                                                            CommandName='<%#"ShowOutHistory|"+Eval("PartID")%>' Text="Đặt"> 
                                 OutPut History
                                                        </asp:LinkButton></a></li>

                                                    <li><a href="#">
                                                        <asp:LinkButton ID="LinkButton6" runat="server" CausesValidation="False"
                                                            CommandName='<%#"ShowOrderHistory|"+Eval("PartID")%>' Text="Đặt"> 
                                 Order History
                                                        </asp:LinkButton></a></li>
                                                </ul>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="dropdown">
                                                <asp:LinkButton CssClass="dropdown-toggle btn" type="button" data-toggle="dropdown" runat="server">     
                               Action
                              <span class="caret"></span>
                                                </asp:LinkButton>
                                                <ul class="dropdown-menu">
                                                    <li>
                                                        <asp:LinkButton ID="lbtNhapKHo2" runat="server" CausesValidation="False"
                                                            CommandName='<%#"NHAP|"+Eval("PartID")%>' Text="Input"> 
                                <span class="glyphicon glyphicon-import"></span> Input
                                                        </asp:LinkButton>

                                                    </li>
                                                    <li>
                                                        <asp:LinkButton ID="lbtXuatKHO2" runat="server" CausesValidation="False"
                                                            CommandName='<%#"XUAT|"+Eval("PartID")%>' Text="Output"> 
                               <span class="glyphicon glyphicon-export"></span> Output
                                                        </asp:LinkButton>
                                                    </li>
                                                    <li>
                                                        <asp:LinkButton ID="lbtOrder" runat="server" CausesValidation="False"
                                                            CommandName='<%#"ORDER|"+Eval("PartID")%>' Text="Output"> 
                               <span class="glyphicon glyphicon-save"></span> Order
                                                        </asp:LinkButton>
                                                    </li>
                                                </ul>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <table class="table">
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="lbtEdit" runat="server" CausesValidation="False"
                                                            CommandName='<%#"EDIT|"+Eval("PartID")%>' Text="Output"> 
                               <span class="glyphicon glyphicon-export"></span> Edit
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="lbtDel" runat="server" CausesValidation="False"
                                                            CommandName='<%#"Del|"+Eval("PartID")%>' Text="Output" ForeColor="Gray"
                                                            OnClientClick="if (!confirm('Are you sure you want delete?')) return false;"> 
                               <span class="glyphicon glyphicon-trash"></span> 
                                                        </asp:LinkButton></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerSettings Mode="NumericFirstLast" />
                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
        </div>
        <div>
        </div>
    </section>
    <%--    <div class="col-sm-1 col-md-1 col-lg-1">
    </div>--%>
    <asp:HiddenField ID="_FilterData" runat="server" />
    <asp:HiddenField ID="_idCodeMachine" runat="server" />
    <asp:HiddenField ID="_idSparepart" runat="server" />
    <asp:HiddenField ID="_all" runat="server" />
    <asp:HiddenField ID="_Find" runat="server" />
    <asp:HiddenField ID="_CLickFillter" runat="server" />
    <asp:HiddenField ID="hfSelectedRow" runat="server" />

    <script type="text/javascript">
        $(function () {
            $('.select2').select2();
        });
        $(function () {
            $('.selectPart').select2();
        });
        $(function () {
            $('.selectSP').select2();
        });
        $(function () {
            $('.selectSec').select2();
        });
        // 🛠️ Khởi tạo Select2 khi trang tải lần đầu
        $(function () {
            $('.selectPos').select2();
        });

        // 🛠️ Re-init Select2 sau khi AJAX UpdatePanel
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            $('.selectPos').select2();
        });

        // 🛠️ Khởi tạo Select2 khi trang tải lần đầu
        $(function () {
            $('.selecFilter').select2();
        });

        // 🛠️ Re-init Select2 sau khi AJAX UpdatePanel
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            $('.selecFilter').select2();
        });
        $(function () {
            $('.selectPosEdit').select2({
                dropdownParent: $("#EditModal")
            });
        });

        $('[id*=ListOrders]').multiselect({
            includeSelectAllOption: true
        });
        // Khi thay đổi dropdown
        function showLoading() {
            document.getElementById("loadingIcon").style.display = "block";
        }

        // Khi update xong thì ẩn loading
        function hideLoading() {
            document.getElementById("loadingIcon").style.display = "none";
        }

        // Đăng ký sự kiện Ajax trên UpdatePanel để tự động ẩn loading khi hoàn thành tải dữ liệu
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(function () {
            showLoading();
        });

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            hideLoading();
        });

        document.addEventListener("DOMContentLoaded", function () {
            let isDragging = false, xOffset = 0, yOffset = 0, currentX, currentY, initialX, initialY;

            // Lấy tất cả các nút mở modal
            const openButtons = document.querySelectorAll(".search_custom_open_button");

            openButtons.forEach(button => {
                button.addEventListener("click", function (event) {
                    event.preventDefault();
                    const modalSelector = button.getAttribute("data-target");
                    const modal = document.querySelector(modalSelector);

                    if (modal) {
                        modal.style.display = "block";
                        centerModal(modal);
                    }
                });
            });

            // Lấy tất cả các nút đóng modal
            const closeButtons = document.querySelectorAll(".search_custom_close");
            closeButtons.forEach(button => {
                button.addEventListener("click", function (event) {
                    event.preventDefault();
                    button.closest(".search_custom_modal").style.display = "none";
                });
            });

            // Căn giữa modal khi mở
            function centerModal(modal) {
                const rect = modal.getBoundingClientRect();
                xOffset = (window.innerWidth - rect.width) / 2;
                yOffset = 200; // Điều chỉnh vị trí theo chiều dọc
                modal.style.left = xOffset + "px";
                modal.style.top = yOffset + "px";
            }

            // Xử lý kéo thả modal
            document.querySelectorAll(".search_custom_header").forEach(header => {
                header.addEventListener("mousedown", function (e) {
                    const modal = header.closest(".search_custom_modal");
                    isDragging = true;
                    initialX = e.clientX - xOffset;
                    initialY = e.clientY - yOffset;

                    document.addEventListener("mousemove", moveModal);
                    document.addEventListener("mouseup", stopDragging);

                    function moveModal(e) {
                        if (!isDragging) return;
                        e.preventDefault();
                        currentX = e.clientX - initialX;
                        currentY = e.clientY - initialY;

                        xOffset = currentX;
                        yOffset = currentY;

                        modal.style.left = currentX + "px";
                        modal.style.top = currentY + "px";
                    }

                    function stopDragging() {
                        isDragging = false;
                        document.removeEventListener("mousemove", moveModal);
                        document.removeEventListener("mouseup", stopDragging);
                    }
                });
            });
        });
        function scrollToSelectedRow() {
            var selectedPartID = document.getElementById('<%= hfSelectedRow.ClientID %>').value;
            if (selectedPartID) {
                var row = document.querySelector("[data-partid='" + selectedPartID + "']");
                if (row) {
                    row.scrollIntoView({ behavior: 'smooth', block: 'center' });

                    // Xóa lớp được đánh dấu khỏi tất cả các hàng trước đó (nếu có)
                    var previousRow = document.querySelector(".highlighted-row");
                    if (previousRow) {
                        previousRow.classList.remove("highlighted-row");
                    }

                    // Thêm lớp đánh dấu vào hàng được chọn
                    row.classList.add("highlighted-row");
                }
            }
        }

        // Gọi hàm khi trang tải xong
        window.onload = function () {
            console.log("Start");
            scrollToSelectedRow();
        };
    </script>
    <%-- <script src="../Scripts/ModalDrag.js"></script>--%>
</asp:Content>
