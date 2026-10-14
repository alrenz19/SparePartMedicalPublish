<%@ Page Title="Output History" Language="C#" MasterPageFile="~/CebuMaster.Master"
    AutoEventWireup="true" CodeBehind="OutputHistory.aspx.cs"
    Inherits="QlyMain.AuditTrailPage.OutputHistory" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <h1>CEBU Spare Part</h1>
    </section>
    <section class="content">
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
                <div class="form-group">
                    <label class="form-label">Spare Part</label>
                    <asp:DropDownList ID="ddlPart" runat="server" CssClass="form-select" Style="width: 200px;">
                        <asp:ListItem Value="0">-- All --</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group" style="align-self: flex-end;">
                    <asp:Button ID="btnExport" runat="server"
                        Text="&#x1F4E5; Export Excel"
                        CssClass="btn btn-success btn-sm"
                        OnClick="BtnExport_Click" CausesValidation="false"
                        Style="margin-left: 8px;" />
                </div>
                <div style="margin-left: auto; align-self: center; font-size: 13px; color: var(--text-muted);">
                    <strong>
                        <asp:Literal ID="litCount" runat="server" /></strong> records
                </div>
            </div>
            <div class="table-wrapper">
                <asp:GridView ID="gvData" runat="server" CssClass="data-table" AutoGenerateColumns="false" EmptyDataText="No records." GridLines="None">
                    <Columns>
                        <asp:TemplateField HeaderText="Output Date" ItemStyle-Width="120">
                            <ItemTemplate><span class="font-mono" style="font-size: 12.5px;"><%# Eval("OutputDate") != null ? ((System.DateTime)Eval("OutputDate")).ToString("dd/MM/yyyy") : "-" %></span></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ItemCode" HeaderText="Item Code" ItemStyle-CssClass="font-mono" ItemStyle-Width="110" />
                        <asp:BoundField DataField="PartName" HeaderText="Part Name" />
                        <asp:BoundField DataField="Model" HeaderText="Model" ItemStyle-CssClass="font-mono" />
                        <asp:BoundField DataField="Unit" HeaderText="Unit" ItemStyle-Width="55" />
                        <asp:TemplateField HeaderText="Qty" ItemStyle-Width="70">
                            <ItemTemplate><span style="font-weight: 700; font-size: 15px; color: #dc2626;">-<%# Eval("Quantity") %></span></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="QuantityInStockBefore" HeaderText="Before" ItemStyle-Width="65" />
                        <asp:BoundField DataField="QuantityInStockAfter" HeaderText="After" ItemStyle-Width="65" />
                        <asp:BoundField DataField="OutputBy" HeaderText="Output By" ItemStyle-Width="100" />
                        <asp:BoundField DataField="PersonReceive" HeaderText="Receive" ItemStyle-Width="100" />
                        <asp:BoundField DataField="StatusUsing" HeaderText="Purpose" ItemStyle-Width="110" />
                        <asp:TemplateField HeaderText="Cost" ItemStyle-Width="110">
                            <ItemTemplate><span class="font-mono" style="font-size: 12px;"><%# Eval("CostDisplay") %></span></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Period" ItemStyle-Width="70">
                            <ItemTemplate><span class="font-mono" style="font-size: 12px;"><%# Eval("Month") %>/<%# Eval("Year") %></span></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Remark" HeaderText="Remark" />
                    </Columns>
                    <AlternatingRowStyle BackColor="#fff8f8" />
                </asp:GridView>
            </div>
        </div>

    </section>
</asp:Content>
