<%@ Page Title="Edit" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Edit.aspx.cs" Inherits="QlyMain.MaintenanceConfims.Edit"
    EnableEventValidation="false" %>



<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
    <link href="../../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="../../Content/plugins/bootstrap-datetimepicker/moment-with-locales.min.js"></script>
    <script src="../../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>


   
     <uc1:ucRequestInfor runat="server" ID="ucRequestInfor" />
    <div class="content">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h2>Edit</h2>
            </div>


            <div class="panel-body">
                <label>Maintenance arrival time: </label>
                <asp:TextBox ID="txtThoiGianDuKienSua" runat="server" class="form-control txtThoiGianDuKienSua" />
                <label>Confirmer:</label>

                <asp:TextBox ID="txtNguoiXacNhan" runat="server" class="form-control"></asp:TextBox>
                <label>
                    Confirmer code:
                </label>

                <asp:TextBox ID="txtCodeNguoiXacNhan" runat="server" class="form-control"></asp:TextBox>
                <asp:TextBox ID="txtMaintenanceConfimID" runat="server" Visible="false" />
                <asp:TextBox ID="txtRequestID" runat="server" Visible="false" />
                <asp:TextBox ID="txtUserID" runat="server" Visible="false" />


            </div>
            <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
            <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
            <div class="panel-footer">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                <asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" CssClass="btn btn-default" CausesValidation="false" />
            </div>
        </div>
    </div>

    <script> 

        //$(function () {
        //    $("#MainContent_txtThoiGianDuKienSua").datepicker({
        //        format: 'mm/dd/yyyy',
        //        todayHighlight: 'TRUE',
        //        autoclose: true,
        //    });

        //});



    </script>

    <script type="text/javascript"> 

        $(function () {
            $('.txtThoiGianDuKienSua').datetimepicker({
                format: 'DD.MMM.yyyy HH:mm'
            });
        });
    </script>
</asp:Content>
