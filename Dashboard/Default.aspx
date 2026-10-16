<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/CebuMaster.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="QlyMain.Dashboard.Default" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <%= QlyMain.Common.AssetHelper.Css("~/Content/css/SparepartDefaultStyle.css") %>
</asp:Content>

<asp:Content ContentPlaceHolderID="Scripts" runat="server">
    <script type="text/javascript">
        // Ensure dashboard images are lazy-loaded and decoded asynchronously for faster paint.
        (function(){
            try {
                document.addEventListener('DOMContentLoaded', function(){
                    var container = document.querySelector('.kpi-grid') || document.body;
                    var imgs = container.querySelectorAll('img');
                    imgs.forEach(function(img){
                        try { img.setAttribute('loading', 'lazy'); } catch(e){}
                        try { img.setAttribute('decoding', 'async'); } catch(e){}
                    });
                });
            } catch(e) { /* fail silently */ }
        })();
    </script>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <%-- KPI Cards --%>
    <div class="kpi-grid">
        <div class="kpi-card" style="--kpi-color: #2563eb; --kpi-bg: rgba(37,99,235,.1);">
            <div class="kpi-icon"><i class="fa-solid fa-screwdriver-wrench"></i></div>
            <div class="kpi-value"><%: VM.TotalParts %></div>
            <div class="kpi-label">Total Spare Parts</div>
        </div>
        <div class="kpi-card" style="--kpi-color: #dc2626; --kpi-bg: rgba(220,38,38,.1); cursor: pointer;" onclick="switchTab('crit')">
            <div class="kpi-icon"><i class="fa-solid fa-triangle-exclamation"></i></div>
            <div class="kpi-value"><%: VM.CriticalAlerts %></div>
            <div class="kpi-label">Below Safety Level</div>
        </div>
        <div class="kpi-card" style="--kpi-color: #d97706; --kpi-bg: rgba(217,119,6,.1); cursor: pointer;" onclick="switchTab('warn')">
            <div class="kpi-icon"><i class="fa-solid fa-circle-exclamation"></i></div>
            <div class="kpi-value"><%: VM.WarningAlerts %></div>
            <div class="kpi-label">Warning</div>
        </div>
        <div class="kpi-card" style="--kpi-color: #16a34a; --kpi-bg: rgba(22,163,74,.1);">
            <div class="kpi-icon"><i class="fa-solid fa-arrow-down-to-line"></i></div>
            <div class="kpi-value"><%: VM.MonthlyInput %></div>
            <div class="kpi-label">Input This Month</div>
        </div>
        <div class="kpi-card" style="--kpi-color: #0891b2; --kpi-bg: rgba(8,145,178,.1);">
            <div class="kpi-icon"><i class="fa-solid fa-arrow-up-from-line"></i></div>
            <div class="kpi-value"><%: VM.MonthlyOutput %></div>
            <div class="kpi-label">Output This Month</div>
        </div>
        <div class="kpi-card" style="--kpi-color: #7c3aed; --kpi-bg: rgba(124,58,237,.1);">
            <div class="kpi-icon"><i class="fa-solid fa-clipboard-list"></i></div>
            <div class="kpi-value"><%: VM.PendingOrders %></div>
            <div class="kpi-label">Pending Orders</div>
        </div>
    </div>

    <div style="display: grid; grid-template-columns: 1.6fr 1fr; gap: 20px; margin-bottom: 20px;">

        <div class="card">
            <div class="card-header" style="padding-bottom: 0;">
                <span class="card-title">
                    <i class="fa-solid fa-triangle-exclamation" style="color: #dc2626;"></i>
                    Safety Stock Alerts
                </span>
                <a href='<%= ResolveUrl("~/Sparepart/List.aspx") %>' class="btn btn-secondary btn-sm">View List</a>
            </div>

            <div class="summary-strip">
                <div class="sum-cell">
                    <div class="sv" style="color: #dc2626;">
                        <asp:Literal ID="litCriticalCount" runat="server" />
                    </div>
                    <div class="sl">Critical</div>
                </div>
                <div class="sum-cell">
                    <div class="sv" style="color: #d97706;">
                        <asp:Literal ID="litWarningCount" runat="server" />
                    </div>
                    <div class="sl">Warning</div>
                </div>
                <div class="sum-cell">
                    <div class="sv" style="color: #2563eb;">
                        <asp:Literal ID="litAlertTotal" runat="server" />
                    </div>
                    <div class="sl">Total</div>
                </div>
            </div>

            <div class="alert-tab-bar" style="padding: 0 12px;">
                <button class="alert-tab crit active" id="tabCrit" onclick="switchTab('crit')">
                    <i class="fa-solid fa-circle" style="font-size: 9px;"></i>
                    Critical
       
                    <span class="tab-badge"><span>
                        <asp:Literal ID="litCriticalCount2" runat="server" /></span></span>
                </button>
                <button class="alert-tab warn" id="tabWarn" onclick="switchTab('warn')">
                    <i class="fa-solid fa-circle" style="font-size: 9px; color: #d97706;"></i>
                    Warning
       
                    <span class="tab-badge"><span>
                        <asp:Literal ID="litWarningCount2" runat="server" /></span></span>
                </button>
                <button class="alert-tab all" id="tabAll" onclick="switchTab('all')">
                    <i class="fa-solid fa-list"></i>
                    All
       
                    <span class="tab-badge"><span>
                        <asp:Literal ID="litAlertTotal2" runat="server" /></span></span>
                </button>
            </div>

            <%-- Tab: Critical --%>
            <div id="panelCrit" class="table-wrapper" style="max-height: 400px; overflow-y: auto;">
                <asp:Panel ID="pnlNoCritical" runat="server">
                    <div style="padding: 24px; text-align: center; color: #16a34a;">
                        <i class="fa-solid fa-circle-check fa-2x"></i>
                        <div style="margin-top: 8px; font-size: 13px;">No parts below safety level</div>
                    </div>
                </asp:Panel>
                <asp:Repeater ID="rptCritical" runat="server">
                    <HeaderTemplate>
                        <table class="data-table" style="width: 100%;">
                            <thead>
                                <tr>
                                    <th style="width: 110px;">Code</th>
                                    <th>Part Name</th>
                                    <th style="width: 90px; text-align: center;">Stock / Min</th>
                                    <th style="width: 70px;">IN/Month</th>
                                    <th style="width: 150px;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="alert-row-crit">
                            <td>
                                <span style="font-family: monospace; font-size: 12px; font-weight: 600;"><%# Eval("ItemCode") %></span>
                                <span style="display: block; font-size: 10px; color: #94a3b8;"><%# Eval("PositionSave") %></span>
                            </td>
                            <td>
                                <span style="font-weight: 600; font-size: 13px;"><%# Eval("PartName") %></span>
                                <span style="display: block; font-size: 11px; color: #94a3b8;"><%# Eval("Maker") %> &bull; <%# Eval("Supplier") %></span>
                                <span style="display: block; font-size: 11px; color: #64748b;"><%# Eval("ListCodeMachine") %></span>
                            </td>
                            <td style="text-align: center;">
                                <span style="font-size: 18px; font-weight: 700; color: #dc2626;"><%# Eval("QtyStock") %></span>
                                <span style="display: block; font-size: 11px; color: #64748b;">min: <%# Eval("SafetyStock") %></span>
                                <span class="stock-bar-wrap" style="display: block; margin: 4px auto 0;">
                                    <span class="stock-bar-bg" style="display: block;">
                                        <span class="stock-bar-fill" style="display: block; background: #dc2626;"
                                            data-pct="<%# Math.Min(100, (int)Eval("QtyStock") > 0 && (int)Eval("SafetyStock") > 0 ? (int)Math.Round((double)(int)Eval("QtyStock") / (int)Eval("SafetyStock") * 100) : 0) %>"></span>
                                    </span>
                                </span>
                            </td>
                            <td style="text-align: center;">
                                <span style="display: block; font-size: 11px; color: #16a34a; font-weight: 600;">+<%# Eval("MonthInput") %></span>
                                <span style="display: block; font-size: 11px; color: #dc2626; font-weight: 600;">-<%# Eval("MonthOutput") %></span>
                            </td>
                            <td>
                                <span style="display: inline-flex; flex-wrap: wrap; gap: 3px;">
                                    <a href='<%# ResolveUrl("~/Sparepart/Detail.aspx") + "?id=" + Eval("PartID") %>' class="act-btn act-dtl"><i class="fa-solid fa-chart-bar"></i>Detail</a>
                                    <a href='<%# ResolveUrl("~/Stock/StockIn.aspx") + "?partid=" + Eval("PartID") %>' class="act-btn act-in"><i class="fa-solid fa-arrow-down-to-line"></i>IN</a>
                                    <a href='<%# ResolveUrl("~/Order/Create.aspx") + "?partid=" + Eval("PartID") %>' class="act-btn act-ord"><i class="fa-solid fa-clipboard-list"></i>Order</a>
                                </span>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate></tbody></table></FooterTemplate>
                </asp:Repeater>
            </div>

            <%-- Tab: Warning --%>
            <div id="panelWarn" class="table-wrapper" style="max-height: 400px; overflow-y: auto; display: none;">
                <asp:Panel ID="pnlNoWarning" runat="server">
                    <div style="padding: 24px; text-align: center; color: #16a34a;">
                        <i class="fa-solid fa-circle-check fa-2x"></i>
                        <div style="margin-top: 8px; font-size: 13px;">No warnings</div>
                    </div>
                </asp:Panel>
                <asp:Repeater ID="rptWarning" runat="server">
                    <HeaderTemplate>
                        <table class="data-table" style="width: 100%;">
                            <thead>
                                <tr>
                                    <th style="width: 110px;">Code</th>
                                    <th>Part Name</th>
                                    <th style="width: 90px; text-align: center;">Stock / Min</th>
                                    <th style="width: 70px;">IN/Month</th>
                                    <th style="width: 150px;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="alert-row-warn">
                            <td>
                                <span style="font-family: monospace; font-size: 12px; font-weight: 600;"><%# Eval("ItemCode") %></span>
                                <span style="display: block; font-size: 10px; color: #94a3b8;"><%# Eval("PositionSave") %></span>
                            </td>
                            <td>
                                <span style="font-weight: 600; font-size: 13px;"><%# Eval("PartName") %></span>
                                <span style="display: block; font-size: 11px; color: #94a3b8;"><%# Eval("Maker") %> &bull; <%# Eval("Supplier") %></span>
                                <span style="display: block; font-size: 11px; color: #64748b;"><%# Eval("ListCodeMachine") %></span>
                            </td>
                            <td style="text-align: center;">
                                <span style="font-size: 18px; font-weight: 700; color: #d97706;"><%# Eval("QtyStock") %></span>
                                <span style="display: block; font-size: 11px; color: #64748b;">min: <%# Eval("SafetyStock") %></span>
                                <span class="stock-bar-wrap" style="display: block; margin: 4px auto 0;">
                                    <span class="stock-bar-bg" style="display: block;">
                                        <span class="stock-bar-fill" style="display: block; background: #d97706;"
                                            data-pct="<%# Math.Min(100, (int)Eval("SafetyStock") > 0 ? (int)Math.Round((double)(int)Eval("QtyStock") / (int)Eval("SafetyStock") * 100) : 100 )%>"></span>
                                    </span>
                                </span>
                            </td>
                            <td style="text-align: center;">
                                <span style="display: block; font-size: 11px; color: #16a34a; font-weight: 600;">+<%# Eval("MonthInput") %></span>
                                <span style="display: block; font-size: 11px; color: #dc2626; font-weight: 600;">-<%# Eval("MonthOutput") %></span>
                            </td>
                            <td>
                                <span style="display: inline-flex; flex-wrap: wrap; gap: 3px;">
                                    <a href='<%# ResolveUrl("~/Sparepart/Detail.aspx") + "?id=" + Eval("PartID") %>' class="act-btn act-dtl"><i class="fa-solid fa-chart-bar"></i>Detail</a>
                                    <a href='<%# ResolveUrl("~/Stock/StockIn.aspx") + "?partid=" + Eval("PartID") %>' class="act-btn act-in"><i class="fa-solid fa-arrow-down-to-line"></i>IN</a>
                                    <a href='<%# ResolveUrl("~/Order/Create.aspx") + "?partid=" + Eval("PartID") %>' class="act-btn act-ord"><i class="fa-solid fa-clipboard-list"></i>Order</a>
                                </span>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate></tbody></table></FooterTemplate>
                </asp:Repeater>
            </div>

            <%-- Tab: All --%>
            <div id="panelAll" class="table-wrapper" style="max-height: 400px; overflow-y: auto; display: none;">
                <asp:Repeater ID="rptAlerts" runat="server">
                    <HeaderTemplate>
                        <table class="data-table" style="width: 100%;">
                            <thead>
                                <tr>
                                    <th style="width: 110px;">Code</th>
                                    <th>Part Name</th>
                                    <th style="width: 90px; text-align: center;">Stock / Min</th>
                                    <th style="width: 60px; text-align: center;">Level</th>
                                    <th style="width: 70px;">IN/Month</th>
                                    <th style="width: 150px;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class='<%# Eval("AlertStatus").ToString()=="CRITICAL"?"alert-row-crit":"alert-row-warn" %>'>
                            <td>
                                <span style="font-family: monospace; font-size: 12px; font-weight: 600;"><%# Eval("ItemCode") %></span>
                                <span style="display: block; font-size: 10px; color: #94a3b8;"><%# Eval("PositionSave") %></span>
                            </td>
                            <td>
                                <span style="font-weight: 600; font-size: 13px;"><%# Eval("PartName") %></span>
                                <span style="display: block; font-size: 11px; color: #94a3b8;"><%# Eval("Maker") %> &bull; <%# Eval("Supplier") %></span>
                            </td>
                            <td style="text-align: center;">
                                <span style="font-size: 18px; font-weight: 700; color: <%# (Eval("AlertStatus")+"")=="CRITICAL" ? "#dc2626" : "#d97706" %>"><%# Eval("QtyStock") %></span>
                                <span style="display: block; font-size: 11px; color: #64748b;">/ <%# Eval("SafetyStock") %></span>
                            </td>
                            <td style="text-align: center;">
                                <span class='badge <%# Eval("AlertStatus").ToString()=="CRITICAL"?"badge-out":"" %>'
                                    style='<%# Eval("AlertStatus").ToString()=="CRITICAL"?"": "background:#fef9c3;color:#854d0e;" %>'>
                                    <%# Eval("AlertStatus").ToString()=="CRITICAL"?"Critical":"Warning" %>
                                </span>
                            </td>
                            <td style="text-align: center;">
                                <span style="display: block; font-size: 11px; color: #16a34a; font-weight: 600;">+<%# Eval("MonthInput") %></span>
                                <span style="display: block; font-size: 11px; color: #dc2626; font-weight: 600;">-<%# Eval("MonthOutput") %></span>
                            </td>
                            <td>
                                <span style="display: inline-flex; flex-wrap: wrap; gap: 3px;">
                                    <a href='<%# ResolveUrl("~/Sparepart/Detail.aspx") + "?id=" + Eval("PartID") %>' class="act-btn act-dtl"><i class="fa-solid fa-chart-bar"></i>Detail</a>
                                    <a href='<%# ResolveUrl("~/Stock/StockIn.aspx") + "?partid=" + Eval("PartID") %>' class="act-btn act-in"><i class="fa-solid fa-arrow-down-to-line"></i>IN</a>
                                    <a href='<%# ResolveUrl("~/Order/Create.aspx") + "?partid=" + Eval("PartID") %>' class="act-btn act-ord"><i class="fa-solid fa-clipboard-list"></i>Order</a>
                                </span>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate></tbody></table></FooterTemplate>
                </asp:Repeater>
                <asp:Panel ID="pnlNoAlert" runat="server">
                    <div style="padding: 24px; text-align: center; color: #16a34a;">
                        <i class="fa-solid fa-circle-check fa-2x"></i>
                        <div style="margin-top: 8px; font-size: 13px;">No stock alerts</div>
                    </div>
                </asp:Panel>
            </div>
        </div>

        <div style="display: flex; flex-direction: column; gap: 16px;">

            <div class="card" style="flex: 1;">
                <div class="card-header">
                    <span class="card-title"><i class="fa-solid fa-arrows-rotate"></i>Recent Transactions</span>
                </div>
                <div style="display: grid; grid-template-columns: 1fr 1fr; max-height: 260px;">
                    <div style="border-right: 1px solid var(--border); overflow-y: auto;">
                        <div style="padding: 7px 12px; font-size: 11px; font-weight: 700; color: #16a34a; background: #f8fafc; border-bottom: 1px solid var(--border);">
                            <i class="fa-solid fa-arrow-down-to-line"></i>Recent IN
         
                        </div>
                        <asp:Repeater ID="rptIn" runat="server">
                            <ItemTemplate>
                                <span style="display: block; padding: 7px 12px; border-bottom: 1px solid #f0f4f8; font-size: 12px;">
                                    <span style="display: block; font-weight: 600;"><%# Eval("PartName") %></span>
                                    <span style="display: block;"><span style="color: #16a34a; font-weight: 700;">+<%# Eval("Quantity") %></span> &middot; <span style="font-family: monospace; font-size: 11px;"><%# Eval("ItemCode") %></span></span>
                                    <span style="display: block; color: #94a3b8; font-size: 11px;"><%# Eval("CreatedBy") %> &middot; <%# Eval("InputDate") != null ? ((System.DateTime)Eval("InputDate")).ToString("dd/MM HH:mm") : "" %></span>
                                </span>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div style="overflow-y: auto;">
                        <div style="padding: 7px 12px; font-size: 11px; font-weight: 700; color: #dc2626; background: #f8fafc; border-bottom: 1px solid var(--border);">
                            <i class="fa-solid fa-arrow-up-from-line"></i>Recent OUT
         
                        </div>
                        <asp:Repeater ID="rptOut" runat="server">
                            <ItemTemplate>
                                <span style="display: block; padding: 7px 12px; border-bottom: 1px solid #f0f4f8; font-size: 12px;">
                                    <span style="display: block; font-weight: 600;"><%# Eval("PartName") %></span>
                                    <span style="display: block;"><span style="color: #dc2626; font-weight: 700;">-<%# Eval("Quantity") %></span> &middot; <span style="font-family: monospace; font-size: 11px;"><%# Eval("ItemCode") %></span></span>
                                    <span style="display: block; color: #94a3b8; font-size: 11px;"><%# Eval("OutputBy") %> &rarr; <%# Eval("PersonReceive") %></span>
                                </span>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header"><span class="card-title"><i class="fa-solid fa-bolt"></i>Quick Actions</span></div>
                <div class="card-body">
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 8px;">
                        <a href='<%= ResolveUrl("~/Sparepart/Form.aspx") %>' class="btn btn-primary" style="justify-content: center;">
                            <i class="fa-solid fa-plus"></i>Add Spare Part
                        </a>
                        <a href='<%= ResolveUrl("~/Stock/StockIn.aspx") %>' class="btn btn-success" style="justify-content: center;">
                            <i class="fa-solid fa-arrow-down-to-line"></i>Stock IN
                        </a>
                        <a href='<%= ResolveUrl("~/Stock/StockOut.aspx") %>' class="btn btn-warning" style="justify-content: center;">
                            <i class="fa-solid fa-arrow-up-from-line"></i>Stock OUT
                        </a>
                        <a href='<%= ResolveUrl("~/Order/Create.aspx") %>' class="btn btn-secondary" style="justify-content: center;">
                            <i class="fa-solid fa-clipboard-plus"></i>New Order
                        </a>
                        <a href='<%= ResolveUrl("~/Order/List.aspx?status=Pending") %>'
                            class="btn" style="background: #f5f3ff; color: #6d28d9; border: 1px solid #ddd6fe; justify-content: center; grid-column: span 2;">
                            <i class="fa-solid fa-hourglass-half"></i>View Pending Orders
           
                            <% if (VM.PendingOrders > 0)
                                { %>
                            <span style="background: #7c3aed; color: #fff; border-radius: 10px; padding: 1px 7px; font-size: 11px; margin-left: 4px;"><%: VM.PendingOrders %></span>
                            <% } %>
                        </a>
                            <!-- TEST BUTTON - Add this line -->
