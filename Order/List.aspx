<%@ Page Title="Orders" Language="C#" MasterPageFile="~/CebuMaster.Master"
    AutoEventWireup="true" CodeBehind="List.aspx.cs"
    Inherits="QlyMain.Order.List" %>
<asp:Content ContentPlaceHolderID="TopbarActions" runat="server">
    <a href='<%= ResolveUrl("~/Order/Create.aspx") %>' class="btn btn-primary btn-sm"><i class="bi bi-clipboard-plus"></i>New Order</a>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlMsg" runat="server" Visible="false">
        <div class="alert" id="divMsg" runat="server" style="margin-bottom: 12px;">
            <asp:Literal ID="litMsg" runat="server" />
        </div>
    </asp:Panel>
    <div style="display: flex; gap: 8px; margin-bottom: 14px; flex-wrap: wrap;">
        <asp:LinkButton ID="btnAll" runat="server" CssClass="btn btn-secondary btn-sm" CommandArgument="" OnCommand="TabFilter"><i class="fa-solid fa-clipboard-list"></i> All</asp:LinkButton>
        <asp:LinkButton ID="btnPending" runat="server" CssClass="btn btn-sm" Style="background: #fef9c3; color: #854d0e; border: 1px solid #fcd34d;" CommandArgument="Pending" OnCommand="TabFilter"><i class="fa-solid fa-hourglass-half"></i> Pending</asp:LinkButton>
        <asp:LinkButton ID="btnApproved" runat="server" CssClass="btn btn-sm" Style="background: #dbeafe; color: #1d4ed8; border: 1px solid #93c5fd;" CommandArgument="Approved" OnCommand="TabFilter"><i class="fa-solid fa-circle-check" style="color:#16a34a;"></i> Approved</asp:LinkButton>
        <asp:LinkButton ID="btnReceived" runat="server" CssClass="btn btn-sm" Style="background: #dcfce7; color: #15803d; border: 1px solid #86efac;" CommandArgument="Received" OnCommand="TabFilter"><i class="fa-solid fa-boxes-stacked"></i> Received</asp:LinkButton>
        <asp:LinkButton ID="btnCancelled" runat="server" CssClass="btn btn-sm" Style="background: #fee2e2; color: #b91c1c; border: 1px solid #fca5a5;" CommandArgument="Cancelled" OnCommand="TabFilter"><i class="fa-solid fa-circle-xmark" style="color:#b91c1c;"></i> Cancelled</asp:LinkButton>
    </div>
    <asp:Literal ID="litPartFilter" runat="server" />
    <div class="card">
        <div class="filter-bar">
            <div class="form-group">
                <label class="form-label">From</label>
                <asp:TextBox ID="txtFrom" runat="server" CssClass="form-control" TextMode="Date" Style="width: 140px;" />
            </div>
            <div class="form-group">
                <label class="form-label">To</label>
                <asp:TextBox ID="txtTo" runat="server" CssClass="form-control" TextMode="Date" Style="width: 140px;" />
            </div>
            <div class="form-group" style="align-self: flex-end;">
                <asp:Button ID="btnSearch" runat="server" Text="Filter" CssClass="btn btn-primary" OnClick="BtnSearch_Click" />
            </div>
            <div style="margin-left: auto; align-self: center; font-size: 13px; color: var(--text-muted);">
                <strong>
                    <asp:Literal ID="litCount" runat="server" /></strong> orders
            </div>
        </div>
        <div class="table-wrapper">
            <asp:GridView ID="gvOrders" runat="server" CssClass="data-table" AutoGenerateColumns="false"
                DataKeyNames="id" OnRowCommand="gvOrders_RowCommand" EmptyDataText="No orders." GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="Order Date" ItemStyle-Width="120">
                        <ItemTemplate><span class="font-mono" style="font-size: 12.5px;"><%# Eval("OrderDate") != null ? ((System.DateTime)Eval("OrderDate")).ToString("dd/MM/yyyy") : "-" %></span></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ItemCode" HeaderText="Item Code" ItemStyle-CssClass="font-mono" ItemStyle-Width="110" />
                    <asp:BoundField DataField="PartName" HeaderText="Part Name" />
                    <asp:BoundField DataField="Unit" HeaderText="Unit" ItemStyle-Width="55" />
                    <asp:TemplateField HeaderText="Stock" ItemStyle-Width="70">
                        <ItemTemplate><span style="font-weight: 600;"><%# Eval("QtyStock") %></span></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order Qty" ItemStyle-Width="85">
                        <ItemTemplate><span style="font-weight: 700; color: #2563eb; font-size: 15px;"><%# Eval("OrderQty") %></span></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OrderUser" HeaderText="Ordered By" ItemStyle-Width="110" />
                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="120">
                        <ItemTemplate><span class='badge <%# Eval("StatusClass") %>'><%# Eval("StatusText") %></span></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="" ItemStyle-Width="185">
                        <ItemTemplate>
                            <asp:LinkButton CommandName="Approve" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-success btn-sm"
                                Visible='<%# Eval("Status").ToString()=="Pending" %>' runat="server"><i class="fa-solid fa-circle-check" style="color:#16a34a;"></i> Approve</asp:LinkButton>
                            <asp:LinkButton CommandName="Receive" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-primary btn-sm"
                                Visible='<%# Eval("Status").ToString()=="Approved" %>' runat="server"><i class="fa-solid fa-boxes-stacked"></i> Receive</asp:LinkButton>
                            <asp:LinkButton CommandName="Cancel" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-danger btn-sm"
                                Visible='<%# Eval("Status").ToString()=="Pending"||Eval("Status").ToString()=="Approved" %>'
                                OnClientClick="return confirm('Cancel this order?')" runat="server"><i class="fa-solid fa-xmark"></i> Cancel</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <AlternatingRowStyle BackColor="#f8faff" />
            </asp:GridView>
        </div>
    </div>
    <asp:HiddenField ID="hfStatusFilter" runat="server" Value="" />
    <asp:HiddenField ID="hfPartIdFilter" runat="server" Value="" />
</asp:Content>
