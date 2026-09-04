<%@ Page Title="List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="List.aspx.cs" Inherits="QlyMain.MachinePage.List" EnableEventValidation="false" %>

<%@ Register Src="~/MachinePage/ucLoadSapCode.ascx" TagPrefix="uc1" TagName="ucLoadSapCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/toastr.min.css" rel="stylesheet" />
    <script src="../Scripts/toastr.min.js"></script>
    <section class="content-header">
        <h1>Machine Management</h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Machine</li>
        </ol>
    </section>
    <div class="content">
        <div class="row">
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-4">
                        <asp:LinkButton ID="lbtAdd" runat="server" Text="Add New" OnClick="lbtAdd_Click" CssClass="btn btn-success">
				  <span class="glyphicon glyphicon-plus"></span> Add Machine
				  </asp:LinkButton>
                        <asp:LinkButton Text="Synchronize with Accounting" Visible="false" CssClass="btn btn-default" ID="lbkSyn" OnClick="lbkSyn_Click" runat="server">
                            Synchronize with Accounting <span class="glyphicon glyphicon-refresh"></span>
                        </asp:LinkButton>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-6">
                                <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control" placeholder="Search..."></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <table>
                                    <tr>
                                        <td>
                                            <div>
                                                <asp:LinkButton ID="lbtSearch" runat="server" OnClick="lbtSearch_Click" CssClass="btn btn-info btn-flat">
	                                            <span class="glyphicon glyphicon-search"></span> Search</asp:LinkButton>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="dropdown">
                                                <button class="btn btn-default btn-st" type="button" id="dropdownMenuButtonExt" style="height: 33px" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <h6 style="margin: 0px"><i class="fa fa-file-excel-o" aria-hidden="true">Export Excel </i><span class="caret"></span></h6>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButtonExt" style="width: 270px; padding: 14px">
                                                    <div class="input-group">

                                                        <asp:LinkButton ID="lbtExcel" Text="Excel" runat="server" CssClass="btn btn-default" OnClick="lbtExcel_Click">
                                                            <i class="fa fa-file-excel-o"></i> Excel
                                                        </asp:LinkButton>
                                                        <asp:LinkButton Text="text" runat="server" ID="lbkExportTEPRA" CssClass="btn btn-default btn-st" Height="33px" OnClick="lbkExportTEPRA_Click">
                                                            <i class="fa fa-file-excel-o" aria-hidden="true"></i> Export TEPRA
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
        <div class="row">
            <div class="col-md-8 order-2 order-md-1">
                <div class="panel">
                    <div class="panel-body" style="overflow: auto;">
                        <asp:GridView ID="GridViewShow" runat="server"
                            AutoGenerateColumns="False" DataKeyNames="id_CodeMachine"
                            AllowPaging="True"
                            CssClass="table table-bordered table-condensed"
                            OnPageIndexChanging="GridViewShow_PageIndexChanging"
                            OnRowCommand="GridViewShow_RowCommand"
                            ShowHeaderWhenEmpty="True"
                            EmptyDataText="No data"
                            EmptyDataRowStyle-HorizontalAlign="Center">
                            <Columns>
                                <asp:TemplateField HeaderText="No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Machine Code">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CodeMachine") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblSerialNumber" runat="server" Text='<%# Bind("CodeMachine") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Type" HeaderText="Type" />
                                <asp:BoundField DataField="MachineName" HeaderText="Machine Name" />
                                <asp:BoundField DataField="Group" HeaderText="Machine Group" />
                                <asp:TemplateField HeaderText="Location">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DepartmentCode") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("DepartmentCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fixed Asset Code">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SapCode") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblSAP_code" runat="server" Text='<%# Bind("SapCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" Visible="False" />
                                <asp:BoundField DataField="id_CodeMachine" HeaderText="ID" />
                                <asp:TemplateField HeaderText="Department">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelDepartmentName" runat="server" Text='<%# Bind("DepartmentName2") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="true">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hpDetailReport" runat="server"
                                            NavigateUrl='<%# String.Format("~/Baocao/MachineInfo.aspx?MachineId={0}&CodeMachine={1}", Eval("id_CodeMachine"),Eval("CodeMachine")) %>'
                                            Text="Machine Report">
                                            <i class="fa fa-bar-chart"></i> Machine Report
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField Visible="true">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hpDetail" runat="server"
                                            NavigateUrl='<%# String.Format("Details.aspx?id_CodeMachine={0}", Eval("id_CodeMachine")) %>'
                                            Text="View">
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtonEdit" runat="server" CommandName="EditRow" CommandArgument='<%# Eval("id_CodeMachine") %>' Text="Edit"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandName="DeleteRow" CommandArgument='<%# Eval("id_CodeMachine") %>'
                                            OnClientClick="return confirm('Confirm delete this data?')"
                                            Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>
                            <PagerSettings Mode="NumericFirstLast" />
                            <PagerStyle CssClass="pagination-ys" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="col-md-4 order-1 order-md-2">
                <asp:Panel ID="PanelModify" runat="server" Visible="false">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3>
                                <asp:Label ID="lblTieuDe" Text="Add" runat="server" /></h3>
                        </div>
                        <div class="panel-body">
                            <label>Machine Code</label>
                            <asp:TextBox ID="txtCodeMachine" runat="server" class="form-control"></asp:TextBox>
                            <br />
                            <label>Machine Name</label>
                            <asp:TextBox ID="txtMachineName" runat="server" class="form-control"></asp:TextBox>
                            <br />
                            <label>Machine Type/Rank</label>
                            <asp:TextBox ID="txtType" runat="server" class="form-control" Text="N"></asp:TextBox>
                            <label>
                                <br />
                                Machine Group<br />
                            </label>
                            Select Machine Group List
                            <input list="MainContent_MachineGroups" name="MachineGroup"
                                id="txtMachineGroups" class="form-control" placeholder="Machine Group" runat="server">
                            <datalist id="MachineGroups" runat="server" autocomplete="off">
                            </datalist>
                            <br />
                            <label>Location</label>
                            <asp:TextBox ID="txtViTri" runat="server" class="form-control"></asp:TextBox>
                            <br />
                            <label>Department/Section</label>

                            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control selectDepartment">
                            </asp:DropDownList>
                            <hr />
                            <uc1:ucLoadSapCode runat="server" ID="ucLoadSapCode" />
                        </div>
                        <div class="panel-footer">
                            <asp:Button ID="btnEditSAVE" runat="server" Text="Save" OnClick="btnEditSAVE_Click" CssClass="btn btn-primary" Visible="false" />
                            <asp:Button ID="btnAddAndContinue" runat="server" CssClass="btn btn-primary" OnClick="btnAddAndContinue_Click" Text="Add and Continue" Visible="false" />
                            <asp:Button ID="btnAddAndClose" runat="server" Text="Add and Close" OnClick="btnAddAndClose_Click" CssClass="btn btn-success" Visible="false" />
                            <asp:Button ID="btnCancel" runat="server" Text="Close" OnClick="btnCancel_Click" CssClass="btn btn-default" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 right">
                <div class="pull-right">
                    Show	 
                        <asp:DropDownList ID="ddlSoDong" runat="server" CssClass="selection pull-right"
                            AutoPostBack="true" OnSelectedIndexChanged="ddlSoDong_SelectedIndexChanged">
                            <asp:ListItem Value="10" Text="10 rows"></asp:ListItem>
                            <asp:ListItem Value="20" Text="20 rows"></asp:ListItem>
                            <asp:ListItem Value="30" Text="30 rows"></asp:ListItem>
                            <asp:ListItem Value="50" Text="50 rows"></asp:ListItem>
                            <asp:ListItem Value="100" Text="100 rows"></asp:ListItem>
                            <asp:ListItem Value="200" Text="200 rows"></asp:ListItem>
                        </asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HiddenFieldid_CodeMachine" runat="server" />

    <script type="text/javascript">
        $(function () {
            $('.selectMachineGroup').select2();
            $('.selectDepartment').select2();
            $('.selectGroupInGridview').select2();

        });
    </script>
</asp:Content>
