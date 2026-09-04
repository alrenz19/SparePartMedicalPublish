<%@ Page Title="List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="List.aspx.cs" Inherits="QlyMaint.NhomMailPage.List" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <section class="content-header">
        <h1>Nhóm mail liên lạc <small></small></h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Nhom Mail</li>
        </ol>
    </section>

    <div class="content">

        <div class="row">
            <div class="col-md-12">
                <asp:LinkButton ID="lbtAdd" runat="server" Text="Add New" OnClick="lbtAdd_Click" CssClass="btn btn-success">
				  <span class="glyphicon glyphicon-plus"></span> Thêm nhóm
				  </asp:LinkButton>
                 
            </div>
          
        </div>

        <div class="panel">
            <div class="panel-body">
                <asp:GridView ID="GridViewShow" runat="server"
                    AutoGenerateColumns="False" DataKeyNames="NhomMailID"
                    AllowPaging="True"
                    CssClass="table table-bordered table-condensed"
                    OnRowEditing="GridViewShow_RowEditing"
                    OnRowDeleting="GridViewShow_RowDeleting"
                    OnPageIndexChanging="GridViewShow_PageIndexChanging"
                    ShowHeaderWhenEmpty="true"
                    EmptyDataText="No data"
                   

                    EmptyDataRowStyle-HorizontalAlign="Center">
                    <Columns>
                        <asp:BoundField DataField="TenNhom" HeaderText="Nhóm mail" />
                        <asp:BoundField DataField="UserID" HeaderText="UserID" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="hpDetail" runat="server"
                                    NavigateUrl='<%# String.Format("AddMail.aspx?NhomMailID={0}", Eval("NhomMailID")) %>'
                                    Text="Xem nhóm và thêm mail" CssClass="btn btn-success">
				  </asp:HyperLink>
                                <asp:LinkButton CssClass="btn btn-warning" runat="server" Text="Sửa" CommandName="Edit"></asp:LinkButton>
                                <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Xóa" CommandName="Delete"></asp:LinkButton>
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


