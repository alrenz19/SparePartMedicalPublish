<%@ Page Title="List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="List.aspx.cs" Inherits="QlyMaint.MaintenanceLeaderPage.List" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <section class="content-header">
        <h1>Quản lý đối sách <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">MaintenanceLeader</li>
        </ol>
    </section>

    <div class="content">

        <div class="row">
            <div class="col-md-4">
                <asp:LinkButton ID="lbtAdd" runat="server" Text="Add New" OnClick="lbtAdd_Click" CssClass="btn btn-success" Visible="false">
				  <span class="glyphicon glyphicon-plus"></span> Add New 
				  </asp:LinkButton>



            </div>
            <div class="col-md-4">
                <div class="input-group input-group">
                    <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control" placeholder="Search.."></asp:TextBox>
                    <span class="input-group-btn">
                        <asp:LinkButton ID="lbtSearch" runat="server" OnClick="lbtSearch_Click" CssClass="btn btn-info btn-flat">
				  <span class="glyphicon glyphicon-search"></span> Tìm</asp:LinkButton>

                    </span>
                    <asp:DropDownList ID="ddlDoiSach" runat="server" Width="120px" CssClass="btn btn-info btn-flat form-input form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDoiSach_SelectedIndexChanged">
                        <asp:ListItem>ALL</asp:ListItem>
                        <asp:ListItem Selected="True">Follow</asp:ListItem>
                    </asp:DropDownList>
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
                    AutoGenerateColumns="False" DataKeyNames="LeaderID,RequestID"
                    AllowPaging="True"
                    CssClass="table table-bordered table-condensed"
                    OnRowEditing="GridViewShow_RowEditing"
                    OnRowDeleting="GridViewShow_RowDeleting"
                    OnPageIndexChanging="GridViewShow_PageIndexChanging"
                    ShowHeaderWhenEmpty="True"
                    EmptyDataText="No data"
                    EmptyDataRowStyle-HorizontalAlign="Center">
                    <Columns>
                        <asp:TemplateField HeaderText=" + ">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                            <ItemStyle Width="10px" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="ProblemName" HeaderText="SỰ CỐ" />

                        <asp:BoundField DataField="CodeMachine" HeaderText="MÃ MÁY" />
                        <asp:BoundField DataField="MachineName" HeaderText="TÊN MÁY" />
                        <asp:BoundField DataField="LeaderName" HeaderText="PHỤ TRÁCH" />
                        <asp:BoundField DataField="PolicyDescription" HeaderText="ĐỐI SÁCH" />
                        <asp:BoundField DataField="NoteForProduct" HeaderText="GHI CHÚ CHO SẢN XUẤT" />
                        <asp:BoundField DataField="ConfirmDate" HeaderText="NGÀY XÁC NHẬN" DataFormatString="{0:dd.MMM.yy}" />
                        <asp:TemplateField HeaderText="Mã Request">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RequestID") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HplRepairRequestss" runat="server"
                                    NavigateUrl='<%# String.Format("~/MachineRepair/RepairRequestss/Details?RequestID={0}", Eval("RequestID")) %>'
                                    Text='<%# Bind("RequestNo") %>'>  </asp:HyperLink>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="hpDetail" runat="server"
                                    NavigateUrl='<%# String.Format("Details.aspx?LeaderID={0}&RequestID={1}", Eval("LeaderID"),Eval("RequestID")) %>'
                                    Text="Xem" CssClass="btn btn-success">
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="btn btn-warning" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>
                            </ItemTemplate>

                            <ItemStyle Width="5%"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
                            </ItemTemplate>

                            <ItemStyle Width="5%"></ItemStyle>
                        </asp:TemplateField>

                    </Columns>

                    <EmptyDataRowStyle HorizontalAlign="Center"></EmptyDataRowStyle>

                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle CssClass="pagination-ys" />
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>


