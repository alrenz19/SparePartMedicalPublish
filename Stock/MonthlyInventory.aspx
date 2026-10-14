<%@ Page Title="Monthly Inventory" Language="C#" MasterPageFile="~/CebuMaster.Master"
    AutoEventWireup="true" CodeBehind="MonthlyInventory.aspx.cs"
    Inherits="QlyMain.Stock.MonthlyInventory" %>

<asp:Content ContentPlaceHolderID="TopbarActions" runat="server">
    <asp:Button ID="btnExport" runat="server" Text="Export .xlsx" CssClass="btn btn-success btn-sm" OnClick="BtnExport_Click" CausesValidation="false" />
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlMsg" runat="server" Visible="false" CssClass="alert alert-warning">
        <asp:Literal ID="litMsg" runat="server" />
    </asp:Panel>

    <div class="kpi-grid">
        <div class="kpi-card" style="--kpi-color: #2563eb; --kpi-bg: rgba(37,99,235,.1);">
            <div class="kpi-icon"><i class="bi bi-clipboard-check"></i></div>
            <div class="kpi-value"><asp:Literal ID="litChecked" runat="server" /></div>
            <div class="kpi-label">Parts Checked</div>
        </div>
        <div class="kpi-card" style="--kpi-color: #16a34a; --kpi-bg: rgba(22,163,74,.1);">
            <div class="kpi-icon"><i class="bi bi-check2-circle"></i></div>
            <div class="kpi-value"><asp:Literal ID="litMatch" runat="server" /></div>
            <div class="kpi-label">Match</div>
        </div>
        <div class="kpi-card" style="--kpi-color: #dc2626; --kpi-bg: rgba(220,38,38,.1);">
            <div class="kpi-icon"><i class="bi bi-exclamation-triangle"></i></div>
            <div class="kpi-value"><asp:Literal ID="litDisc" runat="server" /></div>
            <div class="kpi-label">Discrepancy</div>
        </div>
        <div class="kpi-card" style="--kpi-color: #7c3aed; --kpi-bg: rgba(124,58,237,.1);">
            <div class="kpi-icon"><i class="bi bi-plus-slash-minus"></i></div>
            <div class="kpi-value"><asp:Literal ID="litTotalDiff" runat="server" /></div>
            <div class="kpi-label">Total Difference</div>
        </div>
        <div class="kpi-card" style="--kpi-color: #d97706; --kpi-bg: rgba(217,119,6,.1);">
            <div class="kpi-icon"><i class="bi bi-hourglass-split"></i></div>
            <div class="kpi-value"><asp:Literal ID="litNotChecked" runat="server" /></div>
            <div class="kpi-label">Not Checked</div>
        </div>
    </div>

    <div class="card">
        <div class="filter-bar">
            <div class="form-group">
                <label class="form-label">From</label>
                <asp:TextBox ID="txtFrom" runat="server" CssClass="form-control" TextMode="Date" Style="width: 150px;" />
            </div>
            <div class="form-group">
                <label class="form-label">To</label>
                <asp:TextBox ID="txtTo" runat="server" CssClass="form-control" TextMode="Date" Style="width: 150px;" />
            </div>
            <div class="form-group">
                <label class="form-label">Process</label>
                <asp:DropDownList ID="ddlProcess" runat="server" CssClass="form-select" Style="width: 150px;" />
            </div>
            <div class="form-group">
                <label class="form-label">Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select" Style="width: 140px;">
                    <asp:ListItem Value="">All checks</asp:ListItem>
                    <asp:ListItem Value="Match">Match</asp:ListItem>
                    <asp:ListItem Value="Discrepancy">Discrepancy</asp:ListItem>
                    <asp:ListItem Value="Not checked">Not checked</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label class="form-label">Keyword</label>
                <asp:TextBox ID="txtKeyword" runat="server" CssClass="form-control" placeholder="Name / code / model" Style="width: 180px;" />
            </div>
            <div class="form-group" style="align-self: flex-end;">
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="BtnSearch_Click" />
            </div>
            <div style="margin-left: auto; align-self: center; font-size: 13px; color: var(--text-muted);">
                <strong><asp:Literal ID="litCount" runat="server" /></strong> rows
            </div>
        </div>
        <div class="table-wrapper">
            <asp:GridView ID="gvData" runat="server" CssClass="data-table" AutoGenerateColumns="false"
                EmptyDataText="No inventory records for this filter." GridLines="None"
                OnRowDataBound="GvData_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="CheckedDate" HeaderText="Checked Date" DataFormatString="{0:dd/MM/yyyy HH:mm}" ItemStyle-Width="130" />
                    <asp:BoundField DataField="ItemCode" HeaderText="Item Code" ItemStyle-CssClass="font-mono" ItemStyle-Width="110" />
                    <asp:BoundField DataField="PartName" HeaderText="Part Name" />
                    <asp:BoundField DataField="Model" HeaderText="Model" ItemStyle-CssClass="font-mono" />
                    <asp:BoundField DataField="ProcessName" HeaderText="Process" />
                    <asp:BoundField DataField="SystemQty" HeaderText="System Qty" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="ActualQty" HeaderText="Actual Qty" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Difference" HeaderText="Difference" DataFormatString="{0:+#;-#;0}" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="100" />
                    <asp:BoundField DataField="CheckedBy" HeaderText="By" ItemStyle-Width="80" />
                </Columns>
                <AlternatingRowStyle BackColor="#f8faff" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
