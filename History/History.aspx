<%@ Page Title="History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="History.aspx.cs" Inherits="QlyMaint.History.History" ClientIDMode="Static" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/css/StyleHistory.css" rel="stylesheet" />
    <style>
        .boxshadow {
            box-shadow: 1px 3px 6px #dadada00 !important;
        }

        .bold {
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">
        function dateselect_txtBeforeTime(ev) {
            var calendarBehavior1 = $find("txtBeforeTime_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("dd.MMM.yyyy") + " " + now.format("HH:mm:ss")
        }
        function dateselect_txtBeforeTimePro(ev) {
            var calendarBehavior1 = $find("txtBeforeTimePro_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("dd.MMM.yyyy") + " " + now.format("HH:mm:ss")
        }
        function dateselect_txtAfterTime(ev) {
            var calendarBehavior1 = $find("txtAfterTime_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("dd.MMM.yyyy") + " " + now.format("HH:mm:ss")
        }
        function dateselect_txtAfterTimePro(ev) {
            var calendarBehavior1 = $find("txtAfterTimePro_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("dd.MMM.yyyy") + " " + now.format("HH:mm:ss")
        }
        function dateselect_txtSearchDay(ev) {
            var calendarBehavior1 = $find("txtSearchDay_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("MMM.yyyy")
        }
    </script>
    <div>

        <section class="content-header">
            <h1>Problem History List <small></small></h1>
            <ol class="breadcrumb">
                <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Problem History List</li>
            </ol>
        </section>
        <div class="content">
            <div class="messagealert" id="alert_container">
            </div>
           
                <div class="row" style="margin-top: 12px">
                    <div class="col-md-12 box-shadow2">
                        <div class="page-header" style="text-align: center; margin: 0px; padding: 0px">
                            <h2>Problem History List
                          <small>
                              <asp:Label Text="" ID="lblOfMachine" runat="server" /></small>
                            </h2>
                        </div>
                        <table>
                            <tr>
                                <td>
                                    <asp:Panel runat="server" DefaultButton="btnSearch">
                                        <div class="navbar-form" role="search">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" Height="34px" ID="txtSearch" placeholder="Search Problem Name..." CssClass="form-control" />
                                                <div class="input-group-btn">
                                                    <div class="btn-group" role="group">
                                                        <div class="dropdown dropdown-lg" id="divOpen" runat="server">
                                                            <button type="button" id="btndropdown" runat="server" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                                                aria-expanded="false">
                                                                <span class="auto-style1"></span>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-right" role="menu" style="left: 0">
                                                                <table class="table">
                                                                    <tr>
                                                                        <td>
                                                                            <label for="filter">Machine code </label>
                                                                            <asp:DropDownList runat="server" ID="ddCodeMachineHistory" CssClass="selectCodeppCMHistory" Width="150px"
                                                                                AutoPostBack="true" OnSelectedIndexChanged="ddCodeMachineHistory_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <label for="filter">Month/Year</label>
                                                                            <asp:TextBox runat="server" ID="txtSearchDay" autocomplete="off" onkeypress="return notChar(event)"
                                                                                CssClass="form-control" />
                                                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server"
                                                                                OnClientDateSelectionChanged="dateselect_txtSearchDay"
                                                                                BehaviorID="txtSearchDay_CalendarExtender" TargetControlID="txtSearchDay" />
                                                                            <asp:Label Text="" ForeColor="Red" ID="Label2" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="filter">Trouble Code </label>

                                                                            <asp:DropDownList ID="ddlCodeHistory" runat="server" Width="150px"
                                                                                CssClass="select2" AutoPostBack="true" OnSelectedIndexChanged="ddlCodeHistory_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <asp:Label Text="" ForeColor="Red" ID="lblMaSuCo" runat="server" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="filter">Div/Sec </label>
                                                                            <asp:DropDownList ID="ddDivS" runat="server" Width="150px"
                                                                                CssClass="select2" AutoPostBack="true" OnSelectedIndexChanged="ddDivS_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <asp:LinkButton runat="server" ID="btnSearch" CssClass="btn btn-primary" OnClick="btnSearch_Click"> <span class="glyphicon glyphicon-search"
                                                             aria-hidden="true"></span></asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                    <asp:Label Text="" ID="lblSearchText" ForeColor="Red" runat="server" />
                                </td>
                                <td class="PaddingLeft15">
                                    <div class="dropdown">
                                        <button class="btn btn-primary" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <h6 style="margin: 0px">Create new</h6>
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <asp:LinkButton Text="(Maint)Create new" CssClass="btn btn-default" runat="server" ID="btnCreate" OnClick="btnCreate_Click" />
                                            <asp:LinkButton Text="(Production)Create new" CssClass="btn btn-default" runat="server" ID="btnCreateProduction" OnClick="btnCreateProduction_Click" />
                                        </div>
                                    </div>
                                </td>
                                <td class="PaddingLeft15">
                                    <asp:LinkButton Text="" ID="lbkThongke" CssClass="btn btn-default StyleFontI styleTagA
                                    +-"
                                        runat="server"
                                        OnClick="lbkThongke_Click"> Statistics Link </asp:LinkButton>
                                </td>
                                <td class="PaddingLeft15">
                                    <asp:LinkButton Text="Export" CssClass="btn btn-default  StyleFontI" runat="server" ID="btnExport"
                                        OnClick="btnExport_Click">Export to Excel <i class="fa fa-file-excel-o"></i> </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <%-- Add by Maint --%>
                        <asp:Label ID="lblThongbao" Font-Bold="true" runat="server" />
                        <asp:Panel runat="server" CssClass="boxshadow" ID="pnAdd" Visible="false">
                            <div class="row">
                                <table class="table col-sm-10 col-md-10 col-lg-10" style="color: #466d80; box-shadow: 1px 3px 6px #52abb6 !important; background-color: #f6f6f6">
                                    <tr class="alert-info">
                                        <td colspan="2" style="font-weight: bold; font-size: 18px">Create History</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table class="table" style="padding: 10px; margin-bottom: 0">
                                                <tr>
                                                    <td class="borderRight">
                                                        <table>
                                                            <tr>
                                                                <td class="bold">Trouble Code<sub style="color: red;">*</sub>:</td>
                                                                <%--   <td>
                                                        <div class="dropdown">
                                                            <button class="btn dropdown-toggle" type="button" runat="server"
                                                                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                +Thêm
                                                            </button>
                                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                                <div class="navbar-form" role="search">
                                                                    <asp:Label Text="" Visible="false" ForeColor="Red" ID="lblThongbaoThemSuco" Font-Size="Small" runat="server" />
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtThemSuCo"
                                                                        ErrorMessage="Nhập mã sự cố => ví dụ :CK,XL,.." ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMt"
                                                                        ErrorMessage="Nhập mô tả => ví dụ :Cơ Khí,Xy Lanh,.." ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                                    <div class="input-group">
                                                                        <asp:TextBox runat="server" Height="34px" ID="txtThemSuCo"
                                                                            placeholder="Mã sự cố : (CK) ..." CssClass="form-control" Width="130px" />
                                                                        <div class="input-group-btn">
                                                                            <div class="btn-group" role="group">
                                                                                <asp:TextBox runat="server" Height="34px" ID="txtMt"
                                                                                    placeholder="Mô tả : (Cơ Khí) ..." CssClass="form-control" Width="200px" />
                                                                                <asp:LinkButton runat="server" ID="lbkThemSuco" CssClass="btn btn-primary"
                                                                                    OnClick="lbkThemSuco_OnClick"> 
                                                                                    <span class="glyphicon glyphicon glyphicon-ok"
                                                                                     aria-hidden ="true"></span></asp:LinkButton>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>--%>
                                                            </tr>
                                                        </table>
                                                        <asp:DropDownList runat="server" ID="ddCode" CssClass="selectCodepp" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddCode_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table class="table" style="margin-bottom: 0">
                                                <tr>
                                                    <td class="borderRight bold">Machine Code - Machine Name : <sub style="color: red">*</sub>
                                                        <br />
                                                        <asp:DropDownList runat="server" ID="ddCodeMachine" Width="250px" CssClass="selectCodeppCM">
                                                        </asp:DropDownList>
                                                        <asp:Label Text="" ForeColor="Red" ID="lblMamay" runat="server" />
                                                        <%-- <br />  Nhóm máy<sub style="color: red">*</sub>
                                                    <br />
                                                    <asp:Label Text="" ForeColor="Red" ID="lblNhommay" runat="server" />
                                                    <input list="MainContent_myGroupProblem" required name="myGroupProblem"
                                                        id="txtGroupProblem" class="form-control" placeholder="Nhóm máy :OAHU-AHU,Braiding machiner ..." runat="server"
                                                        style="height: 35px; width: 220px" autocomplete="off">
                                                    <datalist id="myGroupProblem" runat="server">
                                                    </datalist>--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table class="table" style="margin-bottom: 0">
                                                <tr>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <td class="bold">Div/Sec <sub style="color: red">*</sub> :</td>
                                                                <td>
                                                                    <div class="dropdown">
                                                                        <button class="btn dropdown-toggle" type="button" runat="server"
                                                                            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                            +Thêm
                                                                        </button>
                                                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                                            <div class="navbar-form" role="search">
                                                                                <asp:Label Text="" Visible="false" ForeColor="Red" ID="lblThongbaoDIv" Font-Size="Small" runat="server" />
                                                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDiv"
                                                                                ErrorMessage="Nhập mã vị trí" ForeColor="#FF3300"></asp:RequiredFieldValidator>  --%>
                                                                                <div class="input-group">
                                                                                    <div class="input-group-btn">
                                                                                        <div class="btn-group" role="group">
                                                                                            <asp:TextBox runat="server" Height="34px" ID="txtDiv"
                                                                                                placeholder="Vị trí" CssClass="form-control" Width="200px" />
                                                                                            <asp:LinkButton runat="server" ID="lbkThemVitri" CssClass="btn btn-primary"
                                                                                                OnClick="lbkThemVitri_OnClick"> 
                                                                                    <span class="glyphicon glyphicon glyphicon-ok"
                                                                                     aria-hidden ="true"></span></asp:LinkButton>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DropDownList runat="server" ID="ddDiv" CssClass="selectDiv">
                                                        </asp:DropDownList>
                                                        <asp:Label Text="" ForeColor="Red" ID="lblDiv" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table class="table" style="margin-bottom: 0">
                                                <tr>
                                                    <td class="borderRight bold">Model Sparepart <sub style="color: red">*</sub>
                                                        <br />
                                                        <asp:DropDownList runat="server" ID="ddModel" Width="250px" CssClass="selectModel">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table class="table" style="margin-bottom: 0">
                                                <tr>
                                                    <td class="bold">Problem <sub style="color: red">*</sub>:
                            <asp:TextBox runat="server" ID="txtSuCo" TextMode="multiline" Columns="50" Rows="2" Width="200px" CssClass="form-control" />
                                                        <asp:Label Text="" ForeColor="Red" ID="lblSuCo" runat="server" />
                                                    </td>
                                                    <td>
                                                        <%--  --%>
                                                        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
                                                        <br />
                                                        <%--  --%>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="bold" colspan="2">Reason <sub style="color: red">*</sub>:
                                           <asp:TextBox ID="txtNguyenNhan" CssClass="form-control" TextMode="multiline" Columns="50" Rows="2" runat="server" />
                                                        <asp:Label Text="" ForeColor="Red" ID="lblNguyenNhan" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table class="table" style="margin-bottom: 0">
                                                <tr>
                                                    <td class="bold">Handle<sub style="color: red">*</sub>:
                            <asp:TextBox runat="server" ID="txtXuly" TextMode="multiline" Columns="60" Rows="3" Width="200px" CssClass="form-control" />
                                                        <asp:Label Text="" ForeColor="Red" ID="lblXuly" runat="server" />
                                                    </td>

                                                    <td>
                                                        <%--  --%>
                                                        <asp:FileUpload ID="FileUpload2" runat="server" AllowMultiple="true" />
                                                        <%--  --%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="bold">Long-term countermeasures:
                                           <asp:TextBox ID="txtLongTerm" CssClass="form-control" TextMode="multiline" Columns="50" Rows="2" runat="server" />
                                                    </td>
                                                </tr>

                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table class="table" style="margin-bottom: 0">
                                                <tr>
                                                    <td rowspan="2" class="bold">Time
                                            <br />
                                                    </td>
                                                    <td>Before<sub style="color: red">*</sub>:
                                                <asp:TextBox runat="server" ID="txtBeforeTime" autocomplete="off" onkeypress="return notChar(event)" CssClass="form-control" />
                                                        <ajaxToolkit:CalendarExtender ID="txtBeforeTime_CalendarExtender" runat="server"
                                                            OnClientDateSelectionChanged="dateselect_txtBeforeTime"
                                                            BehaviorID="txtBeforeTime_CalendarExtender" TargetControlID="txtBeforeTime" />
                                                        <asp:Label Text="" ForeColor="Red" ID="lblTimeB" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="bold">After<sub style="color: red">*</sub>:
                                          <asp:TextBox runat="server" ID="txtAfterTime" autocomplete="off" onkeypress="return notChar(event)" CssClass="form-control" />
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                                                            OnClientDateSelectionChanged="dateselect_txtAfterTime" Format="dd.MMM.yyyy"
                                                            BehaviorID="txtAfterTime_CalendarExtender" TargetControlID="txtAfterTime" />
                                                        <asp:Label Text="" ForeColor="Red" ID="lblTimeA" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table class="table" style="margin-bottom: 0">
                                                <tr>
                                                    <td class="bold">Repairer <sub style="color: red">*</sub>:
                            <asp:TextBox runat="server" ID="txtNguoiSua" CssClass="form-control" />
                                                        <asp:Label Text="" ForeColor="Red" ID="lblNguoiSua" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="bold">Remark :
                              <asp:TextBox ID="txtRemark" CssClass="form-control" TextMode="multiline" Columns="50" Rows="2" runat="server" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr class="alert-info">
                                        <td colspan="2">
                                            <asp:LinkButton Text="Save " ForeColor="#00bcd4" runat="server" CssClass="btn btn-default" ID="lbkSaveAdd" OnClick="lbkSaveAdd_Click" />
                                            <%--                                        <asp:LinkButton Text="Save" ForeColor="#00bcd4" ID="lbkSaveAddHistory" CssClass="btn btn-default" runat="server" OnClick="lbkSaveAddHistory_Click"  />--%>
                                            <asp:LinkButton Text="Cancel" ForeColor="#ff0000" ID="lbkCancelAddHistory" CssClass="btn btn-default" runat="server" OnClick="lbkCancelAddHistory_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:Panel>
                        <br />
                        <br />
                        <%-- end Add --%>
                        <div class="row">
                            <asp:DataList runat="server" CssClass="col-sm-12 col-md-12 col-lg-12" ID="dlHistory"
                                OnItemCommand="dlHistory_ItemCommand" DataKeyField="id_History" OnItemDataBound="dlHistory_ItemDataBound">
                                <ItemTemplate>
                                    <%--                                <asp:Label ID="lblIDHistory" runat="server" Text='<%# Bind("id_History") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblIDMachine" runat="server" Text='<%# Bind("CodeMachineID") %>' Visible="false"></asp:Label>
                                    --%>
                                    <asp:Label ID="lblIDHistory" Font-Size="15px" runat="server" Text='<%# Bind("id_History") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblIDMachine" Font-Size="15px" runat="server" Text='<%# Bind("CodeMachineID") %>' Visible="false"></asp:Label>
                                    <div class="col-sm-12 col-md-12 col-lg-12">
                                        <asp:LinkButton ID="lbkHistory" CommandName="lbkHistory" runat="server" Height="100%" Width="100%"
                                            CssClass="box-shadow list-group-item list-group-item-action" TabIndex="-1" aria-disabled="true">
                                            <div class="col-sm-2 col-md-2 col-lg-2">
                                                <asp:DataList runat="server" ID="dlChildIMG">
                                                    <ItemTemplate>
                                                        <asp:Image ID="imgproblem" runat="server"
                                                            ImageUrl='<%# Eval("multipleIMGURL") %>'
                                                            Width="90px" Height="90px" />
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <asp:DataList runat="server" ID="dlChildMachine" CssClass="center">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCodeMachine" Font-Size="13px" runat="server" Text='<%# Bind("CodeMachine") %>'></asp:Label>
                                                        <br />
                                                        <asp:Label ID="lblMachineName" Font-Size="12px" runat="server" Text='<%# Bind("MachineName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </div>
                                            <div class="col-sm-10 col-md-10 col-lg-10 alert-info">
                                                <table class="table" style="font-size: 14px">
                                                    <tr>
                                                        <td style="display: none">
                                                            <asp:Label ID="lblIdCodemachine" runat="server" Text='<%# Bind("CodeMachineID") %>'></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label Text="Trouble Code: " runat="server" Font-Bold="true" ForeColor="#cc3300" />
                                                            <asp:Label ID="lblCodeProblemHide" runat="server" Text='<%# Bind("CodeProblem") %>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblCodeProblem" runat="server"></asp:Label>
                                                        </td>
                                                        <td>Incident name:
                                    <asp:Label ID="lblProblemName" runat="server" Text='<%# Bind("Problem") %>'></asp:Label>
                                                        </td>
                                                        <td></td>
                                                        <td>
                                                            <asp:LinkButton Text="text" runat="server" CommandName="Delete" Font-Size="X-Large" ForeColor="Red"
                                                                OnClientClick="if (!confirm('Are you sure you want delete?')) return false;">X</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Repairer :
                                           <asp:Label ID="lblRepairer" runat="server" Text='<%# Bind("Repairer") %>'></asp:Label>
                                                        </td>
                                                        <td>End date:
                                           <asp:Label ID="lblCreatedDate" runat="server" Text='<%# Bind("AfterTime") %>'></asp:Label>
                                                        </td>
                                                        <td style="color: seagreen; font-size: 14px">Total Repair Time:
                                                <asp:Label ID="lblRepairTime" runat="server" Text='<%# Bind("RepairTime") %>' Visible="false"></asp:Label>
                                                            <asp:Label Text="" ID="lblTimeRe" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label Text="Div/Sec: " runat="server" Font-Bold="true" Font-Size="Smaller" ForeColor="#8a8484" />
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("DivSec") %>' Font-Size="Smaller" ForeColor="#8a8484"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                            <table>
                                <tr>
                                    <td>
                                        <asp:LinkButton Text="Front page" ID="bt1" CssClass="btn btn-default" runat="server" OnClick="bt1_Click" />
                                    </td>
                                    <td>
                                        <asp:LinkButton Text="Before" ID="bt2" CssClass="btn btn-default" runat="server" OnClick="bt2_Click" />
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" CssClass="btn btn-default" ID="txtTrang" />
                                    </td>
                                    <td>
                                        <asp:LinkButton Text="After" ID="bt3" CssClass="btn btn-default" runat="server" OnClick="bt3_Click" />
                                    </td>
                                    <td>
                                        <asp:LinkButton Text="Last page" ID="bt4" CssClass="btn btn-default" runat="server" OnClick="bt4_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            
        </div>
    </div>
    <asp:HiddenField ID="_IdCodeMachine" runat="server" />



    <script type="text/javascript">
        $(function () {
            $('.select2').select2()
        });
        $(function () {
            $('.selectCodepp').select2();
        });
        $(function () {
            $('.selectDiv').select2();
        });
        $(function () {
            $('.selectCodeppCM').select2();
        });
        $(function () {
            $('.selectModel').select2();
        });
        $(function () {
            $('.selectCodeppCMHistory').select2();
        });
        $('.dropdown-menu').on('click', function (event) {
            event.stopPropagation();
        });

    </script>


</asp:Content>
