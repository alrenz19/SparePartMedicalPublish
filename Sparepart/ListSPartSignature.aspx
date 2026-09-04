<%@ Page Title="4.Spare parts Inventory management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListSPartSignature.aspx.cs" Inherits="QlyMain.Sparepart.ListSPartSignature" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #f9f9f9;
        }

        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            padding: 2px !important;
            line-height: 1 !important;
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
        }

        .middle {
            vertical-align: middle !important;
        }
    </style>
    <div>
    </div>
           <div class="page-header" style="text-align: center ; margin:0px;padding:0px">
            <h2 style="margin-bottom:0px;margin-top:30px">Quản lý tồn kho Spare parts (Spare parts Inventory management)                        
            </h2>
        </div>
    <div>
        <div class="col-sm-2 col-md-2 col-lg-2" style="font-size: 12px;width:auto">
            <div class="box-shadow1" style="padding: 5px">
                <asp:LinkButton Text="➤ Spare part Menu"  ForeColor="#56879e" Font-Bold="true" CssClass="btn btn-default" Font-Size="12px" runat="server" OnClick="btnSignature_Click" />
                <br />
                <br />
                <asp:LinkButton Text="➤ Tạo Mail" runat="server"  ForeColor="#56879e" Font-Bold="true" CssClass="btn btn-default" Font-Size="12px" OnClick="btnAddMail_Click" />
            </div>
        </div>
        <div class="col-sm-10 col-md-10 col-lg-10">
            <asp:Panel runat="server" ID="pnShowDong">
                Số dòng hiển thị:
            <asp:DropDownList ID="ddlDong" runat="server"
                CssClass="dropdown" AutoPostBack="true"
                OnSelectedIndexChanged="ddlDong_SelectedIndexChanged">
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
                <asp:ListItem>70</asp:ListItem>
                <asp:ListItem>100</asp:ListItem>
            </asp:DropDownList>
            </asp:Panel>
            <asp:GridView runat="server" ID="gv" AutoGenerateColumns="False" Width="100%"
                BorderWidth="0" GridLines="None"
                DataKeyNames="id" Font-Size="15px" OnPageIndexChanging="gv_PageIndexChanging"
                AllowPaging="True"
                OnRowCommand="gv_RowCommand">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton Text="text" ID="lbkSP" runat="server" ForeColor="#607d8b" CommandName='<%#"Open|"+Eval("id")%>'>
                                <table class="table box-shadow1" style="text-align: center; vertical-align: middle">
                                    <tbody>
                                        <tr>
                                            <td class="middle">

                                                <b>Title :</b>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Tile") %>'></asp:Label>
                                            </td>
                                            <td class="middle">

                                                <b>Comment :</b>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                                            </td>
                                            <td class="middle">

                                                <b>Last Modified Date :</b>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("SendDate","{0:dd.MMM.yyyy}") %>'></asp:Label>
                                            </td>
                                            <td>

                                                <div style="float: right">
                                                    <table style="text-align: center;">
                                                        <tr style="font-size: 10px">
                                                            <td>Made by</td>
                                                            <td></td>
                                                            <td>Confirm by</td>
                                                            <td></td>
                                                            <td>Approved by</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border: 1px solid #c2b7b7; padding: 5px">
                                                                <%--  <i class='<%# Eval("IsMadeby").ToString() == "True"?"fa fa-check-circle" :"fa fa-square-o"%>' runat="server" id="IconRequest"
                                                                style='font-size: 20px; color: lightseagreen'></i>--%>
                                                                <img src='<%# Eval("SignMadeBy") %>' width="55" />
                                                            </td>
                                                            <td>
                                                                <img src="../Img/rightArrow.png" width="10" height="8" />
                                                            </td>
                                                            <td style="border: 1px solid #c2b7b7; padding: 5px"><%-- <i class='<%# Eval("IsConfirm").ToString() == "True"?"fa fa-check-circle" :"fa fa-square-o"%>' runat="server" id="IconConfirm"
                                                                style='font-size: 20px; color: lightseagreen'></i>--%>
                                                                <img src='<%# Eval("SignConfirm") %>' width="55" />
                                                            </td>
                                                            <td>
                                                                <img src="../Img/rightArrow.png" width="10" height="8" />
                                                            </td>
                                                            <td style="border: 1px solid #c2b7b7; padding: 5px"><%-- <i class='<%# Eval("IsApprove").ToString() == "True"?"fa fa-check-circle" :"fa fa-square-o"%>' runat="server" id="IconApproved"
                                                                style='font-size: 20px; color: lightseagreen'></i>--%>
                                                                <img src='<%# Eval("SignApprove") %>' width="55" />
                                                            </td>
                                                        </tr>

                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="NumericFirstLast" />
                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
            </asp:GridView>
              <div style="float: right">
                <asp:LinkButton Text="〈 Back" runat="server" CssClass="btn btn-primary" ID="lbkOpenBack" OnClick="lbkOpenBack_Click" />                
            </div>
        </div>
        <div class="col-sm-1 col-md-1 col-lg-1"></div>
    </div>
</asp:Content>
