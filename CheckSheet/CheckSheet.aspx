<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="CheckSheet.aspx.cs" Inherits="QlyMain.CheckSheet.CheckSheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .margin-left {
            margin-left: 10px;
        }

        .PnDateNumber {
            border: 1px solid white;
            border-radius: 2px;
            box-shadow: 1px 0.5px 0.5px 0.5px #888888;
        }

        .btn-style {
            color: #00BCD4;
            background-color: #404649;
            border-color: #ccc;
            font-weight: bold;
        }

        .btn-style4 {
            color: #ece072;
            background-color: #404649;
            border-color: #faeb62;
            font-weight: bold;
        }

        .btn-style1 {
            background-color: #404649;
            border-color: #00bcd4;
            font-weight: bold;
        }

        .btn-style:hover {
            color: #4ef9f1;
        }

        .btn-style1:hover {
            color: #4ef9f1;
        }

        .btn-style1 {
            border-color: #ccc;
            font-weight: bold;
        }

        .btn-style3 {
            color: #31708f;
            background-color: #404649;
            border-color: #ccc;
            font-weight: bold;
        }

        .btn-style2 {
            background-color: #e0feff;
            border-color: #ccc;
            font-weight: bold;
        }

        .paddingRight10 {
            padding-right: 10px;
        }

        .styleBd {
            border: 1px solid #9e9e9e26;
            padding: 2px;
        }

        .textCenter {
            text-align: center;
            vertical-align: middle
        }

        .share-icon.fixed {
            position: fixed;
            right: 34px;
            bottom: 34px;
            height: 50px;
            width: 50px;
            line-height: 50px;
            z-index: 1000;
        }

        .share-icon-Search.Search {
            right: 34px;
            bottom: 34px;
            height: 34px;
            width: 34px;
            line-height: 50px;
            z-index: 1000;
        }

        .Search {
            transform: translateY(-60px) scale(1.5);
        }

        .share-icon {
            color: #fff;
            display: inline-flex;
            cursor: pointer;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background-color: #3f51b5;
        }

        .share-icon-Search {
            color: #fff;
            display: inline-flex;
            cursor: pointer;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background-color: #3f51b5;
        }
    </style>

    <div style="margin-top: 8%">
        <asp:Label Text="" ID="lblThongbao" ForeColor="Red" runat="server" />
        <br />
        <div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-1 col-md-1 col-lg-1">
                    </div>
                    <div class="col-sm-10 col-md-10 col-lg-10">
                        <asp:Label Text="" ID="lblMachine" Font-Size="20px" CssClass="textCenter" Font-Bold="true" ForeColor="#31708f" runat="server" />
                        <br />
                        <table class=" paddingRight10 styleBd">
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddMonth" runat="server"
                                        CssClass="form-control select6y" Width="190px">
                                    </asp:DropDownList></td>
                                <td>
                                    <asp:DropDownList ID="ddYear" runat="server"
                                        CssClass="form-control select9m" Width="190px">
                                    </asp:DropDownList></td>
                                <td>
                                    <asp:LinkButton Text="" CssClass="btn btn-default" ForeColor="#009999"
                                        Font-Bold="true" runat="server" OnClick="btnFind_Click">
                                <i class="fa fa-search" aria-hidden="true"></i>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-sm-1 col-md-1 col-lg-1">
                    </div>
                </div>
            </div>
            <asp:Label Text="" ID="lblThongbaoSave" CssClass="textCenter" runat="server" />
            <%-- CHILLER --%>
            <asp:DataList runat="server" ID="dlCheckSheet" DataKeyField="id_CheckSheet" ShowHeader="true"
                OnItemDataBound="dlCheckSheet_ItemDataBound" Width="100%">
                <ItemTemplate>
                    <div class="container">
                        <div class="row styleBd">
                            <div id="col1Chiller" class="col-sm-4 col-md-4 col-lg-2">
                                <table>
                                    <tr>
                                        <td class="paddingRight10">
                                            <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblID" runat="server" Text='<%# Bind("id_CheckSheet") %>'></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblContent" runat="server" Text='<%# Bind("ContentCheckSheet") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-sm-8 col-md-8 col-lg-10 styleBd" style="overflow: hidden">
                                <asp:DataList runat="server" ShowHeader="true" ID="dlChildCheckSheet"
                                    OnItemDataBound="dlChildCheckSheet_ItemDataBound">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblIDChildCheckSheet" runat="server" Text='<%# Bind("id_ChildCheckSheet") %>' Visible="false"></asp:Label>
                                                    <table>
                                                        <tr>
                                                            <td class="paddingRight10">
                                                                <asp:Label ID="lblContentChild" runat="server" Text='<%# Bind("ChildContent") %>'></asp:Label></td>
                                                            <td>
                                                                <asp:LinkButton Text="Save" CssClass="btn btn-default" ForeColor="#009999"
                                                                    Font-Bold="true" runat="server" OnClick="btnSaveContent_Click" /></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div style="overflow: hidden" class="col-sm-10 col-md-10 col-lg-11 styleBd">
                                                        <div id="col2Chiller" style="overflow: scroll" class="col-sm-2 col-md-3 col-lg-4 styleBd">
                                                            <asp:DataList runat="server" ID="dlDateCheckSheet" RepeatDirection="Horizontal"
                                                                CssClass="table" OnItemDataBound="dlDateCheckSheet_ItemDataBound">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbIDDateContent" runat="server" Text='<%# Bind("ID_Date") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lbDateContent" runat="server" Text='<%# Bind("DateContent") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lbMonthCheck" runat="server" Text='<%# Bind("MonthCheck") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lbYearCheck" runat="server" Text='<%# Bind("YearCheck") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lbDateNumber" CssClass="textCenter" runat="server" Text='<%# Bind("DateNumber") %>'></asp:Label>
                                                                    <asp:TextBox ID="txtDateContentEdit" runat="server" Text='<%# Eval("DateContent") %>'
                                                                        CssClass="form-control paddingRight10" Width="80px" />
                                                                    <asp:Label ID="lblIsSave" Visible="false" runat="server" Text='<%# Bind("IsSave") %>' />
                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <%-- No---%>
            <asp:DataList runat="server" ID="dlNoChild" DataKeyField="id_CheckSheet" ShowHeader="true"
                OnItemDataBound="dlNoChild_ItemDataBound" Width="100%">
                <ItemTemplate>
                    <div class="container">
                        <div class="row styleBd">

                            <div class="col-sm-4 col-md-4 col-lg-2">
                                <table>
                                    <tr>
                                        <td class="paddingRight10">
                                            <asp:Label ID="lblTypeNoChild" runat="server" Text='<%# Bind("Type") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblIDNoChild" runat="server" Text='<%# Bind("id_CheckSheet") %>'></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblContentNoChild" runat="server" Text='<%# Bind("ContentCheckSheet") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-sm-8 col-md-8 col-lg-10 styleBd" style="overflow: hidden">
                                <asp:LinkButton Text="Save" CssClass="btn btn-default" ForeColor="#009999"
                                    Font-Bold="true" runat="server" OnClick="btnSaveContent_Click" />

                                <div style="overflow: scroll" class="col-sm-12 col-md-12 col-lg-12 styleBd">
                                    <asp:DataList runat="server" ID="dlDateCheckSheetNoChild" RepeatDirection="Horizontal"
                                        CssClass="table" OnItemDataBound="dlDateCheckSheetNoChild_ItemDataBound">
                                        <ItemTemplate>
                                            <asp:Label ID="lbIDDateContentNoChild" runat="server" Text='<%# Bind("ID_Date") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lbDateContentNoChild" runat="server" Text='<%# Bind("DateContent") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lbDateNumberNoChild" CssClass="textCenter" runat="server" Text='<%# Bind("DateNumber") %>'></asp:Label>
                                            <asp:Label ID="lbMonthCheckNoChild" runat="server" Text='<%# Bind("MonthCheck") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lbYearCheckNoChild" runat="server" Text='<%# Bind("YearCheck") %>' Visible="false"></asp:Label>
                                            <asp:TextBox ID="txtDateContentEditNoChild" runat="server" Text='<%# Eval("DateContent") %>'
                                                CssClass="form-control paddingRight10" Width="80px" />
                                            <asp:Label ID="lblIsSaveNoChild" Visible="false" runat="server" Text='<%# Bind("IsSave") %>' />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <%-- SCRUBBER --%>
            <asp:DataList runat="server" ID="dlCheckSheet_SCRUBBER" DataKeyField="id" ShowHeader="true"
                OnItemDataBound="dlCheckSheet_SCRUBBER_ItemDataBound" Width="100%">
                <ItemTemplate>
                    <div class="container">
                        <asp:Label ID="lblShowName1" Visible="false" Text="DAILY CHECK SYSTEM FOR WASTEWATER TREATMENT FROM THE EXHAUST GAS TOWER" Font-Bold="true" Font-Size="16px"
                           BackColor="#009688" ForeColor="White" runat="server" />
                        <div class="row styleBd">
                            <div class="col-sm-4 col-md-4 col-lg-2">
                                <table>
                                    <tr>
                                        <td class="paddingRight10">
                                            <asp:Label ID="lblTypeSC" runat="server" Text='<%# Bind("Type") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblStatusSC" runat="server" Text='<%# Bind("Status") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblIDSC" runat="server" Text='<%# Bind("id") %>' Visible="false"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblContentSC" runat="server" Text='<%# Bind("Contents") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-sm-8 col-md-8 col-lg-10 styleBd" style="overflow: hidden">
                                <asp:DataList runat="server" ShowHeader="true" ID="dlCheckSheetSC"
                                    OnItemDataBound="dlCheckSheetSC_ItemDataBound">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblIDCheckSheetSC" runat="server" Text='<%# Bind("id_CheckSheet") %>' Visible="false"></asp:Label>
                                                    <table>
                                                        <tr>
                                                            <td class="paddingRight10">
                                                                <asp:Label ID="lblContentChildSC" runat="server" Text='<%# Bind("ContentCheckSheet") %>'></asp:Label></td>
                                                            <td>
                                                                <asp:LinkButton Text="Save" CssClass="btn btn-default" ForeColor="#009999"
                                                                    Font-Bold="true" runat="server" OnClick="btnSaveContent_Click" /></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div style="overflow: hidden" class="col-sm-10 col-md-10 col-lg-11 styleBd">
                                                        <div style="overflow: scroll" class="col-sm-2 col-md-3 col-lg-4 styleBd">
                                                            <asp:DataList runat="server" ID="dlDateCheckSheetSC" RepeatDirection="Horizontal"
                                                                CssClass="table" OnItemDataBound="dlDateCheckSheetSC_ItemDataBound">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbIDDateContentSC" runat="server" Text='<%# Bind("ID_Date") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lbDateContentSC" runat="server" Text='<%# Bind("DateContent") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lbMonthCheckSC" runat="server" Text='<%# Bind("MonthCheck") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lbYearCheckSC" runat="server" Text='<%# Bind("YearCheck") %>' Visible="false"></asp:Label>
                                                                    <asp:Label ID="lbDateNumberSC" CssClass="textCenter" runat="server" Text='<%# Bind("DateNumber") %>'></asp:Label>
                                                                    <asp:TextBox ID="txtDateContentEditSC" runat="server" Text='<%# Eval("DateContent") %>'
                                                                        CssClass="form-control paddingRight10" Width="80px" />
                                                                    <asp:Label ID="lblIsSaveSC" Visible="false" runat="server" Text='<%# Bind("IsSave") %>' />
                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                        <asp:Label ID="lblShowName" Visible="false" Text="DAILY CHECK CHECKLIST OF EXHAUST GAS TREATMENT SYSTEM" Font-Bold="true" Font-Size="16px"
                           BackColor="#009688" ForeColor="White" runat="server" />
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <%-- SCRUBBER --%>

            <div class="row">
                <div class="share-icon fixed">
                    <asp:LinkButton Text="" runat="server"
                        class="share-icon fixed" ID="btnOpenSend" OnClick="btnOpenSend_Click">
                <i class="fa fa-paper-plane" aria-hidden="true"></i>
                    </asp:LinkButton>

                    <asp:LinkButton ID="lnkFake" runat="server"></asp:LinkButton>
                    <ajaxToolkit:ModalPopupExtender ID="popupSend"
                        runat="server" PopupControlID="pnSend" TargetControlID="lnkFake" CancelControlID="lbtCancelSend"
                        BackgroundCssClass="modalBackground" DropShadow="false">
                    </ajaxToolkit:ModalPopupExtender>
                    <asp:Panel ID="pnSend" runat="server" Style="display: none;">
                        <div id="SendModal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header alert-info">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-12 col-lg-12">
                                                <table class="table">
                                                    <tr>
                                                        <td class="paddingRight10">
                                                            <asp:TextBox ID="txtCOntentSend" TextMode="multiline" Columns="28" Rows="4" runat="server" />
                                                        </td>
                                                        <td class="paddingRight10">
                                                            <asp:DropDownList ID="ddEmail" runat="server"
                                                                CssClass="form-control SelectMailSend" Width="190px">
                                                            </asp:DropDownList></td>
                                                        <td>
                                                            <asp:DropDownList runat="server" ID="ddREP">
                                                                <asp:ListItem Text="-" Value="0" />
                                                                <asp:ListItem Text="OK" Value="1" />
                                                                <asp:ListItem Text="NG" Value="2" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:LinkButton Text="Send" runat="server" CssClass="btn btn-primary" ForeColor="White"
                                                                OnClick="btnSendCh_Click" ID="btnSendCh" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-body">
                                    </div>
                                    <div class="modal-footer">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:Label ID="lblThongBaoSend" runat="server" ForeColor="Red" />
                                            </div>
                                            <div class="col-md-6">
                                                <asp:LinkButton ID="lbtCancelSend" runat="server"
                                                    class="btn btn-default"
                                                    data-dismiss="modal">Cancel</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <asp:LinkButton Text="" Visible="false" ID="btnFixed" runat="server"
                        class="share-icon fixed" OnClick="btnFixed_Click">
                  <i class="fa fa-cogs" aria-hidden="true"></i>
                    </asp:LinkButton>

                </div>
            </div>

        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            $('.select9m').select2();
        });
        $(function () {
            $('.select6y').select2();
        });
        $(function () {
            $('.SelectMailSend').select2();
        });
    </script>
    <asp:HiddenField ID="_IDCheckSheet" runat="server" />
    <asp:HiddenField ID="_DateNumber" runat="server" />
    <asp:HiddenField ID="_IDDateCheckSheet" runat="server" />
    <asp:HiddenField ID="_IDChildCheckSheet" runat="server" />
    <asp:HiddenField ID="_IdCodeMachine" runat="server" />
    <asp:HiddenField ID="_yearCheck" runat="server" />
    <asp:HiddenField ID="_monthCheck" runat="server" />
    <asp:HiddenField ID="_Day" runat="server" />
    <asp:HiddenField ID="_CheckerEmail" runat="server" />
    <asp:HiddenField ID="_fromUser" runat="server" />
    <asp:HiddenField ID="_id_checkSheet_SCRUBBER" runat="server" />
    <asp:HiddenField ID="_IDCheckSheetINSC" runat="server" />
</asp:Content>

