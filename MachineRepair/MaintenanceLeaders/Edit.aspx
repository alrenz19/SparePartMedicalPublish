<%@ Page Title="List" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Edit.aspx.cs" Inherits="QlyMain.MaintenanceLeaders.Edit" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">


    <section class="content-header">
        <h1>Maintenance Leader <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">MaintenanceLeader</li>
        </ol>
    </section>

    <div class="content">
        <div class="panel panel-info">
            <div class="panel-heading">
                Edit
            </div>
            <div class="panel-body">
                <label>Leader's name: </label>
                <asp:TextBox ID="txtLeaderName" runat="server" class="form-control"></asp:TextBox>
                <label>Long-term countermeasure: </label>
                <asp:TextBox ID="txtPolicyDescription" runat="server" class="form-control"></asp:TextBox>
                <label>Note for production: </label>
                <asp:TextBox ID="txtNoteForProduct" runat="server" class="form-control"></asp:TextBox>
                <label>Confirmation date:</label>
                <asp:TextBox ID="txtConfirmDate" runat="server" class="form-control"></asp:TextBox>
                
                    <br />
                    Track the countermeasure for this case:  &nbsp;&nbsp;
               <div class="form-group">
                  <div class="checkbox">
                     <label>   <asp:CheckBox ID="chkFlowDoiSach" runat="server" AutoPostBack="true" Text="Do not track" OnCheckedChanged="chkFlowDoiSach_CheckedChanged"></asp:CheckBox>
</label>
                  </div>
                  </div>
              
                <br />
                <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>

            </div>

            <div class="panel-footer">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                <asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" CssClass="btn btn-default" CausesValidation="false" />
            </div>
        </div>
    </div>


    <%--  
    <asp:TextBox ID="txtRequestID" runat="server" CssClass="form-control" />
<asp:TextBox ID="txtUserID" runat="server" CssClass="form-control" /> --%>
    <asp:HiddenField runat="server" ID="HiddenFieldLeaderID" />
</asp:Content>
