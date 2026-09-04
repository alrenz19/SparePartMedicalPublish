<%@ Page Title="Details" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Details.aspx.cs" Inherits="QlyMain.MaintenanceConfims.Details"
    EnableEventValidation="false" %>

<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">

    <section class="content-header">
        <h1>Production Confirm <small>Confirm the time Maintenance arrives to repair the machine</small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">MaintenanceConfim</li>
        </ol>
    </section>

    <div class="content">

        <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
        <uc1:ucRequestInfor runat="server" ID="ucRequestInfor" />


        <div class="panel panel-midnightblue">
            <div class="panel-heading">
                <span class="glyphicon glyphicon-user"></span>Production:
                <asp:Label runat="server" ID="lblTrangThaiXacNhan" ForeColor="#FFCC00" Font-Bold="True"></asp:Label>

            </div>
            <div class="panel-body">
                <asp:Panel runat="server" ID="PanelNoiDungXacNhan" Enabled="false">
                    <table class="table table-bordered">
                        <tr>
                            <td>Entered by:
                            </td>
                            <td>
                                <asp:Label ID="lblNguoiXacNhan" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>User code:
                            </td>
                            <td>
                                <asp:Label ID="lblCodeNguoiXacNhan" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Machine broke at:</td>
                            <td>
                                <asp:Label ID="lblThoiGianMayHong" runat="server" Enabled="false"></asp:Label></td>
                        </tr>

                        <tr>
                            <td style="width: 200px">Maintenance arrived to repair at:</td>
                            <td>
                                <asp:Label ID="lblThoigianMainDenSua" runat="server" Width="200px"></asp:Label>

                            </td>
                        </tr>
                         
                        <tr>
                            <td>From machine failure to maintenance arrival:</td>
                            <td>
                                <asp:Label ID="lblTongThoiGian" runat="server" Enabled="false" CssClass="badge bg-green"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Production entered confirmation at:</td>
                            <td>
                                <asp:Label ID="lblCreateDate" runat="server" Enabled="false"></asp:Label></td>
                        </tr>
                    </table>
                </asp:Panel>


            </div>
            <div class="panel-footer">
                <asp:LinkButton runat="server" ID="lbtAdd" OnClick="lbtAdd_Click">
                    <span class="glyphicon glyphicon-check"></span> Click to confirm</asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtEdit" OnClick="lbtEdit_Click">
                   <span class="glyphicon glyphicon-pencil"></span>Edit</asp:LinkButton>
                &nbsp;
                <asp:LinkButton runat="server" ID="btnCancel" OnClick="btnCancel_Click">
     <span class="glyphicon glyphicon-backward"></span> Close</asp:LinkButton>
            </div>
        </div>

        <asp:TextBox ID="txtRequestID" runat="server" with="120" Visible="false"></asp:TextBox>
        <asp:TextBox ID="txtUserID" runat="server" with="120" Visible="false"></asp:TextBox>
    </div>
    <script> 

        $(function () {
            $("#MainContent_txtThoiGianDuKienSua").datepicker({
                format: 'dd/mm/yyyy',
                todayHighlight: 'TRUE',
                autoclose: true,
            });
        });



    </script>
</asp:Content>
