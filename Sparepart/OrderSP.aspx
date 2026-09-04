<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderSP.aspx.cs" Inherits="QlyMain.Sparepart.OrderSP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .box-shadow2 {
            background: white;
            padding: 2px 0 2px 0;
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
            background-color: white;
            border-radius: 2px;
        }
    </style>
     <script type="text/javascript">       
         function dateselect_txtOrderDate(ev) {
             var calendarBehavior1 = $find("txtOrderDate_CalendarExtender");
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
                    <!-- Phần Order-->
                    <asp:Panel runat="Server" ID="panelOrder"  CssClass="box-shadow2 marginBottom2">
                        <table class="table table-bordered">
                            <tr>
                                <td colspan="2">
                                    <h1>Order Stock</h1>
                                    <asp:TextBox ID="txtOrderID" runat="server" CssClass="form-control" Visible="false"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Person Order:</td>
                                <td>
                                    <asp:TextBox ID="txtFullNameOrder" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                    <asp:TextBox ID="txtUserIDOrder" runat="server" CssClass="form-control" Visible="false"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Spare Part Name:</td>
                                <td>
                                    <asp:TextBox ID="txtPartIDOrder" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="txtPartNameOrder" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Model:</td>
                                <td>
                                    <asp:TextBox ID="txtModelOrder" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Quantity in Stock:<br />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtQuantityInStockOrder" runat="server"
                                        CssClass="form-control" Enabled="false"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Order Date:</td>
                                <td>
                                    <asp:TextBox ID="txtOrderDate" runat="server" AutoComplete="off" CssClass="form-control"></asp:TextBox></td>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2"
                                    runat="server" Format="dd.MMM.yyyy"
                                    BehaviorID="txtOrderDate_CalendarExtender"
                                    TargetControlID="txtOrderDate" />
                            </tr>
                            <tr>
                                <td class="auto-style1">Order Quantity:                             
                                </td>
                                <td>
                                    <asp:TextBox ID="txtQuantityOrder" runat="server" CssClass="form-control"
                                        autocomplete="off" onOrder="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                                        type="number">
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Remark (Chú thích):</td>
                                <td>
                                    <asp:TextBox ID="txtRemarkOrder" runat="server"
                                        autoComplete="off"
                                        CssClass="form-control"
                                        placeholder="Chú thích có thể để trống"></asp:TextBox></td>
                                <tr>
                                    <td colspan="2">
                                        <h2>
                                            <asp:Label ID="lblThongBao_ORDER" runat="server" BackColor="Yellow" Font-Bold="True" ForeColor="#333333" Text="___"></asp:Label>
                                        </h2>
                                    </td>
                                </tr>
                            <tr>
                                <td class="auto-style1"></td>
                                <td>
                                    <asp:LinkButton ID="lbtOrder" runat="server" CssClass="btn btn-primary" OnClick="lbtOrder_Click">
                                    <i class="fa fa-save"></i>Save Order
                                    </asp:LinkButton>
                                     <button type="button" class="btn btn-primary" onclick="closeWindow()">Close</button>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <!--End Phần Order-->
                    <!-- # Hết   Popup Nhập kho IN-->
                </div>
                <div class="col-sm-1 col-md-1 col-lg-1"></div>
            </div>
        </div>
    </section>
    <asp:HiddenField ID="_PartID" runat="server" />
    <script type="text/javascript">
        function closeWindow() {
            if (confirm("Bạn có chắc chắn muốn đóng trang này không?")) {
                window.open('', '_self'); // Bắt buộc cho Chrome
                window.close();
            }
        }
    </script>
</asp:Content>
