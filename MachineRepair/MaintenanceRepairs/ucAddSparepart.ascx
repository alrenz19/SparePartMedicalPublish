<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAddSparepart.ascx.cs" Inherits="QlyMain.MachineRepair.MaintenanceRepairs.ucAddSparepart" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<style type="text/css">
    .modalBackground {
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
    }

    .modalPopup {
        background-color: #FFFFFF;
        border-width: 3px;
        border-style: solid;
        border-color: black;
        padding-top: 5px;
        padding-left: 10px;
        height: 500px;
    }


    .gridview-header {
        position: sticky;
        top: 0;
        background-color: #f9f9f9;
        z-index: 1;
    }

        .gridview-header th {
            background-color: #f1f1f1;
        }

    .box-shadow1 {
        box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
        margin-top: 1%;
        margin-bottom: 1%;
        margin-right: 1%;
        padding: 0.5%;
        background-color: white;
        border-radius: 2px;
        border-collapse: collapse;
        /*  border: 1px solid black;*/
    }

    .table-wrapper {
        overflow-y: auto;
        max-height: 400px; /* Adjust as needed */
    }

    .padding5 {
        padding: 5px;
    }
</style>
<asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>

<div class="input-group" style="width: 200px">
    <asp:DropDownList runat="server" ID="DropDownListSuDungSparePart" CssClass="form-control" AutoPostBack="true" Width="200"
        OnSelectedIndexChanged="DropDownListSuDungSparePart_SelectedIndexChanged">
        <asp:ListItem Text="Use" Value="1" />
        <asp:ListItem Text="Do not use" Value="0" Selected="True" />
    </asp:DropDownList>
    <div class="input-group-addon" style="background-color: #7ba2b8">
        <asp:LinkButton Text="Select Sparepart" Visible="false" ForeColor="White" ID="lbkOpen" OnClick="lbkOpen_Click" runat="server"><span class="glyphicon glyphicon-link"></span> Select Sparepart </asp:LinkButton>
    </div>
</div>
<br />
<asp:GridView ID="gvListSP" runat="server" AutoGenerateColumns="False"
    DataKeyNames="Id" CssClass="table table-bordered table-condensed"
    EmptyDataText="No data" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
    OnPageIndexChanging="OnPaging" OnRowUpdating="OnRowUpdating"
    EmptyDataRowStyle-HorizontalAlign="Center" OnRowCommand="gvListSP_RowCommand" OnRowDataBound="gvListSP_RowDataBound">
    <Columns>
        <asp:TemplateField HeaderText="Id">
            <ItemTemplate>
                <%#  (Container.DataItemIndex + 1) %>
                <asp:Label ID="Label4" Visible="false" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Sparepart Name">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Partname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Item Code">
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ItemCode") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Model">
            <ItemTemplate>
                <asp:Label ID="LblModel" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Ouput old" Visible="false">
            <ItemTemplate>
                <asp:Label ID="Label1" BackColor="#ea5e4d" CssClass="padding5" ForeColor="White" Font-Size="15px" runat="server" Text='<%# Bind("QtyOuputOLD") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Output Date">
            <ItemTemplate>
                <asp:Label ID="lblQtyDate" Visible="false" runat="server" Text='<%# Bind("QtyDate") %>'></asp:Label>
                <asp:Label ID="lblQtyDateShow" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quantity">
            <EditItemTemplate>
                <asp:TextBox ID="txtQtyOuputEdit" runat="server" Text='<%# Bind("QtyOuput") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblQtyOuput" runat="server" Text='<%# Bind("QtyOuput") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Remark">
            <EditItemTemplate>
                <asp:TextBox ID="txtRemarkEdit" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-info" CausesValidation="True" CommandName="Update" Text="Save"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-default" CausesValidation="False" CommandName="Cancel" Text="Close"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblState" Visible="false" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                <%--<asp:LinkButton runat="server" ID="lbkSave" CssClass="btn btn-success" Text="Edit" CommandName="Save"></asp:LinkButton>--%>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-success" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                |                                                
                                                <asp:LinkButton runat="server" CssClass="btn btn-warning" Text="Restore" CommandName="Restore"></asp:LinkButton>
                |
                                            <asp:LinkButton runat="server" CssClass="btn btn-default" Text="Delete" CommandName="Del" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>
