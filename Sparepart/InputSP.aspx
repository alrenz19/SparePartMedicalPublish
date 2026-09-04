<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InputSP.aspx.cs" Inherits="QlyMain.Sparepart.InputSP" %>

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
        function dateselect_txtInputDate(ev) {
            var calendarBehavior1 = $find("txtInputDate_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            calendarBehavior1.get_element().value = d.format("dd-MMM-yyyy");
        }
        // Hàm tự động gọi reloadGridView() khi đóng tab
        window.addEventListener("beforeunload", function () {
            // Kiểm tra xem window.opener có tồn tại và chưa bị đóng
            if (window.opener && !window.opener.closed) {
                try {
                    // Kiểm tra nếu tài liệu của window.opener đã được tải xong
                    if (window.opener.document) {
                        window.opener.reloadGridView(); // Gọi lại hàm reloadGridView trong trang chính
                    } else {
                        console.warn("Document of window.opener is not accessible.");
                    }
                } catch (ex) {
                    console.error("Error while calling reloadGridView: ", ex);
                }
            } else {
                console.warn("window.opener is not available or the window is closed.");
            }
        });
    </script>
    <section class="content">
        <div class="row">
            <div>
                <div class="col-sm-1 col-md-1 col-lg-1"></div>
                <div class="col-sm-10 col-md-10 col-lg-10">
                    <div class="messagealert" id="alert_container">
                    </div>
                    <!-- Phần Popup Nhập kho IN-->
                    <asp:Panel runat="Server" ID="panelNhap" CssClass="box-shadow2 marginBottom2">
                        <table class="table table-bordered">
                            <tr>
                                <td colspan="2">
                                    <h1>Input Stock</h1>
                                    <asp:TextBox ID="txtInputID" runat="server" CssClass="form-control" Visible="false"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Person Input:</td>
                                <td>
                                    <asp:TextBox ID="txtFullNameInput" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                    <asp:TextBox ID="txtUserIDInput" runat="server" CssClass="form-control" Visible="false"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Spare Part Name:</td>
                                <td>
                                    <asp:TextBox ID="txtPartIDInput" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="txtPartNameInput" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Model:</td>
                                <td>
                                    <asp:TextBox ID="txtModelInput" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Quantity in Stock:</td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtQuantityInStockInput" runat="server"
                                        CssClass="form-control" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Input Date:</td>
                                <td>
                                    <asp:TextBox ID="txtInputDate" runat="server" AutoComplete="off" CssClass="form-control"></asp:TextBox></td>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1"
                                    runat="server" Format="dd.MMM.yyyy"
                                    BehaviorID="txtInputDate_CalendarExtender"
                                    TargetControlID="txtInputDate" />
                            </tr>
                            <tr>
                                <td>Quantity Input:</td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="txtQuantityInput" runat="server" CssClass="form-control"
                                        autocomplete="off" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                                        type="number">
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Remark (Chú thích):</td>
                                <td>
                                    <asp:TextBox ID="txtRemarkInput" runat="server"
                                        autoComplete="off"
                                        CssClass="form-control"
                                        placeholder="Chú thích có thể để trống"></asp:TextBox></td>
                                <tr>
                                    <td colspan="2">
                                        <h2>
                                            <asp:Label ID="lblThongBao_INPUT" runat="server" BackColor="Yellow" Font-Bold="True" ForeColor="#333333" Text="___"></asp:Label>
                                        </h2>
                                    </td>
                                </tr>
                            <tr>
                                <td class="auto-style1"></td>
                                <td>
                                    <asp:LinkButton Text="SSAVE" OnClick="UpdateStockButton_Click" runat="server" Visible="false" />

                                    <asp:LinkButton ID="lbtNhapKho" runat="server" CssClass="btn btn-primary" OnClick="lbtNhapKho_Click">
                                    <i class="fa fa-save"></i>Save Input
                                    </asp:LinkButton> 
                                    <asp:LinkButton ID="lbtNhapKhoClose" runat="server" CssClass="btn btn-primary" OnClick="lbtNhapKhoClose_Click">
                                    <i class="fa fa-close"></i> Close
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <!-- # Hết   Popup Nhập kho IN-->
                </div>
                <div class="col-sm-1 col-md-1 col-lg-1"></div>
            </div>
        </div>
    </section>
    <asp:HiddenField ID="_PartID" runat="server" />

</asp:Content>
