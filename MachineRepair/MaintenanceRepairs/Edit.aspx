<%@ Page Title="Edit" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Edit.aspx.cs" Inherits="QlyMain.MaintenanceRepairs.Edit" EnableEventValidation="false" %>

<%@ Register Src="~/MachineRepair/MaintenanceRepairs/ucAddSparepart.ascx" TagPrefix="uc1" TagName="ucAddSparepart" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
 
    <link href="../../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="../../Content/plugins/bootstrap-datetimepicker/moment-with-locales.min.js"></script>
    <script src="../../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <link href="../../Content/toastr.min.css" rel="stylesheet" />
    <script src="../../Scripts/toastr.min.js"></script>


    <section class="content-header">
        <h1>Maintenance Repair <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">MaintenanceRepair</li>
        </ol>
    </section>

    <div class="content">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h2>Edit</h2>
            </div>
            <div class="panel-body">
                <asp:Panel ID="Panel1" runat="server">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Enter maintenance repair information
                        </div>
                        <div class="panel-body">

                            <table class="table table-bordered">

                                <tr>
                                    <td>Repairer:</td>
                                    <td>
                                        <asp:TextBox ID="txtNguoiSua" runat="server" class="form-control"></asp:TextBox>

                                    </td>
                                </tr>

                                <tr>
                                    <td>Inspection items:</td>
                                    <td>
                                        <asp:TextBox ID="txtCacHangMucKiemTra" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Cause of error:</td>
                                    <td>
                                        <asp:TextBox ID="txtNguyenNhanLoi" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Corrective action:</td>
                                    <td>
                                        <asp:TextBox ID="txtHangDongKhacPhuc" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Incident code:</td>
                                    <td>

                                        <asp:DropDownList ID="ddlCodeSuCo" runat="server"
                                            CssClass="select2">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>

                                    <td colspan="2">
                                        <div class="row">
                                            <div class="col-md-6">
                                                Start repair
                                                <asp:TextBox ID="txtThoiGianBatDauSua" runat="server" class="form-control txtThoiGianBatDauSua" autocomplete="off"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                Completion time 
                                                <asp:TextBox ID="txtThoiGianKetThuc" runat="server" class="form-control txtThoiGianBatDauSua" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>


                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">
                                                        Incident photos before repair
                               <div class="row">
                                   <div class="col-md-6">
                                       <asp:FileUpload ID="FileUploadBefore" runat="server" AllowMultiple="false" />
                                   </div>
                                   <div class="col-md-6">
                                       <asp:Button Text="Upload" runat="server" ID="btnUploadBefore" OnClick="btnUploadBefore_Click" />
                                   </div>
                               </div>
                                                    </div>
                                                    <div class="panel-body">


                                                        <asp:GridView runat="server" ID="gridviewImageBefore" OnRowDeleting="gridviewImageBefore_RowDeleting"
                                                            CssClass="horizontal-gridview" DataKeyNames="ID" AutoGenerateColumns="False" ShowHeader="False">
                                                            <Columns>
                                                                <asp:TemplateField Visible="False">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Url") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblUrl" runat="server" Text='<%# Bind("Url") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>

                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("HinhAnh")%>'
                                                                            Width="150px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />


                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton CssClass="btn btn-warning btn-sm" runat="server" Text="Delete image" CommandName="Delete"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>

                                                        </asp:GridView>
                                                    </div>




                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="panel panel-info">
                                                    <div class="panel-heading">
                                                        Photos after repair
                             <div class="row">
                                 <div class="col-md-6">
                                     <asp:FileUpload ID="FileUploadAfter" runat="server" AllowMultiple="false" />
                                 </div>
                                 <div class="col-md-6">
                                     <asp:Button Text="Upload" runat="server" ID="btnUploadAfter" OnClick="btnUploadAfter_Click" />
                                 </div>
                             </div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <asp:GridView runat="server" ID="gridviewImageAfter" OnRowDeleting="gridviewImageAfter_RowDeleting"
                                                            CssClass="horizontal-gridview"  DataKeyNames="ID" ShowHeader="False" AutoGenerateColumns="False">
                                                            <Columns>
                                                                <asp:TemplateField Visible="False">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Url") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblUrl" runat="server" Text='<%# Bind("Url") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>

                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("HinhAnh")%>'
                                                                            Width="150px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton CssClass="btn btn-warning btn-sm" runat="server" Text="Delete image" CommandName="Delete"></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>

                                                    </div>

                                                </div>



                                            </div>
                                        </div>



                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 20%">Evaluation whether it can be repaired or not:
                                        <br />
                                        <small>Check if <b>repaired</b> or uncheck if <b>not repaired</b>
                                        </small>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chkSuaDuocHayKhong" runat="server" Checked="true" Text=" Repaired" AutoPostBack="True" OnCheckedChanged="chkSuaDuocHayKhong_CheckedChanged"></asp:CheckBox>

                                        <asp:Panel ID="panelKhiKhongSuaDuoc" runat="server" Visible="false">
                                            <b>Estimated repair time:</b>
                                            <asp:TextBox ID="txtThoiGianDuKien" runat="server" class="form-control"></asp:TextBox>

                                            <b>Reason not repaired: 
                                            </b>
                                            <asp:TextBox ID="txtLyDoKhongSuaDuoc" runat="server" class="form-control"></asp:TextBox>

                                        </asp:Panel>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Create Date:</td>
                                    <td>
                                        <asp:Label ID="lblCreateDate" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <uc1:ucAddSparepart runat="server" id="ucAddSparepart" />
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </asp:Panel>
            </div>
            <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
            <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
            <div class="panel-footer">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                <asp:Button ID="btnCancel" runat="server" Text="Do not save and Close" OnClick="btnCancel_Click" CssClass="btn btn-default" CausesValidation="false" />
            </div>
        </div>
    </div>
    <p><b>Estimated repair time(*):</b>    Enter the time when the spare part arrives or the date you estimate it can be repaired </p>

    <asp:Panel runat="server" ID="panelHide" Visible="false">
        MaintenanceRepairID:  
        <asp:TextBox ID="txtMaintenanceRepairID" runat="server" class="form-control"></asp:TextBox>
        RequestID: 
        <asp:TextBox ID="txtRequestID" runat="server" class="form-control"></asp:TextBox>
        User input ID: 
        <asp:TextBox ID="txtUserID" runat="server" class="form-control"></asp:TextBox>
    </asp:Panel>
    <script> 

        $(function () {
            $('.select2').select2()
        });

        $(function () {
            $('.txtThoiGianBatDauSua').datetimepicker({
                format: 'DD.MMM.yyyy HH:mm'
            });
            $('txtThoiGianKetThuc').datetimepicker({
                format: 'DD.MMM.yyyy HH:mm',
            });
        });

        $(function () {
            $("#MainContent_txtThoiGianDuKien").datepicker({
                format: 'mm/dd/yyyy',
                todayHighlight: 'TRUE',
                autoclose: true,
            });
        });
    </script>
</asp:Content>
