<%@ Page Title="Spare Parts" Language="C#" MasterPageFile="~/CebuMaster.Master"
    AutoEventWireup="true" CodeBehind="SparePartList.aspx.cs"
    Inherits="QlyMain.Sparepart.SparePartList" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<section class="content-header"></section>
<section class="content">

<asp:Panel ID="pnlMsg" runat="server" Visible="false">
    <div class="alert" id="divMsg" runat="server" style="margin-bottom:12px;">
        <asp:Literal ID="litMsg" runat="server" />
    </div>
</asp:Panel>

<div class="card">

    <div class="filter-bar">
        <div class="form-group">
            <label class="form-label">Search</label>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"
                placeholder="Name, code, maker..." style="width:210px;" />
        </div>
        <div class="form-group">
            <label class="form-label">Type</label>
            <asp:DropDownList ID="ddlType" runat="server" CssClass="form-select" style="width:130px;">
                <asp:ListItem Value="">-- All --</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <label class="form-label">Supplier</label>
            <asp:DropDownList ID="ddlSupplier" runat="server" CssClass="form-select" style="width:140px;">
                <asp:ListItem Value="">-- All --</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <label class="form-label">Process</label>
            <asp:DropDownList ID="ddlProcess" runat="server" CssClass="form-select" style="width:140px;">
                <asp:ListItem Value="">-- All --</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <label class="form-label">Status</label>
            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select" style="width:100px;">
                <asp:ListItem Value="active">Active</asp:ListItem>
                <asp:ListItem Value="all">All</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <label class="form-label">Alert</label>
            <asp:DropDownList ID="ddlAlert" runat="server" CssClass="form-select" style="width:120px;">
                <asp:ListItem Value="">-- All --</asp:ListItem>
                <asp:ListItem Value="CRITICAL">Critical</asp:ListItem>
                <asp:ListItem Value="WARNING">Warning</asp:ListItem>
                <asp:ListItem Value="NORMAL">Normal</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="form-group" style="align-self:flex-end;">
            <asp:Button ID="btnSearch" runat="server" Text="Search"
                CssClass="btn btn-primary" OnClick="BtnSearch_Click" />
            <asp:Button ID="btnReset"  runat="server" Text="Reset"
                CssClass="btn btn-secondary" OnClick="BtnReset_Click" style="margin-left:6px;" />
        </div>
        <%-- Export panel --%>
        <div style="width:100%;margin-top:8px;padding:10px 14px;background:#f8fafc;border:1px solid #e2e8f0;border-radius:8px;display:flex;align-items:center;flex-wrap:wrap;gap:10px;">
            <span style="font-weight:700;font-size:13px;color:#1e293b;"><i class="fa-solid fa-file-excel" style="color:#16a34a;"></i> Export Excel</span>
            <span style="color:#cbd5e1;">|</span>

            <%-- Năm --%>
            <label style="font-size:12px;color:#475569;margin:0;">Year:</label>
            <asp:DropDownList ID="ddlExportYear" runat="server" CssClass="form-select form-select-sm" style="width:90px;" />

            <%-- Từ tháng --%>
            <label style="font-size:12px;color:#475569;margin:0;">From month:</label>
            <asp:DropDownList ID="ddlExportMonthFrom" runat="server" CssClass="form-select form-select-sm" style="width:90px;">
                <asp:ListItem Value="1" Text="01 - Jan" />
                <asp:ListItem Value="2" Text="02 - Feb" />
                <asp:ListItem Value="3" Text="03 - Mar" />
                <asp:ListItem Value="4" Text="04 - Apr" />
                <asp:ListItem Value="5" Text="05 - May" />
                <asp:ListItem Value="6" Text="06 - Jun" />
                <asp:ListItem Value="7" Text="07 - Jul" />
                <asp:ListItem Value="8" Text="08 - Aug" />
                <asp:ListItem Value="9" Text="09 - Sep" />
                <asp:ListItem Value="10" Text="10 - Oct" />
                <asp:ListItem Value="11" Text="11 - Nov" />
                <asp:ListItem Value="12" Text="12 - Dec" />
            </asp:DropDownList>

            <%-- Đến tháng --%>
            <label style="font-size:12px;color:#475569;margin:0;">To month:</label>
            <asp:DropDownList ID="ddlExportMonthTo" runat="server" CssClass="form-select form-select-sm" style="width:90px;">
                <asp:ListItem Value="1" Text="01 - Jan" />
                <asp:ListItem Value="2" Text="02 - Feb" />
                <asp:ListItem Value="3" Text="03 - Mar" />
                <asp:ListItem Value="4" Text="04 - Apr" />
                <asp:ListItem Value="5" Text="05 - May" />
                <asp:ListItem Value="6" Text="06 - Jun" />
                <asp:ListItem Value="7" Text="07 - Jul" />
                <asp:ListItem Value="8" Text="08 - Aug" />
                <asp:ListItem Value="9" Text="09 - Sep" />
                <asp:ListItem Value="10" Text="10 - Oct" />
                <asp:ListItem Value="11" Text="11 - Nov" />
                <asp:ListItem Value="12" Text="12 - Dec" />
            </asp:DropDownList>

            <%-- Nút export --%>
            <asp:Button ID="btnExportAll" runat="server"
                Text="&#x1F4E5; Export All SP"
                CssClass="btn btn-success btn-sm"
                OnClick="BtnExportAll_Click" CausesValidation="false" />
            <asp:Button ID="btnExportExpired" runat="server"
                Text="&#x26A0; Below Safety Only"
                CssClass="btn btn-danger btn-sm"
                OnClick="BtnExportExpired_Click" CausesValidation="false" />
        </div>
        <div style="margin-left:auto;align-self:center;font-size:13px;color:var(--text-muted);">
            <strong><asp:Literal ID="litCount" runat="server" /></strong> parts &nbsp;|
            <span style="color:#dc2626;"><asp:Literal ID="litCritical" runat="server" /> Critical</span>
            &nbsp;
            <span style="color:#d97706;"><asp:Literal ID="litWarning" runat="server" /> Warning</span>
        </div>
    </div>

    <div class="month-bar">
        <i class="bi bi-calendar3-week"></i>
        Stats for: <strong><asp:Literal ID="litMonthLabel" runat="server" /></strong>
        &nbsp;|&nbsp;
        <span style="background:#dcfce7;color:#15803d;padding:2px 8px;border-radius:4px;font-size:11px;">IN</span>
        <span style="background:#fee2e2;color:#b91c1c;padding:2px 8px;border-radius:4px;font-size:11px;">OUT</span>
        <span style="background:#dbeafe;color:#1e40af;padding:2px 8px;border-radius:4px;font-size:11px;">STOCK</span>
        <span style="background:#ede9fe;color:#6d28d9;padding:2px 8px;border-radius:4px;font-size:11px;">ORDER</span>
        per row
    </div>

    <%-- Totals bar + page size --%>
    <div style="display:flex;align-items:center;gap:16px;padding:8px 16px;background:#f8fafc;border-bottom:1px solid var(--border);font-size:12px;flex-wrap:wrap;">
        <span style="color:#64748b;">Rows:</span>
        <asp:DropDownList ID="ddlPageSize" runat="server"
            style="width:80px;" AutoPostBack="true"
            OnSelectedIndexChanged="DdlPageSize_Changed">
            <asp:ListItem Value="10">10</asp:ListItem>
            <asp:ListItem Value="30" Selected="True">30</asp:ListItem>
            <asp:ListItem Value="50">50</asp:ListItem>
            <asp:ListItem Value="100">100</asp:ListItem>
        </asp:DropDownList>
        <span style="margin-left:8px;color:#64748b;">
            Month <strong><asp:Literal ID="litCurrentMonth" runat="server" /></strong>:
        </span>
        <span style="color:#16a34a;font-weight:600;">
            <i class="fa-solid fa-arrow-down-to-line"></i>
            IN: <asp:Literal ID="litTotalIn" runat="server" />
        </span>
        <span style="color:#dc2626;font-weight:600;">
            <i class="fa-solid fa-arrow-up-from-line"></i>
            OUT: <asp:Literal ID="litTotalOut" runat="server" />
        </span>
        <span style="color:#1e40af;font-weight:600;">
            <i class="fa-solid fa-boxes-stacked"></i>
            Stock: <asp:Literal ID="litTotalStock" runat="server" />
        </span>
    </div>

    <div class="table-wrapper">
        <asp:GridView ID="gvParts" runat="server"
            CssClass="data-table"
            AutoGenerateColumns="false"
            DataKeyNames="PartID"
            OnRowCommand="gvParts_RowCommand"
            EmptyDataText="No spare parts found."
            GridLines="None"
            AllowPaging="true"
            PageSize="30"
            OnPageIndexChanging="gvParts_PageIndexChanging">
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
            <PagerSettings Mode="NumericFirstLast" PageButtonCount="10" />
            <Columns>

                <asp:TemplateField HeaderText="Fav" ItemStyle-Width="36" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbFav" runat="server"
                            CommandName="Fav"
                            CommandArgument='<%# Eval("PartID") + "|" + Eval("Favourite") %>'
                            CssClass="fav-btn"
                            ToolTip="Toggle Favourite"><%# (bool)Eval("Favourite") ? "&#9733;" : "&#9734;" %></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Spare Part">
                    <ItemTemplate>
                        <span class="part-main"><%# Eval("PartName") %></span>
                        <span class="part-sub">
                            <span class="font-mono"><%# Eval("ItemCode") %></span>
                            &nbsp;&middot;&nbsp;<%# Eval("Maker") %>
                            &nbsp;&middot;&nbsp;<span style="color:#2563eb;"><%# Eval("TypeSP") %></span>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Machine / Position" ItemStyle-Width="150">
                    <ItemTemplate>
                        <span style="display:block;font-size:12px;"><%# Eval("ListCodeMachine") %></span>
                        <span class="part-sub" style="font-family:'IBM Plex Mono',monospace;"><%# Eval("PositionSave") %></span>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Process" ItemStyle-Width="120">
                    <ItemTemplate>
                        <span style="display:block;font-size:12px;font-weight:500;color:#475569;">
                            <i class="bi bi-diagram-3"></i> <%# Eval("ProcessName") %>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="This Month" ItemStyle-Width="220">
                    <ItemTemplate>
                        <span class="month-strip">
                            <a href='<%# "../Stock/StockIn.aspx?partid=" + Eval("PartID") %>' class='<%# "mbadge mb-in" + ((int)Eval("MonthInput")==0?" mb-zero":"") %>' title="Stock IN for this part" style="text-decoration:none;">
                                <span class="val"><%# Eval("MonthInput") %></span>
                                <span class="lbl">IN</span>
                            </a>
                            <a href='<%# "../Stock/StockOut.aspx?partid=" + Eval("PartID") %>' class='<%# "mbadge mb-out" + ((int)Eval("MonthOutput")==0?" mb-zero":"") %>' title="Stock OUT for this part" style="text-decoration:none;">
                                <span class="val"><%# Eval("MonthOutput") %></span>
                                <span class="lbl">OUT</span>
                            </a>
                            <span class='<%# "mbadge mb-stock" + (Eval("AlertStatus").ToString()=="CRITICAL"?" crit":Eval("AlertStatus").ToString()=="WARNING"?" warn":"") %>' title="Current stock">
                                <span class="val"><%# Eval("QtyStock") %></span>
                                <span class="lbl">STOCK</span>
                            </span>
                            <a href='<%# "../Order/Create.aspx?partid=" + Eval("PartID") %>' class='<%# "mbadge mb-order" + ((int)Eval("MonthOrderQty")==0?" mb-zero":"") %>' title="Create Order for this part" style="text-decoration:none;">
                                <span class="val"><%# Eval("MonthOrderQty") %></span>
                                <span class="lbl">ORDER</span>
                            </a>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Safety" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <span style="display:block;font-size:11px;color:#64748b;text-align:center;">
                            Min <strong style="color:#dc2626;"><%# Eval("SafetyStock") %></strong>
                            <br />
                            <span style="font-size:10px;color:#94a3b8;">Warn <%# Eval("SafetyStockShow") %></span>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Alert" ItemStyle-Width="90" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="lblAlert" runat="server"
                            CssClass="alert-pill"
                            style='<%# "background:" + (Eval("AlertStatus").ToString()=="CRITICAL"?"#fee2e2":Eval("AlertStatus").ToString()=="WARNING"?"#fef9c3":"#dcfce7") + ";color:" + (Eval("AlertStatus").ToString()=="CRITICAL"?"#991b1b":Eval("AlertStatus").ToString()=="WARNING"?"#854d0e":"#15803d") %>'><%# Eval("AlertStatus") %></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Unit / Lead" ItemStyle-Width="75" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <span style="display:block;font-size:12.5px;font-weight:600;text-align:center;"><%# Eval("Unit") %></span>
                        <span style="display:block;font-size:10px;color:#94a3b8;text-align:center;">LT: <%# Eval("LeadTime") %>d</span>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="" ItemStyle-Width="120">
                    <ItemTemplate>
                        <a href='<%# "../Sparepart/Detail.aspx?id=" + Eval("PartID") %>' class="btn btn-primary btn-sm" style="margin-bottom:3px;">
                            <i class="bi bi-bar-chart-line"></i> Detail
                        </a>
                        <br />
                        <asp:LinkButton ID="lbEdit" runat="server"
                            CommandName="Edit"
                            CommandArgument='<%# Eval("PartID") %>'
                            CssClass="btn btn-secondary btn-sm"><i class="bi bi-pencil"></i> Edit</asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="lbToggle" runat="server"
                            CommandName="Toggle"
                            CommandArgument='<%# Eval("PartID") + "|" + Eval("IsUsing") %>'
                            CssClass='<%# "btn btn-sm " + ((bool)Eval("IsUsing") ? "btn-warning" : "btn-success") %>'
                            OnClientClick="return confirm('Change status?');"
                            style="margin-top:3px;"><%# (bool)Eval("IsUsing") ? "Deactivate" : "Activate" %></asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="lbDelete" runat="server"
                            CommandName="DelPart"
                            CommandArgument='<%# Eval("PartID") %>'
                            CssClass="btn btn-danger btn-sm"
                            OnClientClick="return confirm('Delete this part and ALL history? Cannot be undone.');"
                            style="margin-top:3px;"><i class="fa-solid fa-trash"></i> Del</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <AlternatingRowStyle BackColor="#f8faff" />
        </asp:GridView>
    </div>

    <div style="padding:10px 20px;font-size:12px;color:var(--text-muted);border-top:1px solid var(--border);background:#fafbfc;display:flex;justify-content:space-between;">
        <span>Total: <strong><asp:Literal ID="litCountBottom" runat="server" /></strong> spare parts</span>
        <span>Month: <strong><asp:Literal ID="litMonthLabelBottom" runat="server" /></strong></span>
    </div>

</div>

</section>
</asp:Content>