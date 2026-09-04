<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowInHistory.aspx.cs"
    Inherits="QlyMain.Sparepart.ShowInHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .box-shadow1 {
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
            margin-top: 1%;
            margin-bottom: 1%;
            margin-right: 1%;
            padding: 1%;
            background-color: white;
            border-radius: 2px;
            border-collapse: collapse;
        }

        .box-shadow {
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.2), 0 1px 3px 0 rgba(0, 0, 0, 0.19);
            margin: 1%;
            padding: 0.5%;
            font-size: 14px;
        }
    </style>
    <div class="col-md-1">
    </div>
    <div class="col-md-10 box-shadow1">
        <asp:Label Text="Input History" Font-Size="X-Large" runat="server" />
        <br />
        <br />
        <a id="LinkSP" runat="server" style="text-decoration: underline"><i><span class="fa fa-arrow-left"></span>Quay lại Sparepart</i></a>
        <br />
        <span>Row number:
            <asp:DropDownList ID="ddlDong" runat="server"
                CssClass="dropdown" AutoPostBack="true"
                OnSelectedIndexChanged="ddlDong_SelectedIndexChanged">
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
                <asp:ListItem>100</asp:ListItem>
            </asp:DropDownList>
        </span>
        <br />
        <div class="row">
            <div class="input-group" style="float: right">
                <asp:Panel ID="Panel1" runat="server" DefaultButton="lbkFind">
                    <asp:TextBox ID="txtFind" runat="server" placeholder="Search.."
                        autocomplete="off" Height="30px" Width="450px" BorderColor="#0099cc" Class="form-control"></asp:TextBox>
                    
                    <span class="input-group-btn">
                        <asp:LinkButton ID="lbkFind" runat="server" Height="30px" BorderColor="#0099cc" OnClick="lbkFind_Click"
                            class="btn btn-default"><span class="glyphicon glyphicon-search"></span>̀Search</asp:LinkButton>
                    </span>
                </asp:Panel>
            </div>
        </div>
        <asp:GridView runat="server" ID="gvShowInHistory" AutoGenerateColumns="False" CssClass="table box-shadow" OnRowDataBound="gvShowInHistory_RowDataBound"
            Font-Size="13px" OnPageIndexChanging="gvShowInHistory_PageIndexChanging" AllowPaging="True" HeaderStyle-BackColor="#fcecd6">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <%#  (Container.DataItemIndex + 1) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="PositionSave" HeaderText="Position Save" />
                <asp:BoundField DataField="PartName" HeaderText="SparePart Name" />
                <asp:BoundField DataField="CreatedBy" HeaderText="Created by" />
                <asp:BoundField DataField="QuantityInOld" HeaderText="Quantity Out Old" />
                <asp:BoundField DataField="QuantityInNew" HeaderText="Quantity Out New" />
                <asp:TemplateField HeaderText="CreatedDate">
                    <ItemTemplate>
                        <asp:Label ID="lblCreateD" ForeColor="#336699" Font-Bold="true" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:GridView runat="server" ID="gvInHistory" Visible="false" AutoGenerateColumns="False" CssClass="table"
            OnRowDataBound="gvInHistory_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="month">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("month") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblMonth" runat="server" Text='<%# Bind("month") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="year" HeaderText="year" />
                <asp:BoundField DataField="PositionSave" HeaderText="Position Save" />
                <asp:BoundField DataField="PartName" HeaderText="SparePart Name" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:DataList runat="server" CssClass="table" ID="dlchild" OnItemCommand="dlchild_ItemCommand">
                            <ItemTemplate>
                                <table class="table">
                                    <tr>
                                        <td>Index :
                                          <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblYear" runat="server" Text='<%# Bind("year") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblMonthChild" runat="server" Text='<%# Bind("month") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblPartID" runat="server" Text='<%# Bind("PartID") %>' Visible="false"></asp:Label>

                                            <asp:Label ID="lblSTT" runat="server" ForeColor="#336699" Font-Bold="true" Text='<%# Bind("STT") %>'></asp:Label>
                                        </td>
                                        <td>Quantity: 
                                            <asp:Label ID="lblQuantity" ForeColor="#336699" Font-Bold="true" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                                        </td>
                                        <td>Create By:
                                            <asp:Label ID="Label4" ForeColor="#336699" Font-Bold="true" runat="server" Text='<%# Bind("CreatedBy") %>'></asp:Label>
                                        </td>
                                        <td>Create Date: 
                                            <asp:Label ID="lblCreateDate" ForeColor="#336699" Font-Bold="true" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:Label>
                                        </td>
                                        <td style="display: none">
                                            <asp:LinkButton runat="server" CommandName="Edit">
                                            Edit
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <div id="OpenEdit" style="display: none">
            <asp:LinkButton ID="LinkButton7" runat="server"></asp:LinkButton>
            <ajaxToolkit:ModalPopupExtender ID="popupEdit"
                runat="server" PopupControlID="pnEdit" TargetControlID="LinkButton7" CancelControlID="lbtCancelEdit"
                BackgroundCssClass="modalBackground" DropShadow="false">
            </ajaxToolkit:ModalPopupExtender>
            <asp:Panel ID="pnEdit" CssClass="popupmail" runat="server" Style="display: none;">
                <div id="EditModal">
                    <div class="modalmail">
                        <div class="modal-content">
                            <div class="modal-header alert-info">
                                <asp:Label Text="" ID="lblThongbao" runat="server" />
                                <div>
                                    <table class="table col-md-6">
                                        <tr>
                                            <td>Edit Input </td>
                                            <td>UserCode:
                                              <asp:Label ID="lblUserCode" Text="" runat="server" /></td>
                                            <td>Index :
                                                <asp:Label Text="" ID="lbLan" runat="server" />
                                            </td>
                                            <td>Month :
                                                <asp:Label Text="" ID="lbMonth" runat="server" />
                                            </td>
                                            <td>Year :
                                                <asp:Label Text="" ID="lbYear" runat="server" />
                                            </td>
                                        </tr>
                                    </table>

                                </div>
                            </div>
                            <div class="modal-body" style="height: 100px; overflow-y: scroll">
                                <table class="table">
                                    <tr>
                                        <td>Index :
                                            <asp:TextBox runat="server" ID="txtLan" Enabled="false" CssClass="form-control" Width="100px" /></td>
                                        <td>Quantity :
                                            <asp:TextBox runat="server" ID="txtQuantity" CssClass="form-control" Width="100px" /></td>
                                        <td>
                                            <asp:LinkButton Text="Save" runat="server" ID="lbkEditChild" OnClick="lbkEditChild_Click">Save</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <div class="row">
                                    <div class="col-md-6">
                                    </div>
                                    <div class="col-md-6">
                                        <asp:LinkButton ID="lbtCancelEdit" runat="server"
                                            class="btn btn-default"
                                            data-dismiss="modal">Cancel</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
    <div class="col-md-1">
    </div>
    <asp:HiddenField ID="_Part" runat="server" />
    <asp:HiddenField ID="_PartID" runat="server" />
    <asp:HiddenField ID="_month" runat="server" />
    <asp:HiddenField ID="_year" runat="server" />
    <asp:HiddenField ID="_Lan" runat="server" />
    <asp:HiddenField ID="_Find" runat="server" />
    <asp:HiddenField ID="_id_CodeMachine" runat="server" />
</asp:Content>
