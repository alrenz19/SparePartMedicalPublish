<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMachineTopMayHong.ascx.cs" 
    Inherits="QlyMain.ucDashboard.ucMachineTopMayHong" %>


 
        <div class="box box-solid">
            <div class="box-header with-border">
                <h3 class="box-title"><i class="fa fa-industry"></i>
                    Top <asp:Label ID="lblTop" runat="server"></asp:Label> machines failed the most in 
                    <asp:Label ID="lblSoNgay" runat="server"></asp:Label> recent days</h3>

                <div class="pull-right box-tools">

                    <button type="button" class="btn btn-box-tool btn-sm" data-widget="collapse" data-toggle="tooltip" title="View Report" style="margin-right: 5px;" data-original-title="Collapse">
                        <i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                        <i class="fa fa-times"></i>
                    </button>
                    
                    <asp:HyperLink NavigateUrl="~/Baocao/DepartmentReport.aspx" runat="server">
                        <i class="fa fa-bar-chart"></i>View Report
                    </asp:HyperLink>
                </div>
                <!-- /. tools -->




            </div>
            <div class="box-body no-padding">
                <asp:Repeater ID="RepeaterTopMayHong" runat="server">
                    <HeaderTemplate>
                        <ul class="nav nav-pills nav-stacked">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li> 
                            <a href='<%# String.Format("~/Baocao/MachineInfo.aspx?MachineId={0}&CodeMachine={1}",Eval("id_CodeMachine"), Eval("CodeMachine")) %>' 
                                 
                                runat="server"><i class="fa fa-inbox"></i>
                               <div class="label" style="font-size:14px;color:#3c8dbc; text-decoration:underline;"> 
                                <%# Eval("CodeMachine") %> </div>
                            <small class="text-gray"><%# Eval("DepartmentCode") %> </small>
                            <span class="pull-right"><%# Eval("failure_count") %> times</span></a></li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>





            </div>
            <!-- /.box-body -->
        </div>
        <!-- /. box -->