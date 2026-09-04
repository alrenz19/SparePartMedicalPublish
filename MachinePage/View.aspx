<%@ Page Title="List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="View.aspx.cs" Inherits="QlyMain.MachinePage.View" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <section class="content-header">
        <h1>Machine <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Machine</li>
        </ol>
    </section>

    <section class="content">
       
       

        <div class="panel">
            <div class="panel-body">
                <asp:GridView ID="GridViewShow" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="id_CodeMachine"
                    AllowPaging="True"
                    CssClass="table table-bordered table-condensed"
                    OnRowEditing="GridViewShow_RowEditing"
                    OnRowDeleting="GridViewShow_RowDeleting"
                    OnPageIndexChanging="GridViewShow_PageIndexChanging"
                    ShowHeaderWhenEmpty="true"
                    EmptyDataText="No data"
                    EmptyDataRowStyle-HorizontalAlign="Center">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderTemplate>No</HeaderTemplate>
                            <ItemTemplate><%#(Container.DataItemIndex+1)%></ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="CodeMachine" HeaderText="Code Machine" /> 
                        <asp:BoundField DataField="MachineName" HeaderText="Machine Name" />
                        <asp:BoundField DataField="Group" HeaderText="Group" />
                        <asp:BoundField DataField="RequestNo" HeaderText="RequestNo" />
                        
                      
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:HyperLink ID="hpDetail" runat="server"
                                    NavigateUrl='<%# String.Format("Details.aspx?id_CodeMachine={0}", Eval("id_CodeMachine")) %>'
                                    Text="Xem" CssClass="btn btn-success">
				  </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:LinkButton CssClass="btn btn-warning" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
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
    </section>

</asp:Content>


