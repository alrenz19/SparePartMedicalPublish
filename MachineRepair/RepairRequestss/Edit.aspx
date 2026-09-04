<%@ Page Title="List" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Edit.aspx.cs" Inherits="QlyMain.RepairRequestss.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
    <link href="../../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css" rel="stylesheet" />

    <script src="../../Content/plugins/bootstrap-datetimepicker/moment-with-locales.min.js"></script>
    <script src="../../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>

    <section class="content-header">
        <h1>Repair request <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">RepairRequests</li>
        </ol>
    </section>

    <section class="content">
        <div class="row">
            <div class="col-md-6 col-xs-12">


                <div class="panel panel-info">
                    <div class="panel-heading">
                        Edit request
                    </div>
                    <div class="panel-body">


                        <label>Error description</label>
                        <asp:TextBox ID="txtProblemName" runat="server" CssClass="form-control" />
                        <label>Fault location</label>
                        <asp:TextBox ID="txtViTriLoi" runat="server" CssClass="form-control" />
                        <label>Time of failure</label>
                        <asp:TextBox ID="txtNgayLoi" runat="server" CssClass="form-control txtNgayLoi" />





                        <label>Quality impact?</label>
                        <asp:CheckBox ID="chkAnhHuongChatLuong" runat="server" />
                        <label>NG rate</label>
                        <asp:TextBox ID="txtTiLeNG" runat="server" CssClass="form-control" />
                        <label>Impact on shipment?</label>
                        <asp:CheckBox ID="chkAnhHuongXuatHang" runat="server" />
                        <label>Shipment date</label>
                        <asp:TextBox ID="txtNgayXuatHang" runat="server" CssClass="form-control" />

                        <asp:TextBox ID="txtUserID" runat="server" CssClass="form-control" Visible="false" />
                        <label>Send communication via email</label>
                        <asp:TextBox ID="txtNhomMailID" runat="server" CssClass="form-control" />
                        <label>Request creation date</label>
                        <asp:TextBox ID="txtCreateDate" runat="server" CssClass="form-control" Enabled="false" />


                        <label>Request number</label>
                        <asp:TextBox ID="txtRequestNo" runat="server" CssClass="form-control" Enabled="false" />

                        <label>Note</label>
                        <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" />

                        <asp:TextBox ID="txtMachineID" runat="server" CssClass="form-control" Visible="false" />
                        <asp:TextBox ID="txtStatus" runat="server" CssClass="form-control" Visible="false" />

                        <asp:TextBox ID="txtStatusID" runat="server" CssClass="form-control" Visible="false" />
                        <asp:TextBox ID="txtDepartmentID" runat="server" CssClass="form-control" Visible="false" />



                    </div>
                    <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                    <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
                    <div class="panel-footer">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-default" CausesValidation="false" />
                    </div>
                </div>
            </div>
        </div>

    </section>

    <script> 
        $(function () {

            $('.txtNgayLoi').datetimepicker({
                format: 'DD.MMM.yyyy HH:mm'
            });


        });



    </script>

</asp:Content>
