<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InforSparePart.ascx.cs" Inherits="QlyMain.ucControl.InforSparePart" %>
<style type="text/css">
    .auto-style1 {
        width: 157px;
    }

    .auto-style2 {
        width: 800px;
    }

    .auto-style4 {
        width: 399px;
    }

    .font-weight-bold {
        font-weight: bold;
    }

    .auto-style5 {
        width: 204px;
    }

    .auto-style6 {
        width: 186px;
    }
</style>
<asp:Panel ID="Panel1" runat="server" GroupingText="Spare Part Infor">
    <div class="row">
        <div class="col-md-6">
            <table class="table">
                <tr>
                    <td class="auto-style1" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">Position:</td>
                    <td class="auto-style6" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                        <asp:Label ID="txtPosition" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style1" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">Spare part name<br />
                        (Tên linh kiện):</td>
                    <td class="auto-style6" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                        <asp:Label ID="txtPartName" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style1" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">Maker:</td>
                    <td class="auto-style6" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                        <asp:Label ID="txtMaker" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style1" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">Model:</td>
                    <td class="auto-style6" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                        <asp:Label ID="txtModel" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style1" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">Item code:</td>
                    <td class="auto-style6" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                        <asp:Label ID="txtItemcode" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style1" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">Safety stock:</td>
                    <td class="auto-style6" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                        <asp:Label ID="txtSafety" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style1" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">Leadtime<br />
                        (Days):</td>
                    <td class="auto-style6" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                        <asp:Label ID="txtLeadtime" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style1" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">MOQ/SPQ:</td>
                    <td class="auto-style6" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                        <asp:Label ID="txtMOQ" runat="server" CssClass="font-weight-bold"></asp:Label></td>
                </tr>
            </table>
        </div>
        <div class="col-md-6">
            <table class="table">
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style6">
                        <asp:Label ID="txtPartID" runat="server" Visible="False"></asp:Label></td>
                    <td rowspan="13" class="auto-style4" style="vertical-align: top">
                        <asp:Image ID="Image1" runat="server"  Width="400px" CssClass="imgPart" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Panel>
