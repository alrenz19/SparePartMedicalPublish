<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucLogin.ascx.cs" Inherits="QlyMain.Admin.ucLogin" %>
<asp:Label Text="" ID="lblThongbao" runat="server" />
<asp:TextBox ID="txtUsername" placeholder="User Name" runat="server"></asp:TextBox><br />
<asp:TextBox ID="txtPassword"  placeholder="Password" runat="server" TextMode="Password"></asp:TextBox><br />
<asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />