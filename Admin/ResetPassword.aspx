<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="QlyMain.Admin.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        *, *:before, *:after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        .boxShadow {
            overflow: hidden;
            position: relative;
            width: 40%;
            height: 200px;
            margin: 0 auto 100px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            text-align: center;
            vertical-align: middle;
        }

        body {
            background-image: url("../Content/BG3.jpg");
            height: 900px;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            font-family: 'emoji'
        }

        .btnStyle {
            margin-top: 40px;
            margin-bottom: 20px;
            background: #d4af7a;
            text-transform: uppercase;
            display: block;
            margin: 0 auto;
            width: 260px;
            height: 36px;
            border-radius: 30px;
            color: #fff;
            font-size: 15px;
            cursor: pointer;
            text-align: center;
            vertical-align: middle;
            padding-top: 10px;
        }
        /* necessary to give position: relative to parent. */
        input[type="text"] {
            font: 15px/24px "Muli", sans-serif;
            color: #333;
            width: 70%;
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
            width: 70%;
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

    <script src="../Scripts/bootstrap.min.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="col-md-3"></div>
        <div class="col-md-8 boxShadow">
            <asp:Panel runat="server">
                <h2>Reset Password</h2>
                <div class="colStyle">
                    <asp:TextBox runat="server" CssClass="effect-2" ID="txtNewPassword" TextMode="Password" Width="350px" placeholder="New Password" />
                    <span class="focus-border"></span>
                </div>
                <br />
                <br />
                <asp:LinkButton Text="Save New Password" ForeColor="White" class="btnStyle" ID="lbkSaveNewPass" OnClick="lbkSaveNewPass_Click" runat="server" />
            </asp:Panel>
        </div>
        <div class="col-md-2"></div>
    </form>
</body>
</html>
