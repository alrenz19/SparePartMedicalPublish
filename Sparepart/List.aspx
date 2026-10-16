<%@ Page Title="Spare Parts" Language="C#" MasterPageFile="~/CebuMaster.Master"
    AutoEventWireup="true" CodeBehind="List.aspx.cs" MaintainScrollPositionOnPostback="true"
    Inherits="QlyMain.Sparepart.List" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <%= QlyMain.Common.AssetHelper.Css("~/Content/css/SparepartListStyle.css") %>
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
        /* ── Monthly inventory column ─────────────────────────────────── */
        .inv-last { font-size: 11px; font-weight: 700; margin-bottom: 4px; }
        .inv-last.match { color: #15803d; }
        .inv-last.disc { color: #b91c1c; }
        .inv-last small { display: block; font-weight: 400; color: #94a3b8; }
        .inv-select { font-size: 12px; padding: 2px 4px; height: auto; }
        .inv-disc { display: none; gap: 4px; margin-top: 4px; }
        .inv-disc input { width: 70px; font-size: 12px; padding: 2px 4px; height: auto; }
        .export-bar { width:100%; margin-top:8px; padding:8px; background:#f8fafc; border:1px solid #e2e8f0; border-radius:6px; display:flex; gap:8px; align-items:center; }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="TopbarActions" runat="server">
    <a href='<%= ResolveUrl("~/Sparepart/Form.aspx") %>' class="btn btn-primary btn-sm">
        <i class="bi bi-plus-lg"></i>Add New
    </a>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="pnlMsg" runat="server" Visible="false">
        <div class="alert" id="divMsg" runat="server" style="margin-bottom:12px;">
            <asp:Literal ID="litMsg" runat="server"></asp:Literal>
        </div>
    </asp:Panel>

    <div class="card">

        <div class="filter-bar">
            <div class="form-group">
                <label class="form-label">Search</label>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Name, model, machine/cabinet..." Style="width:210px;"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="form-label">Type</label>
                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-select" Style="width:130px;"></asp:DropDownList>
            </div>

            <div class="export-bar">
                <span style="font-weight:700;font-size:13px;color:#1e293b;">Export Excel</span>
                <label style="font-size:12px;color:#475569;margin:0 4px 0 12px;">Year:</label>
                <asp:DropDownList ID="ddlExportYear" runat="server" CssClass="form-select form-select-sm" Style="width:90px;"></asp:DropDownList>
                <label style="font-size:12px;color:#475569;margin:0 4px 0 12px;">From:</label>
                <asp:DropDownList ID="ddlExportMonthFrom" runat="server" CssClass="form-select form-select-sm" Style="width:90px;">
                    <asp:ListItem Value="1">01 - Jan</asp:ListItem>
                    <asp:ListItem Value="2">02 - Feb</asp:ListItem>
                    <asp:ListItem Value="3">03 - Mar</asp:ListItem>
                    <asp:ListItem Value="4">04 - Apr</asp:ListItem>
                    <asp:ListItem Value="5">05 - May</asp:ListItem>
                    <asp:ListItem Value="6">06 - Jun</asp:ListItem>
                    <asp:ListItem Value="7">07 - Jul</asp:ListItem>
                    <asp:ListItem Value="8">08 - Aug</asp:ListItem>
                    <asp:ListItem Value="9">09 - Sep</asp:ListItem>
                    <asp:ListItem Value="10">10 - Oct</asp:ListItem>
                    <asp:ListItem Value="11">11 - Nov</asp:ListItem>
                    <asp:ListItem Value="12">12 - Dec</asp:ListItem>
                </asp:DropDownList>
                <label style="font-size:12px;color:#475569;margin:0 4px 0 12px;">To:</label>
                <asp:DropDownList ID="ddlExportMonthTo" runat="server" CssClass="form-select form-select-sm" Style="width:90px;">
                    <asp:ListItem Value="1">01 - Jan</asp:ListItem>
                    <asp:ListItem Value="2">02 - Feb</asp:ListItem>
                    <asp:ListItem Value="3">03 - Mar</asp:ListItem>
                    <asp:ListItem Value="4">04 - Apr</asp:ListItem>
                    <asp:ListItem Value="5">05 - May</asp:ListItem>
                    <asp:ListItem Value="6">06 - Jun</asp:ListItem>
                    <asp:ListItem Value="7">07 - Jul</asp:ListItem>
                    <asp:ListItem Value="8">08 - Aug</asp:ListItem>
                    <asp:ListItem Value="9">09 - Sep</asp:ListItem>
                    <asp:ListItem Value="10">10 - Oct</asp:ListItem>
                    <asp:ListItem Value="11">11 - Nov</asp:ListItem>
                    <asp:ListItem Value="12">12 - Dec</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnExportAll" runat="server" Text="Export All" CssClass="btn btn-success btn-sm" OnClick="BtnExportAll_Click"></asp:Button>
            </div>

        </div>

        <div class="month-bar">
            <i class="bi bi-calendar3-week"></i>
            Stats for: <strong><asp:Literal ID="litMonthLabel" runat="server"></asp:Literal></strong>
            &nbsp;|&nbsp;
            <span style="background:#dcfce7;color:#15803d;padding:2px 8px;border-radius:4px;font-size:11px;">IN</span>
            <span style="background:#fee2e2;color:#b91c1c;padding:2px 8px;border-radius:4px;font-size:11px;">OUT</span>
            <span style="background:#dbeafe;color:#1e40af;padding:2px 8px;border-radius:4px;font-size:11px;">STOCK</span>
            per row
        </div>

        <div style="padding:12px;">
            <asp:GridView ID="gvParts" runat="server" AutoGenerateColumns="false" CssClass="table" OnRowCommand="GvParts_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <img src='<%# SafePictureUrl(Eval("PictureURL")) %>' alt='<%# Eval("PartName") %>' style="width:45px;height:45px;object-fit:cover;border-radius:6px;border:1px solid #e2e8f0;" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PartName" HeaderText="Spare Part" />
                    <asp:BoundField DataField="ListCodeMachine" HeaderText="Machine / Cabinet" />
                    <asp:TemplateField HeaderText="This Month">
                        <ItemTemplate>
                            <span class='<%# GetMonthBadgeClass("mbadge mb-in", Eval("MonthInput")) %>'><%# Eval("MonthInput") %> IN</span>
                            <span class='<%# GetMonthBadgeClass("mbadge mb-out", Eval("MonthOutput")) %>'><%# Eval("MonthOutput") %> OUT</span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Alert">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("AlertStatus") %>' Style='<%# GetAlertStyle(Eval("AlertStatus")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

    </div>
</asp:Content>
