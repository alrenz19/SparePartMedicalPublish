<%@ Page Title="List" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Add.aspx.cs" Inherits="QlyMain.MaintenanceConfims.Add" EnableEventValidation="false" %>

<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
   

    <section class="content-header">
        <h1>Production Follow <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Production Follow</li>
        </ol>
    </section>
    <div class="content">
        <uc1:ucRequestInfor runat="server" ID="ucRequestInfor" />

        <div class="panel panel-primary">
            <div class="panel-heading">
                Enter maintenance arrival time for repair 
            </div>
            <div class="panel-body">
                <label>Time </label>
                <asp:TextBox ID="txtThoiGianDuKienSua" runat="server" class="form-control txtThoiGianDuKienSua"></asp:TextBox>
               

                <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                <br />
                <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>

            </div>
            <div class="panel-footer">
                <div class="form-button-container">
                    <asp:Button ID="btnAdd" runat="server" Text="Save" OnClick="btnAdd_Click" CssClass="form-button delete-button" />  
                    
                    
                    &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" CssClass="form-button cancel-button" />
                </div>
            </div>
        </div>



    </div>

    <script> 


        $(function () {
            $('.txtThoiGianDuKienSua').datetimepicker({
                format: 'DD.MMM.yyyy HH:mm'
            });
        });


    </script>
</asp:Content>
