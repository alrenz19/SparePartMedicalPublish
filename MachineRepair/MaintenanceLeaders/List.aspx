<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="QlyMain.MachineRepair.MaintenanceLeaders.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="content-header">
        <h1>MaintenanceLeader <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">MaintenanceLeader</li>
        </ol>
    </section>

    <div class="content">
        <h1 class="h2">List MaintenanceLeader</h1>
        <div class="row">
            <div class="col-md-4">
                <asp:LinkButton ID="lbtAdd" runat="server" Text="Add New" OnClick="lbtAdd_Click" CssClass="btn btn-success">
				  <span class="glyphicon glyphicon-plus"></span> Add New 
                </asp:LinkButton>
            </div>
            <div class="col-md-4">
                <div class="input-group input-group">
                    <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control" placeholder="Search.."></asp:TextBox>
                    <span class="input-group-btn">
                        <asp:LinkButton ID="lbtSearch" runat="server" OnClick="lbtSearch_Click" CssClass="btn btn-info btn-flat">
				  <span class="glyphicon glyphicon-search"></span> Search</asp:LinkButton>
                    </span>
                </div>
            </div>
            <div class="col-md-4 right">
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

        <div class="panel">
            <div class="panel-body">
                <asp:GridView ID="GridViewShow" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="RequestID"
                    AllowPaging="True"
                    CssClass="table table-bordered table-condensed"
                    OnRowEditing="GridViewShow_RowEditing"
                    OnRowDeleting="GridViewShow_RowDeleting"
                    OnPageIndexChanging="GridViewShow_PageIndexChanging"
                    ShowHeaderWhenEmpty="true"
                    EmptyDataText="No data"
                    EmptyDataRowStyle-HorizontalAlign="Center">
                    <Columns>
                        <asp:TemplateField HeaderText="No.">
                            <ItemTemplate>
                                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                            </ItemTemplate>
                            <ItemStyle Width="30px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="RequestNo" HeaderText="Request ID" />
                        <asp:BoundField DataField="PolicyDescription" HeaderText="Corrective Action" />
                        <asp:BoundField DataField="NoteForProduct" HeaderText="Production Remarks" />
                        <asp:BoundField DataField="ConfirmDate" HeaderText="Confirmed Date" />
                        <asp:BoundField DataField="ProblemName" HeaderText="Issue" />
                        <asp:BoundField DataField="LeaderName" HeaderText="Team Leader" />
                        <asp:BoundField DataField="CodeMachine" HeaderText="Machine ID" />
                        <asp:BoundField DataField="MachineName" HeaderText="Machine Name" />

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="hpDetail" runat="server"
                                    NavigateUrl='<%# String.Format("Details.aspx?LeaderID={0}", Eval("LeaderID")) %>'
                                    Text="Xem" CssClass="btn btn-success">
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="btn btn-warning" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle CssClass="pagination-ys" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
