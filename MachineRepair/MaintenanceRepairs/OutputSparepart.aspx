<%@ Page Title="List" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="OutputSparepart.aspx.cs" Inherits="QlyMain.MaintenanceRepairs.OutputSparepart" MaintainScrollPositionOnPostback="true" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>

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
        function dateselect_txtDateOut(ev) {
            var calendarBehavior1 = $find("txtDateOut_CalendarExtender");
            var d = calendarBehavior1.get_selectedDate();
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

        <div class="panel panel-primary">
            <div class="panel-heading">
                Output Sparepart
            </div>
        </div>

        <div class="box-shadow1">
            <asp:Panel runat="server" ID="pnDateOut">
                <div class="input-group" style="width: 400px">
                    <div class="input-group-addon"><b>Output Date</b> <span style="color: red">*</span></div>
                    <asp:TextBox ID="txtOutputDate" CssClass="txtOuput" autocomplete="off" runat="server" Text=""></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server"
                        OnClientDateSelectionChanged="dateselect_txtOutputDate"
                        BehaviorID="txtOutputDate_CalendarExtender" TargetControlID="txtOutputDate" />
                </div>

                <div class="input-group-addon" style="background-color: #7ba2b8">
                    <asp:LinkButton Text="Select Sparepart" ForeColor="White" ID="lbkOpen" OnClick="lbkOpen_Click" runat="server"><span class="glyphicon glyphicon-link"></span> Select Sparepart </asp:LinkButton>
                </div>
            </asp:Panel>
            <br />
            <asp:GridView ID="gvListSP" runat="server" AutoGenerateColumns="False"
                DataKeyNames="Id" CssClass="table table-bordered table-condensed"
                EmptyDataText="No data"
                EmptyDataRowStyle-HorizontalAlign="Center" OnRowCommand="gvListSP_RowCommand" OnRowDataBound="gvListSP_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" />
                    <asp:BoundField DataField="PositionSave" HeaderText="Position" />
                    <asp:BoundField DataField="Partname" HeaderText="Partname" />
                    <asp:BoundField DataField="ItemCode" HeaderText="Item Code" />
                    <asp:BoundField DataField="Model" HeaderText="Model" />
                    <asp:TemplateField HeaderText="Ouput old">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("QtyOuputOLD") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" BackColor="#ea5e4d" CssClass="padding5" ForeColor="White" Font-Size="15px" runat="server" Text='<%# Bind("QtyOuputOLD") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date Output">
                        <ItemTemplate>
                            <asp:TextBox ID="txtDateOut" runat="server" Text='<%# Bind("QtyDate") %>'></asp:TextBox>
                               <cc1:CalendarExtender ID="CalendarExtender1" runat="server"
                    TargetControlID="txtDateOut"
                    OnClientDateSelectionChanged="dateselect_txtDateOut" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQtyOuput" onkeypress="return (event.charCode >= 48 && event.charCode <= 57) || event.charCode === 46" Width="40px" runat="server" Text='<%# Bind("QtyOuput") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Remark">
                        <ItemTemplate>
                            <asp:TextBox ID="txtRemark" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lblState" Visible="false" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                            <asp:LinkButton runat="server" ID="lbkSave" CssClass="btn btn-success" Text="Save Output" CommandName="Save"></asp:LinkButton>
                            |                                                
                                                <asp:LinkButton runat="server" CssClass="btn btn-warning" Text="Restore" CommandName="Restore"></asp:LinkButton>
                            |
                                            <asp:LinkButton runat="server" CssClass="btn btn-default" Text="Delete" CommandName="Del" OnClientClick="if (!confirm('Are you sure you want delete?')) return false;"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>
            </asp:GridView>
        </div>
        <div>
            <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
            <cc1:ModalPopupExtender ID="mpOpen" BehaviorID="mpe" runat="server"
                PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground" CancelControlID="btnHide">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none;">
                <div class="table-wrapper">
                    <div class="input-group">
                        <asp:TextBox runat="server" Height="34px" Font-Size="11px" autocomplete="off" Width="150px" ID="txtSearchSP"
                            placeholder="Search " CssClass="form-control" />
                        <asp:LinkButton Text="text" runat="server" ID="lbkFind" CssClass="btn btn-info" OnClick="lbkFind_Click"><span class="glyphicon glyphicon-search"></span> Search</asp:LinkButton>
                    </div>
                    <asp:GridView ID="gvSP" runat="server" AutoGenerateColumns="false"
                        DataKeyNames="PartID" OnRowDataBound="gvSP_RowDataBound"
                        CssClass="table table-bordered table-condensed table-hover"
                        ShowHeaderWhenEmpty="false" OnSelectedIndexChanged="gvSP_SelectedIndexChanged"
                        EmptyDataText="No data" EnableEventValidation="true"
                        EmptyDataRowStyle-HorizontalAlign="Center"
                        HeaderStyle-CssClass="gridview-header">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="PartID" HeaderText="Id" />
                            <asp:BoundField DataField="PositionSave" HeaderText="Position" />
                            <asp:BoundField DataField="PartName" HeaderText="PartName" />
                            <%--<asp:TemplateField HeaderText="PictureURL">                              
                                <ItemTemplate>
                                    <asp:Label ID="lblUrlPictrue" Visible="false" Text='<%# Eval("PictureURL") %>' runat="server" />
                                    <asp:Image ID="imgproblem" runat="server" ImageUrl='<%# Eval("PictureURL") %>'
                                        Width="80" Height="80" CssClass="image-zoom" onclick="zoomImage(this);" />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:BoundField DataField="Model" HeaderText="Model" />
                            <asp:BoundField DataField="ItemCode" HeaderText="ItemCode" />
                            <asp:BoundField DataField="SafetyStock" HeaderText="SafetyStock" />
                            <asp:BoundField DataField="QtyStock" HeaderText="QtyStock" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="footer">
                    <asp:Button ID="btnHide" runat="server" Text="Close" />
                </div>
            </asp:Panel>
        </div>
    </div>
    <div id="divBackground" class="modal">
    </div>

    <asp:Panel runat="server" ID="panelHide" Visible="false">
        MaintenanceRepairID:  
        <asp:TextBox ID="txtMaintenanceRepairID" runat="server" class="form-control"></asp:TextBox>
        RequestID: 
        <asp:TextBox ID="txtRequestID" runat="server" class="form-control"></asp:TextBox>
        User input ID: 
        <asp:TextBox ID="txtUserID" runat="server" class="form-control"></asp:TextBox>
    </asp:Panel>
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
