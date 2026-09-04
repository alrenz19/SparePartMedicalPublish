<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AutoFindAndUploadData.aspx.cs" Inherits="QlyMain.Admin.AutoFindAndUploadData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel runat="server" ID="pnThongbao">
        <asp:Label ID="lblThongbao" runat="server" Font-Bold="true" />
    </asp:Panel>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <asp:LinkButton Text="-Auto find and upload into data-" CssClass="btn-info btn" runat="server" ID="btnAuto" OnClick="btnAuto_Click" />
            </div>
        </div>
    </div>
</asp:Content>
