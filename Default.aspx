<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="QlyMaint.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .padding {
            padding: 5px;
        }

        .scr {
            height: 50px;
            overflow: scroll;
        }
    </style>
    <div style="margin-top: 10%">
        <div class="col-md-1">
        </div>
        <div class="col-md-10">
            <asp:Panel runat="server" ID="pnThongbao" CssClass="alert-danger padding" Width="80%" Visible="false">
                <asp:Label Text="" ID="lblThongbaoCheckSheet" Font-Bold="true" runat="server" />
            </asp:Panel>
        </div>
        <div class="col-md-1">
        </div>
        <asp:LinkButton Text="Click" OnClick="Click" runat="server" Visible="false" />
        <asp:DataList ID="ddCodeMachine" runat="server" RepeatColumns="3" CellPadding="10"
            ForeColor="#333333" RepeatDirection="Horizontal" CellSpacing="10" Width="100%" DataKeyField="id_CodeMachine"
            OnItemCommand="ddCodeMachine_ItemCommand" OnItemDataBound="ddCodeMachine_ItemDataBound">
            <AlternatingItemStyle BackColor="White" />
            <ItemTemplate>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("CodeMachine") %>'></asp:Label>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("MachineName") %>'></asp:Label>
                            </h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-comments fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">
                                                <asp:Label Text="" ID="lbManual" runat="server" />
                                            </div>
                                            <div>Manual</div>
                                        </div>
                                    </div>
                                </div>
                                <asp:LinkButton runat="server" ID="lbkManual" CommandName="lbkManual">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                    <asp:DataList runat="server" ID="dlManual" CssClass="table-bordered">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="headlineLink" runat="server" Text='<%# Eval("ManunalName") %>' NavigateUrl='<%# Eval("ManunalURL") %>' />
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="panel panel-success">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-tasks fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">
                                                <asp:Label Text="" ID="lblHistory" runat="server" />
                                            </div>
                                            <div>History</div>
                                        </div>
                                    </div>
                                </div>
                                <asp:LinkButton runat="server" ID="lbkHistory" CommandName="lbkHistory">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-shopping-cart fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">
                                                <asp:Label Text="" ID="lblSOP" runat="server" CssClass="scr" />
                                            </div>
                                            <div>SOP</div>
                                        </div>
                                    </div>
                                </div>
                                <asp:LinkButton runat="server" ID="lbkSOP" CommandName="lbkSOP">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                    <asp:DataList runat="server" ID="dlSOP" CssClass="table-bordered table-hover scr">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="headlineLink" runat="server" Text='<%# Eval("SOPName") %>' NavigateUrl='<%# Eval("SOP_URL") %>' />
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="panel panel-warning">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-support fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">
                                                <asp:Label Text="" ID="lblPlan" runat="server" />
                                            </div>
                                            <div>Plan</div>
                                        </div>
                                    </div>
                                </div>
                                <asp:LinkButton runat="server" ID="lbkPlan" CommandName="lbkPlan">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                    <asp:DataList runat="server" ID="dlPlan" CssClass="table-bordered">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="headlineLink" runat="server" Text='<%# Eval("PlanName") %>' NavigateUrl='<%# Eval("PlanURL") %>' />
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="display: none">
                        <div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="panel" style="background-color: #9fbece; color: #31708f; border: #31708f">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-support fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">
                                                <asp:Label Text="" ID="lblCheckSheetHT" runat="server" />
                                            </div>
                                            <div>Check Sheet</div>
                                        </div>
                                    </div>
                                </div>
                                <asp:LinkButton runat="server" ID="lbkCheckSheetHT">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                    <asp:Literal ID="ltlDetailCheckSheetHT" runat="server" />
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="panel panel-danger">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-support fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">
                                                <asp:Label Text="" ID="lblCheckSheet" runat="server" />
                                            </div>
                                            <div>Check Sheet (System)</div>
                                        </div>
                                    </div>
                                </div>
                                <asp:LinkButton runat="server" ID="lbkCheckSheet" CommandName="lbkCheckSheet">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                    <asp:Literal ID="ltlDetailCheckSheet" runat="server" />
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-6">
                            <div class="panel" style="background-color: #33c1b44d; color: #607d8b">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-support fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge">
                                                <asp:Label Text="" ID="Label1" runat="server" />
                                            </div>
                                            <div>Spare part</div>
                                        </div>
                                    </div>
                                </div>
                                <asp:LinkButton runat="server" ID="LinkButton1" CommandName="lbkSparepart">
                                    <div class="panel-footer">
                                        <span class="pull-left">View Details</span>
                                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        <div class="clearfix"></div>
                                    </div>
                                    <asp:Literal ID="Literal1" runat="server" />
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <ItemStyle Wrap="true" />
        </asp:DataList>
    </div>

    <asp:HiddenField ID="_IdCodeMachine" runat="server" />
    <asp:HiddenField ID="_Year" runat="server" />
    <asp:HiddenField ID="_Month" runat="server" />
</asp:Content>
