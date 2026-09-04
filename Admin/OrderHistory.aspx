<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="QlyMain.Admin.OrderHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
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
            text-align: center;
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
    </style>
    <script type="text/javascript">
        function dateselect_txtFind(ev) {
            var calendarBehavior1 = $find("txtFind_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("MMM.yyyy")
        }
    </script>
    <div class="col-sm-12 col-md-12 col-lg-12 box-shadow1">
        <div class="messagealert" id="alert_container">
        </div>
        <asp:Label ID="lblThongbaoAdd" runat="server"></asp:Label>
        <!-- Danh sách Spare Part-->
        <div style="margin-left: 10px; margin-right: 10px;">
            <div style="float: left">
            </div>
            <h3 style="text-align: center">Lịch sử an order

                <asp:Label Text="" ID="lblTitile" Font-Bold="true" ForeColor="#607D8B" runat="server" /></h3>
            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="row">
                    <div class="input-group" style="float: right">
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="lbkFind">
                            <asp:TextBox ID="txtFind" runat="server" placeholder="Search.."
                                autocomplete="off" Height="30px" Width="450px" BorderColor="#0099cc" Class="form-control"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:LinkButton ID="lbkFind" runat="server" Height="30px" BorderColor="#0099cc" OnClick="lbkFind_Click"
                                    class="btn btn-default"><span class="glyphicon glyphicon-search"></span>̀Search</asp:LinkButton>
                            </span>
                        </asp:Panel>
                    </div>
                </div>
                <div class="row">
                    <div style="overflow: scroll">
                        <asp:GridView runat="server" AutoGenerateColumns="False" ID="gvSP"
                            CssClass="table table-bordered box-shadow2" DataKeyNames="PartID"
                            OnPageIndexChanging="gvSP_PageIndexChanging" AllowPaging="True" HeaderStyle-BackColor="#fcecd6"
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
                                <asp:TemplateField HeaderText="ItemCode">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("ItemCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="OrderQty">
                                    <ItemTemplate>
                                        <asp:Label ID="lbQtOut" runat="server" Text='<%# Bind("OrderQty") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="User">
                                    <ItemTemplate>
                                        <asp:Label ID="lbQtUs" runat="server" Text='<%# Bind("OrderUser") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lbQtDate" runat="server" Text='<%# Bind("OrderDate") %>'></asp:Label>
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
    </div>
    <asp:HiddenField ID="_IDPart" runat="server" />
</asp:Content>
