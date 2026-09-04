<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScanBarcodePC.aspx.cs" Inherits="QlyMain.ScanBarcodePC" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/plugin/select2/select2.min.css" rel="stylesheet" />
    <script src="<%=ResolveClientUrl("~/Scripts/")%>bootstrap.min.js"></script>
    <script src="<%=ResolveClientUrl("~/Scripts/")%>jquery-3.4.1.min.js"></script>
    <script src="<%=ResolveClientUrl("~/Scripts/")%>jQuery%20UI.js"></script>
    <script src="<%=ResolveClientUrl("~/Content/")%>plugin/select2/select2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.selectScan').select2();
        });
    </script>
    <style>
        body {
            background: #607D8B;
        }

        #rfScan {
            padding: 6px;
            background-color: black;
            font-size: xx-large;
        }

        span.select2-selection.select2-selection--single {
            height: 70px;
            font-size:x-large;
            padding-top: 5%;
            color:cadetblue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row" style="margin-top: 20%">
                <div class="col-sm-1 col-md-1 col-lg-1">
                </div>
                <div class="col-sm-10 col-md-10 col-lg-10">
                    <asp:RequiredFieldValidator ID="rfScan" runat="server" ControlToValidate="ddMachineCode"
                        ErrorMessage="Không được để trống" ForeColor="Red" CssClass="text-center">Không được để trống </asp:RequiredFieldValidator>
                    <asp:Panel runat="server" CssClass="head" ID="pnScanForm" DefaultButton="btnCodeMachine">
                        <div class="navbar-form" role="search">
                            <div class="input-group">
                                <asp:DropDownList ID="ddMachineCode" runat="server" Height="70px" Width="400px"
                                    CssClass="form-control selectScan">
                                </asp:DropDownList>
                                <span class="input-group-btn">
                                    <asp:ImageButton ImageUrl="Img/qr-code2.png" ID="btnCodeMachine" CssClass="btn btn-default" Height="70px" runat="server" OnClick="btnCodeMachine_Click" />
                                </span>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div class="col-sm-1 col-md-1 col-lg-1">
                </div>
            </div>
        </div>
    </form>
</body>
</html>
