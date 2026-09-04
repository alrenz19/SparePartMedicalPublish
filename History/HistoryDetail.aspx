<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"
    CodeBehind="HistoryDetail.aspx.cs" Inherits="QlyMaint.History.HistoryDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        html {
            scroll-behavior: smooth;
        }

        #MenuHistory {
            position: fixed;
            right: 0;
            left: 85%;
            margin-top: -8em;
            overflow-y: scroll;
            z-index: 1;
            top: 50%;
            font-size: medium;
            font-weight: bold;
        }

        body {
            background-color: #ececec;
        }

        .borderRadius {
            border-radius: 5px;
        }

        nav.navbar-fixed-bottom {
            width: 70px;
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
    </style>
    <script type="text/javascript">
        function dateselect_txtBeforeTime(ev) {
            var calendarBehavior1 = $find("txtBeforeTime_CalendarExtender");
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
        function dateselect_txtCreatedDate(ev) {
            var calendarBehavior1 = $find("txtCreatedDate_CalendarExtender");
            var d = calendarBehavior1._selectedDate;
            var now = new Date();
            calendarBehavior1.get_element().value = d.format("dd.MMM.yyyy")
        }
    </script>
    <section class="content-header">
        <asp:HyperLink runat="server" ID="HyperLinkBackPageLot" Font-Bold="true"
            NavigateUrl="~/History/History.aspx" CssClass="btn btn-Link"><i class="fa fa-backward"></i> Back </asp:HyperLink>
        <asp:Label Text="" ID="lblThongbao" Visible="false" runat="server" Font-Size="X-Large" Font-Bold="true" CssClass="center" />
        <h2 class="center" style="font-weight: bolder; color: #2f7395">
            <asp:Label Text="" ID="lblMachineName" runat="server" />
        </h2>
    </section>
    <div class="content">
        <div class="box-shadow1">
            <asp:DataList runat="server" ID="dlHistoryDetail" CssClass="col-sm-12 col-md-12 col-lg-12 table"
                DataKeyField="id_History" OnItemCommand="dlHistory_ItemCommand" Font-Size="18px"
                OnItemDataBound="dlHistoryDetail_ItemDataBound">
                <ItemTemplate>
                    <asp:Label ID="lblIDHistory" Visible="false" runat="server" Text='<%# Bind("id_History") %>'></asp:Label>
                    <div class="row">
                        <div class="col-sm-10 col-md-10 col-lg-10">
                        </div>
                        <div class="col-sm-2 col-md-2 col-lg-2">
                            <nav class="navbar-fixed-bottom" role="navigation">
                                <div class="text-right" style="margin-bottom: 10%; margin-right: 3%">
                                    <asp:LinkButton CssClass="sticky btn" ForeColor="white" BackColor="#607d8b" BorderColor="Black" runat="server" CommandName="Edit">
                                             <b>Edit history <i class="fa fa-pencil"></i></b>
                                    </asp:LinkButton>
                                </div>
                            </nav>
                        </div>
                    </div>
                    <div class="row box-shadow1">
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <div class="row  borderRadius" style="color: #607d8b">
                                <table class="table">
                                    <tr>
                                        <td style="display: none; padding-bottom: 20px">
                                            <asp:Label ID="lblCodeMachineID" runat="server" Text='<%# Bind("CodeMachineID") %>'></asp:Label>
                                        </td>
                                        <td><b style="color: black; padding-bottom: 20px">
                                            Problem Code :</b>
                                            <asp:Label ID="lblCodeProblem" runat="server" Text='<%# Bind("CodeProblem") %>'></asp:Label>
                                        </td>
                                        <td><b style="color: black; padding-bottom: 20px">
                                            Repairer:</b>
                                            <asp:Label ID="lblRepairer" runat="server" Text='<%# Bind("Repairer") %>'></asp:Label>
                                        </td>
                                        <td><b style="color: black; padding-bottom: 20px">
                                            Created Date :</b>
                                            <asp:Label ID="lblCreateDate" runat="server" Text='<%# Bind("CreatedDate") %>'></asp:Label>
                                        </td>
                                        <td><b style="color: black; padding-bottom: 20px">Div/Sec  :</b>
                                            <asp:Label ID="lblDivSec" runat="server" Text='<%# Bind("DivSec") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row box-shadow1">
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <div class="row  borderRadius">
                                <table class="table" style="color: #607d8b">
                                    <tr>
                                        <td><b style="color: black">
                                            Start Time :</b>
                                            <asp:Label ID="lblBeforeTime" runat="server" Text='<%# Bind("BeforeTime") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <b style="color: black">
                                                End Time :</b>
                                            <asp:Label ID="lblAfterTime" runat="server" Text='<%# Bind("AfterTime") %>'></asp:Label>
                                        </td>
                                        <td><b style="color: black">
                                            Time Duration :</b>
                                            <asp:Label ID="lblTimeduration" runat="server" Text='<%# Bind("RepairTime") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row box-shadow1">
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <div class="row  borderRadius">
                                <table class="table" style="color: #607d8b">
                                    <tr>
                                        <td><b style="color: black">Status when the problem is detected</b>
                                            <asp:Label ID="lblStateWhenFound" runat="server" Text='<%# Bind("StateWhenFound") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="row box-shadow1">
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <div class="row  borderRadius" style="color: #607d8b;">
                                <table class="table">
                                    <tr>
                                        <td><b style="color: black">
                                            Problem:</b>
                                            <asp:Label ID="lblProblemName" runat="server" Text='<%# Bind("Problem") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <div style="width: 400px; height: 200px; overflow-x: scroll;">
                                                <asp:DataList runat="server" ID="dlChildImg" RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <div style="padding: 2px">
                                                            <asp:Image ID="imgproblem" runat="server" ImageUrl='<%# Eval("multipleIMGURL") %>'
                                                                Width="150px" Height="150px" CssClass="image-zoom" onclick="zoomImage(this);" />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><b style="color: black">Steps to check and confirm the problem</b>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("StepCheckAndConfirm") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><b style="color: black">
                                            Reason:</b>
                                            <asp:Label ID="lblNguyenNhan" runat="server" Text='<%# Bind("Reason") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><b style="color: black">
                                            Handling:</b>
                                            <asp:Label ID="lblXuly" runat="server" Text='<%# Bind("Handling") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <div style="width: 400px; height: 200px; overflow-x: scroll;">
                                                <asp:DataList runat="server" ID="dlChildHandling" RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <div style="padding: 2px">
                                                            <asp:Image ID="imgHandlingURL" runat="server" ImageUrl='<%# Eval("multipleIMGURL") %>'
                                                                Width="150px" Height="150px" CssClass="image-zoom" onclick="zoomImage(this);" />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><b style="color: black">
                                            Long-term Countermeasures:</b>
                                            <asp:Label ID="lblLongTerm" runat="server" Text='<%# Bind("LongTerm") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><b style="color: black">Remark :</b>
                                            <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="row">
                        <div class="col-sm-10 col-md-10 col-lg-10">
                        </div>
                        <div class="col-sm-2 col-md-2 col-lg-2">
                            <nav class="navbar-fixed-bottom" role="navigation" style="width: 100px">
                                <div class="text-right" style="margin-bottom: 10%; margin-right: 3%">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:LinkButton CssClass="sticky btn btn-default" BorderColor="Black" ForeColor="Green"
                                                    Font-Size="15px" runat="server" CommandName="Update">
                                                 <b>Save <i class="fa fa-check"></i></b> 
                                                </asp:LinkButton></td>
                                            <td>
                                                <asp:LinkButton Text="text" runat="server" BorderColor="Black" ForeColor="Red" CssClass="sticky btn btn-default"
                                                    Font-Size="15px" CommandName="Cancel">
                                                        <b> Cancel <i class="fa fa-close"></i></b> 
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </nav>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-12 borderRadius">
                            <table class="table box-shadow1" style="padding: 5px">
                                <tr>
                                    <td class="padding6" style="padding-top: 16px"><b style="color: black">
                                        Problem Code:</b><br />
                                        <asp:Label ID="lblCodeProblemEdit" runat="server" Text='<%# Bind("CodeProblem") %>' Visible="false"></asp:Label>
                                        <asp:DropDownList runat="server" ID="ddCode" CssClass="selectCodepp" Height="50px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="padding6"><b style="color: black">
                                        Repairer :</b>
                                        <asp:TextBox ID="txtRepairer" runat="server" Text='<%# Bind("Repairer") %>' CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td><b style="color: black">
                                        Created Date:</b>
                                        <asp:TextBox ID="txtCreatedDate" runat="server" Text='<%# Bind("CreatedDate") %>' CssClass="form-control"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                                            OnClientDateSelectionChanged="dateselect_txtCreatedDate"
                                            BehaviorID="txtCreatedDate_CalendarExtender" TargetControlID="txtCreatedDate" />
                                    </td>
                                    <td>
                                        <b style="color: black">Div/Sec :</b><br />
                                        <asp:Label ID="lblDiv" runat="server" Text='<%# Bind("DivSec") %>' Visible="false"></asp:Label>
                                        <asp:DropDownList runat="server" ID="ddDiv" CssClass="selectDiv">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <table class="table box-shadow1">
                                <tr>
                                    <td><b style="color: black">
                                        Start Time:</b>
                                        <asp:TextBox ID="txtBeforeTime" runat="server" Text='<%# Bind("BeforeTime") %>' CssClass="form-control"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server"
                                            OnClientDateSelectionChanged="dateselect_txtBeforeTime"
                                            BehaviorID="txtBeforeTime_CalendarExtender" TargetControlID="txtBeforeTime" />
                                    </td>
                                    <td>
                                        <b style="color: black">
                                            End Time :</b>
                                        <asp:TextBox ID="txtAfterTime" runat="server" Text='<%# Bind("AfterTime") %>' CssClass="form-control"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server"
                                            OnClientDateSelectionChanged="dateselect_txtAfterTime"
                                            BehaviorID="txtAfterTime_CalendarExtender" TargetControlID="txtAfterTime" />

                                    </td>
                                    <td><b style="color: black">
                                        Time Duration :</b>
                                        <asp:Label ID="lblTimeduration" runat="server" Text='<%# Bind("RepairTime") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <table class="table box-shadow1">
                                <tr>
                                    <td><b style="color: black">Status when the problem is detected</b>
                                        <asp:TextBox ID="txtStateWhenFound" runat="server" Text='<%# Bind("StateWhenFound") %>' CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <table class="table box-shadow1">
                                <tr>
                                    <td><b style="color: black">
                                        Problem:</b>
                                        <asp:TextBox ID="txtProblem" runat="server" Text='<%# Bind("Problem") %>' TextMode="multiline" Columns="50" Rows="2" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <span>
                                            <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
                                            <asp:LinkButton CssClass="btn btn-default" ForeColor="Black" Font-Size="12px" runat="server" CommandName="uploadSUCO">
                                                               Upload File
                                            </asp:LinkButton>
                                        </span>
                                        <br />
                                        <div style="width: 400px; height: 200px; overflow-x: scroll">
                                            <asp:DataList runat="server" ID="dlChildImgEdit" RepeatDirection="Horizontal"
                                                OnItemCommand="dlChildImgEdit_ItemCommand">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIDSUCO" runat="server" Text='<%# Bind("id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblIDHistory" runat="server" Text='<%# Bind("idHistory") %>' Visible="false"></asp:Label>
                                                    <div style="padding: 2px">
                                                        <asp:LinkButton Text="" CommandName="sucoCancel" runat="server"
                                                            OnClientClick="if (!confirm('Are you sure you want to delete this image?')) return false;">
                                                            <asp:Label ID="lblX" CssClass="lbl" Text="X" runat="server" ForeColor="Red" />
                                                        </asp:LinkButton>
                                                        <asp:Image ID="imgproblemEit" runat="server" ImageUrl='<%# Eval("multipleIMGURL") %>'
                                                            Width="150px" Height="150px" />
                                                    </div>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b style="color: black">Steps to check and confirm the problem</b>
                                        <asp:TextBox ID="txtStepCheckAndConfirm" TextMode="multiline" Columns="150" Rows="4" runat="server" Text='<%# Bind("StepCheckAndConfirm") %>' CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"><b style="color: black">
                                        Reason :</b>
                                        <asp:TextBox ID="txtReason" runat="server" Text='<%# Bind("Reason") %>' TextMode="multiline"
                                            Columns="150" Rows="2" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b style="color: black">
                                        Handling:</b>
                                        <asp:TextBox ID="txtHandling" runat="server" Text='<%# Bind("Handling") %>' TextMode="multiline" Columns="50" Rows="2" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <span>
                                            <asp:FileUpload ID="FileUpload2" runat="server" AllowMultiple="true" />
                                            <asp:LinkButton CssClass="btn btn-default" ForeColor="Black" Font-Size="12px" runat="server"
                                                CommandName="uploadHandling">
                                                               Upload File
                                            </asp:LinkButton>
                                        </span>
                                        <br />
                                        <div style="width: 400px; height: 200px; overflow-x: scroll">
                                            <asp:DataList runat="server" ID="dlChildHandlingURLEdit" RepeatDirection="Horizontal"
                                                OnItemCommand="dlChildHandlingURLEdit_ItemCommand">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIDHandling" runat="server" Text='<%# Bind("id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblIDHistoryH" runat="server" Text='<%# Bind("idHistory") %>' Visible="false"></asp:Label>
                                                    <div style="padding: 2px">
                                                        <asp:LinkButton Text="" CommandName="HandlingCancel" runat="server"
                                                            OnClientClick="if (!confirm('Are you sure you want to delete this image?')) return false;">
                                                            <asp:Label ID="lblX" CssClass="lbl" Text="X" runat="server" ForeColor="Red" />
                                                        </asp:LinkButton>
                                                        <asp:Image ID="imgHandlingURLEdit" runat="server" ImageUrl='<%# Eval("multipleIMGURL") %>'
                                                            Width="150px" Height="150px" />
                                                    </div>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"><b style="color: black">
                                        Long-term Countermeasures:</b>
                                        <asp:TextBox ID="txtLongTerm" runat="server" Text='<%# Bind("LongTerm") %>' TextMode="multiline" Columns="50" Rows="2" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"><b style="color: black">Remark :</b>
                                        <asp:TextBox ID="txtRemark" runat="server" Text='<%# Bind("Remark") %>' TextMode="multiline" Columns="50" Rows="2" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </EditItemTemplate>
            </asp:DataList>
            <asp:HyperLink runat="server" ID="HyperLink1" Font-Bold="true"
                NavigateUrl="~/History/History.aspx" CssClass="btn btn-Link"><i class="fa fa-backward"></i> Back </asp:HyperLink>
        </div>
    </div>
    <asp:HiddenField ID="_idHistory" runat="server" />
    <asp:HiddenField ID="_IdCodeMachine" runat="server" />
    <script type="text/javascript">
        $(function () {
            $('.selectDiv').select2();
        });
        $(function () {
            $('.selectCodepp').select2();
        });

    </script>
</asp:Content>

