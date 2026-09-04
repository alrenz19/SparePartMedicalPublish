<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RequestStatusPage.aspx.cs" Inherits="QlyMain.MaintenanceRequest.RequestStatusPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>REQUESTSTATUS</h2>
    <asp:Panel ID="PanelModify" runat="server">
        <table>

            <tr>
                <td>StatusID:</td>
                <td>
                    <asp:TextBox ID="txtStatusID" runat="server" Height="26px" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>StatusName:</td>
                <td>
                    <asp:TextBox ID="txtStatusName" runat="server" class="form-control"></asp:TextBox>
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
                <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="+ Thêm mới" />
            </div>
            <div class="col-md-4">
                Number of rows displayed:
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
                <asp:BoundField DataField="StatusID" HeaderText="StatusID" Visible="False" />
                <asp:BoundField DataField="StatusName" HeaderText="StatusName" />
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbEdit" runat="server" CommandName='<%#"S|"+Eval("StatusID")%>' Text="Edit"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbDelete" runat="server" CommandName='<%#"X|"+Eval("StatusID")%>' OnClientClick="return confirm('Do you want to delete?')" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        </asp:GridView>
    </asp:Panel>

</asp:Content>
