<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="De.aspx.cs" Inherits="QlyMain.De" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/DetailFA.css" rel="stylesheet" />
    <div class="tt">
    </div>
    <%--<div class="col-sm-1 col-md-1 col-lg-1">
    </div>--%>
    <div class="col-sm-12 col-md-12 col-lg-12" style="padding: 20px">
        <div class="messagealert" id="alert_container">
        </div>
      
        <br />
        <br />
        <div class="intro1" style="text-align: center">
            <asp:Label Text="Information (Thông tin chi tiết )" ID="lblTitle" Font-Bold="true" Font-Size="20px" ForeColor="#607D8B" runat="server" />
            <br />
            <asp:Label Text="" ID="lblThongbaoKQ" CssClass="floatLeft" runat="server" Font-Size="20px" ForeColor="Gray" Font-Italic="true" />
        </div>
        <asp:HyperLink ID="hlkBack1" NavigateUrl="~/Admin/MngFA.aspx" Text="" Visible="false" ForeColor="#83959d" Font-Bold="true" runat="server"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i> Back</asp:HyperLink>
        <div style="position: relative;">
            <asp:DataList runat="server" CssClass="table" ID="dtlList" OnItemDataBound="dtlList_ItemDataBound"
                DataKeyField="id">
                <ItemTemplate>
                    <asp:Label Text=' <%# DisplayItemIndex(Container.ItemIndex, "dtlList") %>' CssClass="number-label" Font-Size="15px" ForeColor="White" Font-Bold="true" runat="server" />
                    <table class="table box-shadow2 padding intro2">
                        <tr>
                            <td>
                                <div class="col-sm-3 col-md-3 col-lg-3 Paddingleft">Asset Class: </div>
                                <div class="col-sm-9 col-md-9 col-lg-9">
                                    <asp:Label CssClass="form-control width100" ID="lblAsset_Class"
                                        runat="server" Text='<%# Bind("Asset_Class") %>'></asp:Label>
                                </div>
                                <br />
                                <hr style="border: 1px solid #8080800d; margin: 0px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-sm-3 col-md-3 col-lg-3 title">Sap Code:  </div>
                                <div class="col-sm-9 col-md-9 col-lg-9">
                                    <asp:Label CssClass="form-control width100" ID="lblSAP_code" runat="server" Text='<%# Bind("SAP_code") %>'></asp:Label>
                                </div>
                                <br />
                                <hr style="border: 1px solid #8080800d; margin: 0px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-sm-3 col-md-3 col-lg-3 title">Asset Name:   </div>
                                <div class="col-sm-9 col-md-9 col-lg-9">
                                    <asp:Label ID="lblAsset_Name" CssClass="form-control width100" runat="server" Text='<%# Bind("Asset_Name") %>'></asp:Label>
                                </div>
                                <br />
                                <hr style="border: 1px solid #8080800d; margin: 0px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-sm-3 col-md-3 col-lg-3 title">Name2:   </div>
                                <div class="col-sm-9 col-md-9 col-lg-9">
                                    <asp:Label CssClass="form-control width100" ID="lblName2" runat="server" Text='<%# Bind("Name2") %>'></asp:Label>
                                </div>
                                <br />
                                <hr style="border: 1px solid #8080800d; margin: 0px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-sm-3 col-md-3 col-lg-3 title">Original Asset:   </div>
                                <div class="col-sm-9 col-md-9 col-lg-9">
                                    <asp:Label CssClass="form-control width100" ID="lblOriginal_Asset" runat="server" Text='<%# Bind("Original_Asset") %>'></asp:Label>
                                </div>
                                <br />
                                <hr style="border: 1px solid #8080800d; margin: 0px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-sm-3 col-md-3 col-lg-3 title">Serial Number:    </div>
                                <div class="col-sm-9 col-md-9 col-lg-9">
                                    <asp:Label CssClass="form-control width100" ID="lblSerialNumber" runat="server" Text='<%# Bind("SerialNumber") %>'></asp:Label>
                                </div>
                                <br />
                                <hr style="border: 1px solid #8080800d; margin: 0px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel runat="server" ID="pnProfitCenter">
                                    <div class="col-sm-3 col-md-3 col-lg-3 title">Profit Center:     </div>
                                    <div class="col-sm-9 col-md-9 col-lg-9">
                                        <asp:Label CssClass="form-control width100" ID="lblProfitCenter" runat="server" Text='<%# Bind("ProfitCenter") %>'></asp:Label>
                                    </div>
                                    <br />
                                    <hr style="border: 1px solid #8080800d; margin: 0px" />
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel runat="server" ID="pnProfitCenterName">
                                    <div class="col-sm-3 col-md-3 col-lg-3 title">Profit Center Name:      </div>
                                    <div class="col-sm-9 col-md-9 col-lg-9">
                                        <asp:Label CssClass="form-control width100" ID="lblProfitCenterName" runat="server" Text='<%# Bind("ProfitCenterName") %>'></asp:Label>
                                    </div>
                                    <br />
                                    <hr style="border: 1px solid #8080800d; margin: 0px" />
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel runat="server" ID="pnLocation">
                                    <div class="col-sm-3 col-md-3 col-lg-3 title">Location:       </div>
                                    <div class="col-sm-9 col-md-9 col-lg-9">
                                        <asp:Label CssClass="form-control width100" ID="lblLocation" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                                    </div>
                                    <br />
                                    <hr style="border: 1px solid #8080800d; margin: 0px" />
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel runat="server" ID="pnDeprStartDate">
                                    <div class="col-sm-3 col-md-3 col-lg-3 title">Update Date:       </div>
                                    <div class="col-sm-9 col-md-9 col-lg-9">
                                        <asp:Label CssClass="form-control width100" ID="lblUpdateDate" runat="server" Text='<%# FormatDeprStartDate(Eval("DeprStartDate")) %>'></asp:Label>
                                    </div>
                                    <br />
                                    <hr style="border: 1px solid #8080800d; margin: 0px" />
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel runat="server" ID="pnReceivedAmount">
                                    <div class="col-sm-3 col-md-3 col-lg-3 title">Received Amount:       </div>
                                    <div class="col-sm-9 col-md-9 col-lg-9">
                                        <asp:Label CssClass="form-control width100" ID="lblReceivedAmount" runat="server" Text='<%# FormatCurrency(Eval("ReceivedAmount")) %>'></asp:Label>
                                    </div>
                                    <br />
                                    <hr style="border: 1px solid #8080800d; margin: 0px" />
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel runat="server" ID="pnBookAmount">
                                    <div class="col-sm-3 col-md-3 col-lg-3 title">BookAmount :       </div>
                                    <div class="col-sm-9 col-md-9 col-lg-9">
                                        <asp:Label CssClass="form-control width100" ID="lblBookAmount" runat="server" Text='<%# FormatCurrency(Eval("BookAmount")) %>'></asp:Label>
                                    </div>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Panel runat="server" ID="pnRemark">
                                    <div class="col-sm-3 col-md-3 col-lg-3 title">Remark :       </div>
                                    <div class="col-sm-9 col-md-9 col-lg-9">
                                        <asp:Label CssClass="form-control width100" ID="lblRemark" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                    </div>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-sm-3 col-md-3 col-lg-3 title">State :    </div>
                                <div class="col-sm-6 col-md-6 col-lg-6">
                                    <asp:Label ID="lblStatus" Visible="false" CssClass="width100" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                    <asp:HyperLink ID="hklink" CssClass="width100" Text='<%# Bind("Status") %>' runat="server" />

                                    <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Bind("id") %>'></asp:Label>
                                    <asp:HyperLink CssClass="btn btn-default btn-st" ID="hbkEdit" runat="server"><i class="fa fa-pencil"></i> Edit</asp:HyperLink>
                                </div>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <asp:GridView runat="server" ID="gvlListHide1" AutoGenerateColumns="false"
                        CssClass="tableBorder box-shadow2 padding intro2 table-bordered">
                        <Columns>
                            <asp:BoundField DataField="ProfitCenter" HeaderText="Profit Center" />
                            <asp:BoundField DataField="ProfitCenterName" HeaderText="Profit Center Name" />
                            <asp:BoundField DataField="Location" HeaderText="Location" />
                            <asp:TemplateField HeaderText="UpdateDate">
                                <ItemTemplate>
                                    <asp:Label ID="lblUpdateDate2" runat="server" Text='<%# FormatDeprStartDate(Eval("DeprStartDate")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Received Amount">
                                <ItemTemplate>
                                    <asp:Label ID="lblReceivedAmount" runat="server" Text='<%# FormatCurrency(Eval("ReceivedAmount")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Book Amount">
                                <ItemTemplate>
                                    <asp:Label ID="lblBookAmount" runat="server" Text='<%# FormatCurrency(Eval("BookAmount")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remark">
                                <ItemTemplate>
                                    <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="State">
                                <ItemTemplate>
                                    <asp:Label ID="lblState" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ItemTemplate>
            </asp:DataList>
             <div class="col-sm-12 col-md-12 col-lg-12">
            <asp:GridView runat="server" AutoGenerateColumns="False" ID="gvAudit" Visible="false"
                CssClass="table table-bordered" DataKeyField="id">
                <Columns>
                    <asp:BoundField DataField="SapCode" HeaderText="Sap Code" />
                    <asp:BoundField DataField="Machine" HeaderText="Serial Number" />
                    <asp:BoundField DataField="MdfDate" HeaderText="Date time" />
                </Columns>
            </asp:GridView>            
                 </div>
            <%--<asp:DataList runat="server" CssClass="table" ID="dtlList2"
                DataKeyField="id">
                <ItemTemplate>
                    <asp:Label Text=' <%# DisplayItemIndex(Container.ItemIndex, "dtlList2") %>' CssClass="number-label" Font-Size="15px" ForeColor="White" Font-Bold="true" runat="server" />
                    <table class="table box-shadow2 padding intro2 marginBottom5">
                        <tr>
                            <td>
                                <div class="col-sm-3 col-md-3 col-lg-3 Paddingleft">Asset Class: </div>
                                <div class="col-sm-9 col-md-9 col-lg-9">
                                    <asp:Label CssClass="form-control width100" ID="lblAsset_Class2"
                                        runat="server" Text='<%# Bind("Asset_Class") %>'></asp:Label>
                                </div>
                                <br />
                                <hr style="border: 1px solid #8080800d; margin: 0px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-sm-3 col-md-3 col-lg-3 title">Sap Code:  </div>
                                <div class="col-sm-9 col-md-9 col-lg-9">
                                    <asp:Label CssClass="form-control width100" ID="lblSAP_code2" runat="server" Text='<%# Bind("SAP_code") %>'></asp:Label>
                                </div>
                                <br />
                                <hr style="border: 1px solid #8080800d; margin: 0px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-sm-3 col-md-3 col-lg-3 title">Asset Name:   </div>
                                <div class="col-sm-9 col-md-9 col-lg-9">
                                    <asp:Label ID="lblAsset_Name2" CssClass="form-control width100" runat="server" Text='<%# Bind("Asset_Name") %>'></asp:Label>
                                </div>
                                <br />
                                <hr style="border: 1px solid #8080800d; margin: 0px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-sm-3 col-md-3 col-lg-3 title">Name2:   </div>
                                <div class="col-sm-9 col-md-9 col-lg-9">
                                    <asp:Label CssClass="form-control width100" ID="lblName22" runat="server" Text='<%# Bind("Name2") %>'></asp:Label>
                                </div>
                                <br />
                                <hr style="border: 1px solid #8080800d; margin: 0px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-sm-3 col-md-3 col-lg-3 title">Original Asset:   </div>
                                <div class="col-sm-9 col-md-9 col-lg-9">
                                    <asp:Label CssClass="form-control width100" ID="lblOriginal_Asset2" runat="server" Text='<%# Bind("Original_Asset") %>'></asp:Label>
                                </div>
                                <br />
                                <hr style="border: 1px solid #8080800d; margin: 0px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="col-sm-3 col-md-3 col-lg-3 title">Serial Number:    </div>
                                <div class="col-sm-9 col-md-9 col-lg-9">
                                    <asp:Label CssClass="form-control width100" ID="lblSerialNumber2" runat="server" Text='<%# Bind("SerialNumber") %>'></asp:Label>
                                </div>
                                <br />
                                <hr style="border: 1px solid #8080800d; margin: 0px" />
                            </td>
                        </tr>
                    </table>
                    <asp:GridView runat="server" ID="gvlListHide" AutoGenerateColumns="false" CssClass="tableBorder box-shadow2 padding intro2 table-bordered">
                        <Columns>
                            <asp:BoundField DataField="ProfitCenter" HeaderText="Profit Center" />
                            <asp:BoundField DataField="ProfitCenterName" HeaderText="Profit Center Name" />
                            <asp:BoundField DataField="Location" HeaderText="Location" />
                            <asp:TemplateField HeaderText="Update Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblUpdateDate2" runat="server" Text='<%# FormatDeprStartDate(Eval("UpdateDate")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ReceivedAmount" HeaderText="Received Amount" />
                            <asp:BoundField DataField="BookAmount" HeaderText="Book Amount" />
                        </Columns>
                    </asp:GridView>
                </ItemTemplate>
            </asp:DataList>--%>
        </div>
        <asp:HyperLink ID="hlkBack2" NavigateUrl="~/Admin/MngFA.aspx" Text="" Visible="false" ForeColor="#83959d" Font-Bold="true" runat="server"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i> Back</asp:HyperLink>
    </div>
    <%-- <div class="col-sm-1 col-md-1 col-lg-1">
    </div>--%>
    <asp:HiddenField ID="_Machine" runat="server" />

</asp:Content>