</asp:GridView>
<div>
    <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
    <cc1:ModalPopupExtender ID="mpOpen" BehaviorID="mpe" runat="server"
        PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground" CancelControlID="btnHide">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none;">
        <div class="table-wrapper">
            <div class="input-group">
                <asp:TextBox runat="server" Height="34px" Font-Size="11px" autocomplete="off" Width="150px" ID="txtSearchSP"
                    placeholder="Search " CssClass="form-control" />
                <asp:LinkButton Text="text" runat="server" ID="lbkFind" CssClass="btn btn-info" OnClick="lbkFind_Click"><span class="glyphicon glyphicon-search"></span> Search</asp:LinkButton>
            </div>
            <asp:GridView ID="gvSP" runat="server" AutoGenerateColumns="false"
                DataKeyNames="PartID" OnRowDataBound="gvSP_RowDataBound"
                CssClass="table table-bordered table-condensed table-hover"
                ShowHeaderWhenEmpty="false" OnSelectedIndexChanged="gvSP_SelectedIndexChanged"
                EmptyDataText="No data" EnableEventValidation="true"
                EmptyDataRowStyle-HorizontalAlign="Center"
                HeaderStyle-CssClass="gridview-header">
                <Columns>

                    <asp:BoundField DataField="PartID" HeaderText="Id" />
                    <asp:BoundField DataField="PositionSave" HeaderText="Position" />
                    <asp:BoundField DataField="PartName" HeaderText="PartName" />
                    <%--<asp:TemplateField HeaderText="PictureURL">                              
                                <ItemTemplate>
                                    <asp:Label ID="lblUrlPictrue" Visible="false" Text='<%# Eval("PictureURL") %>' runat="server" />
                                    <asp:Image ID="imgproblem" runat="server" ImageUrl='<%# Eval("PictureURL") %>'
                                        Width="80" Height="80" CssClass="image-zoom" onclick="zoomImage(this);" />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                    <asp:BoundField DataField="Model" HeaderText="Model" />
                    <asp:BoundField DataField="ItemCode" HeaderText="ItemCode" />
                    <asp:BoundField DataField="SafetyStock" HeaderText="SafetyStock" />
                    <asp:BoundField DataField="QtyStock" HeaderText="QtyStock" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="true" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="footer">
            <asp:Button ID="btnHide" runat="server" Text="Close" />
        </div>
    </asp:Panel>
</div>

<div>
    <asp:LinkButton ID="lnk" runat="server"></asp:LinkButton>
    <cc1:ModalPopupExtender ID="mpOpen2" BehaviorID="mpe2" runat="server"
        PopupControlID="pnlPopup2" TargetControlID="lnk" BackgroundCssClass="modalBackground" CancelControlID="btnHide2">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlPopup2" runat="server" CssClass="modalPopup" Style="display: none; height: 470px">
        <div class="table table-bordered table-condensed table-hover" style="padding:22px">
            <div class="input-group">
            </div>
            <h4>Enter sparepart output information</h4>
            <table class="table-wrapper table table-bordered table-condensed ">
                <tr>
                    <td>PartName</td>
                    <td>
                        <asp:Label Text="" ID="lblPartName" ForeColor="#dd4b39" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Item Code</td>
                    <td>
                        <asp:Label Text="" ID="lblItemCode" ForeColor="#dd4b39" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Model </td>
                    <td>
                        <asp:Label Text="" ID="lblModel" runat="server" ForeColor="#dd4b39" />
                    </td>
                </tr>
                <tr>
                    <td>Output Date</td>
                    <td>
                        <div class="input-group">
                            <asp:TextBox runat="server" ID="txtOutputDate" ForeColor="#dd4b39" onkeypress="return (event.charCode >= 48 && event.charCode <= 57) || event.charCode === 46" autocomplete="off" CssClass="form-control" />
                            <ajaxToolkit:CalendarExtender ID="txtRegisterDate_CalendarExtender"
                                runat="server" Format="dd.MMM.yyyy"
                                BehaviorID="txtRegisterDate_CalendarExtender"
                                TargetControlID="txtOutputDate" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td>
                        <div class="input-group">
                            <asp:TextBox runat="server" Width="40px" ForeColor="#dd4b39" ID="txtQty" CssClass="form-control" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Remark</td>
                    <td>
                        <div class="input-group">
                            <asp:TextBox runat="server" ForeColor="#dd4b39" ID="txtRemark" CssClass="form-control" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton Text="Save" CssClass="btn btn-info" ID="lbkOutputSP" OnClick="lbkOutputSP_Click"
                            OnClientClick="if (!confirm('Are you sure you want to output for this sparepart?')) return false;" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="footer">
            <asp:Button ID="btnHide2" runat="server" CssClass="btn btn-default" Text="Close" OnClick="btnHide2_Click" />
        </div>
    </asp:Panel>
</div>
