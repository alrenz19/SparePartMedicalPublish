<%@ Page Title="Add" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"
    CodeBehind="Add.aspx.cs" Inherits="QlyMain.RepairRequestss.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">

    <link href="../../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css" rel="stylesheet" />

    <script src="../../Content/plugins/bootstrap-datetimepicker/moment-with-locales.min.js"></script>
    <script src="../../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>

    <section class="content-header">
        <h1>Create a repair request <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Repair Requests</li>
        </ol>
    </section>
    
    <div class="content">
        <asp:Panel ID="PanelModify" runat="server">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Create New
                </div>
                <div class="panel-body">

                    <table class="table">
                        <tr>
                            <td style="width: 20%">Faulty Machine:
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlMachine" Width="250" CssClass="selectType" AutoPostBack="True" OnSelectedIndexChanged="ddlMachine_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:TextBox ID="txtMachineID" runat="server" class="form-control" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="txtRequestID" runat="server" Visible="false"></asp:TextBox>
                                <br />
                                <i>(If the faulty machine code is not EB1-xxx, please select OTHER according to the department)</i>
                            </td>
                        </tr>
                        <tr>
                            <td>Location/Machine Group:</table>
                            <td>
                                <asp:TextBox ID="txtViTriVaNhomMay" Text="" runat="server" class="form-control"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>Name or clear description of the issue:</td>
                            <td>
                                <asp:TextBox ID="txtViTriLoi" runat="server" class="form-control" autocomplete="off" Text="N/A" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="txtProblemName" runat="server" class="form-control" autocomplete="off"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>Machine stopped at:</td>
                            <td>
                                <asp:TextBox ID="txtNgayLoi" runat="server" CssClass="form-control txtNgayLoi" autocomplete="off" />
                            </td>
                        </tr>

                        <tr>
                            <td>Quality impact:</td>
                            <td>
                                <asp:CheckBox ID="chkAnhHuongChatLuong" runat="server" AutoPostBack="true" OnCheckedChanged="chkAnhHuongChatLuong_CheckedChanged" />
                                Check if there is an impact 
                                <asp:Panel runat="server" ID="panelChatLuong" Visible="false">
                                    <br />
                                    Enter NG rate:
                                    <asp:TextBox ID="txtTiLeNG" runat="server" Width="200px"></asp:TextBox>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>Impact on output:</td>
                            <td>
                                <asp:CheckBox ID="CheckBoxAnhHuongSanLuong" runat="server" AutoPostBack="true" Checked="false" OnCheckedChanged="CheckBoxAnhHuongSanLuong_CheckedChanged" />
                                Check if there is an impact 
                                <asp:Panel runat="server" ID="panelSanLuong" Visible="false">
                                    <br />
                                    Enter the affected output quantity:
                                    <asp:TextBox ID="txtAnhHuongSanLuong" runat="server" Text="0" Width="200"></asp:TextBox>
                                </asp:Panel>
                            </td>
                        </tr>

                        <tr>
                            <td>Does this error affect shipment:</td>
                            <td>
                                <asp:CheckBox ID="chkAnhHuongXuatHang" runat="server" AutoPostBack="true" OnCheckedChanged="chkAnhHuongXuatHang_CheckedChanged" />
                                Check if there is an impact 
                                <asp:Panel runat="server" ID="panelNgayXuatHang" Visible="false">
                                    Enter shipment date:
                                    <asp:TextBox ID="txtNgayXuatHang" runat="server" Width="200"></asp:TextBox>
                                </asp:Panel>
                            </td>
                        </tr>

                        <tr>
                            <td>Note:</td>
                            <td>
                                <asp:TextBox ID="txtRemark" runat="server" class="form-control" autocomplete="off"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Track request by Email:</td>
                            <td>
                                <asp:CheckBox ID="CheckBoxEmail" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBoxEmail_CheckedChanged" />
                                Check to send the request with email 
                                <asp:Panel runat="server" ID="panelEmail" Visible="false">
                                    Select email:
                                    <asp:DropDownList ID="ddlEmail" runat="server" AutoPostBack="true" CssClass="selectType" OnSelectedIndexChanged="ddlEmail_SelectedIndexChanged"></asp:DropDownList>
                                    <br />
                                    Selected emails: 
                                    <asp:GridView ID="GridViewMail" runat="server" CssClass="table-condensed" AutoGenerateColumns="false" OnRowDeleting="GridViewMail_RowDeleting">
                                        <Columns>
                                            <asp:BoundField DataField="HoTen" HeaderText="Full Name" />
                                            <asp:BoundField DataField="Email" HeaderText="Email" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandName="Delete" Text="Delete" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>

                    <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                    <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnAdd" runat="server" Text="Submit request" OnClick="btnAdd_Click" CssClass="form-button delete-button" />
                    &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" CausesValidation="false" CssClass="form-button cancel-button" />
                    <asp:Button ID="Button1" runat="server" Text="Send test mail" OnClick="Button1_Click" Visible="false" />
                </div>
            </div>
        </asp:Panel>
    </div>

    <input type="text" class="form-control pull-right" id="datepicker">
    <script>
        $(function () {
            $('.selectType').select2();

            $("#datepicker").datepicker({
                autoclose: true
            });
        });
        $(function () {
            $('.txtNgayLoi').datetimepicker({
                format: 'DD.MMM.yyyy HH:mm'
            });
        });
        $(function () {
            $(".txtNgayXuatHang").datepicker({
                format: 'mm/dd/yyyy',
                todayHighlight: 'TRUE',
                autoclose: true,
            });
        });
    </script>
</asp:Content>