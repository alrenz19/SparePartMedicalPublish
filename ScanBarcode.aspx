<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScanBarcode.aspx.cs" Inherits="QlyMain.ScanBarcode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <style>
        body {
            background: #607D8B;
        }
        #rfScan{
            padding:6px;
            background-color:black;
            font-size:xx-large;
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
                    <asp:Label Text="" ID="lblThongbao" Font-Bold="true" runat="server" />
                    <asp:RequiredFieldValidator ID="rfScan" runat="server" ControlToValidate="txtScanCodeMachine"
                        ErrorMessage="Không được để trống" ForeColor="Red" CssClass="text-center">Không được để trống </asp:RequiredFieldValidator>                    
                    <asp:Panel runat="server" CssClass="head" ID="pnScanForm" DefaultButton="btnCodeMachine">
                        <div class="navbar-form" role="search">
                            <div class="input-group">
                                <asp:TextBox runat="server" Height="70px" Width="400px" ID="txtScanCodeMachine" placeholder="Scan QRcode..." CssClass="form-control" />
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
