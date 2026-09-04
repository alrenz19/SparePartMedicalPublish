<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MngFAMng.aspx.cs" Inherits="QlyMain.Admin.MngFAMng" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/MngFA.css" rel="stylesheet" />
    <style>
        .dropdown-menu {
            min-width: 30px !important;
        }
    </style>
    <div class="col-sm-12 col-md-12 col-lg-12 " style="padding: 20px;">
        <div class="messagealert" id="alert_container">
        </div>
        <asp:Label Text=" ASSET DATA MANAGEMENT" ForeColor="#555c5f" Font-Size="20px" runat="server" />
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
                <div class="col-sm-6 col-md-6 col-lg-6">
                    <asp:Panel runat="server" CssClass="box-shadow2" DefaultButton="lbkFind">
                        <div class="input-group">
                            <asp:TextBox runat="server" CssClass="form-control" placeholder="SAP code, Original Asset, Asset Class,... "
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
                </div>
            </div>
        </div>
        <asp:GridView runat="server" ID="gvFA" AutoGenerateColumns="False" DataKeyNames="id" OnRowDataBound="gvFA_RowDataBound"
            OnPageIndexChanging="gvFA_PageIndexChanging" AllowPaging="True" PageSize="30"
            EnableViewState="true" ShowHeaderWhenEmpty="true"
            CssClass="table grStyle box-shadow1 center" OnRowCommand="gvFA_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="No">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                        <asp:Label ID="lblQR" runat="server" Visible="false" Text='<%# Bind("QRcodeOrNot") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Asset_Class">
                    <HeaderTemplate>
                        <span class="bold-first-two-char">A</span>sset <span class="bold-first-two-char">C</span>lass
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAsset_Class" runat="server" Text='<%# Bind("Asset_Class") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblAsset_Class" runat="server" Text='<%# Bind("Asset_Class") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SAP code">
                    <HeaderTemplate>
                        <span class="bold-first-two-char">S</span>AP <span class="bold-first-two-char">C</span>ode
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSAP_code" runat="server" Text='<%# Bind("SAP_code") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSAP_code" runat="server" Text='<%# Bind("SAP_code") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Asset Name">
                    <HeaderTemplate>
                        <span class="bold-first-two-char">A</span>sset  <span class="bold-first-two-char">N</span>ame
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAsset_Name" runat="server" Text='<%# Bind("Asset_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblAsset_Name" runat="server" Text='<%# Bind("Asset_Name") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Original Asset">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtOriginal_Asset" runat="server" Text='<%# Bind("Original_Asset") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblOriginal_Asset" runat="server" Text='<%# Bind("Original_Asset") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Serial Number">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSerialNumber" runat="server" Text='<%# Bind("SerialNumber") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSerialNumber" runat="server" Text='<%# Bind("SerialNumber") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Profit Center">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtProfitCenter" runat="server" Text='<%# Bind("ProfitCenter") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblProfitCenter" runat="server" Text='<%# Bind("ProfitCenter") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Profit Center Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtProfitCenterName" runat="server" Text='<%# Bind("ProfitCenterName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblProfitCenterName" runat="server" Text='<%# Bind("ProfitCenterName") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Location">
                    <HeaderTemplate>
                        <span class="bold-first-two-char">L</span>ocation
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLocation" runat="server" Text='<%# Bind("Location") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Remark">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtRemark" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Section Stock Check">
                    <HeaderTemplate>
                        <span class="bold-first-two-char">S</span>ection   <span class="bold-first-two-char">S</span>tock<span class="bold-first-two-char">C</span>heck
                    </HeaderTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSectionStockCheck" runat="server" Text='<%# Bind("SectionStockCheck") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblSectionStockCheck" runat="server" Text='<%# Bind("SectionStockCheck") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State">
                    <ItemTemplate>
                        <asp:Label ID="lblState" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="History">
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" Visible="false" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                        <asp:HyperLink ID="hklink" CssClass="width100" Text='<%# Bind("Status") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="lblRowId" runat="server" Text='<%# Eval("id") %>' CssClass="btn btn-default" Style="display: none;"></asp:Label>
                        <asp:LinkButton Text="Restore" CommandArgument="<%#Container.DataItemIndex%>" CommandName='<%#"RES|"+Eval("id")%>'
                            CssClass="btn btn-default" ID="lblRestore" runat="server"
                            OnClientClick="if(!confirm('Are you sure you want restore')) return false;">
                            <i class="fa fa-trash-o"></i></asp:LinkButton>
                        <asp:LinkButton Text="Delete" CommandArgument="<%#Container.DataItemIndex%>" CommandName='<%#"DEL|"+Eval("id")%>'
                            CssClass="btn btn-default" ID="lblDelete" runat="server"
                            OnClientClick="if(!confirm('Are you sure you want Permanently Delete')) return false;"><i class="fa fa-trash-o"></i></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        </asp:GridView>
    </div>


</asp:Content>
