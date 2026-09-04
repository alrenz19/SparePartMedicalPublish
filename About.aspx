<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="QlyMaint.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label Text="" ID="txtMess" Font-Bold="true" runat="server" />
    <div class="container">
        <div>
            <table class="table">
                <tr>
                    <td>UserCode
                        <asp:TextBox runat="server" ID="txtUserCode" CssClass="form-control" />
                    </td>
                </tr>
                <tr>
                    <td>UserName
                        <asp:TextBox runat="server" ID="txtUserName" CssClass="form-control" />
                    </td>
                </tr>
                <tr>
                    <td>Password
                        <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" />
                    </td>
                </tr>
                <tr>
                    <td>FullName
                        <asp:TextBox runat="server" ID="txtFullName" CssClass="form-control" />
                    </td>
                </tr>
                <tr>
                    <td>ImageSignature
                        <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                </tr>
                <tr>
                    <td>CreateDate
                        <asp:TextBox runat="server" ID="txtCreateDate" CssClass="form-control" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton Text="Save" CssClass="btn btn-default" runat="server" OnClick="Unnamed2_Click" /></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
