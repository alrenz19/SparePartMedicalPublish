<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="QlyMain.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

       <div style="text-align: center; margin-top: 100px;">
       <h1>An Error Occurred</h1>
       <p class="form-error"><%= Session["ErrorMessage"] %></p>
       <p>Please contact support for assistance.</p>
       <p><a href="Default.aspx">Go back to the home page</a> or <a href="Log.aspx">Logout for try again</a></p>
            <h1>An error occurred</h1>
           <p>1. Please <a href="Log.aspx">Log in</a> and do it again.</p>
           <p>2. Contact your leader.</p>
           <p>3. Contact IT team.</p>
   </div>

</asp:Content>
