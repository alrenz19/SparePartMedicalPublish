<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MngInventoryHistory.aspx.cs" Inherits="QlyMain.Admin.MngInventoryHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .grStyle th {
            color: white;
            background: #607d8b;
            border: 1px solid #b5ccd6;
            vertical-align: middle;
            text-align: center;
        }

        .paddingTh {
            padding-top: 3px !important;
            padding-bottom: 0 !important;
        }

        .btn-st {
            color: white;
            background: #607d8b;
        }

        .PaddingLeft {
            padding-left: 10px;
        }

        .textStyle {
            font-weight: bolder;
            color: #607D8B;
        }

        .MarginTop4 {
        }
        /* Media query cho màn hình nhỏ hơn 720px */
        @media screen and (max-width: 720px) {
            .MarginTop4 {
                /*  margin-top: 10%*/
            }
        }
    </style>
    
    <div class="col-sm-12 col-md-12 col-lg-12 MarginTop4" style="padding: 20px;">
        <div class="messagealert" id="alert_container">
        </div>
        <asp:Label Text="Inventory Sheet Page" ForeColor="#555c5f" Font-Size="20px" runat="server" />
        <div class="intro1">
            <span style="color: #676363">Showing:
                        <asp:DropDownList ID="ddlDong" runat="server"
                            CssClass="dropdown" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlDong_SelectedIndexChanged">
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>50</asp:ListItem>
                            <asp:ListItem>70</asp:ListItem>
                            <asp:ListItem>100</asp:ListItem>
                        </asp:DropDownList>
                <asp:Label Text="" ID="lblMessSearch" runat="server" />
            </span>
            <div style="float: right">
                <table>
                    <tr>
                        <td>
                            <asp:Panel runat="server" CssClass="box-shadow2" DefaultButton="lbkFind">
                                <div class="input-group">
                                    <asp:TextBox runat="server" CssClass="form-control" placeholder="... "
                                        Height="35px" Width="250px" autocomplete="off"
                                        ID="txtFind" />

                                    <span class="input-group-btn">
                                        <asp:LinkButton ID="lbkFind" Height="35px"
                                            CssClass="btn btn-default btn-st" runat="server" OnClick="lbkFind_Click"> Search
                                      <i class="fa fa-search"></i>
                                        </asp:LinkButton>
                                    </span>
                                </div>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </div>
            <asp:GridView runat="server" ID="gvInventory" AutoGenerateColumns="False"
                OnRowDataBound="gvInventory_RowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" ShowHeaderWhenEmpty="True" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting"
                CssClass="table grStyle box-shadow1 center">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Asset Class">
                        <ItemTemplate>
                            <asp:Label ID="lblAsset_Class" CssClass="width100" Font-Size="16px" ForeColor="#607d8b" Font-Bold="true" runat="server" Text='<%# Bind("Asset_Class") %>'></asp:Label><br />
                            <asp:Label ID="lblAsset_ClassOld" CssClass="width100" Font-Size="14px" ForeColor="Gray" runat="server" Text='<%# Bind("Asset_ClassOld") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SAP code">
                        <ItemTemplate>
                            <asp:Label ID="lblSAP_code" CssClass="width100" Font-Size="16px" ForeColor="#607d8b" Font-Bold="true" runat="server" Text='<%# Bind("SAP_code") %>'></asp:Label><br />
                            <asp:Label ID="lblSAP_codeOld" CssClass="width100" Font-Size="14px" ForeColor="Gray" runat="server" Text='<%# Bind("SAP_codeOld") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Asset Name">
                        <ItemTemplate>
                            <asp:Label ID="lblAsset_Name" CssClass="width100" Font-Size="16px" ForeColor="#607d8b" Font-Bold="true" runat="server" Text='<%# Bind("Asset_Name") %>'></asp:Label><br />
                            <asp:Label ID="lblAsset_NameOld" CssClass="width100" Font-Size="14px" ForeColor="Gray" runat="server" Text='<%# Bind("Asset_NameOld") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name2">
                        <ItemTemplate>
                            <asp:Label ID="lblName2" CssClass="width100" Font-Size="16px" ForeColor="#607d8b" Font-Bold="true" runat="server" Text='<%# Bind("Name2") %>'></asp:Label><br />
                            <asp:Label ID="lblName2Old" CssClass="width100" Font-Size="14px" ForeColor="Gray" runat="server" Text='<%# Bind("Name2Old") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Original_Asset">
                        <ItemTemplate>
                            <asp:Label ID="lblOriginal_Asset" CssClass="width100" Font-Size="16px" ForeColor="#607d8b" Font-Bold="true" runat="server" Text='<%# Bind("Original_Asset") %>'></asp:Label><br />
                            <asp:Label ID="lblOriginal_AssetOld" CssClass="width100" Font-Size="14px" ForeColor="Gray" runat="server" Text='<%# Bind("Original_AssetOld") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SerialNumber">
                        <ItemTemplate>
                            <asp:Label ID="lblSerialNumber" CssClass="width100" Font-Size="16px" ForeColor="#607d8b" Font-Bold="true" runat="server" Text='<%# Bind("SerialNumber") %>'></asp:Label><br />
                            <asp:Label ID="lblSerialNumberOld" CssClass="width100" Font-Size="14px" ForeColor="Gray" runat="server" Text='<%# Bind("SerialNumberOld") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ProfitCenter">
                        <ItemTemplate>
                            <asp:Label ID="lblProfitCenter" CssClass="width100" Font-Size="16px" ForeColor="#607d8b" Font-Bold="true" runat="server" Text='<%# Bind("ProfitCenter") %>'></asp:Label><br />
                            <asp:Label ID="lblProfitCenterOld" CssClass="width100" Font-Size="14px" ForeColor="Gray" runat="server" Text='<%# Bind("ProfitCenterOld") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ProfitCenterName">
                        <ItemTemplate>
                            <asp:Label ID="lblProfitCenterName" CssClass="width100" Font-Size="16px" ForeColor="#607d8b" Font-Bold="true" runat="server" Text='<%# Bind("ProfitCenterName") %>'></asp:Label><br />
                            <asp:Label ID="lblProfitCenterNameOld" CssClass="width100" Font-Size="14px" ForeColor="Gray" runat="server" Text='<%# Bind("ProfitCenterNameOld") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Location">
                        <ItemTemplate>
                            <asp:Label ID="lblLocation" CssClass="width100" Font-Size="16px" ForeColor="#607d8b" Font-Bold="true" runat="server" Text='<%# Bind("Location") %>'></asp:Label><br />
                            <asp:Label ID="lblLocationOld" CssClass="width100" Font-Size="14px" ForeColor="Gray" runat="server" Text='<%# Bind("LocationOld") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DeprStartDate">
                        <ItemTemplate>
                            <asp:Label ID="lblDeprStartDate" CssClass="width100" Font-Size="16px" ForeColor="#607d8b" Font-Bold="true" runat="server" Text='<%# Bind("DeprStartDate") %>'></asp:Label><br />
                            <asp:Label ID="lblDeprStartDateOld" CssClass="width100" Font-Size="14px" ForeColor="Gray" runat="server" Text='<%# Bind("DeprStartDateOld") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ReceivedAmount">
                        <ItemTemplate>
                            <asp:Label ID="lblReceivedAmount" CssClass="width100" Font-Size="16px" ForeColor="#607d8b" Font-Bold="true" runat="server" Text='<%# Bind("ReceivedAmount") %>'></asp:Label><br />
                            <asp:Label ID="lblReceivedAmountOld" CssClass="width100" Font-Size="14px" ForeColor="Gray" runat="server" Text='<%# Bind("ReceivedAmountOld") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="BookAmount">
                        <ItemTemplate>
                            <asp:Label ID="lblBookAmount" CssClass="width100" Font-Size="16px" ForeColor="#607d8b" Font-Bold="true" runat="server" Text='<%# Bind("BookAmount") %>'></asp:Label><br />
                            <asp:Label ID="lblBookAmountOld" CssClass="width100" Font-Size="14px" ForeColor="Gray" runat="server" Text='<%# Bind("BookAmountOld") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remark">
                        <ItemTemplate>
                            <asp:Label ID="lblRemark" CssClass="width100" Font-Size="16px" ForeColor="#607d8b" Font-Bold="true" runat="server" Text='<%# Bind("Remark") %>'></asp:Label><br />
                            <asp:Label ID="lblRemarkOld" CssClass="width100" Font-Size="14px" ForeColor="Gray" runat="server" Text='<%# Bind("RemarkOld") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="NumericFirstLast" />
                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
            </asp:GridView>
        </div>
    </div>
    <script type="text/javascript">

        window.onload = function () {
            // Lấy tất cả các label trên trang
            var labels = document.getElementsByTagName("lbl");
            console("lbl",labels);
            for (var i = 0; i < labels.length; i++) {
                var currentLabel = labels[i];
                var labelText = currentLabel.innerText.trim();
                console("labelText", labelText);
                // Kiểm tra xem label có từ Old không
                if (labelText.endsWith("Old")) {
                    // Tìm label tương ứng không chứa từ Old
                    var correspondingLabelId = labelText.replace("Old", "");
                    var correspondingLabel = document.getElementById(correspondingLabelId);

                    if (correspondingLabel !== null) {
                        var correspondingLabelText = correspondingLabel.innerText.trim();

                        // So sánh giá trị của label với label không có từ Old
                        if (labelText === correspondingLabelText + "Old") {
                            // Nếu giống nhau, thực hiện bôi đỏ
                            currentLabel.style.color = "red";
                            correspondingLabel.style.color = "red";
                            console("labelText", labelText);
                            console("correspondingLabelText", correspondingLabelText);
                        }
                    }
                }
            }
        };
    </script>
</asp:Content>
