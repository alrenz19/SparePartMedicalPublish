<%@ Page Title="USER MANAGER" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserMng.aspx.cs" Inherits="QlyMain.Admin.UserMng" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="messagealert" id="alert_container">
        </div>
        <asp:Label Text="USER MANAGER" ForeColor="#555c5f" CssClass="PaddingLeft font20" runat="server" /><br />

        <asp:Panel runat="server" ID="pnUpdateAdd" Visible="false">
            <table class="table table-bordered">
                <tr>
                    <td>User code</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtUserCode" placeholder="UserCode" CssClass="form-control" /></td>
                </tr>
                <tr>
                    <td>User Name</td>
                    <td>
                        <asp:TextBox runat="server" ID="txtUserName" placeholder="UserName" CssClass="form-control" /></td>
                </tr>
                <tr>
                    <td>Access Rights</td>
                    <td>
                        <asp:DropDownList runat="server" ID="ddListRole" CssClass="selectListRole" Height="35px" Width="165px">
                            <asp:ListItem Text="Admin" Value="1" />
                            <asp:ListItem Text="User" Value="2" />
                            <asp:ListItem Text="Acc" Value="3" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Section</td>
                    <td>
                        <asp:DropDownList runat="server" ID="ddListSec" CssClass="selectListSec" Height="35px" Width="165px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:LinkButton Text="Lưu lại" ID="lbkSave" CssClass="btn btn-default" OnClick="lbkSave_Click" runat="server" />
                        <asp:LinkButton Text="Cancel" ID="lbkCanCel" CssClass="btn btn-default" OnClick="lbkCanCel_Click" runat="server" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:LinkButton Text="Add+" runat="server" CssClass="btn btn-default" ID="lbkOpenAdd" OnClick="lbkOpenAdd_Click" />
        <div class="row center-block margin-top">
            <span><b>Number of lines displayed:</b>
                <asp:DropDownList ID="ddlDong" runat="server"
                    CssClass="dropdown" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlDong_SelectedIndexChanged">
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                    <asp:ListItem>70</asp:ListItem>
                    <asp:ListItem>100</asp:ListItem>
                </asp:DropDownList>
            </span>
        </div>
        <asp:Panel runat="server" ID="pnUser">
            <asp:GridView ID="GridView1" runat="server" DataKeyNames="Id_User" AutoGenerateColumns="false" OnPageIndexChanging="GridView1_PageIndexChanging"
                CssClass="table grStyle box-shadow1 center font14" ShowHeaderWhenEmpty="true" AllowPaging="True" PageSize="30" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UserCode">
                        <ItemTemplate>
                            <asp:Label ID="lblUserCode" runat="server" Text='<%# Bind("UserCode") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UserName">
                        <ItemTemplate>
                            <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Role">
                        <ItemTemplate>
                            <asp:Label ID="lblRoleId" Visible="false" runat="server" Text='<%# Bind("RoleId") %>'></asp:Label>
                            <asp:Label Text="" ID="lblShow" runat="server" />
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sec">
                        <ItemTemplate>
                            <asp:Label ID="lblSec" runat="server" Text='<%# Bind("Sec") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lblId_User" Visible="false" runat="server" Text='<%# Bind("Id_User") %>'></asp:Label>
                            <asp:LinkButton Text="Edit" ID="lbkEdit" OnClick="lbkEdit_Click" runat="server" />
                            <asp:LinkButton Text="Delete" ID="lbkDelete" OnClick="lbkDelete_Click" runat="server" />
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT fixed-header" Font-Bold="True" />
                    </asp:TemplateField>                 
                </Columns>
                   <pagersettings mode="NumericFirstLast" />
                    <pagerstyle cssclass="pagination-ys" horizontalalign="Center" />
            </asp:GridView>
        </asp:Panel>
        <asp:HiddenField ID="_State" runat="server" />
        <asp:HiddenField ID="_ID" runat="server" />
    </div>
     <script type="text/javascript">
        $(function () {
            $('.selectListRole').select2()
        });
        $(function () {
            $('.selectListSec').select2();
        });      
     </script>
</asp:Content>