<%--    <asp:Button ID="btnTestStockAlert" 
                runat="server" 
                Text="📧 Test Stock Alert" 
                OnClick="btnTestStockAlert_Click"
                CssClass="btn"
                Style="background: #fee2e2; color: #dc2626; border: 1px solid #fecaca; justify-content: center; cursor: pointer;" />--%>
                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>

<asp:Content ContentPlaceHolderID="ScriptContent" runat="server">
    <script>
        // Use arguments to avoid parameter implicit-any diagnostics
        var switchTab = function () {
            var tab = arguments.length ? String(arguments[0]) : '';
            var pc = document.getElementById('panelCrit'); if (pc && pc instanceof HTMLElement) pc.style.display = tab === 'crit' ? '' : 'none';
            var pw = document.getElementById('panelWarn'); if (pw && pw instanceof HTMLElement) pw.style.display = tab === 'warn' ? '' : 'none';
            var pa = document.getElementById('panelAll');  if (pa && pa instanceof HTMLElement) pa.style.display = tab === 'all' ? '' : 'none';
            ['Crit', 'Warn', 'All'].forEach(function (t) {
                var btn = document.getElementById('tab' + t);
                if (btn && btn instanceof HTMLElement) btn.classList.toggle('active', t.toLowerCase() === tab);
            });
        };
        // Apply progress bar widths from data-pct
        function applyBarWidths() {
            Array.prototype.slice.call(document.querySelectorAll('.stock-bar-fill[data-pct]')).forEach(function (el) {
                var pct = el.getAttribute('data-pct');
                if (!pct) return;
                // Ensure we operate on HTMLElement to access style
                if (el instanceof HTMLElement) el.style.width = pct + '%';
            });
        }
        document.addEventListener('DOMContentLoaded', function () {
            switchTab();
            applyBarWidths();
        });
    </script>
</asp:Content>
