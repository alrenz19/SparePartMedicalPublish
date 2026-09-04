<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LOG.aspx.cs" Inherits="QlyMain.LOG" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxControl" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="Content/Log.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/Site.js"></script>
    <style>
        body {
            background-image: url("Content/BG3.jpg");
            /* Full height */
            height: 100%;
            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            font-family: 'emoji'
        }
        .img:before {
            content: "";
            position: absolute;
            right: 0;
            top: 0;
            width: 900px;
            height: 100%;
            background-image: url("Content/asahi1.png");
            background-size: cover;
            transition: transform 1.2s ease-in-out;
        }
        .img:after {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgb(0 0 0 / 34%);
        }

        .back-to-signin {
            color: black;
        }

        :focus {
            outline: none;
        }
        /* necessary to give position: relative to parent. */
        input[type="text"] {
            font: 15px/24px "Muli", sans-serif;
            color: #333;
            width: 100%;
            box-sizing: border-box;
            letter-spacing: 1px;
        }

        :focus {
            outline: none;
        }

        .colStyle {
            position: relative;
        }
        /* necessary to give position: relative to parent. */
        input[type="text"] {
            font: 15px/24px "Lato", Arial, sans-serif;
            color: #333;
            width: 100%;
            box-sizing: border-box;
            letter-spacing: 1px;
        }

        .effect-2 {
            border: 0;
            padding: 7px 0;
            border-bottom: 1px solid #ccc;
        }

            .effect-2 ~ .focus-border {
                position: absolute;
                bottom: 0;
                left: 50%;
                width: 0;
                height: 2px;
                background-color: #00BCD4;
                transition: 0.4s;
            }

            .effect-2:focus ~ .focus-border {
                width: 100%;
                transition: 0.4s;
                left: 0;
            }
    </style>
    <title>Maintenance and Spare Parts</title>
</head>
<body>
    <div class="messagealert" id="alert_container">
    </div>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="cont">
            <div style="display: none">
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-primary" />
                <asp:LinkButton Text="OK" CssClass="btn btn-default" ID="btnUploadE3" runat="server" OnClick="btnUploadE3_Click" />
                <br />
                <br />
            </div>
            <div class="form sign-in">
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
                    <asp:Panel runat="server" ID="pnSignIn">
                        <h2>
                            <asp:Label ID="lblWelcomeMessage" runat="server" Text="Welcome back!" />
                        </h2>
                        <br />
                        <asp:Label Text="" runat="server" ID="lblThongbao" />
                        <br />
                        <div class="colStyle">
                            <asp:TextBox runat="server" Width="355px" ID="txtUserCodeLogin" CssClass="effect-2" placeholder="User Name" />
                            <span class="focus-border"></span>
                        </div>
                        <br />
                        <asp:Panel runat="server" DefaultButton="lbkSignIn">
                            <div class="colStyle">
                                <asp:TextBox runat="server" Width="355px" TextMode="Password" ID="txtPasswordLogin" autocomplete="off" CssClass="effect-2" placeholder="Password" />
                                <span class="focus-border"></span>
                            </div>
                        </asp:Panel>
                        <br />
                        <asp:LinkButton Text="Forgot password?" CssClass="forgot-pass text-center" runat="server" ID="lbkForgot" OnClick="lbkForgot_Click" />
                        &nbsp; <span class="Select Language"></span>
                        <asp:DropDownList ID="ddlLanguage" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLanguage_SelectedIndexChanged">
                            <asp:ListItem Value="en">English</asp:ListItem>
                            <asp:ListItem Value="vi">Tiếng Việt</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:LinkButton Text="Sign In" CssClass="btnStyle" ForeColor="White" runat="server" ID="lbkSignIn" OnClick="lbkSignIn_Click" />
                        <br />
                        <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
                    </asp:Panel>

                </div>
                <div class="col-md-2">
                </div>
                <asp:Panel runat="server" ID="pnSendMail" Visible="false">
                    <h2>Reset Your Password</h2>
                    <div class="col-md-8" style="padding-left: 175px; padding-top: 40px;">
                        <div class="colStyle">
                            <input list="EmailSends" class="effect-2" id="txtEmail" runat="server" style="height: 30px; width: 260px" placeholder="mail" name="Email" />
                            <span class="focus-border"></span>
                        </div>
                        <datalist id="EmailSends" runat="server">
                        </datalist><br />
                        <br />
                        <asp:LinkButton Text="Send Password Reset Email" ForeColor="White" CssClass="btnStyle" ID="lbkSendEmail" OnClick="lbkSendEmail_Click" runat="server" />
                        <br />
                        <asp:LinkButton runat="server" CssClass="back-to-signin" OnClick="lbkBack_CLick" ForeColor="#607197"><span class="glyphicon glyphicon-menu-left">Back</span></asp:LinkButton>
                    </div>
                </asp:Panel>
                <div class="col-md-8" style="padding-left: 205px; padding-top: 70px;">
                    <asp:Panel runat="server" ID="pnMessForgot" Visible="false">
                        <img src="Content/mail.gif" style="width: 150px" />
                        <br />
                        <label>
                            <br />
                            <span>Check Your Email!</span>
                            <span style="color: #fff9f9a3">Kiểm tra Email của bạn!</span>
                        </label>
                        <br />
                        <asp:LinkButton runat="server" CssClass="back-to-signin" OnClick="lbkBack_CLick" ForeColor="#607197"><span class="glyphicon glyphicon-menu-left">Back</span></asp:LinkButton>
                    </asp:Panel>
                </div>
            </div>
            <div class="sub-cont">
                <div class="img">
                    <div class="img__text m--up">
                        <h2>Sign Up</h2>
                        <p>Create Your Account !</p>
                        <p><i style="color: #fff9f9a3">Tạo tài khoản của bạn !</i></p>
                    </div>
                    <div class="img__text m--in">
                        <h2>One of us?</h2>
                        <p>If you already has an account, just sign in!</p>
                        <p style="color: #fff9f9a3"><i>Nếu bạn đã có tài khoản, chỉ cần đăng nhập!</i></p>
                    </div>
                    <div class="img__btn">
                        <span class="m--up">Sign Up</span>
                        <span class="m--in">Sign In</span>
                    </div>
                </div>
                <div class="form sign-up">
                    <div class="panel panel-success">
                        <div class="panel-body">
                            <div class="form-group">
                                <label>Mã nhân viên:</label>
                                <asp:TextBox ID="txtUserCodeDangKy" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Mật khẩu:</label>
                                <asp:TextBox ID="txtPasswordDangKy" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Họ tên:</label>
                                <asp:TextBox ID="txtFullNameDangKy" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Email:</label>
                                <asp:TextBox ID="txtEmailDangKY" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Phòng:</label>
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="btn btn-sm">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <asp:Button ID="btnAdd" runat="server" Text="Đăng ký" OnClick="btnAdd_Click" CssClass="btn btn-success" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="lbkBack_CLick" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="display:none">
            <asp:FileUpload ID="FileUpload4" runat="server" CssClass="btn btn-primary" />
            <asp:Button ID="Button2" runat="server" Text="CheckUpload" CssClass="btn btn-primary" OnClick="CheckUpload_Click" />
        </div>
    </form>
</body>
<!-- /form -->
<script type="text/javascript">
    document.querySelector('.img__btn').addEventListener('click', function () {
        document.querySelector('.cont').classList.toggle('s--signup');
    });
    $(document).ready(function () {
        $('.Select2').select2();
    });
</script>
</html>