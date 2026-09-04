<%@ Page Title="Machine Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MachineReport.aspx.cs" Inherits="QlyMain.Baocao.MachineReport" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="../Content/plugins/bootstrap-datetimepicker/moment-with-locales.min.js"></script>
    <script src="../Content/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <section class="content-header">
        <h1>Machine information
         
      </h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>

            <li class="active">MachineInfo</li>
        </ol>
    </section>
    <asp:Literal ID="LiteralThongBao" runat="server"></asp:Literal>
    <section class="invoice">
        <!-- title row -->
        <div class="row">
            <div class="col-sm-12 invoice-col">
                <div class="has-feedback">
                    <table class="no-border">
                        <tr>
                            <td>Machine code</td>
                            <td> 
                                  <asp:DropDownList runat="server" ID="ddlMachine" Width="250" CssClass="selectType">
  </asp:DropDownList>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>From date 
                                <br />
                                <asp:TextBox runat="server" ID="txtFromDate" CssClass="form-control input-sm txtFromDate" placeholder="From date.." Width="200px"></asp:TextBox>
                            </td>
                            <td>To date  
                                <br />
                                <asp:TextBox runat="server" ID="txtTodate" CssClass="form-control input-sm txtTodate" placeholder="To date.."></asp:TextBox>

                            </td>
                            <td>
                                <br />
                                <div class="input-group input-group">


                                    <span class="input-group-btn">&nbsp;
                          
                            <asp:LinkButton ID="lbtSearch" runat="server" OnClick="lbtSearch_Click" CssClass="btn btn-info btn-flat btn-sm">
                                               <span class="glyphicon glyphicon-search"></span> Search 
                            </asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonClear" runat="server" OnClick="lbtClear_Click" CssClass="btn btn-default btn-flat btn-sm">
<span class="glyphicon glyphicon-trash"></span> Clear 
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lbkEport" runat="server" OnClick="lbkEport_CLick" CssClass="btn btn-default btn-flat btn-sm">
<span class="glyphicon glyphicon-save"></span> Export Excel 
                                        </asp:LinkButton>


                                    </span>


                                </div>
                            </td>
  
                        </tr>
                    </table>
                    <hr />


                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-xs-4">
                <h2 class="page-header">
                    <i class="fa fa-caret-right"></i>Machine code:
                    <asp:Label runat="server" ID="lblCodeMachine" Font-Bold="true" CssClass=""></asp:Label>

                </h2>
            </div>


            <!-- /.col -->
        </div>
        <!-- info row -->
        <div class="row invoice-info">

            <div class="col-sm-4 invoice-col">

                <b>Machine name:</b>
                <asp:Label runat="server" ID="lblMachineName"></asp:Label>
                <br />
                <b>Machine group:</b>
                <asp:Label runat="server" ID="lblMachineGroup"></asp:Label>
                <br />
                <b>Departmentn:</b>
                <asp:Label runat="server" ID="lblDeparmentName"></asp:Label>
                <br />
                <b>Section:</b>
                <asp:Label runat="server" ID="lblDeparmentGroup"></asp:Label>
                <br />

            </div>


            <!-- /.col -->
        </div>
        <br />
        <!-- /.row -->

        <!-- Table row -->
        <div class="row">
            <div class="col-md-6 col-xs-6 table-responsive">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Incident history</h3>
                    </div>
                    <div class="box-body">
                        <asp:GridView runat="server" ID="gvMayHong" AutoGenerateColumns="False"
                            CssClass="table table-striped">
                            <Columns>
                                <asp:TemplateField HeaderText="No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="MachineId" HeaderText="MachineId" Visible="false" />
                                <asp:TemplateField HeaderText="Code máy">

                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLinkCodeMachine" runat="server" Font-Bold="true"
                                            NavigateUrl='<%# String.Format("~/Baocao/MachineInfo.aspx?MachineId={0}&CodeMachine={1}",Eval("MachineId"), Eval("CodeMachine")) %>'
                                            Text='<%# Bind("CodeMachine") %>'> 
                                        </asp:HyperLink>


                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Date of shutdown">
                                    <HeaderTemplate>
                                        <asp:Label ID="TextBoxHeadtotal_downtime_minutes" runat="server" Text="Date" ToolTip="Date of shutdown">
            <i class="fa fa-info-circle" aria-hidden="true" ></i> Date
                                        </asp:Label>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Font-Bold="true" Text='<%# Eval("NgayLoi") == null ? "N/A" : Eval("NgayLoi", "{0: dd.MMM.yy}") %>'> 
                                        </asp:Label>

                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Right" />

                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Total (Minutes) Stop">
                                    <HeaderTemplate>
                                        <asp:Label ID="TextBoxHeadtotal_downtime_minutes" runat="server" Text="Total (Minutes) Stop" ToolTip="Total downtime">
            <i class="fa fa-info-circle" aria-hidden="true" ></i> Stop Time (Minutes)
                                        </asp:Label>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("total_downtime_minutes") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:BoundField DataField="CodeSuCo" HeaderText="Problem Code" />
                                <asp:TemplateField HeaderText="Request No">
                                    <ItemTemplate>

                                        <asp:HyperLink ID="HyperLinkRequestNo" runat="server" Font-Bold="true"
                                            NavigateUrl='<%# String.Format("~/MachineRepair/RepairRequestss/Details.aspx?RequestID={0}&RequestNo={1}",Eval("RequestID"), Eval("RequestNo")) %>'
                                            Text='<%# Bind("RequestNo") %>'> 
                                        </asp:HyperLink>
                                    </ItemTemplate>

                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>
                    </div>
                </div>

            </div>
            <div class="col-1-md-6 col-sm-6">

                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Spare used for repair</h3>
                    </div>
                    <div class="box-body">
                         
                    </div>
                    <!-- /.box-body -->
                </div>

            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

        <div class="row">
            <div class="col-md-12">
                 
            </div>
        </div>
        <!-- /.row -->

    </section>




   
  
    <script>  
        $(function () {
            $('.txtFromDate').datetimepicker({
                format: 'MM/DD/yyyy'
            });
            $('.txtTodate').datetimepicker({
                format: 'MM/DD/yyyy'
            });
        });

        $(function () {
            $('.selectType').select2();
        });
    </script> 
</asp:Content>