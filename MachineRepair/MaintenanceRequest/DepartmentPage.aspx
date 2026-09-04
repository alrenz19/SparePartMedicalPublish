<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DepartmentPage.aspx.cs" Inherits="QlyMain.MaintenanceRequest.DepartmentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>DEPARTMENT</h2>
    <asp:Panel ID="PanelModify" runat="server">
        <table>

            <tr>
                <td>DepartmentID:</td>
                <td>
                    <asp:TextBox ID="txtDepartmentID" runat="server" Height="26px" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>DepartmentName:</td>
                <td>
                    <asp:TextBox ID="txtDepartmentName" runat="server" class="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>DepartmentCode:</td>
                <td>
                    <asp:TextBox ID="txtDepartmentCode" runat="server" class="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
                    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="PanelShow" runat="server">
        <div class="row">
            <div class="col-md-8">
                <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="+ Add new" />
            </div>
            <div class="col-md-4">
               row:
  <asp:DropDownList ID="ddlSoDong" runat="server"
      CssClass="dropdown" AutoPostBack="true"
      OnSelectedIndexChanged="ddlSoDong_SelectedIndexChanged">
      <asp:ListItem>10</asp:ListItem>
      <asp:ListItem>30</asp:ListItem>
      <asp:ListItem>50</asp:ListItem>
      <asp:ListItem>100</asp:ListItem>
  </asp:DropDownList>
            </div>
        </div>
        <br />
        <asp:GridView ID="GridViewShow" runat="server" AutoGenerateColumns="false" AllowPaging="True" OnPageIndexChanging="GridViewShow_PageIndexChanging" EmptyDataText="Chưa có dữ liệu" OnRowCommand="GridViewShowRowClick" Width="600px">
            <Columns>
                <asp:TemplateField HeaderText=" + ">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                    <ItemStyle Width="10px" />
                </asp:TemplateField>
                <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" Visible="False" />
                <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" />
                <asp:BoundField DataField="DepartmentCode" HeaderText="DepartmentCode" />
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" runat="server" CommandName='<%#"S|"+Eval("DepartmentID")%>' Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbDelete" runat="server" CommandName='<%#"X|"+Eval("DepartmentID")%>' OnClientClick="return confirm('Do you want to delete?')" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        </asp:GridView>
    </asp:Panel>

</asp:Content>
