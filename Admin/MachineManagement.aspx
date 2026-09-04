<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MachineManagement.aspx.cs" Inherits="QlyMain.Admin.MachineManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--    <link href="../../Content/toastr.min.css" rel="stylesheet" />
<script src="../../Scripts/toastr.min.js"></script>--%>
    <link href="../Content/toastr.min.css" rel="stylesheet" />
    <script src="../Scripts/toastr.min.js"></script>
    <script type="text/javascript">
        $(window).bind('load', function () {
            var headerChk = $(".chkheaderE input");
            var itemChk = $(".chkitemsE input");
            headerChk.bind("click", function () {
                itemChk.each(function () { this.checked = headerChk[0].checked; })
            });
            itemChk.bind("click", function () { if ($(this).checked == false) headerChk[0].checked = false; });
        });
    </script>
    <section class="content-header">
        <h1>Machine list <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Machine Management</li>
        </ol>
    </section>
    <div class="content">
        <div class="panel panel-info">


            <div class="row">

                <div class="col-sm-12 col-md-12 col-lg-12">

                    <asp:LinkButton Text="Add Machine" CssClass="btn btn-primary" ID="lbkOpenAddMachine" OnClick="lbkOpenAddMachine_Click" runat="server" />



                    <asp:Panel runat="server" ID="pnThemMay" Visible="false">
                        <table>
                            <tr>

                                <td>Machine name
                     <asp:TextBox runat="server" ID="txtMachineName" placeholder="Machine name Example: Tube Extruder B1 ,.. " CssClass="form-control" />
                                </td>
                                <td>Machine code<br />
                                    <asp:TextBox runat="server" onfocus="this.value='EB1-'" placeholder="Machine code Example: EB1-1226 ,.." ID="txtCodeMachine" CssClass="form-control" />
                                </td>
                                <td>Machine group
                                    <asp:HyperLink NavigateUrl="~/MachineGroupPage/Add" runat="server">
                                        Add machine group
                                    </asp:HyperLink>
                                    <br />
                                    <asp:DropDownList ID="ddlMachineGroup" runat="server" CssClass="selectMachineGroup form-control"></asp:DropDownList>
                                </td>
                                <td>Location
                                    <br />
                                    <asp:TextBox runat="server" placeholder="Machine location Example: P1-3F-SPGW (3F-G) ,P1-1F-Cent MD.." ID="txtViTri" CssClass="form-control" />
                                </td>
                                <td>
                                    <br />
                                    <asp:LinkButton Text="Save" CssClass="btn btn-primary" runat="server" ID="btnSave" OnClick="btnSave_Click" />

                                    <asp:LinkButton Text="Close" CssClass="btn btn-primary" runat="server" ID="btnClose" OnClick="btnClose_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>



                    <asp:Label Text="" ID="lblThongbao" runat="server" />
                    <asp:Literal ID="LiteralThongBao" runat="server"></asp:Literal>


                </div>

            </div>
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-6">
                </div>
                <div class="col-sm-12 col-md-6 col-lg-6">
                    <div class="navbar-form" role="search" style="float: right">
                        <div class="input-group">
                            <span class="input-group-addon">
                                <asp:CheckBox ID="CheckBoxStatus" Text=""  runat="server" />
                                
                            </span>
                            <span class="input-group-btn">
                                <asp:TextBox runat="server" ID="txtSearchMachine" placeholder="Search for machine code, machine name, machine group ..." CssClass="form-control" />
                                <asp:LinkButton Text="Search" runat="server" Font-Bold="true" CssClass="btn btn-default" ID="lbkSearchMachine" OnClick="lbkSearchMachine_Click" />
                            
                                </span>
                                <asp:LinkButton ID="lbtExcel" Text="Excel" runat="server" CssClass="btn btn-default" OnClick="lbtExcel_Click">
                                    <i class="fa fa-file-excel-o"></i> Excel
                                </asp:LinkButton>
                        </div>
                        <br />
                        Check: Filter OK machine. Uncheck: Filter error machine
                    </div>
                </div>
            </div>

            <div class="row">

                <div class="col-sm-12 col-md-12 col-lg-12">
                    <asp:GridView ID="gvMachine" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-bordered table-striped gvstyling box-shadow" ShowHeaderWhenEmpty="True" BorderStyle="None"
                        BorderWidth="1px" DataKeyNames="id_CodeMachine" Font-Size="12px"
                        AllowPaging="True" OnPageIndexChanging="gvMachine_PageIndexChanging"
                        OnRowEditing="OnRowEditing"
                        OnRowCancelingEdit="OnRowCancelingEdit"
                        OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting"
                        CellPadding="3" CellSpacing="2" OnRowDataBound="gvMachine_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderStyle-Width="1px">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkboxSelectAll" CssClass="chkheaderE"
                                        runat="server" Text="" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="SelectCheckBox" CssClass="chkitemsE" runat="server" />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblStatusE" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <HeaderStyle Width="1px"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Machine code">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCodeMachineEdit" runat="server" Text='<%# Bind("CodeMachine") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CodeMachine") %>'></asp:Label>
                                </ItemTemplate>


                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Machine name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtMachineNameEdit" runat="server" Text='<%# Bind("MachineName") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("MachineName") %>'></asp:Label>
                                </ItemTemplate>


                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Machine group">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlGroup" runat="server" CssClass="selectGroupInGridview">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Group") %>'></asp:Label>
                                </ItemTemplate>


                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Location">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDepartmentCode" runat="server" Text='<%# Bind("DepartmentCode") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelDepartmentCode" runat="server" Text='<%# Bind("DepartmentCode") %>'></asp:Label>
                                </ItemTemplate>


                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Department">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="selectDepartment">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>

                                    <asp:Label ID="LabelDepartmentName" runat="server" Text='<%# Bind("DepartmentName2") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:CheckBox ID="checkBoxStatus" runat="server"  ></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-info btn-sm" Text="Save"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-default btn-sm" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-success btn-sm" Text="Edit"></asp:LinkButton>

                                    &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger btn-sm" Text="Delete"
                                        OnClientClick="if(!confirm('Are you sure you want to delete this machine??')) return false;"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                        <PagerSettings Mode="NumericFirstLast" />
                    </asp:GridView>
                </div>
            </div>
            <asp:LinkButton Text="Rename machine group" runat="server" CssClass="btn btn-primary" ID="lbkOpenGroup" OnClick="lbkOpenGroup_Click" />
            <asp:Panel runat="server" ID="pnAddGroup" Visible="false">
                <table>
                    <tr>
                        <td>
                            <div class="navbar-form" role="search">
                                <b>Type</b>
                                <br />
                                <div class="input-group">
                                    <span class="input-group-btn">
                                        <asp:TextBox runat="server" ID="txtLoai" placeholder="Find Machine Type (Example : Extru..)" CssClass="form-control" />
                                        <asp:LinkButton Text="Find" runat="server" Font-Bold="true" CssClass="btn btn-primary" ID="btnFind" OnClick="btnFind_Click" />
                                    </span>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="navbar-form" role="search">
                                <b>Group</b>
                                <br />
                                <div class="input-group">
                                    <asp:TextBox runat="server" ID="txtGroup" placeholder="Add Error Code group  (Example : Extruder...)" CssClass="form-control" />
                                    <span class="input-group-btn">
                                        <asp:LinkButton Text="Save" Font-Bold="true" CssClass="btn btn-primary"
                                            runat="server" ID="lbkSaveGroup" OnClick="lbkSaveGroup_Click" />
                                    </span>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>

    <asp:HiddenField ID="_Id" runat="server" />
    <script type="text/javascript">
        $(function () {
            $('.selectMachineGroup').select2();
            $('.selectDepartment').select2();
            $('.selectGroupInGridview').select2();

        });
    </script>
</asp:Content>
