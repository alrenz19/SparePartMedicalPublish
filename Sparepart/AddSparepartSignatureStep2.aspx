<%@ Page Title="2.Spare parts Inventory management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddSparepartSignatureStep2.aspx.cs" Inherits="QlyMain.Sparepart.AddSparepartSignatureStep2" %>

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
    </style>
    <br />
    <div style="top: 45px;">
        <div class="messagealert" id="alert_container">
        </div>
        <div class="page-header" style="text-align: center; margin: 0px; padding: 0px">
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
            <h3 style="text-align: center">Chỉnh sửa linh kiện</h3>
            <asp:Label Text="" ID="lblThongbao" runat="server" />

            <asp:Panel runat="server" ID="pnShowDong" Font-Size="13px">
                Số dòng hiển thị:
                 <asp:DropDownList ID="ddlDong" runat="server"
                     CssClass="dropdown" AutoPostBack="true"
                     OnSelectedIndexChanged="ddlDong_SelectedIndexChanged">
                     <asp:ListItem>5</asp:ListItem>
                     <asp:ListItem>10</asp:ListItem>
                     <asp:ListItem>20</asp:ListItem>
                     <asp:ListItem>30</asp:ListItem>
                 </asp:DropDownList>
            </asp:Panel>
            <asp:GridView runat="server" ID="gv" CssClass="table center" AutoGenerateColumns="False"
                DataKeyNames="PartID" Font-Size="12px" OnRowCommand="gv_RowCommand" OnRowDataBound="gv_RowDataBound">
                <HeaderStyle CssClass="center" />
                <Columns>
                    <asp:TemplateField ItemStyle-Width="70px">
                        <HeaderTemplate>
                            <asp:LinkButton Text="" ID="lklDelete" runat="server" Width="69px" CssClass="btn btn-sm btn-default"
                                CommandName="Delete" OnClick="lklDelete_Click"
                                OnClientClick="if(!confirm('Bạn có chắc là muốn xóa hết tài liệu trong nhóm này')) return false;">
                                                <span class="glyphicon glyphicon-repeat" style="color:steelblue;font-weight:bold"></span>Xóa hết</asp:LinkButton>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False"
                                            CommandName="Delete1" Text="Delete" OnClientClick="if(!confirm('Bạn có chắc là muốn xóa tài liệu này?')) return false;">
                             <span class="glyphicon glyphicon-trash" style="color:gray"></span>
                                        </asp:LinkButton></td>
                                    <td>
                                        <%#  (Container.DataItemIndex + 1) %>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <ItemStyle Width="70px"></ItemStyle>
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
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("PartName") %>' Width="150px"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Wrap="true" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Maker">
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
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Model") %>' Width="120px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ItemCode">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtItemCode" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("ItemCode") %>' Width="60px"></asp:Label>
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
                    <asp:TemplateField HeaderText="Safety Stock" HeaderStyle-CssClass="center">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtSafety" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <div class="navbar-form" role="search">
                                <div class="input-group">
                                    <asp:Panel runat="server" DefaultButton="lbkSave">
                                        <asp:TextBox ID="txtSafetySend" runat="server" BorderColor="#cc3300"
                                            oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                                            CssClass="form-control" Width="100px" Text='<%# Bind("SafetyStock") %>'></asp:TextBox>
                                        <span class="input-group-btn">
                                            <asp:LinkButton Text="✔" ID="lbkSave" CommandName="SaveSafety"
                                                runat="server" BorderColor="#CC3300" CssClass="btn btn-default" ForeColor="Green" />
                                        </span>
                                        <asp:Label Text="" ID="lblchangeIcon" Visible="false" runat="server" />
                                    </asp:Panel>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Lead Time" Visible="false">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLeadTime" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("LeadTime") %>' Width="20px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="MOQ_SPQ" Visible="false">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMOQ_SPQ" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("MOQ_SPQ") %>' Width="20px"></asp:Label>
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
                    <asp:TemplateField HeaderText="Remark">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRemark" Text='<%# Bind("Remark") %>' runat="server" Width="120"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div style="float: right">
                <asp:LinkButton Text="〈 Back" runat="server" CssClass="btn btn-primary" ID="lbkOpenBackStep1" OnClick="lbkOpenBackStep1_Click" />
                <asp:LinkButton Text="Next 〉" runat="server" CssClass="btn btn-primary" ID="lbkOpenStep3" OnClick="lbkOpenStep3_Click" />
            </div>
        </div>
    </div>
    <asp:HiddenField ID="_Id" runat="server" />
    <asp:HiddenField ID="_LinkMail" runat="server" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('.selectSendMail').select2();
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
