<%@ Page Title="Monthly Stock" Language="C#" MasterPageFile="~/CebuMaster.Master"
    AutoEventWireup="true" CodeBehind="MonthlyStock.aspx.cs"
    Inherits="QlyMain.Stock.MonthlyStock" %>

<asp:Content ContentPlaceHolderID="TopbarActions" runat="server">
    <asp:Button ID="btnExport" runat="server" Text="Export CSV" CssClass="btn btn-secondary btn-sm" OnClick="BtnExport_Click" CausesValidation="false" />
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <div class="filter-bar">
            <div class="form-group">
                <label class="form-label">Month</label>
                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-select" Style="width: 120px;">
                    <asp:ListItem Value="">All</asp:ListItem>
                    <asp:ListItem Value="1">Jan</asp:ListItem>
                    <asp:ListItem Value="2">Feb</asp:ListItem>
                    <asp:ListItem Value="3">Mar</asp:ListItem>
                    <asp:ListItem Value="4">Apr</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">Jun</asp:ListItem>
                    <asp:ListItem Value="7">Jul</asp:ListItem>
                    <asp:ListItem Value="8">Aug</asp:ListItem>
                    <asp:ListItem Value="9">Sep</asp:ListItem>
                    <asp:ListItem Value="10">Oct</asp:ListItem>
                    <asp:ListItem Value="11">Nov</asp:ListItem>
                    <asp:ListItem Value="12">Dec</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label class="form-label">Year</label>
                <asp:TextBox ID="txtYear" runat="server" CssClass="form-control" TextMode="Number" Style="width: 90px;" />
            </div>
            <div class="form-group">
                <label class="form-label">Spare Part</label>
                <asp:DropDownList ID="ddlPart" runat="server" CssClass="form-select" Style="width: 200px;">
                    <asp:ListItem Value="0">-- All --</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group" style="align-self: flex-end;">
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="BtnSearch_Click" />
            </div>
            <div style="margin-left: auto; align-self: center; font-size: 13px; color: var(--text-muted);">
                <strong>
                    <asp:Literal ID="litCount" runat="server" /></strong> records
            </div>
        </div>
        <div class="table-wrapper">
            <asp:GridView ID="gvData" runat="server" CssClass="data-table" AutoGenerateColumns="false" EmptyDataText="No data." GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="Period" ItemStyle-Width="80">
                        <ItemTemplate><span class="font-mono fw-600"><%# Eval("MonthLabel") %></span></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ItemCode" HeaderText="Item Code" ItemStyle-CssClass="font-mono" ItemStyle-Width="110" />
                    <asp:BoundField DataField="PartName" HeaderText="Part Name" />
                    <asp:TemplateField HeaderText="IN" ItemStyle-Width="70">
                        <ItemTemplate><span style="color: #16a34a; font-weight: 700;"><%# Eval("QtyInput") %></span></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OUT" ItemStyle-Width="70">
                        <ItemTemplate><span style="color: #dc2626; font-weight: 700;"><%# Eval("QtyOutput") %></span></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Stock" ItemStyle-Width="80">
                        <ItemTemplate><span style="font-weight: 700; font-size: 15px;"><%# Eval("QtyStock") %></span></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="QtyStockOld" HeaderText="Old" ItemStyle-Width="70" />
                    <asp:BoundField DataField="QtyStockNew" HeaderText="New" ItemStyle-Width="70" />
                    <asp:BoundField DataField="OrderQty" HeaderText="OrderQty" ItemStyle-Width="80" />
                    <asp:BoundField DataField="OrderStatus" HeaderText="OrdStatus" />
                    <asp:BoundField DataField="GapInput" HeaderText="Gap" ItemStyle-Width="60" />
                    <asp:BoundField DataField="TotalOrderOfMonth" HeaderText="TotalOrd" ItemStyle-Width="80" />
                </Columns>
                <AlternatingRowStyle BackColor="#f8faff" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
