<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OuputSP.aspx.cs" Inherits="QlyMain.Sparepart.OuputSP" %>

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
        function dateselect_txtOutputDate(ev) {
            var calendarBehavior1 = $find("txtOutputDate_CalendarExtender");
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
                    <!-- Phần Popup xuất kho-->
                    <asp:Panel runat="Server" ID="paneXuat" CssClass="box-shadow2 marginBottom2">
                        <h1>Output Stock</h1>
                        <table class="table">
                            <tr>
                                <td class="auto-style1">Spare Part Name</td>
                                <td>
                                    <asp:TextBox ID="txtPartID" runat="server" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="txtPartName2" runat="server" autocomplete="off" Font-Bold="True"
                                        CssClass="form-control" Enabled="false"></asp:TextBox>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddHistory" CssClass="selectSP" Width="500px"
                                        AutoPostBack="true">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Quantity in Stock:</td>
                                <td>
                                    <asp:TextBox ID="txtQuantityInStock" runat="server" CssClass="form-control" autocomplete="off" Enabled="false" Font-Bold="True" Font-Size="Large"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Person Output:</td>
                                <td>
                                    <asp:TextBox ID="txtUserID" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" Enabled="false" autocomplete="off"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">Quantity Output:</td>
                                <td>
                                    <asp:TextBox ID="txtQuantityOutput" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" runat="server" CssClass="form-control"
                                        autocomplete="off" type="number"></asp:TextBox>
                                </td>
                            </tr>
                            <%--  <tr>
                            <td class="auto-style1">Person Receive (Người Nhận Hàng):</td>
                            <td>
                                <asp:TextBox ID="txtNguoiNhan" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                            </td>
                        </tr>--%>
                            <tr>
                                <td class="auto-style1">
                                Output Date (Ngày Xuất):                
                            <td>
                                <asp:TextBox ID="txtOutputDate" runat="server" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" AutoComplete="off" CssClass="form-control"></asp:TextBox></td>
                                <ajaxToolkit:CalendarExtender ID="txtRegisterDate_CalendarExtender"
                                    runat="server" Format="dd.MMM.yyyy"
                                    BehaviorID="txtRegisterDate_CalendarExtender"
                                    TargetControlID="txtOutputDate" />
                            </tr>
                            <tr>
                                <td class="auto-style1">Remark Ghi chú/(xuất cho tên Máy):</td>
                                <td>
                                    <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control"
                                        autocomplete="off"
                                        placeholder="Xuất cho máy nào ?"></asp:TextBox></td>
                            </tr>
                            <tr style="display: none">
                                <td>Cost (Giá)</td>
                                <td>
                                    <asp:TextBox runat="server" ID="txtCost" Width="200"
                                        autocomplete="off" />
                                    (<asp:Label runat="server" ID="lblCurrency"
                                        autocomplete="off" />)</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <h2>
                                        <asp:Label ID="lblThongBao" runat="server" BackColor="Yellow" ForeColor="#663300" Text="Label" Visible="False"></asp:Label>
                                    </h2>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">&nbsp;</td>
                                <td>
                                    <asp:LinkButton ID="lbtXuatKho" runat="server" CssClass="btn btn-primary" OnClick="lbtXuatKho_Click">
                                                    <i class="fa fa-save"></i> Save Output
                                    </asp:LinkButton>
                                    <button type="button" class="btn btn-primary" onclick="closeWindow()">Close</button>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <!--#Hết Phần Popup xuất kho-->
                </div>
                <div class="col-sm-1 col-md-1 col-lg-1"></div>
            </div>
        </div>
    </section>
    <asp:HiddenField ID="_PartID" runat="server" />
    <script type="text/javascript">
        $(function () {
            $('.selectSP').select2();
        });
        function closeWindow() {
            if (confirm("Bạn có chắc chắn muốn đóng trang này không?")) {
                window.open('', '_self'); // Bắt buộc cho Chrome
                window.close();
            }
        }
    </script>
</asp:Content>
