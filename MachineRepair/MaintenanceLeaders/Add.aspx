<%@ Page Title="List" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Add.aspx.cs" Inherits="QlyMain.MaintenanceLeaders.Add" EnableEventValidation="false" %>

<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">

    <section class="content-header">
        <h1>Maintenance Leader <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">MaintenanceLeader</li>
        </ol>
    </section>
    <div class="content">

        <uc1:ucRequestInfor runat="server" ID="ucRequestInfor" />

        <asp:Panel ID="PanelModify" runat="server">
            <div class="panel panel-default">
                <div class="panel-heading">Enter long-term countermeasure </div>
                <div class="panel-body">
                    <label>Name of maintenance leader: </label>
                    <asp:TextBox ID="txtLeaderName" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="txttxtLeaderNameRequiredFieldValidator" runat="server" ControlToValidate="txtLeaderName" Display="None" ErrorMessage="Leader name cannot be empty." />
                    <label>
                    <br />
                    Long-term countermeasure: </label>
                    <asp:TextBox ID="txtPolicyDescription" runat="server" class="form-control"></asp:TextBox>
               
                    <label>Note for Production: </label>
                    <asp:TextBox ID="txtNoteForProduct" runat="server" class="form-control"></asp:TextBox>
                    <label>
                    <br />
                    Confirmation date:</label>
                    <asp:TextBox ID="txtConfirmDate" runat="server" class="form-control"></asp:TextBox>
                    
                    <label>
                    <br />
                    Track the countermeasure for this case:</label>
                    <asp:CheckBox ID="chkFlowDoiSach" runat="server" AutoPostBack="true" Text="Do not track" OnCheckedChanged="chkFlowDoiSach_CheckedChanged"></asp:CheckBox>
                    
                    <br />
                    
                    <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                    <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
                    
                </div>
                <div class="panel-footer">
                    <asp:Button ID="btnAdd" runat="server" Text="Save" OnClick="btnAdd_Click" CssClass="btn btn-success" />
                    &nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" CausesValidation="false" CssClass="btn btn-default" />
                </div>
            </div>
        </asp:Panel>
    </div>

</asp:Content>
