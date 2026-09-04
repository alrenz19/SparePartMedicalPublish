<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sparepart_Machine.aspx.cs" Inherits="QlyMain.Sparepart.Sparepart_Machine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background: #80808024;
        }

        .box-shadow1 {
            background: white;
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
            background-color: white;
            border-radius: 2px;
        }

        .select2-selection--single .select2-selection__arrow {
            height: 25px;
        }

        ul.multiselect-container.dropdown-menu {
            height: 170px;
            overflow: auto;
        }

        .center {
            text-align: center;
        }

        .width1 {
            width: 90%;
            overflow-x: scroll;
        }

        .background {
            background-color: #ddd;
        }

        /* Extra small devices (phones, 600px and down) */
        @media only screen and (max-width: 600px) {
            .res {
                display: block;
            }
        }

        /* Small devices (portrait tablets and large phones, 600px and up) */
        @media only screen and (min-width: 600px) {
            .res {
                display: block;
            }
        }
        /* Medium devices (landscape tablets, 768px and up) */
        @media only screen and (min-width: 768px) {
            .res {
                display: block;
            }
        }

        /* Large devices (laptops/desktops, 992px and up) */
        @media only screen and (min-width: 992px) {
            .res {
                width: 90%
            }
        }

        /* Extra large devices (large laptops and desktops, 1200px and up) */
        @media only screen and (min-width: 1200px) {
            .res {
                width: 90%
            }
        }

        .marginLeft20 {
            margin-left: 20px;
        }

        .treeNode {
            transition: all .3s;
            padding: 3px 2px;
            text-align: center;
            text-decoration: none !important;
        }

        .rootNode {
            color: #607d8b;
        }

        .leafNode {
            padding: 5px;
            color: #337ab7;
            font-weight: bold;
        }

        .selectNode {
            font-weight: bold;
            color: #009688;
        }
    </style>
    <link href="../Content/css/bootstrap-multiselect.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap-multiselect.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.Machinemultiple').select2();
        })
    </script>
    <div>
        <div class="container res">
            <div class="row">
                <div class="col-md-12" style="margin-top: 12px">

                    <div class="page-header" style="text-align: center">
                        <h2>Link Spare Parts vs Machine             
                        </h2>
                    </div>
                    <asp:Label Text="" ID="lblThongbao" runat="server" />
                    <asp:Label Text="" ID="label" runat="server" />
                    <asp:LinkButton Text="Create Link" ID="lbkOpenLink" CssClass="btn btn-default marginLeft20" OnClick="lbkOpenLink_Click" runat="server" />
                    <asp:Panel runat="server" ID="pnOpenAdd" CssClass="box-shadow1" Visible="false">
                        <table>
                            <tr>
                                <td colspan="4" class="center border-bottom 
                                                padding-bottom"><b>Create Link</b></td>
                            </tr>
                            <tr>
                                <td class="padding-left">
                                    <asp:DropDownList runat="server" ID="ddType" CssClass="selectSec" AutoPostBack="true"
                                        Height="30px" Width="200px" OnSelectedIndexChanged="ddType_SelectedIndexChanged">
                                    </asp:DropDownList></td>
                                <td class="padding-left">

                                    <asp:DropDownList runat="server" ID="ddSparepart" CssClass="selectSp"
                                        Height="70px" Width="230px">
                                    </asp:DropDownList>
                                </td>
                                <td class="padding-left">
                                    <asp:Panel runat="server" ID="pnMachine">
                                        <select id="Machinemultiple" runat="server" class="Machinemultiple" multiple="true">
                                        </select>
                                    </asp:Panel>
                                </td>
                                <td class="padding-left">
                                    <asp:LinkButton ID="btnSaveLienKet" CssClass="btn btn-default" runat="server"
                                        OnClick="btnSaveLienKet_Click">
                                                      <span class="glyphicon glyphicon glyphicon-ok"></span>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delete" CssClass="btn btn-default marginLeft20" />
                    <br />
                    <div class="col-md-6">
                        <asp:TreeView ID="tvSP" runat="server" ViewStateMode="Enabled"
                            NodeStyle-CssClass="treeNode" 
                            RootNodeStyle-CssClass="rootNode"
                            LeafNodeStyle-CssClass="leafNode" SelectedNodeStyle-CssClass="selectNode"
                            CssClass="width box-shadow1" NodeWrap="true" ShowCheckBoxes="All">
                        </asp:TreeView>
                    </div>
                    <div class="col-md-6">
                        <asp:TreeView ID="tvMachine" runat="server"
                            NodeStyle-CssClass="treeNode"
                            RootNodeStyle-CssClass="rootNode"
                            LeafNodeStyle-CssClass="leafNode" SelectedNodeStyle-CssClass="selectNode" ViewStateMode="Enabled"
                            CssClass="width box-shadow1" NodeWrap="true" ShowCheckBoxes="All">
                        </asp:TreeView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Visible="false"></asp:LinkButton>
    <script type="text/javascript">        
        $(function () {
            $('.selectSp').select2();
        });
        $(function () {
            $('.selectSec').select2();
        });
    </script>
</asp:Content>