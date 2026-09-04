<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="QlyMain.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #80808024;
        }

        .box {
            background: white;
            box-shadow: 0 4px 8px 0 rgb(67 65 65 / 20%), 0 6px 20px 0 rgb(255 255 255 / 0%);
            padding: 2px 0 2px 0;
            width: 100%;
            zoom: 96%;
            padding: 0 15px 0 15px;
            margin-bottom: 2px;
            border-bottom: 2px solid #8cb6ca;
        }

        table tbody th, td {
            padding: 5px;
        }

        .box-shadow2 {
            box-shadow: 1px 1px 1px 1px #424c519c;
            border-radius: 1px;
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

        .gvstyling th {
            background-color: #607d8b;
            color: white;
            border: 1px solid #9e9e9e;
            text-align: center;
        }

        .margin0 {
            margin: 0 !important;
        }

        .pointer {
            cursor: pointer;
        }
    </style>
    <div class="container">
        <div class="row center-block">
            <asp:Panel runat="server" DefaultButton="btnSearch" Width="50%">
                <div class="input-group box-shadow2">
                    <asp:TextBox runat="server" CssClass="form-control"
                        Height="35px"
                        ID="txtSearchCommon" />
                    <span class="input-group-btn">
                        <asp:LinkButton ID="btnSearch" Height="35px"
                            CssClass="btn btn-default btn-st" runat="server" OnClick="btnSearch_Click">Tìm kiếm
                                      <i class="fa fa-search"></i>
                        </asp:LinkButton>
                    </span>
                </div>
            </asp:Panel>
        </div>
        <div class="row  center-block margin-top">
            <asp:DropDownList ID="ddlDong" runat="server"
                CssClass="dropdown box-shadow1 margin0" AutoPostBack="true"
                OnSelectedIndexChanged="ddlDong_SelectedIndexChanged">
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
                <asp:ListItem>100</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="row  center-block">
            <asp:GridView ID="gv" runat="server" Width="100%" AutoGenerateColumns="False"
                AllowPaging="True" OnPageIndexChanging="gv_PageIndexChanging"
                CssClass="table gvstyling box-shadow1 margin0 center" ShowHeaderWhenEmpty="True" BorderStyle="None"
                BorderWidth="1px" DataKeyNames="id_CodeMachine" Font-Size="12px"
                CellPadding="3" CellSpacing="2" OnRowDataBound="gv_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Machine Code" HeaderStyle-CssClass="center">
                        <ItemTemplate>
                            <asp:HyperLink ID="hkLINK" runat="server" Text='<%# Bind("CodeMachine") %>'></asp:HyperLink>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Machine Name" HeaderStyle-CssClass="center">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("MachineName") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Problem history" HeaderStyle-CssClass="center">
                        <ItemTemplate>
                            <asp:HyperLink ID="hkLINKHistory" runat="server" Text='history'></asp:HyperLink>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT" Font-Bold="True" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Spare part" HeaderStyle-CssClass="center">
                        <ItemTemplate>
                            <asp:HyperLink ID="hkLINKSparepart" runat="server" Text='Sparepart'></asp:HyperLink>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT" Font-Bold="True" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Maintenance plan" HeaderStyle-CssClass="center">
                        <ItemTemplate>
                            <asp:HyperLink ID="hkLINKMaintenance" runat="server" Text='Maintenance'></asp:HyperLink>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT" Font-Bold="True" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Statistical charts" HeaderStyle-CssClass="center">
                        <ItemTemplate>
                            <asp:HyperLink ID="hkLINKStatistical" runat="server" Text='charts'></asp:HyperLink>
                        </ItemTemplate>
                        <HeaderStyle CssClass="paddingT" Font-Bold="True" />
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="NumericFirstLast" />
                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
            </asp:GridView>
        </div>
    </div>
    <asp:HiddenField ID="_Machine" runat="server" />
</asp:Content>
