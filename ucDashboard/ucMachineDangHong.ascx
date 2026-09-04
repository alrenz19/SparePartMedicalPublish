<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMachineDangHong.ascx.cs" Inherits="QlyMain.ucDashboard.ucMachineDangHong" %>


<div class="box box-info">
    <div class="box-header ui-sortable-handle" style="cursor: move;">
        <i class="fa fa-envelope"></i>

        <h3 class="box-title">MACHINES STOPPED</h3>
        <!-- tools box -->
        <div class="pull-right box-tools">

            <button type="button" class="btn btn-box-tool btn-sm" data-widget="collapse" data-toggle="tooltip" title="View Report" style="margin-right: 5px;" data-original-title="Collapse">
                <i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool btn-sm" data-widget="remove">
                <i class="fa fa-times"></i>
            </button>

        </div>
    </div>
    <div class="box-body">

   

        <asp:GridView ID="GridViewShow" runat="server"
            AutoGenerateColumns="False" GridLines="None" DataKeyNames="id_CodeMachine"
            CssClass="table table-bordered table-striped table-condensed col-xs-12 table-responsive"
            ShowHeaderWhenEmpty="true"
            EmptyDataText="No machines are currently down"
            EmptyDataRowStyle-HorizontalAlign="Center" OnPageIndexChanging="GridViewShow_PageIndexChanging">


            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>No</HeaderTemplate>
                    <ItemTemplate><%#(Container.DataItemIndex+1)%></ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="DepartmentName" HeaderText="Department" />
                <asp:BoundField DataField="BoPhan" HeaderText="Section" />
                <asp:TemplateField HeaderText="Machine Code">

                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLinkCodeMachine" runat="server"  Font-Bold="true"
                            NavigateUrl='<%# String.Format("~/Baocao/MachineInfo.aspx?MachineId={0}&CodeMachine={1}",Eval("id_CodeMachine"), Eval("CodeMachine")) %>'
                            Text='<%# Bind("CodeMachine") %>'> 
                        </asp:HyperLink>


                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Machine name and issue">

                    <ItemTemplate>

                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("MachineName") %>'> 
                        </asp:Label>
                        <br />
                        &#8594; <small>
                            <asp:Label ID="Label2" runat="server" ForeColor="#d12e4c" Text='<%# Eval("ProblemName") %>'> 
                            </asp:Label></small>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:BoundField DataField="DepartmentCode" HeaderText="Location" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:TemplateField HeaderText="MACHINE FAILURE DATE">

                    <ItemTemplate>

                        <asp:Label ID="Label1" runat="server" Font-Bold="true" Text='<%# Eval("NgayLoi") == null ? "N/A" : Eval("NgayLoi", "{0: dd.MMM.yy}") %>'> 
                        </asp:Label>&nbsp;
                <asp:Label ID="Label2" runat="server" Font-Bold="true" ForeColor="Gray" Text='<%# Eval("NgayLoi") == null ? "N/A" : Eval("NgayLoi", "{0:HH:mm}") %>'> 
                </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="KhoangThoiGianDaQua" HeaderText="Downtime" />


                <asp:TemplateField>
                    <HeaderTemplate>Request No.</HeaderTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="hpDetail" runat="server" 
                            NavigateUrl='<%# String.Format("~/MachineRepair/RepairRequestss/Details.aspx?RequestID={0}", Eval("RequestID")) %>'
                            Text='<%# Eval("RequestNo") %>' ToolTip='<%# Eval("ProblemName") %>'>
	  </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle CssClass="pagination-ys" />
        </asp:GridView>


    </div>
    <div class="box-footer clearfix">
        <%-- <button type="button" class="pull-right btn btn-default" id="sendEmail">
            Send
               
            <i class="fa fa-arrow-circle-right"></i>
        </button>--%>
    </div>
</div>