<%@ Page Title="List" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="List.aspx.cs" Inherits="QlyMain.RepairRequestss.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
    <link href="../../Content/toastr.min.css" rel="stylesheet" />
    <script src="../../Scripts/toastr.min.js"></script>

    <div class="box box-primary">
        <div class="box-header with-border">
            <div class="row">
                <div class="col-md-5">
                    <h3 class="box-title">
                        <asp:Label Text="All requests" runat="server" ID="lblStatusHeader" />
                    </h3>
                </div>
                <div class="col-md-7">
                    <asp:Panel runat="server" DefaultButton="lbtSearch">
                        <div class="box-tools pull-right">
                            <div class="has-feedback">
                                <div class="input-group input-group">
                                    <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control input-sm" placeholder="Search.."></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:LinkButton ID="lbtSearch" runat="server" OnClick="lbtSearch_Click" CssClass="btn btn-info btn-flat btn-sm">
                                            <span class="glyphicon glyphicon-search"></span> Search 
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="LinkButtonClear" runat="server" OnClick="lbtClear_Click" CssClass="btn btn-info btn-flat btn-sm">
                                            <span class="glyphicon glyphicon-trash"></span> Clear 
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lbkEport" runat="server" OnClick="lbkEport_CLick" Visible="false" CssClass="btn btn-info btn-flat btn-sm">
                                            <span class="glyphicon glyphicon-save"></span> Export Excel 
                                        </asp:LinkButton>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
        <div class="box-body no-padding" style="overflow:auto; min-height:400px">
            <asp:GridView ID="GridViewShow" runat="server"
                AutoGenerateColumns="False" DataKeyNames="RequestID"
                AllowPaging="True"
                CssClass="table table-bordered table-hover table-condensed"
                OnRowEditing="GridViewShow_RowEditing"
                OnRowDeleting="GridViewShow_RowDeleting"
                OnPageIndexChanging="GridViewShow_PageIndexChanging"
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
                    <asp:TemplateField HeaderText="RQ No">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLinkRequestNo" runat="server" Font-Bold="true"
                                NavigateUrl='<%# String.Format("Details.aspx?RequestID={0}", Eval("RequestID")) %>'
                                Text='<%# Bind("RequestNo") %>'>
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                     
                    <asp:BoundField DataField="RequestID" HeaderText="RequestID" Visible="False" />
                   
                    <asp:TemplateField HeaderText="MACHINE">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLinkCodeMachine" runat="server" Font-Bold="true"
                                NavigateUrl='<%# String.Format("~/Baocao/MachineInfo.aspx?MachineId={0}&CodeMachine={1}",Eval("MachineId"), Eval("CodeMachine")) %>'
                                Text='<%# Bind("CodeMachine") %>'> 
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="MACHINE">
                        <ItemTemplate>
                            <b>NAME:</b>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("MachineName") %>'></asp:Label><br />
                            <b>GROUP:</b>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Group") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="REQUESTER">
                        <ItemTemplate>
                            <b>NAME:</b>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("FullName") %>'></asp:Label>
                            <br />
                            <b>DEPARTMENT:</b>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("DepartmentName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="ProblemName" HeaderText="CONTENT" />
                    
                    <asp:TemplateField HeaderText="FAILURE DATE">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Font-Bold="true" Text='<%# Eval("NgayLoi") == null ? "N/A" : Eval("NgayLoi", "{0: dd.MMM.yy}") %>'> 
                            </asp:Label>&nbsp;
                            <asp:Label ID="Label2" runat="server" Font-Bold="true" ForeColor="Gray" Text='<%# Eval("NgayLoi") == null ? "N/A" : Eval("NgayLoi", "{0:HH:mm}") %>'> 
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="STATUS" HeaderStyle-CssClass="hidden-xs hidden-sm" ItemStyle-CssClass="hidden-xs hidden-sm">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" Font-Bold="true" Text='<%# Eval("Status") %>' runat="server" CssClass="cssStatus" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="ACTIONS">
                        <HeaderTemplate>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div>
                                <div class="dropdown">
                                    <button class="dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
                                        <span class="fa fa-cog"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <asp:HyperLink ID="HyperLink1" runat="server"
                                                NavigateUrl='<%# String.Format("Details2.aspx?RequestID={0}", Eval("RequestID")) %>'
                                                Text="Details"></asp:HyperLink>
                                        </li>
                                        <li>
                                            <asp:HyperLink ID="HyperLink4" runat="server"
                                                NavigateUrl='<%# String.Format("Edit.aspx?RequestID={0}", Eval("RequestID")) %>'
                                                Text="Edit"></asp:HyperLink>
                                        </li>
                                        <li>
                                            <asp:HyperLink ID="HyperLink2" runat="server"
                                                NavigateUrl='<%# String.Format("Delete.aspx?RequestID={0}", Eval("RequestID")) %>'
                                                Text="Delete"></asp:HyperLink>
                                        </li>
                                        <li>
                                            <asp:HyperLink ID="HyperLink3" runat="server"
                                                NavigateUrl='<%# String.Format("Cancel.aspx?RequestID={0}", Eval("RequestID")) %>'
                                                Text="Cancel"></asp:HyperLink>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="VIEW DETAILS">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLinkDetails" runat="server" 
                                NavigateUrl='<%# String.Format("Details.aspx?RequestID={0}", Eval("RequestID")) %>'
                                Text="View" CssClass="btn btn-success btn-sm">
                            </asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle> 
                <PagerSettings Mode="NumericFirstLast" />
                <PagerStyle CssClass="pagination-ys" />
            </asp:GridView>
        </div>
        <div class="box-footer no-padding">
            <div class="pull-right">
                Show
                <asp:DropDownList ID="ddlSoDong" runat="server" CssClass="selection pull-right" AutoPostBack="true" OnSelectedIndexChanged="ddlSoDong_SelectedIndexChanged">
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

    <asp:HiddenField ID="HiddenFieldStatus" runat="server" />
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>

    <p>Accounts belonging to Maintenance will, by default, display all requests</p>
</asp:Content>