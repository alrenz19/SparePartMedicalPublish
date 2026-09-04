<%@ Page Title="List" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Add.aspx.cs" Inherits="QlyMain.MaintenanceRepairs.Add" MaintainScrollPositionOnPostback="true" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>
<%@ Register Src="~/MachineRepair/MaintenanceRepairs/ucAddSparepart.ascx" TagPrefix="uc1" TagName="ucAddSparepart" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
    <link href="../../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css" rel="stylesheet" />

    <script src="../../Content/plugins/bootstrap-datetimepicker/moment-with-locales.min.js"></script>
    <script src="../../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>

    <link href="../../Content/toastr.min.css" rel="stylesheet" />
    <script src="../../Scripts/toastr.min.js"></script>

    <style type="text/css">
        .modal {
            display: none;
            position: absolute;
            top: 0px;
            left: 0px;
            background-color: black;
            z-index: 100;
            opacity: 0.8;
            filter: alpha(opacity=60);
            -moz-opacity: 0.8;
            min-height: 100%;
        }

        #divImage {
            display: none;
            z-index: 1000;
            position: fixed;
            top: 0;
            left: 0;
            background-color: White;
            height: 550px;
            width: 600px;
            padding: 3px;
            border: solid 1px black;
        }

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

        .header, .footer {
            background-color: #f1f1f1;
            padding: 5px;
            text-align: center;
            font-weight: bold;
        }

        .body {
            overflow-y: auto;
            height: calc(100% - 100px); /* Adjust height to account for header and footer */
        }

        .table-wrapper {
            overflow-y: auto;
            max-height: 400px; /* Adjust as needed */
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

        .padding5 {
            padding: 5px;
        }

        input:required {
            border: 1px solid #9e9e9e;
        }

            input:required:invalid {
                border: 1px solid #dd7b7b;
            }
    </style>
    <script type="text/javascript">
        function dateselect_txtOutputDate(ev) {
            var calendarBehavior1 = $find("txtOutputDate_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("dd.MMM.yyyy");
        }
    </script>
    <section class="content-header">
        <h1>Maintenance Repair <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Maintenance Repair</li>
        </ol>
    </section>
    <div class="content">
        <uc1:ucRequestInfor runat="server" ID="ucRequestInfor" />
        <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
        <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
        <asp:Literal ID="LiteralThongBao2" runat="server"> </asp:Literal>



        <div class="panel panel-primary">
            <div class="panel-heading">
                Enter maintenance repair information
                     <asp:Button ID="Button1" runat="server" Text="Close" OnClick="btnCancel_Click" CssClass="pull-right btn btn-default" CausesValidation="false" />
            </div>
            <div class="panel-body">
                <asp:Panel runat="server" ID="panelSuaChua">
                    <table class="table table-bordered">
                        <tr>
                            <td style="width: 250px;">Issue code:</td>
                            <td>
                                <asp:DropDownList ID="ddlCodeSuCo" runat="server"
                                    CssClass="select2">
                                </asp:DropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td>Repairer:</td>
                            <td>
                                <asp:TextBox ID="txtNguoiSua" runat="server" class="form-control"></asp:TextBox>
                                <p>Please enter name and code <small>e.g.: Tran Van A, 401x or A 4012</small> </p>
                            </td>
                        </tr>

                        <tr>
                            <td>Inspection items:</td>
                            <td>
                                <asp:TextBox ID="txtCacHangMucKiemTra" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Root cause:</td>
                            <td>
                                <asp:TextBox ID="txtNguyenNhanLoi" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Corrective actions:</td>
                            <td>
                                <asp:TextBox ID="txtHangDongKhacPhuc" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Enter repairer's code
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="txtCode" Width="200"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCode" ErrorMessage="Enter your code" ForeColor="#FF5050">Enter your code to proceed</asp:RequiredFieldValidator>
                                <br />
                                <i class="small">Enter the code to confirm whether spare parts were used</i>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">Spare Part 
                            <br />
                                used for the repair
                            <uc1:ucAddSparepart runat="server" ID="ucAddSparepart" />
                            </td>
                        </tr>

                        <tr>
                            <td>Assessment: fixed or not:</td>
                            <td>
                                <asp:DropDownList ID="DropDownListSuaDuocHayKhong" runat="server"
                                    CssClass="form-control" AutoPostBack="true" Width="200"
                                    OnSelectedIndexChanged="DropDownListSuaDuocHayKhong_SelectedIndexChanged">
                                    <asp:ListItem Text="Repaired" Value="1" Selected="True" />
                                    <asp:ListItem Text="Not repaired yet" Value="0" />
                                </asp:DropDownList>
                                <asp:Panel ID="panelKhiSuaDuoc" runat="server" Visible="true">
                                    <div class="row">
                                        <div class="col-md-6">
                                            Start repair
                                        <asp:TextBox ID="txtThoiGianBatDauSua" runat="server" class="form-control " autocomplete="off" ReadOnly></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            Finish time 
                                        <asp:TextBox ID="txtThoiGianKetThuc" runat="server" class="form-control txtThoiGianKetThuc" autocomplete="off"></asp:TextBox>

                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="panelKhiKhongSuaDuoc" runat="server" Visible="false">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <b>Estimated time to repair:</b>
                                            <asp:TextBox ID="txtThoiGianDuKien" runat="server" class="form-control txtThoiGianDuKien"></asp:TextBox>
                                            <p class="small"><i>Enter the date when spare parts arrive or the date you estimate the repair can be completed</i></p>
                                        </div>
                                        <div class="col-md-6">
                                            <b>Reason not repaired:  </b>
                                            <asp:TextBox ID="txtLyDoKhongSuaDuoc" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </asp:Panel>
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
                                                    CssClass="horizontal-gridview" AutoGenerateColumns="False" ShowHeader="False">
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
                                                    CssClass="horizontal-gridview" ShowHeader="False" AutoGenerateColumns="False">
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
                    </table>

                </asp:Panel>
            </div>
            <div class="panel-footer">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnAdd_Click" CssClass="btn btn-primary" />
                &nbsp;&nbsp;
    <asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" CssClass="btn btn-default" CausesValidation="false" />
            </div>
        </div>


    </div>
    <div id="divBackground" class="modal">
    </div>
    <div id="divImage">
        <table style="height: 100%; width: 100%">
            <tr>
                <td valign="middle" align="center">
                    <%--  <img id="imgLoader" alt="" src="Image/loader.gif" />--%>
                    <img id="imgFull" alt="" src="" style="display: none; width: 590px" />
                </td>
            </tr>
            <tr>
                <td align="center" valign="bottom">
                    <input id="btnClose" type="button" value="close" onclick="HideDiv()" />
                </td>
            </tr>
        </table>
    </div>


    <asp:Panel runat="server" ID="panelHide" Visible="false">
        MaintenanceRepairID:  
        <asp:TextBox ID="txtMaintenanceRepairID" runat="server" class="form-control"></asp:TextBox>
        RequestID: 
        <asp:TextBox ID="txtRequestID" runat="server" class="form-control"></asp:TextBox>
        Entered by user ID: 
        <asp:TextBox ID="txtUserID" runat="server" class="form-control"></asp:TextBox>
    </asp:Panel>
    <script> 
        $(function () {
            $('.select2').select2();
            $('.selectSparePart').select2();

            $(function () {
                $('.txtThoiGianKetThuc').datetimepicker({
                    format: 'DD.MMM.yyyy HH:mm'
                });
            });

        });

        $(function () {

            $(".txtThoiGianDuKien").datepicker({
                format: 'mm/dd/yyyy',
                todayHighlight: 'TRUE',
                autoclose: true,
            });


        });

    </script>
    <script type="text/javascript">

        function LoadDiv(url) {
            var img = new Image();
            var bcgDiv = document.getElementById("divBackground");
            var imgDiv = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            var imgLoader = document.getElementById("imgLoader");
            imgLoader.style.display = "block";
            img.onload = function () {
                imgFull.src = img.src;
                imgFull.style.display = "block";
                imgLoader.style.display = "none";
            };
            img.src = url;
            var width = document.body.clientWidth;
            if (document.body.clientHeight > document.body.scrollHeight) {
                bcgDiv.style.height = document.body.clientHeight + "px";
            }
            else {
                bcgDiv.style.height = document.body.scrollHeight + "px";
            }
            imgDiv.style.left = (width - 650) / 2 + "px";
            imgDiv.style.top = "20px";
            bcgDiv.style.width = "100%";

            bcgDiv.style.display = "block";
            imgDiv.style.display = "block";
            return false;
        }
        function HideDiv() {
            var bcgDiv = document.getElementById("divBackground");
            var imgDiv = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            if (bcgDiv != null) {
                bcgDiv.style.display = "none";
                imgDiv.style.display = "none";
                imgFull.style.display = "none";
            }
        }
    </script>
</asp:Content>
