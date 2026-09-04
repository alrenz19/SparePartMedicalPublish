<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSparepartRepairByMachine.ascx.cs" Inherits="QlyMain.ucControl.ucSparepartRepairByMachine" %>
<asp:GridView ID="gvListSP" runat="server" AutoGenerateColumns="False"
    CssClass="table table-bordered table-condensed"
    EmptyDataText="No data"
    EmptyDataRowStyle-HorizontalAlign="Center">
    <Columns>
        <asp:TemplateField HeaderText="S.No">
            <ItemTemplate>
                <%#  (Container.DataItemIndex + 1) %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Sparepart">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Partname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Model">
            <ItemTemplate>
                <asp:Label ID="LblModel" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Request No">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLinkRequestNo" runat="server" Font-Bold="true"
                    NavigateUrl='<%# String.Format("~/MachineRepair/RepairRequestss/Details.aspx?RequestID={0}&RequestNo={1}",Eval("RequestID"), Eval("RequestNo")) %>'
                    Text='<%# Bind("RequestNo") %>'> 
                </asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Qty">
            <ItemTemplate>
                <asp:Label ID="LblQtyOuput" runat="server" Text='<%# Bind("QtyOutput") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Create Date">
            <ItemTemplate>
                <asp:Label ID="lblCreateDate" runat="server" Text='<%# Bind("CreateDate") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>
</asp:GridView>
