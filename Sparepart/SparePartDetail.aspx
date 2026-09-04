<%@ Page Title="Part Detail" Language="C#"  MasterPageFile="~/CebuMaster.Master"
    AutoEventWireup="true" CodeBehind="SparePartDetail.aspx.cs"
    Inherits="QlyMain.Sparepart.SparePartDetail" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<section class="content-header"><h1>CEBU Spare Part</h1></section>
<section class="content">

<%-- Part Info Header --%>
<div class="card" style="margin-bottom:16px;">
    <div class="card-header" style="background:linear-gradient(135deg,#1a2332,#243044);color:#fff;padding:14px 20px;">
        <span style="font-size:16px;font-weight:700;font-family:'IBM Plex Sans',sans-serif;">
            <asp:Literal ID="litPartName" runat="server" />
        </span>
        <span style="margin-left:12px;font-family:'IBM Plex Mono',monospace;font-size:12px;opacity:.7;">
            <asp:Literal ID="litItemCode" runat="server" />
        </span>
        <span style="margin-left:auto;float:right;">
            <asp:Literal ID="litAlertBadge" runat="server" />
        </span>
    </div>
    <div class="part-info-grid">
        <div class="info-cell"><div class="lbl">Maker</div><div class="val"><asp:Literal ID="litMaker" runat="server" /></div></div>
        <div class="info-cell"><div class="lbl">Model</div><div class="val"><asp:Literal ID="litModel" runat="server" /></div></div>
        <div class="info-cell"><div class="lbl">Type</div><div class="val"><asp:Literal ID="litType" runat="server" /></div></div>
        <div class="info-cell"><div class="lbl">Unit</div><div class="val"><asp:Literal ID="litUnit" runat="server" /></div></div>
        <div class="info-cell"><div class="lbl">Position</div><div class="val mono"><asp:Literal ID="litPosition" runat="server" /></div></div>
        <div class="info-cell"><div class="lbl">Machine</div><div class="val"><asp:Literal ID="litMachine" runat="server" /></div></div>
        <div class="info-cell"><div class="lbl">Supplier</div><div class="val"><asp:Literal ID="litSupplier" runat="server" /></div></div>
        <div class="info-cell"><div class="lbl">Current Stock</div>
            <div class="val" style="font-size:22px;"><asp:Literal ID="litStock" runat="server" /></div></div>
        <div class="info-cell"><div class="lbl">Safety / Show</div>
            <div class="val"><asp:Literal ID="litSafety" runat="server" /></div></div>
        <div class="info-cell"><div class="lbl">Lead Time</div>
            <div class="val"><asp:Literal ID="litLeadTime" runat="server" />d</div></div>
        <div class="info-cell"><div class="lbl">Cost</div>
            <div class="val"><asp:Literal ID="litCost" runat="server" /></div></div>
        <div class="info-cell"><div class="lbl">Order Qty</div>
            <div class="val" style="color:#7c3aed;"><asp:Literal ID="litOrderQty" runat="server" /></div></div>
    </div>
</div>

