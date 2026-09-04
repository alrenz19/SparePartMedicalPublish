<%@ Page Title="Upload data" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UpdateMenu.aspx.cs" Inherits="QlyMain.UpdateData.UpdateMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background: #80808024;
        }

        .box-shadow1 {
            background: white;
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
            background-color: white;
            border-radius: 2px;
        }

        span.select2-selection.select2-selection--single {
            height: 30px;
        }
        /*Modal*/
        .modalBackground1 {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
        }

        .modalPopup1 {
            background-color: #FFFFFF;
            width: 40%;
            height: auto;
            padding: 30px;
            box-shadow: 2px 4px 6px #888888;
        }

            .modalPopup1 .body {
                min-height: 50px;
                line-height: 30px;
                text-align: center;
                padding: 50px;
            }

            .modalPopup1 .footer {
                padding: 3px;
            }

            .modalPopup1 .button {
                height: 23px;
                color: White;
                line-height: 23px;
                text-align: center;
                font-weight: bold;
                cursor: pointer;
                background-color: #9F9F9F;
                border: 1px solid #2a502a;
            }

        ul.multiselect-container.dropdown-menu {
            height: 180px;
            overflow: auto;
        }

        select#MainContent_dlTypeExport {
            border: 1px solid green;
        }

        .auto-style1 {
            left: 0px;
            top: 0px;
        }
        /* Extra small devices (phones, 600px and down) */
        @media only screen and (max-width: 600px) {
            .res {
                display: block;
            }
        }

        /* Small devices (portrait tablets and large phones, 600px and up) */
        @media only screen and (min-width: 600px) {
            .res {
                display: block;
            }
        }

        /* Medium devices (landscape tablets, 768px and up) */
        @media only screen and (min-width: 768px) {
            .res {
                display: block;
            }
        }

        /* Large devices (laptops/desktops, 992px and up) */
        @media only screen and (min-width: 992px) {
            .res {
                width: 90%
            }
        }

        /* Extra large devices (large laptops and desktops, 1200px and up) */
        @media only screen and (min-width: 1200px) {
            .res {
                width: 90%
            }
        }
    </style>
    <link href="../Content/css/bootstrap-multiselect.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap-multiselect.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=lboxCodeMachineExport]').multiselect({
                includeSelectAllOption: true
            });
        });
        $(function () {
            $('[id*=ListSec]').multiselect({
                includeSelectAllOption: true
            });
        });

        $(function () {
            $('.selectExp').select2({
                dropdownParent: $("#mdExport")
            });
        });
        function getfilepath() {
            var fileupload = document.getElementById("FileUpload1");
            var hiddenvalue = document.getElementById("filepath");
            hiddenvalue.value = fileupload.value;
        }
    </script>
    <div style="margin-top: 8%"></div>
    <section class="content-header">
        <div class="page-header" style="text-align: center; margin: 0px; padding: 0px">
            <h2>Cập nhật dữ liệu(Upload data)      
            </h2>
        </div>
    </section>
    <div class="content">
        <div>
            <asp:FileUpload ID="FileUpload4" runat="server" CssClass="btn btn-primary" />
            <asp:Button ID="Button2" runat="server" Text="CheckSheetNoChild" CssClass="btn btn-primary" OnClick="CheckSheetNoChild_Click" />
        </div>
        <div>
            <div class="row">
                <div class="col-md-1">
                </div>
                <div class="col-md-10">
                    <asp:LinkButton Text="Sửa Máy" runat="server" ID="lbkOpenEditMachine" CssClass="btn btn-default" OnClick="lbkOpenEditMachine_click" />
                    <asp:Panel runat="server" ID="pnOpenEditMachine" Visible="false">
                        <div>
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <h4>Sửa máy</h4>
                                Số dòng hiển thị:
                        <asp:DropDownList ID="ddlSoDong" runat="server"
                            CssClass="dropdown" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlSoDong_SelectedIndexChanged">
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>50</asp:ListItem>
                            <asp:ListItem>100</asp:ListItem>
                        </asp:DropDownList>
                                <asp:GridView ID="gvMachine" runat="server" AutoGenerateColumns="false"
                                    DataKeyNames="id_CodeMachine" CssClass="table table-bordered box-shadow1"
                                    OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing"
                                    OnRowCancelingEdit="OnRowCancelingEdit"
                                    OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting"
                                    EmptyDataText="No records has been added."
                                    CellPadding="4"
                                    OnPageIndexChanging="gvMachine_PageIndexChanging"
                                    AllowPaging="True">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Mã máy" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCodeMachine" runat="server" Text='<%# Eval("CodeMachine") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtCodeMachine" runat="server" Text='<%# Eval("CodeMachine") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tên máy" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMachineName" runat="server" Text='<%# Eval("MachineName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtMachineName" runat="server" Text='<%# Eval("MachineName") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150" />
                                    </Columns>
                                    <PagerSettings Mode="NumericFirstLast" />
                                    <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>
                        </div>
                    </asp:Panel>

                    <div class="row">
                        <asp:Label Text="" ID="lblThongbaoSS" runat="server" />
                        <asp:Panel runat="server" CssClass="alert-info box-shadow1" Width="60%">
                            <ul style="padding: 5px">
                                <li>Thêm nhiều máy cùng 1 file dữ liệu thì cách nhau giữa các máy bằng dấu <b style="font-weight: bold; color: red">,</b> ở mục <b class="alert-danger">Code Machine</b></li>
                                <li>Ví dụ <b class="alert-success">EB1-0001<b style="font-weight: bold; color: red">,</b>EB2-0002<b style="font-weight: bold; color: red">,</b>EB3-0003</b></li>
                            </ul>
                            <div class="navbar-form" role="search">
                                <div class="input-group">
                                    <asp:DropDownList ID="ddMachineCodeM" runat="server" Height="30px" Font-Size="12px"
                                        CssClass="form-control selectM">
                                    </asp:DropDownList>
                                    <span class="input-group-btn">
                                        <asp:ImageButton ImageUrl="../Img/Find.png" ID="btnFindMachineM" CssClass="btn btn-default" Height="30px" runat="server" OnClick="btnFindMachineM_Click" />
                                    </span>
                                </div>
                            </div>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="pnExp" Visible="false">
                            <div class="card-body ">
                                <br />
                                <asp:LinkButton ID="btnAddLot" runat="server" Text="Upload" CssClass="btn btn-primary">
                        <span class="glyphicon glyphicon-plus"></span> Upload CheckSheet
                                </asp:LinkButton>
                                <asp:Panel ID="panelAddLot" runat="server"
                                    CssClass="modalPopup1"
                                    Style="display: none; width: 50%">
                                    <div class="popbody" id="mdExport">
                                        <table class="table">
                                            <tr>
                                                <td>
                                                    <br />
                                                    <asp:DropDownList runat="server" ID="dlTypeExport" AutoPostBack="true"
                                                        CssClass="btn form-control" OnSelectedIndexChanged="dlTypeExport_SelectedIndexChanged">
                                                        <asp:ListItem Text="-" Value="0" />
                                                        <asp:ListItem Text="Air compressor" Value="1" />
                                                        <asp:ListItem Text="Soft Water system" Value="2" />
                                                        <asp:ListItem Text="OAHU" Value="3" />
                                                        <asp:ListItem Text="f0466" Value="4" />
                                                        <asp:ListItem Text="Chiller" Value="5" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:ListBox ID="lboxCodeMachineExport"
                                                        Rows="5"
                                                        Width="100px" CssClass="selectExp"
                                                        SelectionMode="Multiple"
                                                        runat="server" Visible="false"></asp:ListBox>
                                                </td>
                                                <td class="auto-style45"><b>
                                                    <br />
                                                    <asp:FileUpload ID="FileUpload2" runat="server" CssClass="btn btn-primary" />
                                                </b>
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button ID="btnUpdate" runat="server" Text="Cập Nhật" Width="80px" Height="28px" CssClass="btn btn-primary" OnClick="btnUpload_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="footer" align="right">
                                        <asp:Button ID="Button1" runat="server" Text="Close" CssClass="button" />
                                    </div>
                                </asp:Panel>
                                <ajaxToolkit:ModalPopupExtender ID="ModalExp"
                                    runat="server"
                                    PopupControlID="panelAddLot"
                                    TargetControlID="btnAddLot"
                                    BackgroundCssClass="modalBackground1">
                                    <Animations>
                            <OnShown><Fadein Duration="0.35" /></OnShown>
                            <OnHiding><Fadeout Duration="0.25" /></OnHiding>
                                    </Animations>
                                </ajaxToolkit:ModalPopupExtender>
                            </div>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="pnSP" Visible="false">
                            <div class="card-body ">
                                <br />
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="Upload" CssClass="btn btn-primary">
                        <span class="glyphicon glyphicon-plus"></span> Upload Sparepart
                                </asp:LinkButton>
                                <asp:Panel ID="panelUploadSP" runat="server"
                                    CssClass="modalPopup1"
                                    Style="display: none; width: 50%">
                                    <div class="popbody" id="mdSPort">
                                        <asp:Label Text="" ID="lblThongbaoDrop" runat="server" />
                                        <table class="table">
                                            <tr>
                                                <td>Div/Sec
                                                    <br />
                                                    <asp:DropDownList runat="server" ID="ddType" CssClass="btn btn-default">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="auto-style45"><b>Chọn file
                                                    <br />
                                                    <asp:FileUpload ID="FileUpload3" runat="server" CssClass="btn btn-primary" Width="150px" />
                                                    <%--                                                    <asp:Button ID="btnChonSheet" runat="server" Text="OK" Width="50px" Height="28px" CssClass="btn btn-primary" OnClick="btnChonSheet_Click" />--%>
                                                </b>
                                                </td>
                                                <td>Chọn Sheet
                                                    <br />
                                                    <%-- <asp:DropDownList runat="server" ID="ddlCheksheet" CssClass="btn btn-default">
                                                    </asp:DropDownList>--%>
                                                </td>
                                                <td>
                                                    <br />
                                                    <asp:Button ID="btnUploadSp" runat="server" Text="Upload Spare Part" Width="80px"
                                                        Height="28px" CssClass="btn btn-primary" OnClick="btnUploadSp_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="footer" align="right">
                                        <asp:Button ID="Button3" runat="server" Text="Close" CssClass="button" />
                                    </div>
                                </asp:Panel>
                                <ajaxToolkit:ModalPopupExtender ID="ModalSP"
                                    runat="server"
                                    PopupControlID="panelUploadSP"
                                    TargetControlID="LinkButton1"
                                    BackgroundCssClass="modalBackground1">
                                    <Animations>
                                    <OnShown><Fadein Duration="0.35" /></OnShown>
                                    <OnHiding><Fadeout Duration="0.25" /></OnHiding>
                                </Animations>
                                </ajaxToolkit:ModalPopupExtender>
                            </div>
                        </asp:Panel>
                        <br />
                        <table class="table table-bordered box-shadow1">
                            <tr>
                                <td style="padding-left: 5px;">
                                    <asp:Label ID="thongbaochonloai" runat="server" />
                                    <div class="form-group " style="margin-top: 10px">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                Code Machine
                                            </div>
                                            <asp:TextBox ID="txtCodeMachine" Text="EB" runat="server" class="form-control" CssClass="auto-style1"></asp:TextBox>
                                            <asp:Label ID="lblThongbaoType" runat="server" />
                                            <asp:DropDownList runat="server" ID="CodeType"
                                                CssClass="btn form-control btn-default" Visible="false">
                                                <asp:ListItem Text="-" Value="0" />
                                                <asp:ListItem Text="Air compressor" Value="1" />
                                                <asp:ListItem Text="Soft Water system" Value="2" />
                                                <asp:ListItem Text="OAHU" Value="3" />
                                                <asp:ListItem Text="f0466" Value="4" />
                                                <asp:ListItem Text="Chiller" Value="5" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </td>
                                <td style="padding-left: 5px">
                                    <asp:DropDownList runat="server" CssClass="btn btn-default" ID="ddChoose">
                                        <asp:ListItem Text="Manual" Value="1" />
                                        <asp:ListItem Text="SOP" Value="2" />
                                        <asp:ListItem Text="Plan" Value="3" />
                                        <asp:ListItem Text="CheckSheet" Value="4" />
                                    </asp:DropDownList></td>
                                <td style="padding-left: 5px">
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </td>
                                <td style="padding-left: 5px">
                                    <asp:Button ID="btnUpload" Text="Save" runat="server" OnClick="btnSaveFile_Click" />
                                </td>
                                <td style="padding-left: 5px">
                                    <asp:Label Text="" ID="lblThongbao" runat="server" />
                                </td>
                            </tr>
                        </table>
                        <asp:HiddenField ID="_idCodeMachine" runat="server" />
                    </div>
                </div>
                <div class="col-md-1">
                </div>

                <div class="col-md-12" style="margin-left: 10px; margin-right: 10px">
                    <div class="col-md-3">
                        <asp:Panel runat="server" CssClass="alert-info">
                            Manual                        
                        </asp:Panel>
                        <br />
                        <asp:GridView runat="server" ID="gvManual" Font-Size="14px" class="table table-bordered box-shadow1"
                            DataKeyNames="id_Manunal"
                            AutoGenerateColumns="False" OnRowCommand="gvManual_RowCommand"
                            AllowPaging="True" PageSize="10"
                            OnPageIndexChanging="OnPagingM">
                            <HeaderStyle ForeColor="#ffffff" BackColor="#689daf" />
                            <Columns>
                                <asp:BoundField DataField="ManunalName" HeaderText="Manunal" ItemStyle-Wrap="true" ItemStyle-Width="150px" />
                                <asp:BoundField DataField="CodeMachine" HeaderText="CodeMachine" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDelManual" runat="server" CommandName="DelManual"
                                            Text="x" ForeColor="Red" OnClientClick="return confirm('Are you sure?');" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="col-md-3">
                        <asp:Panel runat="server" CssClass="alert-info">
                            SOP
                        </asp:Panel>
                        <br />
                        <asp:GridView runat="server" ID="gvSOP" class="table table-bordered box-shadow1" DataKeyNames="id_SOP"
                            AutoGenerateColumns="False" OnRowCommand="gvSOP_RowCommand" Font-Size="14px" AllowPaging="True" PageSize="10"
                            OnPageIndexChanging="OnPagingS">
                            <HeaderStyle ForeColor="#ffffff" BackColor="#689daf" />
                            <Columns>
                                <asp:BoundField DataField="SOPName" HeaderText="SOP" ItemStyle-Wrap="true" />
                                <asp:BoundField DataField="CodeMachine" HeaderText="CodeMachine" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDelSOP" runat="server" CommandName="DelSOP"
                                            Text="x" ForeColor="Red" OnClientClick="return confirm('Are you sure?');" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="col-md-3">
                        <asp:Panel runat="server" CssClass="alert-info">
                            PLan
                        </asp:Panel>
                        <br />
                        <asp:GridView runat="server" ID="gvPlan" class="table table-bordered box-shadow1" DataKeyNames="id_Plan"
                            AutoGenerateColumns="False" OnRowCommand="gvPlan_RowCommand" Font-Size="14px" AllowPaging="True" PageSize="10"
                            OnPageIndexChanging="OnPagingP">
                            <HeaderStyle ForeColor="#ffffff" BackColor="#689daf" />
                            <Columns>
                                <asp:BoundField DataField="PlanName" HeaderText="Plan" ItemStyle-Wrap="true" />
                                <asp:BoundField DataField="CodeMachine" HeaderText="CodeMachine" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDelPlan" runat="server" CommandName="DelPlan"
                                            Text="x" ForeColor="Red" OnClientClick="return confirm('Are you sure?');" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="col-md-3" style="padding: 0">
                        <asp:Panel runat="server" CssClass="alert-info">
                            Check Sheet
                        </asp:Panel>
                        <br />
                        <asp:GridView runat="server" ID="gvCheckSheet" class="table table-bordered box-shadow1" DataKeyNames="id_checkSheetHT"
                            AutoGenerateColumns="False" OnRowCommand="gvCheckSheet_RowCommand" AllowPaging="True" PageSize="10"
                            OnPageIndexChanging="OnPagingCS" Font-Size="14px">
                            <HeaderStyle ForeColor="#ffffff" BackColor="#689daf" />
                            <Columns>
                                <asp:BoundField DataField="CheckSheetName" HeaderText="Plan" ItemStyle-Wrap="true" ItemStyle-Width="150px" />
                                <asp:BoundField DataField="CodeMachine" HeaderText="CodeMachine" ItemStyle-Width="70px" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDelCheckSheet" runat="server" CommandName="DelCheckSheet"
                                            Text="x" ForeColor="Red" OnClientClick="return confirm('Are you sure?');" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="_idCheckSheet" runat="server" />
</asp:Content>
