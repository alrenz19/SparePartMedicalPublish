<%@ Page Title="Add/Edit User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="QlyMain.UsersPage.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <section class="content">
      <div class="row"> 
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">
                            <asp:Label ID="lblTitle" runat="server" Text="Add New User"></asp:Label>
                        </h4>
                        <div class="card-tools">
                            <asp:LinkButton ID="btnBack" runat="server" CssClass="btn btn-secondary btn-sm" OnClick="btnBack_Click">
                                <i class="fa fa-arrow-left me-1"></i>Back
                            </asp:LinkButton>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="row mb-3">
                                    <label class="col-md-3 col-form-label">
                                        User Code <span class="text-danger">*</span>
                                    </label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtUserCode" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvUserCode" runat="server" 
                                            ControlToValidate="txtUserCode" 
                                            ErrorMessage="Please enter user code" 
                                            CssClass="text-danger" 
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="cvUserCode" runat="server" 
                                            ControlToValidate="txtUserCode" 
                                            ErrorMessage="User code already exists" 
                                            CssClass="text-danger" 
                                            Display="Dynamic"
                                            OnServerValidate="cvUserCode_ServerValidate"></asp:CustomValidator>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-3 col-form-label">
                                        Username <span class="text-danger">*</span>
                                    </label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" 
                                            ControlToValidate="txtUserName" 
                                            ErrorMessage="Please enter username" 
                                            CssClass="text-danger" 
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-3 col-form-label">
                                        Full Name <span class="text-danger">*</span>
                                    </label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" MaxLength="200"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server" 
                                            ControlToValidate="txtFullName" 
                                            ErrorMessage="Please enter full name" 
                                            CssClass="text-danger" 
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-3 col-form-label">
                                        Password <span class="text-danger">*</span>
                                    </label>
                                    <div class="col-md-9">
                                        <div class="input-group">
                                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" MaxLength="100"></asp:TextBox>
                                            <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('txtPassword')">
                                                <i class="fa fa-eye" id="togglePasswordIcon"></i>
                                            </button>
                                        </div>
                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                            ControlToValidate="txtPassword" 
                                            ErrorMessage="Please enter password" 
                                            CssClass="text-danger" 
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                        <small class="text-muted">Password must be at least 6 characters</small>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-3 col-form-label">Email</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" MaxLength="200" TextMode="Email"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                            ControlToValidate="txtEmail" 
                                            ErrorMessage="Invalid email format" 
                                            ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                                            CssClass="text-danger" 
                                            Display="Dynamic"></asp:RegularExpressionValidator>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-3 col-form-label">
                                        Department <span class="text-danger">*</span>
                                    </label>
                                    <div class="col-md-9">
                                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-select">
                                            <asp:ListItem Value="">-- Select Department --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvDepartment" runat="server" 
                                            ControlToValidate="ddlDepartment" 
                                            ErrorMessage="Please select department" 
                                            CssClass="text-danger" 
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-3 col-form-label">Email Display Name</label>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtNameMail" runat="server" CssClass="form-control" MaxLength="200"></asp:TextBox>
                                        <small class="text-muted">Display name when sending emails</small>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-3 col-form-label">Role</label>
                                    <div class="col-md-9">
                                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-select">
                                            <asp:ListItem Value="">-- Select Role --</asp:ListItem>
                                            <asp:ListItem Value="1">Admin</asp:ListItem>
                                            <asp:ListItem Value="2">User</asp:ListItem>
                                            <asp:ListItem Value="3">Manager</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <label class="col-md-3 col-form-label">Status</label>
                                    <div class="col-md-9">
                                        <div class="form-check form-switch">
                                            <asp:CheckBox ID="chkUserStatus" runat="server" CssClass="form-check-input" Checked="true" />
                                            <label class="form-check-label">Active</label>
                                        </div>
                                    </div>
                                </div>

                                <!-- Digital Signature Upload -->
                                <div class="row mb-3">
                                    <label class="col-md-3 col-form-label">Digital Signature</label>
                                    <div class="col-md-9">
                                        <asp:FileUpload ID="fuImageSignature" runat="server" CssClass="form-control" />
                                        <small class="text-muted">Only image files accepted (.jpg, .png, .gif) - Maximum size 2MB</small>
                                        <asp:Panel ID="pnlCurrentImage" runat="server" Visible="false" CssClass="mt-2">
                                            <label class="form-label">Current Signature:</label><br />
                                            <asp:Image ID="imgCurrentSignature" runat="server" CssClass="img-thumbnail" style="max-width: 200px; max-height: 100px;" />
                                            <br />
                                            <asp:LinkButton ID="btnRemoveImage" runat="server" CssClass="btn btn-sm btn-outline-danger mt-2" OnClick="btnRemoveImage_Click">
                                                <i class="fa fa-trash"></i> Remove Image
                                            </asp:LinkButton>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </div>

                            <!-- Sidebar Information -->
                            <div class="col-md-4">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <h6 class="card-title">System Information</h6>
                                        
                                        <asp:Panel ID="pnlSystemInfo" runat="server" Visible="false">
                                            <div class="mb-2">
                                                <small class="text-muted">Created Date:</small><br />
                                                <asp:Label ID="lblCreateDate" runat="server" CssClass="fw-bold"></asp:Label>
                                            </div>
                                            
                                            <div class="mb-2">
                                                <small class="text-muted">Last Login:</small><br />
                                                <asp:Label ID="lblLastLoginDate" runat="server" CssClass="fw-bold"></asp:Label>
                                            </div>

                                            <div class="mb-2">
                                                <small class="text-muted">User ID:</small><br />
                                                <asp:Label ID="lblUserId" runat="server" CssClass="fw-bold"></asp:Label>
                                            </div>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlNewUserInfo" runat="server">
                                            <div class="alert alert-info">
                                                <i class="fa fa-info-circle me-2"></i>
                                                Creating new user. System information will be automatically updated after saving.
                                            </div>
                                        </asp:Panel>

                                        <div class="mt-3">
                                            <h6>Password Requirements:</h6>
                                            <ul class="small text-muted">
                                                <li>Minimum 6 characters</li>
                                                <li>Should contain uppercase and lowercase letters</li>
                                                <li>Should contain numbers and special characters</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card-footer text-end">
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary me-2" 
                            OnClick="btnCancel_Click" CausesValidation="false" />
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script type="text/javascript">
        function togglePassword(textboxId) {
            var textbox = document.getElementById('<%= txtPassword.ClientID %>');
            var icon = document.getElementById('togglePasswordIcon');

            if (textbox.type === 'password') {
                textbox.type = 'text';
                icon.className = 'fa fa-eye-slash';
            } else {
                textbox.type = 'password';
                icon.className = 'fa fa-eye';
            }
        }

        // File upload validation
        function validateFileUpload() {
            var fileUpload = document.getElementById('<%= fuImageSignature.ClientID %>');
            if (fileUpload.files.length > 0) {
                var file = fileUpload.files[0];
                var maxSize = 2 * 1024 * 1024; // 2MB
                var allowedTypes = ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'];

                if (file.size > maxSize) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'File size cannot exceed 2MB!'
                    });
                    fileUpload.value = '';
                    return false;
                }

                if (!allowedTypes.includes(file.type)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Only image files accepted (.jpg, .png, .gif)!'
                    });
                    fileUpload.value = '';
                    return false;
                }
            }
            return true;
        }

        // Attach validation event for file upload
        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('<%= fuImageSignature.ClientID %>').addEventListener('change', validateFileUpload);
        });

        // Auto generate UserCode from FullName (optional)
        function generateUserCode() {
            var fullName = document.getElementById('<%= txtFullName.ClientID %>').value;
            var userCode = document.getElementById('<%= txtUserCode.ClientID %>');
            
            if (fullName && !userCode.value) {
                // Generate user code from name (e.g., Nguyen Van A -> NVA)
                var names = fullName.split(' ');
                var code = '';
                names.forEach(function(name) {
                    if (name) code += name.charAt(0).toUpperCase();
                });
                
                // Add random number to avoid duplicates
                code += Math.floor(Math.random() * 1000);
                userCode.value = code;
            }
        }

        // Auto generate UserCode when blur from FullName
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('<%= txtFullName.ClientID %>').addEventListener('blur', generateUserCode);
        });
    </script>
</asp:Content>