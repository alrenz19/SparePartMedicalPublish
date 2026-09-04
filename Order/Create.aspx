<%@ Page Title="New Order" Language="C#" MasterPageFile="~/CebuMaster.Master"
    AutoEventWireup="true" CodeBehind="Create.aspx.cs"
    Inherits="QlyMain.Order.CreateOrder" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlMsg" runat="server" Visible="false">
        <div class="alert" id="divMsg" runat="server" style="margin-bottom: 16px;">
            <asp:Literal ID="litMsg" runat="server" /></div>
    </asp:Panel>
    <div style="max-width: 520px;">
        <div class="card">
            <div class="card-header"><span class="card-title"><i class="fa-solid fa-clipboard-list"></i>Create Order Request</span></div>
            <div class="card-body">
                <div class="form-group">
                    <label class="form-label">Spare Part *</label>
                    <asp:DropDownList ID="ddlPart" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="DdlPart_Changed" />
                </div>
                <asp:Panel ID="pnlInfo" runat="server" Visible="false">
                    <div style="background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; margin-bottom: 14px; display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 12px; font-size: 13px;">
                        <div>
                            <div style="font-size: 11px; color: #64748b;">Current Stock</div>
                            <div style="font-size: 20px; font-weight: 700;">
                                <asp:Literal ID="litStock" runat="server" /></div>
                        </div>
                        <div>
                            <div style="font-size: 11px; color: #64748b;">Safety Stock</div>
                            <div style="font-size: 20px; font-weight: 700;">
                                <asp:Literal ID="litSafety" runat="server" /></div>
                        </div>
                        <div>
                            <div style="font-size: 11px; color: #64748b;">Suggested</div>
                            <div style="font-size: 20px; font-weight: 700; color: #2563eb;">
                                <asp:Literal ID="litSuggest" runat="server" /></div>
                        </div>
                    </div>
                </asp:Panel>
                <div class="form-group">
                    <label class="form-label">Order Quantity *</label>
                    <asp:TextBox ID="txtOrderQty" runat="server" CssClass="form-control" TextMode="Number" Text="1" Style="font-size: 20px; font-weight: 700; text-align: center;" />
                    <asp:RangeValidator ControlToValidate="txtOrderQty" runat="server" MinimumValue="1" MaximumValue="99999" Type="Integer" ErrorMessage="Must be ≥ 1" ForeColor="Red" Display="Dynamic" Font-Size="11px" />
                </div>
                <div style="display: flex; gap: 10px; margin-top: 10px;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Order" CssClass="btn btn-primary" Style="flex: 1; padding: 10px;" OnClick="BtnSubmit_Click" />
                    <asp:HyperLink NavigateUrl="~/Order/List.aspx" CssClass="btn btn-secondary" runat="server">Cancel</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
