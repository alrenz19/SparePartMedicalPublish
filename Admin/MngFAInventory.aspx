<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MngFAInventory.aspx.cs" Inherits="QlyMain.Admin.MngFAInventory" %>

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
                        <td style="padding-left: 30px">
                            <asp:LinkButton runat="server" CssClass="btn btn-default btn-st" ID="lbkAdd" OnClick="lbkAdd_CLick"><i class="fa fa-plus-circle" aria-hidden="true"></i> Thêm mới (Add New)</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
            <asp:GridView runat="server" ID="gvInventory" AutoGenerateColumns="False" DataKeyNames="id"
                OnRowDataBound="gvInventory_RowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" ShowHeaderWhenEmpty="True" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting"
                CssClass="table grStyle box-shadow1 center">
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <%-- <asp:CheckBox ID="chkboxSelectAll"
                                CssClass="chkheader"
                                runat="server" Text=" All" />--%>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <%--<asp:CheckBox ID="SelectCheckBox" runat="server" CssClass="chkitems" />--%>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="code">                        
                        <ItemTemplate>
                            <asp:Label ID="lblid" Visible="false" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            <asp:HyperLink ID="hkInventoryCode" CssClass="width100" Text='<%# Bind("InventoryCode") %>' runat="server" />
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtInventoryName" runat="server" Text='<%# Bind("InventoryName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblInventoryName" CssClass="width100" runat="server" Text='<%# Bind("InventoryName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User">                        
                        <ItemTemplate>
                            <asp:Label ID="lblUser" runat="server" Text='<%# Bind("UserCode") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Div">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDiv" runat="server" Text='<%# Bind("Div") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDiv" runat="server" Text='<%# Bind("Div") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Datetime">                       
                        <ItemTemplate>
                            <asp:Label ID="lblDatetime" runat="server" Text='<%# Format(Eval("DateCreate")) %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" />
                    </asp:TemplateField>

                    
                    <asp:TemplateField HeaderText="State">                       
                        <ItemTemplate>
                            <asp:Label ID="lblState" runat="server" Font-Bold="true"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>


                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lblRowId" runat="server" Text='<%# Eval("id") %>' CssClass="row-id" Style="display: none;"></asp:Label>
                            <asp:LinkButton Text="Update" Visible="false" CommandArgument="<%#Container.DataItemIndex%>" CommandName='<%#"EDIT|"+Eval("id")%>'
                                ID="lblUpdate" runat="server" CssClass="btn btn-default"> <i class="fa fa-pencil" aria-hidden="true"></i></asp:LinkButton>
                            <asp:LinkButton Text="Delete"  Visible="false" CommandArgument="<%#Container.DataItemIndex%>" CommandName='<%#"DEL|"+Eval("id")%>'
                                CssClass="btn btn-default" ID="lblDelete" runat="server" OnClientClick="if(!confirm('Are you sure you want delete')) return false;"><i class="fa fa-trash-o"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="NumericFirstLast" />
                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
