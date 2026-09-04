<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucLoadSapCode.ascx.cs" Inherits="QlyMain.MachinePage.ucLoadSapCode" %>


<asp:CheckBox ID="cbIsAcc" runat="server" Text="Tài sản cố định " OnCheckedChanged="cbIsAcc_CheckedChanged" AutoPostBack="true" />
<div class="input-group">
    <span class="input-group-addon">
        <asp:Label Text="Chọn mã kế toán " Visible="false" ID="lblSapCode" runat="server" />
    </span>
    <asp:DropDownList ID="ddlSapCode" Visible="false" runat="server" CssClass="selectMachineGroup bg-aqua form-control" Width="150px"></asp:DropDownList>
    <asp:Label Text="" ForeColor="Red" ID="lblListSapCodes" runat="server" />
</div>
