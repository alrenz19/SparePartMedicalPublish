<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QtyHistory.aspx.cs" Inherits="QlyMain.Admin.QtyHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background: white;
        }

        .select2-selection--single .select2-selection__arrow {
            height: 15px;
        }

        ul.multiselect-container.dropdown-menu {
            height: 160px;
            overflow: auto;
        }

        .table-bordered > tbody > tr > td, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > td, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > thead > tr > th {
            border:  2px solid #b2b1b1 !important;
        }

        .box-shadow2 {
            background: white;
            padding: 2px 0 2px 0;
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
            background-color: white;
            border-radius: 2px;
            text-align: center;
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

        .ImgbRadius {
            padding: 2px !important;
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
    </style>
    <script type="text/javascript">
        function dateselect_txtFind(ev) {
            var calendarBehavior1 = $find("txtFind_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("MMM.yyyy")
        }
    </script>
    <section class="content" id="content">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <div class="messagealert" id="alert_container">
            </div>
            <asp:Label ID="lblThongbaoAdd" runat="server"></asp:Label>
              <section class="content-header">
                    <h3>Warehouse safety history
                <asp:Label Text="" ID="lblTitile" Font-Bold="true" ForeColor="#607D8B" runat="server" /></h3>
                </section>
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="row">
                        <div class="col-sm-6 col-md-6 col-lg-6">
                            <table class="table table-bordered box-shadow2">
                                <tr>
                                    <td>Total Q'ty 'Stock'</td>
                                    <td>Total Q'ty 'Input'</td>
                                    <td>Total Q'ty 'Output'</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton Text="" CssClass="alert-info ImgbRadius" ID="hkQtyStock" runat="server" OnClick="hkQtyStock_Click" /></td>
                                    <td>
                                        <asp:LinkButton Text="" CssClass="alert-success ImgbRadius" ID="hkQtyIn" runat="server" OnClick="hkQtyIn_Click" /></td>
                                    <td>
                                        <asp:LinkButton Text="" CssClass="alert-warning ImgbRadius" ID="hkQtyOut" runat="server" OnClick="hkQtyOut_Click" /></td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-6">
                        </div>
                    </div>
                    <div class="row">
                        <div style="float: right">
                            <asp:Panel ID="Panel1" runat="server" DefaultButton="lbkFind">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtFind" runat="server" autocomplete="off" Height="30px" BorderColor="#0099cc" Class="form-control"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server"
                                                OnClientDateSelectionChanged="dateselect_txtFind"
                                                BehaviorID="txtFind_CalendarExtender" TargetControlID="txtFind" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFindPosition" runat="server" placeholder="Position Save" Height="30px" BorderColor="#0099cc" Class="form-control"></asp:TextBox>
                                        </td>
                                        <td>
                                            <span class="input-group-btn">
                                                <asp:LinkButton ID="lbkFind" runat="server" Height="30px" BorderColor="#0099cc" OnClick="lbkFind_Click"
                                                    class="btn btn-default"><span class="glyphicon glyphicon-search"></span>Search</asp:LinkButton>
                                            </span>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="row" style="overflow: scroll">
                        <div class="gridview-container">
                            <asp:GridView runat="server" AutoGenerateColumns="False" ID="gvSP"
                                CssClass="table table-bordered box-shadow2" DataKeyNames="PartID"
                                OnPageIndexChanging="gvSP_PageIndexChanging" AllowPaging="True" HeaderStyle-CssClass="gridview-header"
                                GridLines="None" Font-Size="13px" OnRowDataBound="gvSP_RowDataBound">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <%#  (Container.DataItemIndex + 1) %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PictureURL">
                                        <ItemTemplate>
                                            <asp:ImageButton CssClas="ImgbRadius margin" ID="ImgbRadius" Width="80" Height="80"
                                                ImageUrl='<%# Bind("PictureURL") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PartID" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="lblID" runat="server" Text='<%# Bind("PartID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Position Save">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("PositionSave") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Part Name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("PartName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Maker">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Maker") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Model">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ItemCode">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("ItemCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Safety Stock">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("SafetyStockShow") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Qty">
                                        <ItemTemplate>
                                            <asp:Label ID="lbQtStock" runat="server" Visible="false" Text='<%# Bind("QtyStockNew") %>'></asp:Label>
                                            <asp:Label ID="lbQtIn" runat="server" Visible="false" Text='<%# Bind("QtyInput") %>'></asp:Label>
                                            <asp:Label ID="lbQtOut" runat="server" Visible="false" Text='<%# Bind("QtyOutput") %>'></asp:Label>
                                            <asp:Label ID="lblQty" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remark">
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerSettings Mode="NumericFirstLast" />
                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
        </div>
    </section>
    <asp:HiddenField ID="_type" runat="server" />
</asp:Content>
