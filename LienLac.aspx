<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LienLac.aspx.cs" Inherits="QlyMain.LienLac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .gvstyling th {
            background-color: #607d8b;
            color: white;
            border: 1px solid #9e9e9e;
        }

        #LienLac {
            color: white !important;
            border-bottom: 2px solid #00deff;
            font-weight: bold;
        }

        .box-shadow {
            box-shadow: 1px 3px 6px 0 rgba(0, 0, 0, 0.2), 0 3px 1px 0 rgba(0, 0, 0, 0.19);
            margin-top: 1%;
            margin-bottom: 1%;
            margin-right: 1%;
            padding: 0.5%;
            background-color: white;
            border-radius: 2px;
        }
    </style>

    <div>
        <asp:DropDownList ID="ddlDong" runat="server"
            CssClass="dropdown" AutoPostBack="true"
            OnSelectedIndexChanged="ddlDong_SelectedIndexChanged">
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>50</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>
        </asp:DropDownList>
    </div>
    <asp:GridView ID="gvLienLac" runat="server" Width="100%" AutoGenerateColumns="False"
        AllowPaging="True"
        CssClass="table gvstyling box-shadow" ShowHeaderWhenEmpty="True" BorderStyle="None"
        BorderWidth="1px" DataKeyNames="id" Font-Size="12px"
        CellPadding="3" CellSpacing="2">
        <Columns>
            <asp:TemplateField HeaderText="No">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Width="5%" />
                <ItemStyle Width="3px" />
            </asp:TemplateField>
            <asp:BoundField DataField="UserCode" HeaderText="User" ItemStyle-Width="3px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Title" HeaderText="Tiêu đề" ItemStyle-Width="3px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="NoidungLienLac" HeaderText="Nội dung liên lạc" ItemStyle-Width="3px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="date" HeaderText="Ngày tạo" ItemStyle-Width="3px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />

        </Columns>
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        <PagerSettings Mode="NumericFirstLast" />
    </asp:GridView>
</asp:Content>
