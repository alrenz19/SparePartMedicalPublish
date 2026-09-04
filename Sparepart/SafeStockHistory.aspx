<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SafeStockHistory.aspx.cs" Inherits="QlyMain.Sparepart.SafeStockHistory" %>

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
            calendarBehavior1.get_element().value = d.format("dd.MMM.yyyy")
        }
    </script>
    <section class="content-header">
        <h1>Spare Part
   
        <small>Control panel</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Spare Part</li>
        </ol>
    </section>
    <section class="content">
        <div class="row">


            <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="messagealert" id="alert_container">
                </div>
                <asp:HyperLink runat="server" ID="HyperLinkBackPageLot" Font-Bold="true"
                    NavigateUrl="~/Sparepart/SparepartMenu.aspx" CssClass="btn btn-Link"><i class="fa fa-backward"></i> Back </asp:HyperLink>


                <asp:Label ID="lblThongbaoAdd" runat="server"></asp:Label>
                <!-- Danh sách Spare Part-->
                <div style="margin-left: 10px; margin-right: 10px;">
                    <div style="float: left">
                    </div>
                    <h3 style="text-align: center">Lịch sử an toàn kho</h3>
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
                    <div class="input-group col-md-6" style="float: right">
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="lbkFind" Width="700px">
                            <asp:TextBox ID="txtFind" runat="server" autocomplete="off" Height="30px" BorderColor="#0099cc" placeholder="PartName,Model,Datetime,...." Class="form-control"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server"
                                OnClientDateSelectionChanged="dateselect_txtFind"
                                BehaviorID="txtFind_CalendarExtender" TargetControlID="txtFind" />
                            <span class="input-group-btn">
                                <asp:LinkButton ID="lbkFind" runat="server" Height="30px" BorderColor="#0099cc" OnClick="lbkFind_Click"
                                    class="btn btn-default"><span class="glyphicon glyphicon-search"></span>̀Tìm kiếm</asp:LinkButton>
                            </span>
                        </asp:Panel>
                    </div>
                    <br />
                    <br />
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <div style="overflow: scroll">
                            <asp:GridView runat="server" AutoGenerateColumns="False" ID="gvHistory"
                                CssClass="table table-bordered box-shadow2" OnRowDataBound="gvHistory_RowDataBound" DataKeyNames="id"
                                GridLines="None" Font-Size="13px" ShowHeaderWhenEmpty="true"
                                OnPageIndexChanging="gvHistory_PageIndexChanging" AllowPaging="True">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <%#  (Container.DataItemIndex + 1) %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton CssClas="ImgbRadius margin" ID="ImgbRadius" Width="60" Height="60"
                                                ImageUrl='<%# Bind("PictureURL") %>' runat="server" />
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
                                    <asp:TemplateField HeaderText="Model">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtModel" runat="server" Width="120"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="UserName">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtUserName" runat="server" Width="120"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Q'ty Old">
                                        <EditItemTemplate>
                                            <asp:Label ID="lblOld" runat="server" Text='<%# Bind("SafetyStockOld") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label51" runat="server" Text='<%# Bind("SafetyStockOld") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Q'ty New">
                                        <ItemTemplate>
                                            <asp:Label ID="Label52" runat="server" Text='<%# Bind("SafetyStockNew") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date Time">
                                        <ItemTemplate>
                                            <%# Convert.ToDateTime(Eval("DateMdf")).ToString("dd.MMM.yyyy _ HH:mm:ss tt") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerSettings Mode="NumericFirstLast" />
                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <asp:HyperLink runat="server" ID="HyperLink1" Font-Bold="true"
                    NavigateUrl="~/Sparepart/SparepartMenu.aspx" CssClass="btn btn-Link"><i class="fa fa-backward"></i> Back </asp:HyperLink>

            </div>
        </div>
    </section>

</asp:Content>
