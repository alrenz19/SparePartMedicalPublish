<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCheckSheetView.ascx.cs" Inherits="QlyMain.ucControl.ucCheckSheetView" %>
<div class="col-sm-12 col-md-12 col-lg-12">
    <asp:DataList runat="server" ID="dlCheckSheet" DataKeyField="id_CheckSheet" ShowHeader="true"
        CssClass=" table-sm col-sm-12 col-md-12 col-lg-12"
        OnItemDataBound="dlCheckSheet_ItemDataBound" Style="left: 20px; top: 0px">
        <HeaderTemplate>
            <div class="row col-sm-2 col-md-2 col-lg-2">
                No
            </div>
            <div class="row col-sm-5 col-md-5 col-lg-5">
                Content (Nội dung kiểm tra)
            </div>
            <div class="row col-sm-4 col-md-4 col-lg-4">
                Position check (Vị trí kiểm tra)
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="row col-sm-2 col-md-1 col-lg-1">
                <asp:Label ID="lblID" runat="server" Text='<%# Bind("id_CheckSheet") %>'></asp:Label>
            </div>
            <div class="row col-sm-4 col-md-4 col-lg-4">
                <asp:Label ID="lblContent" runat="server" Text='<%# Bind("ContentCheckSheet") %>'></asp:Label>
            </div>
            <div class="row col-sm-4 col-md-4 col-lg-4">
                <asp:DataList runat="server" ShowHeader="true" ID="dlChildCheckSheet"
                    CssClass="table table-sm col-sm-12 col-md-12 col-lg-12"
                    OnItemDataBound="dlChildCheckSheet_ItemDataBound">
                    <ItemTemplate>
                        <asp:Label ID="lblIDChildCheckSheet" runat="server" Text='<%# Bind("id_ChildCheckSheet") %>' Visible="false"></asp:Label>
                        <div class="row col-sm-10 col-md-10 col-lg-10">
                            <asp:Label ID="lblContentChild" runat="server" Text='<%# Bind("ChildContent") %>'></asp:Label>
                        </div>
                        <div class="row col-sm-2 col-md-2 col-lg-2">
                            <asp:DataList runat="server" ID="dlDateCheckSheet">
                                <ItemTemplate>
                                    <asp:Label ID="lblDateContent" runat="server" Text='<%# Bind("DateContent") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <div class="row">
        <div id="menu">
            <table>
                <tr>
                    <td>
                        <asp:LinkButton Text="Send" runat="server" ID="btnOK"
                            CssClass="btn btn-style" OnClick="btnOK_Click">
                                              <span class="glyphicon glyphicon-thumbs-up"></span>
                        </asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton Text="Send" runat="server" ID="btnNG"
                            CssClass="btn btn-style" OnClick="btnNG_Click">
                                              <span class="glyphicon glyphicon-thumbs-down"></span>
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<asp:HiddenField ID="_MachineName" runat="server" />
<asp:HiddenField ID="_IDCheckSheet" runat="server" />
<asp:HiddenField ID="_IDChildCheckSheet" runat="server" />
