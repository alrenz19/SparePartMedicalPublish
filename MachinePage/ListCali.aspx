<%@ Page Title="List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ListCali.aspx.cs" Inherits="QlyMain.MachinePage.ListCali" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/MachinePage/ucLoadSapCode.ascx" TagPrefix="uc1" TagName="ucLoadSapCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/toastr.min.css" rel="stylesheet" />
    <script src="../Scripts/toastr.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery.slim.min.js"></script>
    <script src="../Scripts/bundle.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>
    <!-- Thêm jQuery -->
    <script src="../Content/jquery-3.6.0.min.js"></script>
    <!-- Thêm Bootstrap JS -->
    <script src="../Content/bootstrap/js/bootstrap.min.js"></script>
    <!-- Thêm Bootstrap CSS -->
    <link href="../Content/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .editEn {
            background-color: #72bdd385;
            border-color: #8cc2d3;
        }

        .DelEn {
            background-color: #f1b9b7;
            border-color: #e49f9d;
        }

        .custom-form-container .form-group {
            margin-bottom: 20px;
        }

        .custom-form-container .form-control {
            height: auto;
            padding: 8px 12px;
        }

        .custom-form-container .row {
            margin-bottom: 20px;
        }

        .custom-form-container {
            max-width: 1200px;
            margin: auto;
        }
            .custom-form-container .col-md-4 {
                padding-left: 15px;
                padding-right: 15px;
            }

        .fontGrid {
            font-family: "Emoji";
        }

        .styleTB {
            color: #ac2900;
        }
    </style>
    <script type="text/javascript">
        $(window).bind('load', function () {
            // Chọn checkbox header (tất cả)
            var headerChk = $(".chkheader input");
            // Chọn tất cả checkbox items
            var itemChk = $(".chkitems input");

            headerChk.bind("click", function () {
                itemChk.each(function () {
                    this.checked = headerChk[0].checked;
                });
                updateButtonStates();
            });
            console.log("Selected count 111: ", selectedCount);
            itemChk.bind("click", function () {
                if (!this.checked) {
                    headerChk[0].checked = false;
                }
                if ($(".chkitems input:checked").length === $(".chkitems input").length) {
                    headerChk[0].checked = true;
                }
                updateButtonStates();
            });
        });
        function updateButtonStates() {
            var selectedCount = $(".chkitems input:checked").length;
            console.log("Selected count: ", selectedCount);

            var editButton = document.getElementById('<%=btnEdit.ClientID %>');
            var delButton = document.getElementById('<%= bnDel.ClientID %>');

            // Nếu chỉ có 1 checkbox được chọn, bật nút Edit và Delete
            if (selectedCount === 1) {
                editButton.disabled = false;
                delButton.disabled = false;
                // ClearButton.disabled = false;
                editButton.classList.remove('editEn');
                delButton.classList.remove('DelEn');
            }
            // Nếu có nhiều hơn 1 checkbox được chọn, chỉ bật nút Delete
            else if (selectedCount > 1) {
                editButton.disabled = true;
                delButton.disabled = false;
                editButton.classList.add('editEn');
                delButton.classList.remove('DelEn');
            }
            // Nếu không có checkbox nào được chọn, tắt cả hai nút
            else {
                editButton.disabled = true;
                delButton.disabled = true;
                editButton.classList.add('editEn');
                delButton.classList.add('DelEn');
            }
        }
    </script>

    <section class="content-header">
        <h1>Quản lý máy</h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server">
                <i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Machine</li>
        </ol>
    </section>
    <div class="content">
        <div class="messagealert" id="alert_container">
        </div>
        <asp:Label ID="lblMessage" runat="server" CssClass="form-error" meta:resourcekey="lblMessageResource1" />
        <asp:Literal ID="LiteralThongBao" runat="server" meta:resourcekey="LiteralThongBaoResource1"></asp:Literal>

        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-8 show">
                <table>
                    <tr>
                        <td>
                            <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control" placeholder="Search..." meta:resourcekey="txtSearchResource1"></asp:TextBox>
                        </td>
                        <td>
                            <asp:LinkButton ID="lbtSearch" runat="server" OnClick="lbtSearch_Click" CssClass="btn btn-info btn-flat" meta:resourcekey="lbtSearchResource1">
	                                            <span class="glyphicon glyphicon-search"></span> Search</asp:LinkButton>
                        </td>
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-default btn-st" type="button" id="dropdownMenuButtonExt" style="height: 33px" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <h6 style="margin: 0px"><i class="fa fa-file-excel-o" aria-hidden="true">Export Excel </i><span class="caret"></span></h6>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButtonExt" style="width: 270px; padding: 14px">
                                    <div class="input-group">
                                        <asp:LinkButton ID="lbtExcel" Text="
                                                            &lt;i class=&quot;fa fa-file-excel-o&quot;&gt;&lt;/i&gt; Excel
                                        " runat="server" CssClass="btn btn-default" OnClick="lbtExcel_Click" meta:resourcekey="lbtExcelResource1"></asp:LinkButton>
                                        <asp:LinkButton Text="
                                                            &lt;i class=&quot;fa fa-file-excel-o&quot; aria-hidden=&quot;true&quot;&gt;&lt;/i&gt; Export TEPRA
                                        " runat="server" ID="lbkExportTEPRA" CssClass="btn btn-default btn-st" Height="33px" meta:resourcekey="lbkExportTEPRAResource1"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-4">
                      <%--  <button type="button" class="btn btn-success" id="btnAdd" data-toggle="modal" data-target="#myModal" runat="server" onclick="setCommandArgument('Add')">
                            <span class="glyphicon glyphicon-plus"></span>Thêm
                        </button>--%>
                        <asp:Button Text="+Thêm" ID="btAdd" OnClick="btnAdd_Click" CssClass="btn btn-success"  runat="server" meta:resourcekey="btAddResource1" />
                        <asp:Button ID="btnEdit" runat="server" Text="📝Sửa" Enabled="False"
                            OnClick="btnEdit_Click" CssClass="btn btn-info" meta:resourcekey="btnEditResource1" />
                        <asp:Button ID="bnDel" runat="server" CssClass="btn btn-danger" Enabled="False" Text="✖ Xóa"
                            OnClick="btnDel_Click" OnClientClick="if(!confirm('Bạn có chắc là muốn xóa không?')) return false;" meta:resourcekey="bnDelResource1" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 order-2 order-md-1">
                <div class="panel">
                    <div class="panel-body" style="overflow: auto;">
                        <asp:GridView ID="GridViewShow" runat="server"
                            AutoGenerateColumns="False" DataKeyNames="idME"
                            AllowPaging="True"
                            CssClass="table table-bordered table-condensed fontGrid"
                            OnPageIndexChanging="GridViewShow_PageIndexChanging"
                            OnRowCommand="GridViewShow_RowCommand"
                            ShowHeaderWhenEmpty="True"
                            EmptyDataText="No data"
                            EmptyDataRowStyle-HorizontalAlign="Center" OnRowDataBound="GridViewShow_RowDataBound" meta:resourcekey="GridViewShowResource1">
                            <Columns>
                                <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkboxSelectAll" CssClass="chkheader"
                                            runat="server" Text="All" onclick="toggleSelectAll(this);" meta:resourcekey="chkboxSelectAllResource1" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="SelectCheckBox" CssClass="chkitems" runat="server" onchange="updateButtonStates();" ClientIDMode="Static" meta:resourcekey="SelectCheckBoxResource1" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="No." meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" meta:resourcekey="lblRowNumberResource1" />
                                    </ItemTemplate>
                                    <ItemStyle Width="30px"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Mã máy" meta:resourcekey="TemplateFieldResource3">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MEName") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblMEName" runat="server" Text='<%# Bind("MEName") %>' meta:resourcekey="lblMENameResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MECode" HeaderText="Control No" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="MachineName" HeaderText="Tên máy" meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="MachineCode" HeaderText="Code M/C" meta:resourcekey="BoundFieldResource3" />
                                <asp:TemplateField HeaderText="Type Cal" meta:resourcekey="TemplateFieldResource4">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TypeCal") %>' meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblTypeCal" runat="server" Text='<%# Bind("TypeCal") %>' meta:resourcekey="lblTypeCalResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cal. Freq" meta:resourcekey="TemplateFieldResource5">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CalFreq") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblCalFreq" runat="server" Text='<%# Bind("CalFreq") %>' meta:resourcekey="lblCalFreqResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="ValidTo" HeaderText="Valid to(Tháng hết hạn)" meta:resourcekey="BoundFieldResource4" />
                                <asp:BoundField DataField="PossibleMeasuringRange" HeaderText="Possible measuring range" meta:resourcekey="BoundFieldResource5" />
                                <asp:BoundField DataField="Model" HeaderText="Model" meta:resourcekey="BoundFieldResource6" />
                                <asp:BoundField DataField="SerialNo" HeaderText="Serial No." meta:resourcekey="BoundFieldResource7" />
                                <asp:BoundField DataField="AccuracyOfMaker" HeaderText="Accuracy of Maker" meta:resourcekey="BoundFieldResource8" />
                                <asp:BoundField DataField="Resolution" HeaderText="Resolution" meta:resourcekey="BoundFieldResource9" />
                                <asp:BoundField DataField="Maker" HeaderText="Maker" meta:resourcekey="BoundFieldResource10" />
                                <asp:BoundField DataField="UsingMeasuringRange" HeaderText="Using measuring range" meta:resourcekey="BoundFieldResource11" />
                                <asp:BoundField DataField="ToleranceOfProducts" HeaderText="Tolerance of products" meta:resourcekey="BoundFieldResource12" />
                                <asp:BoundField DataField="AccuracyControl" HeaderText="Accuracy control" meta:resourcekey="BoundFieldResource13" />
                                <asp:BoundField DataField="VerificationPoints" HeaderText="Calibration/ Verification points" meta:resourcekey="BoundFieldResource14" />
                                <asp:BoundField DataField="VerificationStandard" HeaderText="Calibration/ Verification standard" meta:resourcekey="BoundFieldResource15" />
                                <asp:BoundField DataField="VerificationReportFormat" HeaderText="Calibration/ Verification report format" meta:resourcekey="BoundFieldResource16" />
                                <asp:BoundField DataField="StartDate" HeaderText="Start date" meta:resourcekey="BoundFieldResource17" />
                                <asp:BoundField DataField="RegisteredDate" HeaderText="Registered date" meta:resourcekey="BoundFieldResource18" />
                                <asp:BoundField DataField="InstalledPlace" HeaderText="Installed Place" meta:resourcekey="BoundFieldResource19" />
                                <asp:BoundField DataField="Status" HeaderText="Status" meta:resourcekey="BoundFieldResource20" />
                                <asp:BoundField DataField="CalRange" HeaderText="Cal Range" meta:resourcekey="BoundFieldResource21" />
                                <asp:BoundField DataField="High1" HeaderText="High (3 Point)" meta:resourcekey="BoundFieldResource22" />
                                <asp:BoundField DataField="Moderate" HeaderText="Moderate (2 Point)" meta:resourcekey="BoundFieldResource23" />
                                <asp:BoundField DataField="Low1" HeaderText="Low(1 Point)" meta:resourcekey="BoundFieldResource24" />
                                <asp:BoundField DataField="High2" HeaderText="High (2 Point)" meta:resourcekey="BoundFieldResource25" />
                                <asp:BoundField DataField="Low2" HeaderText="Low (1 Point)" meta:resourcekey="BoundFieldResource26" />
                                <asp:BoundField DataField="Hard" HeaderText="Hard (2 Point)" meta:resourcekey="BoundFieldResource27" />
                                <asp:BoundField DataField="Easy" HeaderText="Easy (1 Point)" meta:resourcekey="BoundFieldResource28" />
                                <asp:BoundField DataField="Total" HeaderText="Total Point" meta:resourcekey="BoundFieldResource29" />
                                <asp:BoundField DataField="FrequencyObtained" HeaderText="Tần suất có được" meta:resourcekey="BoundFieldResource30" />
                                <asp:BoundField DataField="AssetNo" HeaderText="Asset No." meta:resourcekey="BoundFieldResource31" />
                                <asp:TemplateField meta:resourcekey="TemplateFieldResource6">
                                    <HeaderTemplate>
                                        Thời gian đăng ký 
                                                     
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("RegDate") %>' meta:resourcekey="Label1Resource1"></asp:Label>
                                        <br />
                                        <span style="font-size: 10px; color: gray; font-style: italic">Lần <%# Eval("Times") %></span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField meta:resourcekey="TemplateFieldResource7">
                                    <HeaderTemplate>
                                        Nội dung đăng ký    
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("RegContent") %>' meta:resourcekey="Label2Resource1"></asp:Label>
                                        <br />
                                        <span style="font-size: 10px; color: gray; font-style: italic">Lần <%# Eval("Times") %></span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="TimeOfExecution" HeaderText="Thời gian thực hiện" meta:resourcekey="BoundFieldResource32" />
                            </Columns>
                            <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle CssClass="pagination-ys" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 right">
                <div class="pull-right">
                    Show	
                        <asp:DropDownList ID="ddlSoDong" runat="server" CssClass="selection pull-right"
                            AutoPostBack="True" OnSelectedIndexChanged="ddlSoDong_SelectedIndexChanged" meta:resourcekey="ddlSoDongResource1">
                            <asp:ListItem Value="10" Text="10 rows" meta:resourcekey="ListItemResource1"></asp:ListItem>
                            <asp:ListItem Value="20" Text="20 rows" meta:resourcekey="ListItemResource2"></asp:ListItem>
                            <asp:ListItem Value="30" Text="30 rows" meta:resourcekey="ListItemResource3"></asp:ListItem>
                            <asp:ListItem Value="50" Text="50 rows" meta:resourcekey="ListItemResource4"></asp:ListItem>
                            <asp:ListItem Value="100" Text="100 rows" meta:resourcekey="ListItemResource5"></asp:ListItem>
                            <asp:ListItem Value="200" Text="200 rows" meta:resourcekey="ListItemResource6"></asp:ListItem>
                        </asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div id="myModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document" style="margin-left: 10%; width: 85%">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">
                            <asp:Label Text="Thêm mới" ID="lblTittle" runat="server" meta:resourcekey="lblTittleResource1" /></h4>
                        <asp:LinkButton Text="Xóa dữ liệu" CssClass="btn btn-info" ID="lbkClear" OnClick="lbkClear_Click" runat="server" meta:resourcekey="lbkClearResource1" />
                    </div>
                    <div class="modal-body">
                        <div class="container1">
                            <div class="row">
                                <!-- Cột 1 -->
                                <div class="col-md-4">
                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">ME Name</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtMEName" Height="30px" runat="server" placeholder="Measuring equipment name" CssClass="form-control styleTB" meta:resourcekey="txtMENameResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Control No</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtMECode" runat="server" Height="30px" placeholder="ME Code" CssClass="form-control styleTB" onfocus="this.value='ME-'" meta:resourcekey="txtMECodeResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Machine Name</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtMachineName" runat="server" Height="30px" placeholder="Tên máy" CssClass="form-control styleTB" meta:resourcekey="txtMachineNameResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Machine Code</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtMachineCode" runat="server" Height="30px" placeholder="Mã máy" CssClass="form-control styleTB" onfocus="this.value='EB1-'" meta:resourcekey="txtMachineCodeResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Type Cal</label>
                                        <div class="col-sm-8">
                                            <%--<asp:TextBox ID="txtTypeCal" runat="server" Height="30px" placeholder=" " CssClass="form-control styleTB" placeholder="Type Cal"></asp:TextBox>--%>
                                            <input list="TypeCals" name="myTension_DanDay_Start" id="ttTypeCal" placeholder="In./Ex."
                                                runat="server" class="form-control styleTB">
                                            <datalist id="TypeCals">
                                                <option value="In.">
                                                <option value="Ex.">
                                            </datalist>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Cal Freq (Month)</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtCalFreq" runat="server" Height="30px" placeholder="Tần suất hiệu chuẩn" CssClass="form-control styleTB" meta:resourcekey="txtCalFreqResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Valid To</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtValidTo" runat="server" Height="30px" placeholder="Tháng hết hạn" CssClass="form-control styleTB" p meta:resourcekey="txtValidToResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Possible Measuring Range</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtPossibleMeasuringRange" runat="server" Height="30px" placeholder="Khoảng đo được của thiết bị đo" CssClass="form-control styleTB" meta:resourcekey="txtPossibleMeasuringRangeResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Model</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtModel" runat="server" Height="30px" placeholder="kiểu,mẫu" CssClass="form-control styleTB" meta:resourcekey="txtModelResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Serial No</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtSerialNo" runat="server" Height="30px" placeholder="Số sêri" CssClass="form-control styleTB" meta:resourcekey="txtSerialNoResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Accuracy Of Maker</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtAccuracyOfMaker" runat="server" Height="30px" placeholder="Độ chính xác của maker" CssClass="form-control styleTB" meta:resourcekey="txtAccuracyOfMakerResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Resolution</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtResolution" runat="server" Height="30px" placeholder="Bước nhảy, vạch chia" CssClass="form-control styleTB" meta:resourcekey="txtResolutionResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <!-- Cột 2 -->
                                <div class="col-md-4">
                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Maker</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtMaker" runat="server" Height="30px" placeholder="Nhà sản xuất" CssClass="form-control styleTB" meta:resourcekey="txtMakerResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Using Measuring Range</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtUsingMeasuringRange" runat="server" Height="30px" placeholder="Khoảng đo sử dụng" CssClass="form-control styleTB" meta:resourcekey="txtUsingMeasuringRangeResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Tolerance Of Products</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtToleranceOfProducts" runat="server" Height="30px" placeholder="Sai số sử dụng" CssClass="form-control styleTB" meta:resourcekey="txtToleranceOfProductsResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Accuracy Control</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtAccuracyControl" runat="server" Height="30px" placeholder="Độ chính xác quản lý" CssClass="form-control styleTB" meta:resourcekey="txtAccuracyControlResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Calibration/ Verification points</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtVerificationPoints" runat="server" Height="30px" placeholder="Độ hiệu chuẩn/kiểm tra xác nhận" CssClass="form-control styleTB" meta:resourcekey="txtVerificationPointsResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Calibration/ Verification standard</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtVerificationStandard" runat="server" Height="30px" placeholder="Tiêu chuẩn hiệu chuẩn/  kiểm tra xác nhận" CssClass="form-control styleTB" meta:resourcekey="txtVerificationStandardResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <!-- Cột 3 -->
                                <div class="col-md-4">
                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Calibration/ Verification report format</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtVerificationReportFormat" runat="server" Height="30px" placeholder="Form báo cáo hiệu chuẩn/ kiểm tra xác nhận" CssClass="form-control styleTB" meta:resourcekey="txtVerificationReportFormatResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Start Date (First cal./ Ver.)</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtStartDate" runat="server" Height="30px" placeholder="Ngày hiệu chuẩn/ kiểm tra xác nhận đầu tiên" CssClass="form-control styleTB" meta:resourcekey="txtStartDateResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Registered Date</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtRegisteredDate" runat="server" Height="30px" placeholder="Ngày đăng ký" CssClass="form-control styleTB" meta:resourcekey="txtRegisteredDateResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">InstalledPlace</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtInstalledPlace" runat="server" Height="30px" placeholder="Nơi lắp đặt" CssClass="form-control styleTB" meta:resourcekey="txtInstalledPlaceResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Status</label>
                                        <div class="col-sm-8">
                                            <input list="Status" name="myTension_DanDay_Start" id="ttStatus"
                                                runat="server" class="form-control styleTB" style="width: 250px" placeholder="Tình trạng">
                                            <datalist id="Status">
                                                <option value="OK">
                                                <option value="Hibernation">
                                                <option value="wait for cal">
                                            </datalist>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">CalRange</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtCalRange" runat="server" Height="30px" placeholder="Cal Range" CssClass="form-control styleTB" meta:resourcekey="txtCalRangeResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">High (3 Point)</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtHigh1" runat="server" Height="30px" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" placeholder="High 3 Point" CssClass="form-control styleTB" meta:resourcekey="txtHigh1Resource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Moderate (2 Point)</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtModerate" runat="server" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" Height="30px" CssClass="form-control styleTB" placeholder="Moderate" meta:resourcekey="txtModerateResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Low (1 Point)</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtLow1" runat="server" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" Height="30px" CssClass="form-control styleTB" placeholder="Low1" meta:resourcekey="txtLow1Resource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">High (2 Point)</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtHigh2" runat="server" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" Height="30px" CssClass="form-control styleTB" placeholder="High2" meta:resourcekey="txtHigh2Resource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Low (1 Point)</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtLow2" runat="server" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" Height="30px" CssClass="form-control styleTB" placeholder="Low2" meta:resourcekey="txtLow2Resource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Hard (2 Point)</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtHard" runat="server" Height="30px" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" CssClass="form-control styleTB" placeholder="Hard" meta:resourcekey="txtHardResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Easy (1 Point)</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtEasy" runat="server" Height="30px" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" CssClass="form-control styleTB" placeholder="Easy" meta:resourcekey="txtEasyResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Total</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtTotal" runat="server" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" Height="30px" CssClass="form-control styleTB" placeholder="Total" meta:resourcekey="txtTotalResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Frequency Obtained</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtFrequencyObtained" runat="server" Height="30px" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" CssClass="form-control styleTB" placeholder="Frequency Obtained" meta:resourcekey="txtFrequencyObtainedResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Asset No</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtAssetNo" runat="server" Height="30px" CssClass="form-control styleTB" placeholder="Asset No" meta:resourcekey="txtAssetNoResource1"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="col-sm-4 control-labelst">Time Of Execution</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtTimeOfExecution" runat="server" Height="30px" CssClass="form-control styleTB" placeholder="Time Of Execution" meta:resourcekey="txtTimeOfExecutionResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="display:none">
                                <div style="padding:5px">
                                    <asp:GridView ID="GridView1" Width="50%" runat="server" AutoGenerateColumns="False"
                                        CssClass="table" ShowHeaderWhenEmpty="True" BorderStyle="None" meta:resourcekey="GridView1Resource1">
                                        <Columns>
                                            <asp:TemplateField HeaderText="No" meta:resourcekey="TemplateFieldResource8">
                                                <ItemTemplate>
                                                    Lần <%# Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Thời gian đăng ký" meta:resourcekey="TemplateFieldResource9">                                               
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtTimeReg" runat="server" Height="30px"  Text='<%# Bind("RegDate") %>' CssClass="form-control styleTB" meta:resourcekey="txtTimeRegResource1"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Nội dung đăng ký" meta:resourcekey="TemplateFieldResource10">                                              
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtContentReg" runat="server" Height="30px"  Text='<%# Bind("RegContent") %>' CssClass="form-control styleTB" meta:resourcekey="txtContentRegResource1"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:LinkButton Text="Save changes" CssClass="btn btn-primary" ID="lbkEdit" OnClick="lbkEdit_Click" runat="server" meta:resourcekey="lbkEditResource1"></asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HiddenFieldid_CodeMachine" runat="server" />
    <asp:HiddenField ID="hiddenFieldRecordId" runat="server" />
    <asp:HiddenField ID="_ID" runat="server" />
    <asp:HiddenField ID="hfAction" runat="server" />
    <script type="text/javascript">
        function setCommandArgument(value) {
            document.getElementById('<%= hfAction.ClientID %>').value = value;
            var recordId = $("#selectedRecordId").val();
            document.getElementById('<%= hiddenFieldRecordId.ClientID %>').value = recordId;
        }
        function openModal() {
            $('#myModal').modal('show');
        }
    </script>
</asp:Content>


