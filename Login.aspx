<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QlyMain.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <link href="Content/loginCss.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <title></title>
    <style>
        .box-shadow {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            margin: 1%;
            padding: 0.5%;
            font-size: x-large;
        }

        body {
            background-color: #607D8B;
            font-size: xx-large;
        }

        .ImgbRadius {
            border-radius: 100px;
            border: 1px solid #65d3e1;
        }

        #ImgbRadius {
            border-radius: 100px;
            border: 1px solid #65d3e1;
        }

        #divLogin {
            /*  width: 100%;
            height: 100%;*/
            background-color: white;
            border-radius: 10px;
            padding: 10%;
        }

        #btnLogin {
            background-color: #5f9ea0;
            border-color: #00BCD4;
            color: black;
        }

            #btnLogin :hover {
                color: white;
                border-color: #3bb9bd;
                margin-left: 25%;
            }

        .margin {
            margin: 5px;
        }

        .overflow {
            overflow-x: scroll;
        }
    </style>
    <script type="text/javascript">
        function Confirm() {
            var confirm_value = document.getElementById('confirm_value');
            if (!confirm_value) { //create element only if not found
                confirm_value = document.createElement("INPUT");
                confirm_value.type = "hidden";
                confirm_value.name = "confirm_value";
                confirm_value.id = "confirm_value";

                document.forms[0].appendChild(confirm_value);
            }
            if (confirm("Bạn muốn Scan barcode ?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <br />
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div>
                    <div class="row">
                        <div class="col-3 col-s-3  col-md-3">
                        </div>
                        <div class="col-6 col-s-6 col-md-6">
                            <table id="divLogin" style="margin-top: 5%; height: 80%; margin-left: 20%;">
                                <tr>
                                    <td style="border-radius: 10px 10px 0 0;">
                                        <h1 style="text-align: center; font-weight: bold; font-family: cursive">login</h1>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="row" style="background-color: cadetblue; border-radius: 5px">
                                            <div class="col-s-4 col-4">
                                            </div>
                                            <div class="col-s-4 col-4">
                                                <asp:ImageButton CssClass="ImgbRadius" ID="imgChange" Width="130" Height="130"
                                                    ImageUrl="Img/qr-code2.png" runat="server" />
                                            </div>
                                            <div class="col-s-4 col-4">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="font-family: cursive; margin-top: 20px; margin: 15px; line-height: 2em">
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Label ID="FailureText" runat="server"
                                                        ForeColor="Red"
                                                        Font-Bold="True"
                                                        Font-Size="18pt"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>User Code:</td>
                                                <td>
                                                    <asp:Panel runat="server" DefaultButton="btnLogin">
                                                        <asp:TextBox runat="server" Width="250" Height="50"
                                                            autocomplete="off" CssClass="form-control" ID="txtUserCode"
                                                            Font-Bold="true" ForeColor="#00bcd4" Font-Size="Large" />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Password:</td>
                                                <td>
                                                    <asp:Panel runat="server" DefaultButton="btnLogin">
                                                        <asp:TextBox runat="server" Width="250" Height="50" TextMode="Password"
                                                            autocomplete="off" CssClass="form-control" ID="txtPassword"
                                                            Font-Bold="true" ForeColor="#00bcd4" Font-Size="Large" />
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="margin: 8px;">
                                            <tr>
                                                <td>
                                                    <%-- <div style="overflow-x:scroll;width:460px">
                                                        <asp:DataList runat="server" ID="dlUser" RepeatDirection="Horizontal" DataKeyField="Id_User"
                                                            CellSpacing="15" Width="50%" CellPadding="15" CssClass="overflow" OnItemCommand="dlUser_ItemCommand" OnItemDataBound="dlUser_ItemDataBound">
                                                            <ItemTemplate>
                                                                <table class="text-center">
                                                                    <tr>
                                                                        <td style="padding: 4px">
                                                                            <asp:ImageButton CssClas="ImgbRadius margin" ID="ImgbRadius" Width="80" Height="80"
                                                                                ImageUrl='<%# Bind("ImageSignature") %>' runat="server"
                                                                                CommandName="OnClick" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="padding: 4px">
                                                                            <asp:Label ID="Label2" CssClass="text-center" runat="server" Font-Size="Medium"
                                                                                Text='<%# Bind("UserCode") %>' ForeColor="#54cdd3"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </div>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="margin-left: 50%"><%--OnClientClick="Confirm" --%>
                                                    <asp:LinkButton Text="Save" ID="btnLogin" class="btn" runat="server" OnClick="btnLogin_Click">
                                                    <i class="fa fa-sign-in" aria-hidden="true"><asp:label text="Login" Font-Bold="true" Font-Size="X-Large" runat="server" /> </i>
                                                    </asp:LinkButton></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-3 col-s-3  col-md-3">
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <table style="box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); border:1px solid">
            <tr>
                <td>
                    <h2>Forgot your password? No problem! </h2>
                </td>
            </tr>
            <tr>
                <td>
                    <h3>You can set a new one now! Click the link below! </h3>
                </td>
            </tr>
            <tr>
                <td>                    
                   Reset your CodePen password
                </td>
            </tr>
            <tr>
                <td>
                    <h2>Forgot your password? No problem! </h2>
                </td>
            </tr>
        </table>
        <br />
        <%--  style="display: none"--%>
        <div style="display: none">
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-primary" />
            <asp:LinkButton Text="OK" CssClass="btn btn-default" ID="btnUploadE3" runat="server" OnClick="btnUploadE3_Click" />
            <br />
            <br />
        </div>
        <asp:HiddenField ID="_IdCodeMachine" runat="server" />
        <asp:HiddenField ID="_url" runat="server" />
        <asp:HiddenField ID="_UserID" runat="server" />
    </form>
</body>
</html>
