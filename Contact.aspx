<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="QlyMaint.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DataList ID="ddCodeMachine" runat="server" RepeatColumns="3" CellPadding="10"
        ForeColor="#333333" RepeatDirection="Horizontal" CellSpacing="10" Width="100%"
        OnItemCommand="ddCodeMachine_ItemCommand">
        <AlternatingItemStyle BackColor="White" />
        <ItemTemplate>
            <asp:Panel ID="pnLabel1" runat="server" CssClass="col-md-12" Width="100%">
                <div class="col-sm-6 col-md-6 col-lg-6 hoverBtn">
                    <asp:Panel runat="server" CssClass="box-shadow" Width="220px" Height="300px">
                        <h3 style="text-align: center; color: steelblue">Machine</h3>
                        <h4 class="bg-danger">
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("CodeMachine") %>'></asp:Label>
                        </h4>
                        <asp:LinkButton CommandName="lbkCodeMachine" CssClass="alert-success" ID="lbkManunal" Width="80%" runat="server" Text="Manunal" />
                        <br />
                        <br />
                        <asp:LinkButton runat="server" CssClass="alert-info" CommandName="lbkHistory" ID="lbkHistory" Width="80%" Text="History" />
                        <br />
                        <br />
                        <asp:LinkButton runat="server" CssClass="alert-success" ID="lbkSOP" Width="80%" Text="SOP" />
                        <br />
                        <br />
                        <asp:LinkButton runat="server" CssClass="alert-info" ID="lbkPlan" Width="80%" Text="Plan" />
                        <br />
                        <br />
                        <asp:LinkButton runat="server" CssClass="alert-success" ID="lbkCheckSheet" Width="80%" Text="Check Sheet" />

                    </asp:Panel>
                </div>
            </asp:Panel>
        </ItemTemplate>
        <ItemStyle Wrap="true" />
    </asp:DataList>
</asp:Content>
