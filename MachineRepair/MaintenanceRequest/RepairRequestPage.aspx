<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RepairRequestPage.aspx.cs"
    Inherits="QlyMain.MaintenanceRequest.RepairRequestPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../assets/plugins/datepicker/datepicker3.css" rel="stylesheet" />
    <h2>Repair request</h2>
    <asp:Panel ID="PanelModify" runat="server">
        <table class="table">
            <tr>
                <td style="width: 20%">Faulty machine:</td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlMachine" Width="250" CssClass="selectType">
                    </asp:DropDownList>
                    <asp:TextBox ID="txtMachineID" runat="server" class="form-control" Visible="false"></asp:TextBox>
                    <asp:TextBox ID="txtRequestID" runat="server" Visible="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Issue name or description:</td>
                <td>
                    <asp:TextBox ID="txtProblemName" runat="server" class="form-control" autocomplete="off"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Date of failure:</td>
                <td>
                    <asp:TextBox ID="txtNgayLoi" runat="server" class="form-control" Width="200px" autocomplete="off"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Failure time:</td>
                <td>
                    <asp:TextBox ID="txtGioLoi" runat="server" TextMode="Time" class="form-control" Width="200px" autocomplete="off"></asp:TextBox>

                </td>
            </tr>
            <tr>

            <tr>
                <td>Affects quality:</td>
                <td>
                    <asp:CheckBox ID="chkAnhHuongChatLuong" runat="server"></asp:CheckBox>
                    Check if it affects
                </td>
            </tr>
            <tr>
                <td>NG rate:</td>
                <td>
                    <asp:TextBox ID="txtTiLeNG" runat="server" class="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Does this error affect shipment?</td>
                <td>
                    <asp:CheckBox ID="chkAnhHuongXuatHang" runat="server"></asp:CheckBox>
                    Check if it affects
                </td>
            </tr>
            <tr>
                <td>Shipment date:</td>
                <td>
                    <asp:TextBox ID="txtNgayXuatHang" runat="server" class="form-control"></asp:TextBox>
                </td>
            </tr>


            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
                    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
    <asp:Panel ID="PanelShow" runat="server">
        <div class="row">
            <div class="col-md-8">
                <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="+ Add new" />
            </div>
            <div class="col-md-4">
                Rows per page:
  <asp:DropDownList ID="ddlSoDong" runat="server"
      CssClass="dropdown" AutoPostBack="true"
      OnSelectedIndexChanged="ddlSoDong_SelectedIndexChanged">
      <asp:ListItem>10</asp:ListItem>
      <asp:ListItem>30</asp:ListItem>
      <asp:ListItem>50</asp:ListItem>
      <asp:ListItem>100</asp:ListItem>
  </asp:DropDownList>
            </div>
        </div>
        <br />
        <asp:GridView ID="GridViewShow" runat="server"
            AutoGenerateColumns="false"
            AllowPaging="True"
            OnPageIndexChanging="GridViewShow_PageIndexChanging"
            EmptyDataText="No data yet"
            OnRowCommand="GridViewShowRowClick"
            CssClass="table table-condensed table-hover">

            <Columns>
                <asp:TemplateField HeaderText=" + ">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                    <ItemStyle Width="10px" />
                </asp:TemplateField>
                <asp:BoundField DataField="RequestID" HeaderText="RequestID" Visible="False" />
                <asp:BoundField DataField="MachineID" HeaderText="MachineID" Visible="false" />
                <asp:BoundField DataField="CodeMachine" HeaderText="Machine" />
                <asp:BoundField DataField="ProblemName" HeaderText="Issue name or description" />
                <asp:BoundField DataField="NgayLoi" HeaderText="Date Error" />
                <asp:BoundField DataField="Status" HeaderText="Status" />

                <asp:BoundField DataField="AnhHuongChatLuong" HeaderText="Affects quality" />
                <asp:BoundField DataField="TiLeNG" HeaderText="NG rate" />
                <asp:BoundField DataField="AnhHuongXuatHang" HeaderText="Affects shipment deadline" />
                <asp:BoundField DataField="NgayXuatHang" HeaderText="Shipment date" />

                <asp:BoundField DataField="UserID" HeaderText="UserID" Visible="false" />
                <asp:BoundField DataField="UserCode" HeaderText="User Code" />
                <asp:TemplateField HeaderText="View">
                    <ItemTemplate>

                        <asp:HyperLink ID="RepairRequestsViewPage" runat="server" CssClass=""
                            NavigateUrl='<%# String.Format("~/MaintenanceRequest/RepairRequestDetailPage.aspx?RequestID={0}", Eval("RequestID")) %>'
                            Text="View">
                        </asp:HyperLink>

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" runat="server" CommandName='<%#"S|"+Eval("RequestID")%>' Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbDelete" runat="server" CommandName='<%#"X|"+Eval("RequestID")%>' OnClientClick="return confirm('Do you want to delete?')" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        </asp:GridView>
    </asp:Panel>

    <script>
        $(function () {
            $('.selectType').select2()
        });

        $(function () {
            $("#MainContent_txtNgayLoi").datepicker({
                format: 'dd/mm/yyyy',
                todayHighlight: 'TRUE',
                autoclose: true,
            });
        });

    </script>



</asp:Content>
