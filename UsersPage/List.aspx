<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="QlyMain.UsersPage.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-header">
        <h4 class="card-title">User List</h4>
    </div>

    <div class="content">
        <!-- Toolbar -->
        <div class="row mb-3">
            <div class="col-md-6">
                <div class="input-group">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by code, username or full name..."></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                </div>
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                    <asp:ListItem Value="">-- All Departments --</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-3 text-end">
                <asp:Button ID="btnAdd" runat="server" Text="Add New" CssClass="btn btn-primary me-2" OnClick="btnAdd_Click" />
                <asp:Button ID="btnExport" runat="server" Text="Export Excel" CssClass="btn btn-success" OnClick="btnExport_Click" />
            </div>
        </div>

        <!-- Data Table -->
        <div class="table-responsive">
            <asp:GridView ID="gvUsers" runat="server" CssClass="table table-striped table-hover"
                AutoGenerateColumns="false" AllowPaging="true" PageSize="10"
                OnPageIndexChanging="gvUsers_PageIndexChanging"
                OnRowCommand="gvUsers_RowCommand"
                OnRowDataBound="gvUsers_RowDataBound"
                AllowSorting="true"
                OnSorting="gvUsers_Sorting">
                <Columns>
                    <asp:BoundField DataField="RowNumber" HeaderText="No." ItemStyle-Width="50px" ItemStyle-CssClass="text-center" />
                    <asp:BoundField DataField="UserCode" HeaderText="User Code" SortExpression="UserCode" />
                    <asp:BoundField DataField="UserName" HeaderText="Username" SortExpression="UserName" />
                    <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="FullName" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="DepartmentName" HeaderText="Department" SortExpression="Department.DepartmentName" />
                    <asp:TemplateField HeaderText="Status" ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <span class="badge <%# (bool?)Eval("UserStatus") == true ? "bg-success" : "bg-danger" %>">
                                <%# (bool?)Eval("UserStatus") == true ? "Active" : "Inactive" %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CreateDate" HeaderText="Created Date" DataFormatString="{0:dd/MM/yyyy}" SortExpression="CreateDate" />
                    <asp:BoundField DataField="LastLoginDate" HeaderText="Last Login" DataFormatString="{0:dd/MM/yyyy HH:mm}" SortExpression="LastLoginDate" />
                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="120px" ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server"
                                CommandName="EditUser"
                                CommandArgument='<%# Eval("Id_User") %>'
                                CssClass="btn btn-sm btn-outline-primary me-1"
                                ToolTip="Edit">
                                                <i class="fa fa-edit"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" runat="server"
                                CommandName="DeleteUser"
                                CommandArgument='<%# Eval("Id_User") %>'
                                CssClass="btn btn-sm btn-outline-danger"
                                ToolTip="Delete"
                                OnClientClick="return confirm('Are you sure you want to delete this user?');">
                                                <i class="fa fa-trash"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="pagination justify-content-center" />
                <EmptyDataTemplate>
                    <div class="text-center py-4">
                        <i class="fa fa-inbox fa-3x text-muted mb-3"></i>
                        <p class="text-muted">No data to display</p>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>

        <!-- Pagination Info -->
        <div class="row mt-3">
            <div class="col-md-6">
                <asp:Label ID="lblPageInfo" runat="server" CssClass="text-muted"></asp:Label>
            </div>
            <div class="col-md-6 text-end">
                <div class="form-inline">
                    <label class="me-2">Rows/Page:</label>
                    <asp:DropDownList ID="ddlPageSize" runat="server" CssClass="form-select form-select-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged" Style="width: auto; display: inline-block;">
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="20">20</asp:ListItem>
                        <asp:ListItem Value="50">50</asp:ListItem>
                        <asp:ListItem Value="100">100</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
    </div>

    <!-- Loading overlay -->
    <div id="loadingOverlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.5); z-index: 9999;">
        <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: white;">
            <div class="spinner-border" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
            <div class="mt-2">Processing...</div>
        </div>
    </div>

    <script type="text/javascript">
        function showLoading() {
            document.getElementById('loadingOverlay').style.display = 'block';
        }

        function hideLoading() {
            document.getElementById('loadingOverlay').style.display = 'none';
        }

        // Show loading for postback operations
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(showLoading);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(hideLoading);

        // Enter key search
        function checkEnter(event) {
            if (event.keyCode === 13) {
                document.getElementById('<%= btnSearch.ClientID %>').click();
                return false;
            }
        }

        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('<%= txtSearch.ClientID %>').addEventListener('keypress', checkEnter);
        });
    </script>
</asp:Content>