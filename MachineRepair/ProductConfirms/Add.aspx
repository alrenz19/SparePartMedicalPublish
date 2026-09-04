<%@ Page Title="Add" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Add.aspx.cs" Inherits="QlyMain.ProductConfirms.Add" EnableEventValidation="false" %>

<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">


    <section class="content-header">
        <h1>Request Department Confirmation <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">ProductConfirm</li>
        </ol>
    </section>
    <div class="content">

        <uc1:ucRequestInfor runat="server" ID="ucRequestInfor" />

        <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
        <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>

        <asp:Panel ID="PanelModify" runat="server">
            <div class="panel panel-success">
                <div class="panel-heading">Enter confirmation </div>
                <div class="panel-body">

                    <label>Confirmation content</label>
                    <asp:TextBox ID="txtProductComment" runat="server" class="form-control"></asp:TextBox>


                </div>


                <div class="panel-footer">
                    <asp:Button ID="btnAdd" runat="server" Text="Save" OnClick="btnAdd_Click" CssClass="btn btn-success" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" CssClass="btn btn-default" />
                </div>
            </div>
        </asp:Panel>
    </div>

</asp:Content>
