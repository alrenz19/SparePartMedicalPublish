<%@ Page Title="" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true" CodeBehind="Details2.aspx.cs" Inherits="QlyMain.MachineRepair.RepairRequestss.Details2" %>

<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
   
    
        <div class="panel panel-warning">
            <div class="panel-body">
                <uc1:ucRequestInfor runat="server" ID="ucRequestInfor" />

                <asp:Label ID="Label1" runat="server" CssClass="form-error" />
                <asp:Literal ID="Literal1" runat="server"> </asp:Literal>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
            <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
            <div class="panel-footer">
                <asp:Button ID="btnEdit" runat="server" Text="Sửa yêu cầu" OnClick="btnEdit_Click" CssClass="btn btn-warning" />
                <asp:Button ID="btnCancelRequest" runat="server" Text="Hủy yêu cầu" OnClick="btnCancelRequest_Click" CssClass="btn btn-warning" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-default" />
            </div>
        </div>
 
    <!--# content -->

</asp:Content>
