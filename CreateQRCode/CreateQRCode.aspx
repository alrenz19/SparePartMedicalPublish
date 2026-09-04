<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"   CodeBehind="CreateQRCode.aspx.cs" Inherits="QlyMain.CreateQRCode.CreateQRCode" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
        <div class="row" style="margin-top: 5%">
            <h3>Generate QRCode</h3>

            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-default marginRight10" />
            <asp:LinkButton Text="" runat="server" ID="LinkButton1" CssClass="btn btn-default marginRight10"
                OnClick="lbUpload"> Upload <i class="fa fa-delicious" style="color:chocolate"></i></asp:LinkButton>
        </div>

        <div class="row">
            <div>
                <br />
                
                <div>
                    <asp:LinkButton Text="" Visible="false" runat="server" ID="LinkButton2" CssClass="btn btn-default marginRight10"
                        OnClick="lbDownload"> Download <i class="fa fa-download" style="color:green"></i></asp:LinkButton>
                    <asp:GridView ID="GridView1"  CssClass="table table-striped table-hover gvstyling box-shadow1 margin0 center" 
                        ShowHeaderWhenEmpty="True" BorderStyle="None" BorderWidth="1px" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField>
                                  <HeaderTemplate>STT</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="SapCode" HeaderText="SapCode">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="AssetName" HeaderText="Asset Name" />
                            <asp:BoundField DataField="OriginalAsset" HeaderText="Original Asset" />
                            <asp:BoundField DataField="EB1No" HeaderText="EB1No" />
                            <asp:BoundField DataField="QRCode" HeaderText="QRCode Data"></asp:BoundField>
                            <asp:TemplateField>
                                <HeaderTemplate>QRCode</HeaderTemplate>
                                <ItemTemplate>
                                    <img src="data:image/jpeg;base64,<%# Eval("QRCodeBase64") %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                         <EmptyDataTemplate>No Record Available</EmptyDataTemplate>  
                    </asp:GridView>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
