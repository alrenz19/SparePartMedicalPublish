<%@ Page Title="Kế hoạch bảo dưỡng" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Scheduler.aspx.cs" Inherits="QlyMain.Admin.Scheduler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .box {
            background: white;
            box-shadow: 0 4px 8px 0 rgb(67 65 65 / 20%), 0 6px 20px 0 rgb(255 255 255 / 0%);
            padding: 2px 0 2px 0;
            width: 100%;
            zoom: 96%;
            padding: 0 15px 0 15px;
            margin-bottom: 2px;
            border-bottom: 2px solid #8cb6ca;
        }

        table tbody th, td {
            padding: 5px;
        }

        .box-shadow2 {
            box-shadow: 1px 1px 1px 1px #424c519c;
            border-radius: 1px;
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

        .grStyle th {
            color: white;
            background: #607d8b;
            /*     border: 1px solid #b5ccd6;*/
            vertical-align: middle;
            text-align: center;
        }

        .paddingTh {
            /* padding-top: 3px !important;
            padding-bottom: 0 !important;*/
        }

        .btn-st {
            color: white;
            background: #607d8b;
        }

        body {
            background: #80808024;
            font-size: 12px;
        }

        .StatusLabelOK {
            /*   background: #caf7fd;
            color: #16616b;
            border-radius: 5px;
            font-family: emoji;
            font-weight: bold;
            padding: 5px;
            border: 1px solid #aee7ee;*/
        }

        .StatusLabelNG {
            background: #ffe2b6;
            color: #513308;
            border-radius: 5px;
            font-family: emoji;
            font-weight: bold;
            padding: 5px;
            border: 1px solid #f8c477;
        }

        .pointer {
            cursor: pointer;
        }

        .btnLabel {
            background: white;
            border-radius: 2px;
            font-family: emoji;
            font-weight: bold;
            padding: 5px;
            border: 1px solid;
        }

        .padding0 {
            padding: 0 !important;
        }

        .marginRight10 {
            margin-right: 10px !important;
        }

        .stBottom {
            border-bottom: 1px solid #e8a0a0;
        }
    </style>
    <script type="text/javascript">
        function dateselect_txtDeadline(ev) {
            var calendarBehavior1 = $find("txtDeadline_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            calendarBehavior1.get_element().value = d.format("MMM.yyyy")
        }
        function dateselect_txtFind(ev) {
            var calendarBehavior1 = $find("txtFind_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            calendarBehavior1.get_element().value = d.format("MMM.yyyy")
        }
        $(window).bind('load', function () {
            var headerChk = $(".chkheader input");
            var itemChk = $(".chkitems input");
            headerChk.bind("click", function () {
                itemChk.each(function () { this.checked = headerChk[0].checked; })
            });
            itemChk.bind("click", function () { if ($(this).checked == false) headerChk[0].checked = false; });
        });
    </script>

    <section class="content-header">
        <h1>Maintenance Plan <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Maintenance Plan</li>
        </ol>
    </section>

    <div class="content">
         
        <div class="row">
            <div class="messagealert" id="alert_container">
            </div>
            <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h6>Maintenance Plan
                       <small>
                           <asp:Label Text="" ID="lblOfMachine" runat="server" />
                       </small>
                        </h6>
                    </div>
                    <div class="panel-body">
                        <div class="row center-block">
                            <div class="col-md-2">
                                <asp:LinkButton Text="" runat="server" ID="lbkOpenAdd" CssClass="btn btn-default marginRight10"
                                    OnClick="lbkOpenAdd_Click"> Add <i class="fa fa-plus" style="color:steelblue"></i></asp:LinkButton>
                            </div>
                            <div class="col-md-10">
                                <asp:Panel runat="server" ID="pnAdd" Visible="false">
                                    <table style="border: 2px solid #607d8b6e" class="">
                                        <tr>
                                            <td><b>Deadline</b><br />
                                                <asp:TextBox runat="server" Height="30px" autocomplete="off" placeholder="Select maintenance period"
                                                    oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                                                    ID="txtDeadline" CssClass="form-control" />
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender" runat="server"
                                                    OnClientDateSelectionChanged="dateselect_txtDeadline"
                                                    BehaviorID="txtDeadline_CalendarExtender" TargetControlID="txtDeadline" />
                                            </td>
                                            <td><b>Select machine</b>
                                                <br />
                                                <asp:DropDownList runat="server" Width="140px" Height="30px"
                                                    ID="drMachine" CssClass="btn btn-default slMachine">
                                                </asp:DropDownList></td>
                                            <td>
                                                <b>Department</b>
                                                <asp:DropDownList ID="ddDivS" runat="server" Width="90px"
                                                    CssClass="btn btn-default selectSec">
                                                </asp:DropDownList>
                                            </td>
                                            <td><b>Location</b>
                                                <asp:DropDownList ID="ddPlace" runat="server" Width="120px"
                                                    CssClass="btn btn-default selectPlace">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <b>P.I.C</b>
                                                <asp:TextBox runat="server" placeholder="Leader Name" ID="txtPIC" CssClass="form-control" />
                                            </td>
                                            <td><b>Remark</b>
                                                <asp:TextBox runat="server" placeholder="Remark..." ID="txtRemark" CssClass="form-control" />
                                            </td>
                                            <td>
                                                <br />
                                                <asp:LinkButton Text="Add device" Height="30px"
                                                    CssClass="btn btn-default btn-st" ID="lbkAdd" runat="server" OnClick="lbkAdd_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <div class="alert-info">
                                    <span>Yes <b>
                                        <asp:Label Text="" ID="lblTT" runat="server" ForeColor="#087380" Font-Bold="true" /></b>machine under maintenance  
                                <asp:Label ID="lblMonthOk" runat="server" Font-Bold="true" ForeColor="#087380" />
                                    </span>
                                    <br />
                                    <p style="font-style: italic">Status : </p>
                                    <ul>
                                        <li>
                                            <span>Yes <b>
                                                <asp:Label Text="" ID="lblOKSr" runat="server" Font-Bold="true" /></b> has been maintained.
                                            </span>
                                        </li>
                                        <li><span>Yes <b>
                                            <asp:Label Text="" ID="lblNGSr" Font-Bold="true" ForeColor="#cc7a02" runat="server" />

                                        </b>Machine not maintained.</span></li>
                                        <li><span>Yes <b>
                                            <asp:Label Text="" ID="lblchamSr" Font-Bold="true" runat="server" />

                                        </b>The machine is behind schedule.</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row center-block">
                            <div class="col-md-4">
                                <asp:LinkButton Text="Delete List" CssClass="btn btn-default" ID="btnDelAll" runat="server" OnClientClick="if(!confirm('Are you sure you want to delete this machine?')) return false;" OnClick="btnDelAll_Click"> 
                                    Delete  List    <span class="glyphicon glyphicon-trash" style="color:gray"></span></asp:LinkButton>
                            </div>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <asp:TextBox runat="server" CssClass="form-control"
                                        Height="35px" autocomplete="off"
                                        ID="txtFind" />
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                                        OnClientDateSelectionChanged="dateselect_txtFind"
                                        BehaviorID="txtFind_CalendarExtender" TargetControlID="txtFind" />
                                    <span class="input-group-btn">
                                        <asp:LinkButton ID="lbkFind" Height="35px"
                                            CssClass="btn btn-default btn-st" runat="server" OnClick="lbkFind_Click">Find
                                            <i class="fa fa-search"></i>
                                        </asp:LinkButton>
                                    </span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:LinkButton Text="" runat="server" OnClick="Unnamed3_Click"><i style="font-size:24px" class="fa">&#xf021;</i></asp:LinkButton>
                                <asp:DropDownList runat="server" CssClass="btn btn-default" AutoPostBack="true"
                                    ID="drChooseStatus" OnSelectedIndexChanged="drChooseStatus_SelectedIndexChanged">
                                    <asp:ListItem Text="All" Value="0" />
                                    <asp:ListItem Text="Has been maintained" Value="1" />
                                    <asp:ListItem Text="Has not been maintained" Value="2" />
                                    <asp:ListItem Text="Behind schedule" Value="3" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row center-block margin-top">
                            <span><b>Number of lines displayed:</b>
                                <asp:DropDownList ID="ddlDong" runat="server"
                                    CssClass="dropdown" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlDong_SelectedIndexChanged">
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>70</asp:ListItem>
                                    <asp:ListItem>100</asp:ListItem>
                                </asp:DropDownList>
                            </span>
                        </div>
                        <div class="row center-block">
                            <asp:GridView runat="server" ID="gvScheduler" AutoGenerateColumns="False" DataKeyNames="id"
                                OnPageIndexChanging="gvSP_PageIndexChanging" AllowPaging="True" PageSize="30"
                                CssClass="table grStyle <%--box-shadow1--%> center" OnRowCommand="gvScheduler_RowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderStyle-CssClass="" ItemStyle-CssClass="padding0">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkboxSelectAll" CssClass="chkheader"
                                                runat="server" Text=" Select all" />
                                            <br />
                                            <asp:LinkButton runat="server" ID="btnOk" CssClass="btn btn-default btn-xs" ForeColor="#1f8b99" CommandName="OK">                                            
           <label class="pointer">Maintenance</label></span>
                                            </asp:LinkButton>

                                            <asp:LinkButton Text="" ID="btnNG" runat="server" CssClass="btn btn-default btn-xs" ForeColor="#a3783c" CommandName="NG">                                            
                  <label class="pointer">Cancel</label></asp:LinkButton>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <table>
                                                <tr>
                                                    <td style="font-weight: bolder; font-size: 15px;">
                                                        <asp:CheckBox ID="SelectCheckBox" CssClass="chkitems" runat="server" />
                                                    </td>
                                                    <td style="font-weight: bolder; font-size: 15px;">
                                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False"
                                                            CommandName="Delete1" Text="Delete" OnClientClick="if(!confirm('Are you sure you want to delete this device?')) return false;">
<span class="glyphicon glyphicon-trash" style="color:gray"></span>
                                                        </asp:LinkButton>
                                                    </td>
                                                    <td style="font-weight: bolder; font-size: 15px; padding: 0 !important">
                                                        <%# Container.DataItemIndex+1 %> 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <asp:TextBox runat="server" Text='<%# Bind("Remark") %>' placeholder="Remark" CssClass="form-control input-sm" ID="txtRemark" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="paddingTh" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mã máy">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CodeMachine") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CodeMachine") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="paddingT" Font-Bold="True" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="MachineName" HeaderText="Machine name" HeaderStyle-CssClass="paddingT" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle Font-Bold="True" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SecDiv" HeaderText="Department" HeaderStyle-CssClass="paddingT" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle Font-Bold="True" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Place" HeaderText="Location" HeaderStyle-CssClass="paddingT" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle Font-Bold="True" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DueDate" HeaderText="Deadline" DataFormatString="{0:MMM.yy}" HeaderStyle-CssClass="paddingT" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle Font-Bold="True" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="PIC" HeaderText="P.I.C" HeaderStyle-CssClass="paddingT" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle Font-Bold="True" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Remark" HeaderText="Remark" HeaderStyle-CssClass="paddingT" HeaderStyle-Font-Bold="true">
                                        <HeaderStyle Font-Bold="True" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Status" HeaderStyle-CssClass="paddingT"
                                        HeaderStyle-Font-Bold="true">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("isStatus") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("isStatus").ToString() == "True" ? 
                                         "Đã bảo dưỡng" : "Chưa bảo dưỡng"%>'
                                                CssClass='<%# Eval("isStatus").ToString() == "True" ? "label label-success" : "label label-warning" %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Font-Bold="True" />
                                    </asp:TemplateField>
                                </Columns>
                                <PagerSettings Mode="NumericFirstLast" />
                                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     

    <div class="col-md-12">
        <asp:Panel runat="server">
        </asp:Panel>
    </div>

        </div>
    <asp:HiddenField ID="_Status" runat="server" />
    <asp:HiddenField ID="_idCodeMachine" runat="server" />

    <script type="text/javascript">
        $(function () {
            $('.slMachine').select2()
        });
        $(function () {
            $('.selectSec').select2();
        });
        $(function () {
            $('.selectPlace').select2();
        });
    </script>
</asp:Content>
