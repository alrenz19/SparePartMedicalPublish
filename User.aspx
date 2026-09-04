<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="QlyMain.User1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top: 10%">
        <div class="row">
            <div class="col-sm-1 col-md-1 col-lg-1">
            </div>
            <div class="col-sm-10 col-md-10 col-lg-10">
                <asp:ImageButton ImageUrl="imageurl" ID="imgUser" CssClass="ImgbRadius"  Width="100" Height="100" runat="server" />
            </div>
            <div class="col-sm-1 col-md-1 col-lg-1">
            </div>
        </div>
    </div>
</asp:Content>
