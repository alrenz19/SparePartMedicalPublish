<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SparepartInOut.aspx.cs" Inherits="QlyMain.Sparepart.SparepartInOut" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .RowTable {
            text-align: center;
            vertical-align: middle;
            border: 1px solid #b7b9ba;
            padding:2px;
        }

        .btn-st {
            background: white;
            border-radius: 0px;
        }

        .backGrClr {
            background-color: #fcecd6;
        }

        .ModalPopupBG {
            background-color: #666699;
            filter: alpha(opacity=50);
            opacity: 0.7;
        }

        .center {
            text-align: center;
            vertical-align: middle
        }

        .box-shadow {
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.2), 0 1px 3px 0 rgba(0, 0, 0, 0.19);
            margin: 1%;
            padding: 0.5%;
            font-size: 14px;
        }

        .box-shadow1 {
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
            margin-top: 1%;
            margin-bottom: 1%;
            margin-right: 1%;
            padding: 1%;
            background-color: white;
            border-radius: 2px;
            border-collapse: collapse;
        }

        .gridview-container {
            height: 900px;
            padding: 0 5px 0px 5px;
        }
          /* Style for the image */
        .image-zoom {
            width: 100%;
            transition: transform 0.25s ease;
        }

        /* Zoom effect */
        .zoomed {
            transform: scale(1.5);
            cursor: zoom-out;
        }
    </style>
    <script type="text/javascript">
        function dateselect_txtDateTime(ev) {
            var calendarBehavior1 = $find("txtDateTime_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("MMM.yyyy")
        }
        function dateselect_txtFind(ev) {
            var calendarBehavior1 = $find("txtFind_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("MMM.yyyy")
        }
        function zoomImage(image) {
            // Toggle zoomed class to zoom in and out
            if (image.classList.contains('zoomed')) {
                image.classList.remove('zoomed');
            } else {
                image.classList.add('zoomed');
            }
        }
    </script>
    <section>
        <div class="box-shadow1" style="overflow: scroll">
            <div class="col-md-0">
            </div>
            <div class="col-md-12 gridview-container" style="padding: 0 10px 0 50px">
                <h3>Spare Part Infor</h3>
                <asp:HyperLink runat="server" ID="HyperLinkBackPageLot" Font-Bold="true"
                    NavigateUrl="~/Sparepart/SparepartMenu.aspx" CssClass="btn btn-Link"><i class="fa fa-backward"></i> Back </asp:HyperLink>
                <div class="row">
                    <asp:Panel ID="Panel1" runat="server">
                        <div class="">
                            <div class="col-md-6">
                                <div>
                                    <table class="box-shadow1" style="line-height: 1.3; width: 100%; color: #607d8b; border: 1px solid #b7b9ba">
                                        <tr>
                                            <td class="RowTable backGrClr" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC"><b>Position:</b></td>
                                            <td class="RowTable" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                                                <asp:Label ID="txtPosition" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="RowTable backGrClr" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC"><b>Spare part name</b></td>
                                            <td class="RowTable" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                                                <asp:Label ID="txtPartName" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="RowTable backGrClr" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC"><b>Maker:</b></td>
                                            <td class="RowTable" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                                                <asp:Label ID="txtMaker" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="RowTable backGrClr" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC"><b>Model:</b></td>
                                            <td class="RowTable" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                                                <asp:Label ID="txtModel" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="RowTable backGrClr" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC"><b>Item code:</b></td>
                                            <td class="RowTable" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                                                <asp:Label ID="txtItemcode" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="RowTable backGrClr" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC"><b>Safety stock:</b></td>
                                            <td class="RowTable" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                                                <asp:Label ID="txtSafety" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="RowTable backGrClr" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC"><b>Leadtime</b><br />
                                                (Days):</td>
                                            <td class="RowTable" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                                                <asp:Label ID="txtLeadtime" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="RowTable backGrClr" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC"><b>MOQ/SPQ:</b></td>
                                            <td class="RowTable" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                                                <asp:Label ID="txtMOQ" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="RowTable backGrClr" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC"><b>Machine:</b></td>
                                            <td class="RowTable" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                                                <asp:Label ID="txtMachine" runat="server" CssClass="font-weight-bold"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="RowTable backGrClr" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC"><b>Machine:</b></td>
                                            <td class="RowTable" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                                                <asp:Literal ID="ltrListmachine" runat="server"></asp:Literal>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">
                                                <%--<asp:DataList runat="server" ID="ddListCodeMachine" RepeatDirection="Horizontal" RepeatColumns="4">
                                        <HeaderTemplate>
                                            <b>Code Machine</b>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <table class="table">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblCodeMachine" runat="server" Text='<%# Bind("CodeMachine") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>--%>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <table class="table">
                                    <tr>
                                        <td class="auto-style1"></td>
                                        <td class="">
                                            <asp:Label ID="txtPartID" runat="server" Visible="False"></asp:Label></td>
                                        <td rowspan="13" class="auto-style4" style="vertical-align: top">
                                            <asp:Image ID="Image1" runat="server" Width="200px" Height="200px" CssClass="imgPart image-zoom"  onclick="zoomImage(this);"  />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div class="row">
                    <a id="LinkSP" runat="server" style="text-decoration: underline"><i><span class="fa fa-arrow-left"></span>Back Sparepart</i></a>
                </div>
                <div class="row">
                    <hr style="width: 80%; border: 1px solid #00968840" />
                    <div class="dropdown">
                        <asp:LinkButton Text="+ Edit Input/Ouput/Stock" ID="lbkOpenUpdate" Font-Underline="true" CssClass="btn btn-info"
                            runat="server" OnClick="lbkOpenUpdate_Click" />
                        <asp:Label ID="lblthongbaocapnhat" runat="server" />
                        <asp:Label ID="lblTB" runat="server" />
                        <asp:Panel runat="server" ID="pnOpen" Visible="false">
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <div class="btn-group" role="group">
                                        <asp:Label Text="" ID="lblThongBao" runat="server" />
                                        <asp:DropDownList runat="server" ID="ddIN_OUT" Height="34px" CssClass="btn btn-default"
                                            OnSelectedIndexChanged="ddIN_OUT_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Text="--Select In/Out--" Value="0" />
                                            <asp:ListItem Text="IN" Value="1" />
                                            <asp:ListItem Text="OUT" Value="2" />
                                            <asp:ListItem Text="STOCK" Value="3" />

                                        </asp:DropDownList>
                                        <asp:TextBox runat="server" Height="34px" ID="txtDateTime" autocomplete="off"
                                            onkeypress="return notChar(event)"
                                            placeholder="Thời gian" CssClass="form-control" Width="200px" />
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server"
                                            OnClientDateSelectionChanged="dateselect_txtDateTime"
                                            BehaviorID="txtDateTime_CalendarExtender" TargetControlID="txtDateTime" />
                                        <asp:TextBox runat="server" Height="34px" ID="txtQty"
                                            placeholder="Số lượng" CssClass="form-control" Width="200px" />
                                        <asp:LinkButton runat="server" ID="lbkUpdate" CssClass="btn btn-primary" OnClick="lbkUpdate_Click"> 
                                 <span class="glyphicon glyphicon glyphicon-ok"
                                 aria-hidden ="true"></span></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                    <table>
                        <tr>
                            <td>
                                <asp:DropDownList runat="server" ID="ddYear" CssClass="btn btn-st btn-default"
                                    OnSelectedIndexChanged="ddYear_Changed" AutoPostBack="true">
                                </asp:DropDownList></td>
                            <td>
                                <asp:LinkButton Text="History In/Out" OnClick="lbkInOut_Click" CssClass="btn btn-st btn-default" runat="server">History In/Out <span class="glyphicon glyphicon-modal-window"></span></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <asp:LinkButton ID="lnkFake2" runat="server"></asp:LinkButton>
                        <ajaxToolkit:ModalPopupExtender ID="ppPassOK"
                            runat="server" PopupControlID="pnPassOK" TargetControlID="lnkFake2" CancelControlID="lbtCancel2"
                            BackgroundCssClass="modalBackground ModalPopupBG" DropShadow="false">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pnPassOK" runat="server" Style="display: none;">
                            <div id="Modal2">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-body">
                                        </div>
                                        <div class="modal-footer">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lblThongBaoPass" runat="server" ForeColor="Red" />
                                                    <div class="input-group col-md-6" style="float: right">
                                                        <asp:Panel ID="Panel2" runat="server" DefaultButton="lbkFind" Width="500px">
                                                            <asp:TextBox ID="txtFind" runat="server" autocomplete="off" Height="30px" Width="400px" BorderColor="#0099cc" placeholder="PartName,Model,Datetime,...." Class="form-control"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                                                                OnClientDateSelectionChanged="dateselect_txtFind"
                                                                BehaviorID="txtFind_CalendarExtender" TargetControlID="txtFind" />
                                                            <span class="input-group-btn">
                                                                <asp:LinkButton ID="lbkFind" runat="server" Height="30px" BorderColor="#0099cc" OnClick="lbkFind_Click"
                                                                    class="btn btn-default"><span class="glyphicon glyphicon-search"></span>Search</asp:LinkButton>
                                                            </span>
                                                        </asp:Panel>
                                                    </div>
                                                    <asp:GridView runat="server" AutoGenerateColumns="False" ID="gvHistory"
                                                        CssClass="table table-bordered box-shadow2" DataKeyNames="id"
                                                        OnPageIndexChanging="gvHistory_PageIndexChanging" AllowPaging="True"
                                                        GridLines="None" Font-Size="13px" ShowHeaderWhenEmpty="true">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <%#  (Container.DataItemIndex + 1) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Model">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label0" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="ItemCode">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ItemCode") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="UserCode">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserCode") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="DateCreate">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("DateCreate") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="số lượng">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Alias") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <PagerSettings Mode="NumericFirstLast" />
                                                        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                                                    </asp:GridView>

                                                    <asp:LinkButton ID="lbtCancel2" runat="server"
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
                    <table class="table box-shadow1">
                        <tr style="color: #607d8b; font-weight: bold; background-color: #fcecd6" class="RowTable">
                            <td class="RowTable">Status</td>
                            <td class="RowTable">Jan
                            </td>
                            <td class="RowTable">Feb
                            </td>
                            <td class="RowTable">Mar
                            </td>
                            <td class="RowTable">Apr
                            </td>
                            <td class="RowTable">May
                            </td>
                            <td class="RowTable">Jun
                            </td>
                            <td class="RowTable">Jul
                            </td>
                            <td class="RowTable">Aug
                            </td>
                            <td class="RowTable">Sep
                            </td>
                            <td class="RowTable">Oct
                            </td>
                            <td class="RowTable">Nov
                            </td>
                            <td class="RowTable">Dec
                            </td>
                        </tr>
                        <tr>
                            <td style="color: #607d8b; font-weight: bold" class="RowTable backGrClr">In</td>
                            <td class="RowTable">
                                <asp:Label ID="lblInJan" runat="server" /></td>
                            <td class="RowTable">
                                <asp:Label ID="lblInFeb" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblInMar" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblInApr" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblInMay" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblInJun" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblInJul" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblInAug" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblInSep" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblInOct" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblInNov" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblInDec" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="color: #607d8b; font-weight: bold" class="RowTable backGrClr">Out</td>
                            <td class="RowTable">
                                <asp:Label ID="lblOutJan" runat="server" /></td>
                            <td class="RowTable">
                                <asp:Label ID="lblOutFeb" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOutMar" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOutApr" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOutMay" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOutJun" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOutJul" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOutAug" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOutSep" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOutOct" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOutNov" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOutDec" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="color: #607d8b; font-weight: bold" class="RowTable backGrClr">Stock</td>
                            <td class="RowTable">
                                <asp:Label ID="lblStockJan" runat="server" /></td>
                            <td class="RowTable">
                                <asp:Label ID="lblStockFeb" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblStockMar" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblStockApr" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblStockMay" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblStockJun" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblStockJul" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblStockAug" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblStockSep" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblStockOct" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblStockNov" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblStockDec" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="color: #607d8b; font-weight: bold" class="RowTable backGrClr">Order Q'ty</td>
                            <td class="RowTable">
                                <asp:Label ID="lblOrderJan" runat="server" /></td>
                            <td class="RowTable">
                                <asp:Label ID="lblOrderFeb" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOrderMar" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOrderApr" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOrderMay" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOrderJun" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOrderJul" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOrderAug" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOrderSep" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOrderOct" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOrderNov" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblOrderDec" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="color: #607d8b; font-weight: bold" class="RowTable backGrClr">Total Order Q'ty</td>
                            <td class="RowTable">
                                <asp:Label ID="lblTotalOrderJan" runat="server" /></td>
                            <td class="RowTable">
                                <asp:Label ID="lblTotalOrderFeb" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblTotalOrderMar" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblTotalOrderApr" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblTotalOrderMay" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblTotalOrderJun" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblTotalOrderJul" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblTotalOrderAug" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblTotalOrderSep" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblTotalOrderOct" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblTotalOrderNov" runat="server" />
                            </td>
                            <td class="RowTable">
                                <asp:Label ID="lblTotalOrderDec" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <asp:HyperLink runat="server" ID="HyperLink1" Font-Bold="true"
                        NavigateUrl="~/Sparepart/SparepartMenu.aspx" CssClass="btn btn-Link"><i class="fa fa-backward"></i> Back </asp:HyperLink>
                </div>
            </div>
            <div class="col-md-0">
            </div>
        </div>
    </section>

    <br />
    <br />
    <br />
    <asp:HiddenField ID="_idCodeMachine" runat="server" />
    <asp:HiddenField ID="_PartID" runat="server" />
    <asp:HiddenField ID="_Find" runat="server" />
</asp:Content>
