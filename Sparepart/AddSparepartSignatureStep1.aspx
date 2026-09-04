<%@ Page Title="1.Spare parts Inventory management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"
    CodeBehind="AddSparepartSignatureStep1.aspx.cs" Inherits="QlyMain.Sparepart.AddSparepartSignatureStep1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background: #80808024;
        }

        .modalBackground1 {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
        }

        .borderbottom {
            border: 1px solid #607d8b;
        }

        .modalmail {
            /*    width: 90%;*/
            /* margin-left: 4%;
            padding: 5px;*/
        }

        .box {
            background: white;
            box-shadow: 0 4px 8px 0 rgb(67 65 65 / 20%), 0 6px 20px 0 rgb(255 255 255 / 0%);
            padding: 2px 0 2px 0;
            width: 100%;
            zoom: 96%;
            padding: 0 15px 0 15px;
            margin-bottom: 2px;
            border-bottom: 2px solid #8cb6ca;
        }

        table tbody th, td {
            padding: 5px;
        }

        .box-shadow2 {
            background: white;
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
            background-color: white;
            border-radius: 2px;
        }

        span.select2-selection.select2-selection--single {
            height: 35px !important;
        }

        span.select2.select2-container.select2-container--default {
            /* border: 2px solid #8bd9ff;
            border-radius: 6px;*/
        }

        span.select2-dropdown.select2-dropdown--below {
            font-size: 12px;
        }

        .styleBorder {
            border: 2px solid #8bd9ff;
            border-radius: 6px;
        }

        .Height35 {
            height: 35px !important;
        }

        .margin0 {
            margin: 0px !important;
        }

        .marginBottom {
            margin-bottom: 0 !important;
        }
    </style>
    <script type="text/javascript">
        $(window).bind('load', function () {
            var headerChk = $(".chkheader input");
            var itemChk = $(".chkitems input");
            headerChk.bind("click", function () {
                itemChk.each(function () { this.checked = headerChk[0].checked; })
            });
            itemChk.bind("click", function () { if ($(this).checked == false) headerChk[0].checked = false; });
        });
    </script>
    <br />
    <div style="top: 45px;">
        <div class="messagealert" id="alert_container">
        </div>
            <div class="page-header" style="text-align: center ; margin:0px;padding:0px">
            <h2 style="margin-bottom:0px;margin-top:30px">Quản lý tồn kho Spare parts (Spare parts Inventory management)                        
            </h2>
        </div>
        <div class="col-sm-2 col-md-2 col-lg-2" style="font-size: 12px; width: auto">
            <div class="box-shadow2" style="padding: 5px">
                <br />
                <asp:LinkButton Text="➤ Spare part Menu " ForeColor="#56879e" Font-Bold="true" CssClass="btn btn-default" Font-Size="12px" runat="server" OnClick="btnSignature_Click" />
                <br />
                <br />
                <asp:LinkButton Text="➤ List Mail " ForeColor="#56879e" Font-Bold="true" runat="server" CssClass="btn btn-default" Font-Size="12px" OnClick="btnListMail_Click" />
                <br />
            </div>
        </div>
        <div class="col-sm-10 col-md-10 col-lg-10  box-shadow2">
            <h3 style="text-align: center">Tạo list linh kiện cần thay đổi thông số .</h3>
            <asp:Label Text="" ID="lblThongbao" runat="server" />
            <div>
                <div style="float: right" class="navbar-form">
                    <div class="input-group">
                        <table style="border: 1px solid #607d8b; background-color: #e9edf0">
                            <tr>
                                <td>
                                    <asp:DropDownList runat="server" ID="ddType" CssClass="selectSec" AutoPostBack="true"
                                        Height="70px" Width="200px" OnSelectedIndexChanged="ddType_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <div class="input-group">
                                                    <div class="input-group-btn">
                                                        <div class="btn-group" role="group">
                                                            <asp:TextBox runat="server" Height="34px" ID="txtSearchSP"
                                                                placeholder="Tìm kiếm " CssClass="form-control" Width="200px" />
                                                            <asp:LinkButton runat="server" ID="lbkSearch" CssClass="btn btn-primary"
                                                                OnClick="lbkSearch_OnClick"> 
                                             <span class="glyphicon glyphicon-search"
                                               aria-hidden ="true"></span></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <asp:Panel runat="server" ID="pnShowDong" Font-Size="13px">
                Số dòng hiển thị:
                 <asp:DropDownList ID="ddlDong" runat="server"
                     CssClass="dropdown" AutoPostBack="true"
                     OnSelectedIndexChanged="ddlDong_SelectedIndexChanged">
                     <asp:ListItem>5</asp:ListItem>
                     <asp:ListItem>30</asp:ListItem>
                     <asp:ListItem>50</asp:ListItem>
                     <asp:ListItem>100</asp:ListItem>
                 </asp:DropDownList>
            </asp:Panel>
            <asp:GridView runat="server" ID="gv" CssClass="table marginBottom" AutoGenerateColumns="False"
                AllowPaging="True" OnPageIndexChanging="gv_PageIndexChanging" PageSize="5"
                DataKeyNames="PartID" Font-Size="12px" OnRowCommand="gv_RowCommand" OnRowDataBound="gv_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderStyle-Width="160px" HeaderStyle-CssClass="paddingTh" ItemStyle-CssClass="padding0">
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkboxSelectAll" CssClass="chkheader"
                                runat="server" Text=" Chọn tất cả" />
                            <br />
                            <asp:LinkButton runat="server" ID="lbkAddAll" CssClass="btn btn-default" ForeColor="#1f8b99"
                                CommandName="AddAll">                                            
                                        <label class="pointer">Add to list ▶</label></span>
                            </asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td style="padding-right: 20px; font-weight: bolder; font-size: 15px; padding: 0 !important">
                                        <asp:CheckBox ID="SelectCheckBox" CssClass="chkitems" runat="server" />
                                    </td>
                                    <td style="font-weight: bolder; font-size: 15px; padding: 0 !important">
                                        <%# Container.DataItemIndex+1 %> |
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PartID" Visible="False">
                        <EditItemTemplate>
                            <asp:Label ID="lblPartID" runat="server" Text='<%# Bind("PartID") %>' Width="60px"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblID" runat="server" Text='<%# Bind("PartID") %>' Width="60px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Position Save" Visible="false">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPositionSave" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("PositionSave") %>' Width="60px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Part Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPartName" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPartName" runat="server" Text='<%# Bind("PartName") %>' Width="150px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Wrap="true" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Maker" Visible="false">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMaker" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Maker") %>' Width="60px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Model">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtModel" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblModel" runat="server" Text='<%# Bind("Model") %>' Width="120px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ItemCode">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtItemCode" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblItemCode" runat="server" Text='<%# Bind("ItemCode") %>' Width="60px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price" Visible="false">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrice" runat="server" Width="120"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label51" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Supplier" Visible="false">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSupplier" runat="server" Width="120"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label52" runat="server" Text='<%# Bind("Supplier") %>'></asp:Label>
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
                            <asp:ImageButton CssClas="ImgbRadius margin" ID="ImgbRadius" Width="80" Height="80"
                                ImageUrl='<%# Bind("PictureURL") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Safety Stock">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSafety" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSafetyStock" runat="server" Text='<%# Bind("SafetyStock") %>' Width="20px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Q'ty Stock">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtQty" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("QtyStock") %>' Width="20px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbkAdd" runat="server" CssClass="btn btn-default"
                                CommandName="Add" ForeColor="#1f8b99" Text="Add to list ▶" Font-Bold="true"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="NumericFirstLast" />
                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
            </asp:GridView>
            <div style="float: right">
                <asp:LinkButton Text="Next 〉" runat="server" CssClass="btn btn-primary" ID="lbkOpenStep2" OnClick="lbkOpenStep2_Click" />
            </div>
        </div>
    </div>
    <asp:HiddenField ID="_Id" runat="server" />
    <asp:HiddenField ID="_LinkMail" runat="server" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('.selectSendMail').select2();
        });
        $(document).ready(function () {
            $('.selectSec').select2();
        });
        $(function () {
            $('.SelectPs').select2(
                {
                    dropdownParent: $("#mailNestedAddListModal")
                });
        });
        $(function () {
            $('.SelectSng').select2(
                {
                    dropdownParent: $("#mailNestedAddListModal")
                });
        });
    </script>
</asp:Content>
