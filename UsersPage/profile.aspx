<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="profile.aspx.cs" Inherits="QlyMain.UsersPage.Profile" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3>User Profile</h3>
            </div>
            <div class="panel-body">
                <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                <asp:Literal ID="LiteralThongBao" runat="server"></asp:Literal>
                
                <!-- Profile Picture Section -->
                <div class="form-group text-center">
                    <asp:Image ID="imgProfile" runat="server" CssClass="img-circle" Width="150" Height="150" 
                        ImageUrl="~/Content/dist/img/avatar5.png" />
                    <br />
                    <asp:FileUpload ID="fuProfilePicture" runat="server" CssClass="btn btn-default" />
                    <asp:Button ID="btnUploadPicture" runat="server" Text="Upload Picture" 
                        OnClick="btnUploadPicture_Click" CssClass="btn btn-info btn-sm" 
                        CausesValidation="false" />
                </div>
                
                <hr />
                
                <!-- User Details Display -->
                <div class="form-group">
                    <label>Full Name:</label>
                    <asp:Label ID="litFullName" runat="server" CssClass="form-control-static" />
                </div>
                
                <div class="form-group">
                    <label>Email:</label>
                    <asp:Label ID="litEmail" runat="server" CssClass="form-control-static" />
                </div>
                
                <div class="form-group">
                    <label>User Code:</label>
                    <asp:Label ID="litUserCode" runat="server" CssClass="form-control-static" />
                </div>
                
                <!-- Department Dropdown Section -->
                <div class="form-group">
                    <label>Department:</label>
                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control" 
                        DataTextField="DepartmentName" DataValueField="DepartmentID" AppendDataBoundItems="true">
                        <asp:ListItem Text="-- Select Department --" Value=""></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnUpdateDepartment" runat="server" Text="Update Department" 
                        OnClick="btnUpdateDepartment_Click" CssClass="btn btn-primary btn-sm" 
                        Style="margin-top: 5px;" CausesValidation="false" />
                </div>
                
                <hr />
                
                <!-- Change Username Section -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>Change Username</h4>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label>Current Username:</label>
                            <asp:Label ID="litCurrentUsername" runat="server" CssClass="form-control-static" />
                        </div>
                        <div class="form-group">
                            <label>New Username:</label>
                            <asp:TextBox ID="txtNewUsername" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                                ControlToValidate="txtNewUsername" ErrorMessage="Username is required" 
                                CssClass="text-danger" Display="Dynamic"
                                ValidationGroup="UsernameGroup" />
                        </div>
                        <asp:Button ID="btnChangeUsername" runat="server" Text="Change Username" 
                            OnClick="btnChangeUsername_Click" CssClass="btn btn-warning"
                            ValidationGroup="UsernameGroup"
                            OnClientClick="return confirm('Are you sure you want to change your username?');" />
                    </div>
                </div>
                
                <!-- Change Password Section -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>Change Password</h4>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label>Current Password:</label>
                            <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvCurrentPassword" runat="server" 
                                ControlToValidate="txtCurrentPassword" ErrorMessage="Current password is required" 
                                CssClass="text-danger" Display="Dynamic"
                                ValidationGroup="PasswordGroup" />
                        </div>
                        <div class="form-group">
                            <label>New Password:</label>
                            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" 
                                ControlToValidate="txtNewPassword" ErrorMessage="New password is required" 
                                CssClass="text-danger" Display="Dynamic"
                                ValidationGroup="PasswordGroup" />
                            <asp:RegularExpressionValidator ID="revPassword" runat="server" 
                                ControlToValidate="txtNewPassword" 
                                ErrorMessage="Password must be at least 6 characters" 
                                ValidationExpression="^.{6,}$" CssClass="text-danger" Display="Dynamic"
                                ValidationGroup="PasswordGroup" />
                        </div>
                        <div class="form-group">
                            <label>Confirm New Password:</label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" 
                                ControlToValidate="txtConfirmPassword" ErrorMessage="Please confirm your password" 
                                CssClass="text-danger" Display="Dynamic"
                                ValidationGroup="PasswordGroup" />
                            <asp:CompareValidator ID="cvPassword" runat="server" 
                                ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword" 
                                ErrorMessage="Passwords do not match" CssClass="text-danger" Display="Dynamic"
                                ValidationGroup="PasswordGroup" />
                        </div>
                        <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" 
                            OnClick="btnChangePassword_Click" CssClass="btn btn-warning"
                            ValidationGroup="PasswordGroup"
                            OnClientClick="return confirm('Are you sure you want to change your password?');" />
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <asp:Button ID="btnCancel" runat="server" Text="Back" OnClick="btnCancel_Click" CssClass="btn btn-default" 
                    CausesValidation="false" />
            </div>
        </div>
    </div>
</asp:Content>
