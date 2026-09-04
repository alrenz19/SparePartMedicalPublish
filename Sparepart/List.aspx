<%@ Page Title="Spare Parts" Language="C#" MasterPageFile="~/CebuMaster.Master"
    AutoEventWireup="true" CodeBehind="List.aspx.cs"
    Inherits="QlyMain.Sparepart.List" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Content/css/SparepartListStyle.css" rel="stylesheet" />
    <style>
        /* ── Total Inventory Cost banner ───────────────────────────────── */
        .total-cost-banner {
            display: inline-block;
            border: 2px dashed #dc2626;
            border-radius: 10px;
            padding: 10px 24px;
            text-align: center;
            background: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.07);
            margin-bottom: 14px;
            min-width: 220px;
        }
        .total-cost-banner .tcb-label {
            font-size: 10px;
            font-weight: 800;
            letter-spacing: 1.5px;
            color: #374151;
            text-transform: uppercase;
        }
        .total-cost-banner .tcb-value {
            font-size: 24px;
            font-weight: 900;
            color: #111827;
            margin-top: 3px;
            letter-spacing: -0.5px;
        }
        .total-cost-banner .tcb-sub {
            font-size: 10px;
            color: #6b7280;
            margin-top: 3px;
        }
        .tcb-nodata {
            font-size: 10px;
            color: #d97706;
            margin-top: 3px;
        }

        /* ── Cost column cells ─────────────────────────────────────────── */
        .cost-value {
            font-weight: 700;
            font-size: 13px;
            color: #92400e;
        }
        .cost-break {
            display: block;
            font-size: 10px;
            color: #94a3b8;
            font-weight: 400;
            margin-top: 1px;
        }
        .cost-nil {
            color: #cbd5e1;
            font-size: 13px;
        }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="TopbarActions" runat="server">
    <a href='<%= ResolveUrl("~/Sparepart/Form.aspx") %>' class="btn btn-primary btn-sm">
        <i class="bi bi-plus-lg"></i>Add New
    </a>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="pnlMsg" runat="server" Visible="false">
        <div class="alert" id="divMsg" runat="server" style="margin-bottom: 12px;">
            <asp:Literal ID="litMsg" runat="server" />
        </div>
    </asp:Panel>

    <%-- ═══════════════════════════════════════════════════════════════════════
         TOTAL INVENTORY COST BANNER  (matches the dashed-red box in screenshot)
         ═══════════════════════════════════════════════════════════════════════ --%>
    <div style="display: flex; justify-content: flex-end; margin-bottom: 4px;">
        <div class="total-cost-banner">
            <div class="tcb-label">
                <i class="fa-solid fa-yen-sign" style="color: #dc2626;"></i>
                Total Inventory Cost
            </div>
            <div class="tcb-value">
                <asp:Literal ID="litTotalCost" runat="server" />
            </div>
            <div class="tcb-sub">Total cost of all parts in the INVENTORY SYSTEM</div>
            <%-- Shown only when no parts have a unit cost entered --%>
            <asp:Panel ID="pnlNoCostData" runat="server" Visible="false">
                <div class="tcb-nodata">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                    No unit cost data entered yet
                </div>
            </asp:Panel>
        </div>
    </div>

    <div class="card">

        <div class="filter-bar">
            <div class="form-group">
                <label class="form-label">Search</label>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"
                    placeholder="Name, model, machine/cabinet..." Style="width: 210px;" />
            </div>
            <div class="form-group">
                <label class="form-label">Type</label>
                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-select" Style="width: 130px;">
                    <asp:ListItem Value="">-- All --</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label class="form-label">Supplier</label>
                <asp:DropDownList ID="ddlSupplier" runat="server" CssClass="form-select" Style="width: 140px;">
                    <asp:ListItem Value="">-- All --</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label class="form-label">Process</label>
                <asp:DropDownList ID="ddlProcess" runat="server" CssClass="form-select" Style="width: 140px;">
                    <asp:ListItem Value="">-- All --</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label class="form-label">Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select" Style="width: 100px;">
                    <asp:ListItem Value="active">Active</asp:ListItem>
                    <asp:ListItem Value="all">All</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label class="form-label">Alert</label>
                <asp:DropDownList ID="ddlAlert" runat="server" CssClass="form-select" Style="width: 120px;">
                    <asp:ListItem Value="">-- All --</asp:ListItem>
                    <asp:ListItem Value="CRITICAL">Critical</asp:ListItem>
                    <asp:ListItem Value="WARNING">Warning</asp:ListItem>
                    <asp:ListItem Value="NORMAL">Normal</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group" style="align-self: flex-end;">
                <asp:Button ID="btnSearch" runat="server" Text="Search"
                    CssClass="btn btn-primary" OnClick="BtnSearch_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset"
                    CssClass="btn btn-secondary" OnClick="BtnReset_Click" Style="margin-left: 6px;" />
            </div>

            <%-- Export bar --%>
            <div style="width: 100%; margin-top: 8px; padding: 10px 14px; background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 8px; display: flex; align-items: center; flex-wrap: wrap; gap: 10px;">
                <span style="font-weight: 700; font-size: 13px; color: #1e293b;">
                    <i class="fa-solid fa-file-excel" style="color: #16a34a;"></i> Export Excel
                </span>
                <span style="color: #cbd5e1;">|</span>

                <label style="font-size: 12px; color: #475569; margin: 0;">Year:</label>
                <asp:DropDownList ID="ddlExportYear" runat="server" CssClass="form-select form-select-sm" Style="width: 90px;" />

                <label style="font-size: 12px; color: #475569; margin: 0;">From month:</label>
                <asp:DropDownList ID="ddlExportMonthFrom" runat="server" CssClass="form-select form-select-sm" Style="width: 90px;">
                    <asp:ListItem Value="1"  Text="01 - Jan" />
                    <asp:ListItem Value="2"  Text="02 - Feb" />
                    <asp:ListItem Value="3"  Text="03 - Mar" />
                    <asp:ListItem Value="4"  Text="04 - Apr" />
                    <asp:ListItem Value="5"  Text="05 - May" />
                    <asp:ListItem Value="6"  Text="06 - Jun" />
                    <asp:ListItem Value="7"  Text="07 - Jul" />
                    <asp:ListItem Value="8"  Text="08 - Aug" />
                    <asp:ListItem Value="9"  Text="09 - Sep" />
                    <asp:ListItem Value="10" Text="10 - Oct" />
                    <asp:ListItem Value="11" Text="11 - Nov" />
                    <asp:ListItem Value="12" Text="12 - Dec" />
                </asp:DropDownList>

                <label style="font-size: 12px; color: #475569; margin: 0;">To month:</label>
                <asp:DropDownList ID="ddlExportMonthTo" runat="server" CssClass="form-select form-select-sm" Style="width: 90px;">
                    <asp:ListItem Value="1"  Text="01 - Jan" />
                    <asp:ListItem Value="2"  Text="02 - Feb" />
                    <asp:ListItem Value="3"  Text="03 - Mar" />
                    <asp:ListItem Value="4"  Text="04 - Apr" />
                    <asp:ListItem Value="5"  Text="05 - May" />
                    <asp:ListItem Value="6"  Text="06 - Jun" />
                    <asp:ListItem Value="7"  Text="07 - Jul" />
                    <asp:ListItem Value="8"  Text="08 - Aug" />
                    <asp:ListItem Value="9"  Text="09 - Sep" />
                    <asp:ListItem Value="10" Text="10 - Oct" />
                    <asp:ListItem Value="11" Text="11 - Nov" />
                    <asp:ListItem Value="12" Text="12 - Dec" />
                </asp:DropDownList>

                <asp:Button ID="btnExportAll" runat="server"
                    Text="📥 Export All SP"
                    CssClass="btn btn-success btn-sm"
                    OnClick="BtnExportAll_Click" CausesValidation="false" />
                <asp:Button ID="btnExportExpired" runat="server"
                    Text="⚠️ Below Safety Only"
                    CssClass="btn btn-danger btn-sm"
                    OnClick="BtnExportExpired_Click" CausesValidation="false" />
                <asp:Button ID="btnPrintQr" runat="server"
                    Text="🖨️ Print QR Codes"
                    CssClass="btn btn-primary btn-sm"
                    OnClick="BtnPrintQr_Click" CausesValidation="false" />
                <asp:HiddenField ID="hfQrPrintSelection" runat="server" />
            </div>

            <div style="margin-left: auto; align-self: center; font-size: 13px; color: var(--text-muted);">
                <strong><asp:Literal ID="litCount" runat="server" /></strong> parts &nbsp;|
                <span style="color: #dc2626;">
                    <asp:Literal ID="litCritical" runat="server" /> Critical
                </span>
                &nbsp;
                <span style="color: #d97706;">
                    <asp:Literal ID="litWarning" runat="server" /> Warning
                </span>
            </div>
        </div>

        <div class="month-bar">
            <i class="bi bi-calendar3-week"></i>
            Stats for: <strong><asp:Literal ID="litMonthLabel" runat="server" /></strong>
            &nbsp;|&nbsp;
            <span style="background: #dcfce7; color: #15803d; padding: 2px 8px; border-radius: 4px; font-size: 11px;">IN</span>
            <span style="background: #fee2e2; color: #b91c1c; padding: 2px 8px; border-radius: 4px; font-size: 11px;">OUT</span>
            <span style="background: #dbeafe; color: #1e40af; padding: 2px 8px; border-radius: 4px; font-size: 11px;">STOCK</span>
            <span style="background: #ede9fe; color: #6d28d9; padding: 2px 8px; border-radius: 4px; font-size: 11px;">ORDER</span>
            per row
        </div>

        <div style="display: flex; align-items: center; gap: 16px; padding: 8px 16px; background: #f8fafc; border-bottom: 1px solid var(--border); font-size: 12px; flex-wrap: wrap;">
            <span style="color: #64748b;">Rows:</span>
            <asp:DropDownList ID="ddlPageSize" runat="server"
                Style="width: 80px;" AutoPostBack="true"
                OnSelectedIndexChanged="DdlPageSize_Changed">
                <asp:ListItem Value="10">10</asp:ListItem>
                <asp:ListItem Value="30" Selected="True">30</asp:ListItem>
                <asp:ListItem Value="50">50</asp:ListItem>
                <asp:ListItem Value="100">100</asp:ListItem>
            </asp:DropDownList>
            <span style="margin-left: 8px; color: #64748b;">
                Month <strong><asp:Literal ID="litCurrentMonth" runat="server" /></strong>:
            </span>
            <span style="color: #16a34a; font-weight: 600;">
                <i class="fa-solid fa-arrow-down-to-line"></i>
                IN: <asp:Literal ID="litTotalIn" runat="server" />
            </span>
            <span style="color: #dc2626; font-weight: 600;">
                <i class="fa-solid fa-arrow-up-from-line"></i>
                OUT: <asp:Literal ID="litTotalOut" runat="server" />
            </span>
            <span style="color: #1e40af; font-weight: 600;">
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

                    <%-- QR print selection --%>
                    <asp:TemplateField HeaderText="Select"
                        ItemStyle-Width="42" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input type="checkbox" title="Select all visible rows"
                                onclick="toggleVisibleQrRows(this.checked);" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <input type="checkbox" class="qr-select"
                                value='<%# Eval("PartID") %>'
                                onchange="updateQrPrintSelection(this);" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- Favourite --%>
                    <asp:TemplateField HeaderText="Fav"
                        ItemStyle-Width="36" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbFav" runat="server"
                                CommandName="Fav"
                                CommandArgument='<%# Eval("PartID") + "|" + Eval("Favourite") %>'
                                CssClass="fav-btn"
                                ToolTip="Toggle Favourite"><%# (bool)Eval("Favourite") ? "&#9733;" : "&#9734;" %></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- QR code --%>
                    <asp:TemplateField HeaderText="QR"
                        ItemStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Image ID="imgPartQr" runat="server"
                                ImageUrl='<%# GetQrCodeDataUrl(Container.DataItem) %>'
                                AlternateText="Spare part QR code"
                                ToolTip="Spare part QR code"
                                Style="width:45px; height:45px; object-fit:contain;" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- Image --%>
                    <asp:TemplateField HeaderText="Image"
                        ItemStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Image ID="imgPart" runat="server"
                                ImageUrl='<%# GetImageUrl(Eval("PictureURL")) %>'
                                CssClass="part-image"
                                AlternateText='<%# Eval("PartName") %>'
                                ToolTip='<%# "Click to view " + Eval("PartName") %>'
                                Style="width: 45px; height: 45px; object-fit: cover; border-radius: 6px; cursor: pointer; border: 1px solid #e2e8f0;" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- Spare Part --%>
                    <asp:TemplateField HeaderText="Spare Part">
                        <ItemTemplate>
                            <span class="part-main"><%# Eval("PartName") %></span>
                            <span class="part-sub">
                                <span class="font-mono"><%# Eval("Model") %></span>
                                &nbsp;&middot;&nbsp;<%# Eval("Maker") %>
                                &nbsp;&middot;&nbsp;<span style="color: #2563eb;"><%# Eval("TypeSP") %></span>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- Machine / Cabinet --%>
                    <asp:TemplateField HeaderText="Machine / Cabinet" ItemStyle-Width="150">
                        <ItemTemplate>
                            <span style="display: block; font-size: 12px;"><%# Eval("ListCodeMachine") %></span>
                            <span class="part-sub" style="font-family: 'IBM Plex Mono',monospace;"><%# Eval("PositionSave") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- Process --%>
                    <asp:TemplateField HeaderText="Process" ItemStyle-Width="120">
                        <ItemTemplate>
                            <span style="display: block; font-size: 12px; font-weight: 500; color: #475569;">
                                <i class="bi bi-diagram-3"></i> <%# Eval("ProcessName") %>
                            </span>
                            <span class="part-sub" style="font-size: 10px; color: #94a3b8;">
                                Code: <%# Eval("ProcessCode") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- This Month badges --%>
                    <asp:TemplateField HeaderText="This Month" ItemStyle-Width="220">
                        <ItemTemplate>
                            <span class="month-strip">
                                <a href='<%# "../Stock/StockIn.aspx?partid=" + Eval("PartID") %>'
                                   class='<%# "mbadge mb-in" + ((int)Eval("MonthInput")==0?" mb-zero":"") %>'
                                   title="Stock IN for this part" style="text-decoration: none;">
                                    <span class="val"><%# Eval("MonthInput") %></span>
                                    <span class="lbl">IN</span>
                                </a>
                                <a href='<%# "../Stock/StockOut.aspx?partid=" + Eval("PartID") %>'
                                   class='<%# "mbadge mb-out" + ((int)Eval("MonthOutput")==0?" mb-zero":"") %>'
                                   title="Stock OUT for this part" style="text-decoration: none;">
                                    <span class="val"><%# Eval("MonthOutput") %></span>
                                    <span class="lbl">OUT</span>
                                </a>
                                <span class='<%# "mbadge mb-stock" + (Eval("AlertStatus").ToString()=="CRITICAL"?" crit":Eval("AlertStatus").ToString()=="WARNING"?" warn":"") %>'
                                      title="Current stock">
                                    <span class="val"><%# Eval("QtyStock") %></span>
                                    <span class="lbl">STOCK</span>
                                </span>
                                <a href='<%# "../Order/Create.aspx?partid=" + Eval("PartID") %>'
                                   class='<%# "mbadge mb-order" + ((int)Eval("MonthOrderQty")==0?" mb-zero":"") %>'
                                   title="Create Order for this part" style="text-decoration: none;">
                                    <span class="val"><%# Eval("MonthOrderQty") %></span>
                                    <span class="lbl">ORDER</span>
                                </a>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- Safety --%>
                    <asp:TemplateField HeaderText="Safety"
                        ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <span style="display: block; font-size: 11px; color: #64748b; text-align: center;">
                                Min <strong style="color: #dc2626;"><%# Eval("SafetyStock") %></strong>
                                <br />
                                <span style="font-size: 10px; color: #94a3b8;">Warn <%# Eval("SafetyStockShow") %></span>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- Alert pill --%>
                    <asp:TemplateField HeaderText="Alert"
                        ItemStyle-Width="90" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblAlert" runat="server"
                                CssClass="alert-pill"
                                Style='<%# "background:" + (Eval("AlertStatus").ToString()=="CRITICAL"?"#fee2e2":Eval("AlertStatus").ToString()=="WARNING"?"#fef9c3":"#dcfce7") + ";color:" + (Eval("AlertStatus").ToString()=="CRITICAL"?"#991b1b":Eval("AlertStatus").ToString()=="WARNING"?"#854d0e":"#15803d") %>'><%# Eval("AlertStatus") %></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- ═══════════════════════════════════════════════════════
                         COST COLUMN  —  Cost per piece × QtyStock
                         ═══════════════════════════════════════════════════════ --%>
                    <asp:TemplateField HeaderText="Cost"
                        ItemStyle-Width="130"
                        ItemStyle-HorizontalAlign="Right"
                        HeaderStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <%# Eval("InventoryCostDisplay").ToString() == "—"
                                ? "<span class=\"cost-nil\">—</span>"
                                : "<span class=\"cost-value\">" + Eval("InventoryCostDisplay") + "</span>" %>
                            <span class="cost-break"><%# Eval("CostPerPieceDisplay") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- Unit / Lead --%>
                    <asp:TemplateField HeaderText="Unit / Lead"
                        ItemStyle-Width="75" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <span style="display: block; font-size: 12.5px; font-weight: 600; text-align: center;"><%# Eval("Unit") %></span>
                            <span style="display: block; font-size: 10px; color: #94a3b8; text-align: center;">LT: <%# Eval("LeadTime") %>d</span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- Actions dropdown --%>
                    <asp:TemplateField HeaderText="" ItemStyle-Width="120">
                        <ItemTemplate>
                            <div class="dropdown">
                                <button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">
                                    <i class="bi bi-gear"></i>
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href='<%# "../Sparepart/Detail.aspx?id=" + Eval("PartID") %>' class="btnDetail">
                                            <i class="bi bi-bar-chart-line"></i> Detail
                                        </a>
                                    </li>
                                    <li>
                                        <asp:LinkButton ID="lbEdit" runat="server"
                                            CommandName="Edit" CssClass="btnEdit"
                                            CommandArgument='<%# Eval("PartID") %>'>
                                            <i class="bi bi-pencil"></i> Edit
                                        </asp:LinkButton>
                                    </li>
                                    <li>
                                        <asp:LinkButton ID="lbToggle" runat="server"
                                            CommandName="Toggle"
                                            CommandArgument='<%# Eval("PartID") + "|" + Eval("IsUsing") %>'
                                            CssClass='<%# ((bool)Eval("IsUsing") ? "alert-warning" : "alert-success") %>'
                                            OnClientClick="return confirm('Change status?');"><%# (bool)Eval("IsUsing") ? "Deactivate" : "Activate" %></asp:LinkButton>
                                    </li>
                                    <li>
                                        <asp:LinkButton ID="lbDelete" runat="server"
                                            CommandName="DelPart" CssClass="btnDelete"
                                            CommandArgument='<%# Eval("PartID") %>'
                                            OnClientClick="return confirm('Delete this part and ALL history? Cannot be undone.');">
                                            <i class="bi bi-trash3"></i> Del
                                        </asp:LinkButton>
                                    </li>
                                </ul>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <AlternatingRowStyle BackColor="#f8faff" />
            </asp:GridView>
        </div>
        <script type="text/javascript">
            (function () {
                var hiddenId = '<%= hfQrPrintSelection.ClientID %>';
                function selectedIds() {
                    var hidden = document.getElementById(hiddenId);
                    return hidden && hidden.value ? hidden.value.split(',').filter(function (id) { return id; }) : [];
                }
                window.updateQrPrintSelection = function (checkbox) {
                    var ids = selectedIds();
                    if (checkbox.checked && ids.indexOf(checkbox.value) === -1) ids.push(checkbox.value);
                    if (!checkbox.checked) ids = ids.filter(function (id) { return id !== checkbox.value; });
                    document.getElementById(hiddenId).value = ids.join(',');
                };
                window.toggleVisibleQrRows = function (checked) {
                    var checkboxes = document.querySelectorAll('.qr-select');
                    for (var i = 0; i < checkboxes.length; i++) {
                        checkboxes[i].checked = checked;
                        updateQrPrintSelection(checkboxes[i]);
                    }
                };
                var ids = selectedIds();
                var checkboxes = document.querySelectorAll('.qr-select');
                for (var i = 0; i < checkboxes.length; i++)
                    checkboxes[i].checked = ids.indexOf(checkboxes[i].value) !== -1;
            }());
        </script>

        <%-- Footer bar — shows part count + total cost + month --%>
        <div style="padding: 10px 20px; font-size: 12px; color: var(--text-muted); border-top: 1px solid var(--border); background: #fafbfc; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 8px;">
            <span>
                Total: <strong><asp:Literal ID="litCountBottom" runat="server" /></strong> spare parts
            </span>
            <span style="font-weight: 700; color: #92400e;">
                <i class="fa-solid fa-yen-sign"></i>
                Inventory Cost: <asp:Literal ID="litTotalCostBottom" runat="server" />
            </span>
            <span>
                Month: <strong><asp:Literal ID="litMonthLabelBottom" runat="server" /></strong>
            </span>
        </div>
    </div>

    <%-- Image Modal --%>
    <div id="imageModal" class="modal" style="display: none; position: fixed; z-index: 9999; padding-top: 50px; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0,0,0,0.92);">
        <span class="close" style="position: absolute; top: 15px; right: 35px; color: #f1f1f1; font-size: 40px; font-weight: bold; cursor: pointer; transition: 0.3s;">&times;</span>
        <img class="modal-content" id="modalImage" style="margin: auto; display: block; width: 80%; max-width: 800px; max-height: 80vh; object-fit: contain; border-radius: 8px; box-shadow: 0 0 20px rgba(0,0,0,0.3);" />
        <div id="caption" style="margin: auto; display: block; width: 80%; max-width: 700px; text-align: center; color: #ccc; padding: 10px 0; font-size: 16px;"></div>
    </div>

    <script type="text/javascript">
        function bindImageClickEvents() {
            var images = document.querySelectorAll('.part-image');
            for (var i = 0; i < images.length; i++) {
                images[i].onclick = function () {
                    showImageModal(this.src, this.alt);
                };
            }
        }

        function showImageModal(imageUrl, partName) {
            var modal = document.getElementById('imageModal');
            var modalImg = document.getElementById('modalImage');
            var captionEl = document.getElementById('caption');
            if (!modal || !modalImg) return;

            modal.style.display = "block";
            modalImg.src = imageUrl;
            captionEl.innerHTML = partName;

            var span = document.getElementsByClassName("close")[0];
            if (span) {
                span.onclick = function () { modal.style.display = "none"; };
            }

            modal.onclick = function (event) {
                if (event.target == modal) modal.style.display = "none";
            };

            document.onkeydown = function (event) {
                if (event.key === "Escape" && modal.style.display === "block")
                    modal.style.display = "none";
            };
        }

        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', bindImageClickEvents);
        } else {
            bindImageClickEvents();
        }

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm) {
            prm.add_endRequest(function () { bindImageClickEvents(); });
        }
    </script>
</asp:Content>
