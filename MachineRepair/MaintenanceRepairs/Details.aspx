<%@ Page Title="List" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Details.aspx.cs" Inherits="QlyMain.MaintenanceRepairs.Details" EnableEventValidation="false" %>

<%@ Register Src="~/ucControl/ucRequestInfor.ascx" TagPrefix="uc1" TagName="ucRequestInfor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
    <style type="text/css">
        .modal {
            display: none;
            position: absolute;
            top: 0px;
            left: 0px;
            background-color: black;
            z-index: 100;
            opacity: 0.8;
            filter: alpha(opacity=60);
            -moz-opacity: 0.8;
            min-height: 100%;
        }

        #divImage {
            display: none;
            z-index: 1000;
            position: fixed;
            top: 0;
            left: 0;
            background-color: White;
            height: 550px;
            width: 600px;
            padding: 3px;
            border: solid 1px black;
        }
        .auto-style1 {
            width: 20%;
        }
    </style>
    <section class="content-header">
        <h1>Machine Repair Information <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Maintenance Repair</li>
        </ol>
    </section>
    <div class="content">
        <uc1:ucRequestInfor runat="server" ID="ucRequestInfor" />

        <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
        <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>

        <div class="panel panel-primary">
            <div class="panel-heading">
                Repair Information
            </div>
            <div class="panel-body">

                <table class="table table-bordered">

                    <tr>
                        <th class="auto-style1">Repairer:</th>
                        <td>
                            <asp:Label ID="lblNguoiSua" runat="server"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <th class="auto-style1">Inspection Items:</th>
                        <td>
                            <asp:Label ID="lblCacHangMucKiemTra" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th class="auto-style1">Cause of Error:</th>
                        <td>
                            <asp:Label ID="lblNguyenNhanLoi" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <th class="auto-style1">Corrective Action:</th>
                        <td>
                            <asp:Label ID="lblHangDongKhacPhuc" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <th class="auto-style1">Incident Code:</th>
                        <td>
                            <asp:Label ID="lblCodeSuCo" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Start Repair Time
                                        </div>
                                        <div class="panel-body">
                                            Date (MM/dd/yyyy): 
                                    <asp:Label ID="lblNgayBatDauSua" runat="server" autocomplete="off"></asp:Label>
                                            <br />
                                            Time:<asp:Label ID="lblGioBatDauSua" runat="server" TextMode="Time" autocomplete="off"></asp:Label>

                                            <asp:GridView runat="server" ID="gridviewImageBefore"
                                                CssClass="horizontal-gridview" AutoGenerateColumns="False" ShowHeader="False">
                                                <Columns>

                                                    <asp:TemplateField>

                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("HinhAnh")%>'
                                                                Width="150px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                </Columns>

                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            Completion Time
                                        </div>
                                        <div class="panel-body">
                                            Date (MM/dd/yyyy): 
                                               <asp:Label ID="lblNgayKetThucSua" runat="server" autocomplete="off"></asp:Label>
                                            <br />
                                            Time: 
                                               <asp:Label ID="lblGioKetThucSua" runat="server" TextMode="Time" autocomplete="off"></asp:Label>

                                            <asp:GridView runat="server" ID="gridviewImageAfter"
                                                CssClass="horizontal-gridview" ShowHeader="False" AutoGenerateColumns="False">
                                                <Columns>
                                                    <asp:TemplateField>

                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("HinhAnh")%>'
                                                                Width="150px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </th>
                    </tr>
                    <tr style="display:none">
                        <th class="auto-style1">Use Spare Part:
                        </th>
                        <td>
                            <asp:GridView ID="GridViewSparePart" runat="server" AutoGenerateColumns="false"
                                CssClass="table table-bordered table-condensed"
                                ShowHeaderWhenEmpty="false"
                                EmptyDataText="Not used"
                                EmptyDataRowStyle-HorizontalAlign="Center">
                                <Columns>
                                    <asp:BoundField DataField="PartID" HeaderText="Id Control" />
                                    <asp:BoundField DataField="Partname" HeaderText="Part Name & Model" />

                                    <asp:TemplateField ItemStyle-Width="5%">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hpDetail" runat="server"
                                                NavigateUrl='<%# String.Format("~/Sparepart/SparepartInOut?id_CodeMachine=&partID={0}&all=all&Find=0", Eval("PartID")) %>'
                                                Text="View" CssClass="btn btn-default">
                                            </asp:HyperLink>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Evaluation whether it can be repaired or not:
                                   <br />
                            <small>Check if <b>Repaired</b> or uncheck if <b>Not Repaired</b></small>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkSuaDuocHayKhong" runat="server"
                                Checked="true" Enabled="false"
                                Text=""></asp:CheckBox>

                            <asp:Panel ID="panelKhiKhongSuaDuoc" runat="server" Visible="false">
                                <b>Estimated repair time:</b>
                                <asp:Label ID="lblThoiGianDuKien" runat="server"></asp:Label>

                                <br />
                                <b>Reason for not repairing: 
                                </b>
                                <asp:Label ID="lblLyDoKhongSuaDuoc" runat="server"></asp:Label>

                            </asp:Panel>
                        </td>
                    </tr>

                    <tr>
                        <th class="auto-style1">Entry Date:</th>
                        <td>
                            <asp:Label ID="lblCreateDate" runat="server" Enabled="false"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <h4>List of Spareparts Used</h4>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"
                                DataKeyNames="Id"
                                CssClass="table table-bordered table-condensed"
                                ShowHeaderWhenEmpty="false"
                                EmptyDataText="No data"
                                EmptyDataRowStyle-HorizontalAlign="Center">
                                <Columns>
                                    <asp:TemplateField HeaderText="Id">
                                        <ItemTemplate>
                                            <%#  (Container.DataItemIndex + 1) %>
                                            <asp:Label ID="Label4" Visible="false" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Partname">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Partname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Item Code">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ItemCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Model">
                                        <ItemTemplate>
                                            <asp:Label ID="LblModel" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Output Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQtyDate" Visible="false" runat="server" Text='<%# Bind("QtyDate") %>'></asp:Label>
                                            <asp:Label ID="lblQtyDateShow" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quantity">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQtyOuput" runat="server" Text='<%# Bind("QtyOuput") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remark">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRemark" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>

                </table>

            </div>

            <div class="panel-footer">
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" CssClass="btn btn-success" />
                &nbsp;<asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" CssClass="btn btn-warning" />
                &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" CssClass="btn btn-default" />
            </div>
        </div>
    </div>
    <asp:Panel runat="server" ID="panelHide" Visible="false">
        MaintenanceRepairID:  
     <asp:Label ID="lblMaintenanceRepairID" runat="server"></asp:Label>
        RequestID: 
     <asp:Label ID="lblRequestID" runat="server"></asp:Label>
        User Input ID: 
     <asp:Label ID="lblUserID" runat="server"></asp:Label>
    </asp:Panel>


    <div id="divBackground" class="modal">
    </div>
    <div id="divImage">
        <table >
            <tr>
                <td valign="middle" align="center">
                     <input id="btnClose2" type="button" value="X" onclick="HideDiv()" class="pull-right btn btn-info" />
                    <img id="imgLoader" alt="" src="Image/loader.gif" />
                    <img id="imgFull" alt="No image" src="" style="display: none; width: 590px" />
                </td>
            </tr>
            <tr>
                <td align="center" valign="bottom">
                    <input id="btnClose" type="button" value="close" onclick="HideDiv()" />
                </td>
            </tr>
        </table>
    </div>

    <script type="text/javascript">
        function LoadDiv(url) {
            var img = new Image();
            var bcgDiv = document.getElementById("divBackground");
            var imgDiv = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            var imgLoader = document.getElementById("imgLoader");
            imgLoader.style.display = "block";
            img.onload = function () {
                imgFull.src = img.src;
                imgFull.style.display = "block";
                imgLoader.style.display = "none";
            };
            img.src = url;
            var width = document.body.clientWidth;
            if (document.body.clientHeight > document.body.scrollHeight) {
                bcgDiv.style.height = document.body.clientHeight + "px";
            }
            else {
                bcgDiv.style.height = document.body.scrollHeight + "px";
            }
            imgDiv.style.left = (width - 650) / 2 + "px";
            imgDiv.style.top = "20px";
            bcgDiv.style.width = "100%";

            bcgDiv.style.display = "block";
            imgDiv.style.display = "block";
            return false;
        }
        function HideDiv() {
            var bcgDiv = document.getElementById("divBackground");
            var imgDiv = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            if (bcgDiv != null) {
                bcgDiv.style.display = "none";
                imgDiv.style.display = "none";
                imgFull.style.display = "none";
            }
        }
    </script>
</asp:Content>