<%-- selector --%>
<div class="card">
    <div style="display:flex;align-items:center;padding:12px 16px 4px;gap:10px;border-bottom:1px solid #f0f4f8;">
        <i class="bi bi-calendar3" style="color:#2563eb;font-size:16px;"></i>
        <span style="font-size:13px;font-weight:600;color:#1e293b;">Select Year:</span>
        <div class="year-tabs" style="padding:0;">
            <asp:Repeater ID="rptYears" runat="server" OnItemCommand="rptYears_ItemCommand">
                <ItemTemplate>
                    <asp:LinkButton ID="lbYear" runat="server"
                        CommandName="SelectYear"
                        CommandArgument='<%# Eval("Year") %>'
                        CssClass='<%# (int)Eval("Year") == SelectedYear ? "year-btn active" : "year-btn" %>'><%# Eval("Year") %></asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <span style="margin-left:auto;font-size:12px;color:#94a3b8;">
            Showing year: <strong style="color:#2563eb;"><asp:Literal ID="litSelectedYear" runat="server" /></strong>
        </span>
        <asp:Button ID="btnExportDetail" runat="server"
            Text="&#x1F4E5; Export Excel (all months)"
            CssClass="btn btn-success btn-sm"
            OnClick="BtnExportDetail_Click"
            CausesValidation="false"
            style="margin-left:8px;" />
    </div>

    <%-- bar --%>
    <div class="tab-bar" style="padding:0 16px;">
        <asp:LinkButton ID="lbTabSummary" runat="server" CssClass="tab-btn active" OnClick="ShowSummary">
            <i class="bi bi-grid-3x3-gap"></i> Monthly Summary
        </asp:LinkButton>
        <asp:LinkButton ID="lbTabInput"   runat="server" CssClass="tab-btn" OnClick="ShowInput">
            <i class="bi bi-box-arrow-in-down" style="color:#16a34a;"></i> Input
        </asp:LinkButton>
        <asp:LinkButton ID="lbTabOutput"  runat="server" CssClass="tab-btn" OnClick="ShowOutput">
            <i class="bi bi-box-arrow-up" style="color:#dc2626;"></i> Output
        </asp:LinkButton>
        <asp:LinkButton ID="lbTabOrder"   runat="server" CssClass="tab-btn" OnClick="ShowOrder">
            <i class="bi bi-clipboard-check" style="color:#7c3aed;"></i> Order
        </asp:LinkButton>
    </div>

    <%-- TAB: Monthly Summary --%>
    <asp:Panel ID="pnlSummary" runat="server">
        <div class="table-wrapper">
            <asp:GridView ID="gvSummary" runat="server" CssClass="data-table"
                AutoGenerateColumns="false" EmptyDataText="No data." GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="Month" ItemStyle-Width="100">
                        <ItemTemplate>
                            <span style="font-family:'IBM Plex Mono',monospace;font-weight:700;font-size:13px;">
                                <%# Eval("MonthLabel") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IN" ItemStyle-Width="80">
                        <ItemTemplate>
                            <span class="sum-badge sum-in">+<%# Eval("QtyInput") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OUT" ItemStyle-Width="80">
                        <ItemTemplate>
                            <span class="sum-badge sum-out">-<%# Eval("QtyOutput") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Stock End" ItemStyle-Width="90">
                        <ItemTemplate>
                            <span class="sum-badge sum-stock"><%# Eval("QtyStock") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Stock Old" ItemStyle-Width="85">
                        <ItemTemplate>
                            <span style="font-size:12px;color:#64748b;"><%# Eval("QtyStockOld") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order Qty" ItemStyle-Width="90">
                        <ItemTemplate>
                            <span class="sum-badge sum-order"><%# Eval("OrderQty") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OrderStatus"       HeaderText="Order Status" />
                    <asp:BoundField DataField="GapInput"          HeaderText="Gap"          ItemStyle-Width="60" />
                    <asp:BoundField DataField="TotalOrderOfMonth" HeaderText="Total Order"  ItemStyle-Width="90" />
                </Columns>
                <AlternatingRowStyle BackColor="#f8faff" />
            </asp:GridView>
        </div>
    </asp:Panel>

    <%-- TAB: Input --%>
    <asp:Panel ID="pnlInput" runat="server" Visible="false">
        <div class="table-wrapper">
            <asp:GridView ID="gvInput" runat="server" CssClass="data-table"
                AutoGenerateColumns="false" EmptyDataText="No input records." GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="Date" ItemStyle-Width="110">
                        <ItemTemplate>
                            <span style="font-family:'IBM Plex Mono',monospace;font-size:12.5px;">
                                <%# Eval("InputDate") != null ? ((System.DateTime)Eval("InputDate")).ToString("dd/MM/yyyy") : "-" %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Period" ItemStyle-Width="75">
                        <ItemTemplate>
                            <span style="font-size:12px;color:#64748b;"><%# Eval("Month") %>/<%# Eval("Year") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Qty IN" ItemStyle-Width="80">
                        <ItemTemplate>
                            <span style="font-weight:700;font-size:16px;color:#16a34a;">+<%# Eval("Quantity") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Before" ItemStyle-Width="70">
                        <ItemTemplate>
                            <span style="font-size:12px;color:#64748b;"><%# Eval("QuantityInStockBefore") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="After" ItemStyle-Width="70">
                        <ItemTemplate>
                            <span style="font-size:12px;font-weight:600;color:#0369a1;"><%# Eval("QuantityInStockAfter") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CreatedBy" HeaderText="By"     ItemStyle-Width="100" />
                    <asp:BoundField DataField="Remark"    HeaderText="Remark" />
                </Columns>
                <RowStyle CssClass="row-in" />
            </asp:GridView>
        </div>
    </asp:Panel>

    <%-- TAB: Output --%>
    <asp:Panel ID="pnlOutput" runat="server" Visible="false">
        <div class="table-wrapper">
            <asp:GridView ID="gvOutput" runat="server" CssClass="data-table"
                AutoGenerateColumns="false" EmptyDataText="No output records." GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="Date" ItemStyle-Width="110">
                        <ItemTemplate>
                            <span style="font-family:'IBM Plex Mono',monospace;font-size:12.5px;">
                                <%# Eval("OutputDate") != null ? ((System.DateTime)Eval("OutputDate")).ToString("dd/MM/yyyy") : "-" %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Period" ItemStyle-Width="75">
                        <ItemTemplate>
                            <span style="font-size:12px;color:#64748b;"><%# Eval("Month") %>/<%# Eval("Year") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Qty OUT" ItemStyle-Width="80">
                        <ItemTemplate>
                            <span style="font-weight:700;font-size:16px;color:#dc2626;">-<%# Eval("Quantity") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Before" ItemStyle-Width="70">
                        <ItemTemplate>
                            <span style="font-size:12px;color:#64748b;"><%# Eval("QuantityInStockBefore") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="After" ItemStyle-Width="70">
                        <ItemTemplate>
                            <span style="font-size:12px;font-weight:600;color:#b91c1c;"><%# Eval("QuantityInStockAfter") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OutputBy"      HeaderText="Output By"  ItemStyle-Width="100" />
                    <asp:BoundField DataField="PersonReceive" HeaderText="Receive"     ItemStyle-Width="100" />
                    <asp:BoundField DataField="StatusUsing"   HeaderText="Purpose"     ItemStyle-Width="120" />
                    <asp:TemplateField HeaderText="Cost" ItemStyle-Width="110">
                        <ItemTemplate>
                            <span style="font-size:12px;font-family:'IBM Plex Mono',monospace;"><%# Eval("CostDisplay") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Remark" HeaderText="Remark" />
                </Columns>
                <RowStyle CssClass="row-out" />
            </asp:GridView>
        </div>
    </asp:Panel>

    <%-- TAB: Order --%>
    <asp:Panel ID="pnlOrder" runat="server" Visible="false">
        <div class="table-wrapper">
            <asp:GridView ID="gvOrder" runat="server" CssClass="data-table"
                AutoGenerateColumns="false" EmptyDataText="No order records." GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="Order Date" ItemStyle-Width="120">
                        <ItemTemplate>
                            <span style="font-family:'IBM Plex Mono',monospace;font-size:12.5px;">
                                <%# Eval("OrderDate") != null ? ((System.DateTime)Eval("OrderDate")).ToString("dd/MM/yyyy") : "-" %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Order Qty" ItemStyle-Width="90">
                        <ItemTemplate>
                            <span style="font-weight:700;font-size:16px;color:#7c3aed;"><%# Eval("OrderQty") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OrderUser" HeaderText="Ordered By" ItemStyle-Width="110" />
                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="120">
                        <ItemTemplate>
                            <span class='<%# "badge " + Eval("StatusClass") %>'><%# Eval("StatusText") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Modified" ItemStyle-Width="120">
                        <ItemTemplate>
                            <span style="font-size:12px;color:#64748b;">
                                <%# Eval("dateMdf") != null ? ((System.DateTime)Eval("dateMdf")).ToString("dd/MM/yyyy") : "-" %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="InputOld" HeaderText="Input Old" ItemStyle-Width="85" />
                    <asp:BoundField DataField="OrderOld" HeaderText="Order Old" ItemStyle-Width="85" />
                </Columns>
                <RowStyle CssClass="row-order" />
            </asp:GridView>
        </div>
    </asp:Panel>

</div>

<asp:HiddenField ID="hfPartID"      runat="server" Value="0" />
<asp:HiddenField ID="hfActiveTab"   runat="server" Value="Summary" />
<asp:HiddenField ID="hfYear"        runat="server" Value="0" />


</section>
</asp:Content>