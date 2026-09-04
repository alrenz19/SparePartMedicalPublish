<%@ Page Title="Add" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AddMail.aspx.cs" Inherits="QlyMaint.NhomMailPage.AddMail" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <section class="content-header">
        <h1>Thêm Mail vào nhóm </h1>
        <ol class="breadcrumb">
            <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active"></li>
        </ol>
    </section>
    <div class="content">
        <asp:Panel ID="PanelModify" runat="server">
            <div class="panel panel-success">
                <div class="panel-heading">Add New </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3">
                             <label>Chọn mail </label>
 <asp:DropDownList runat="server" ID="ddlUser" CssClass="selectType" AutoPostBack="true" OnSelectedIndexChanged="ddlUser_SelectedIndexChanged">
  
 </asp:DropDownList>
                        </div>
                        <div class="col-md-9"> 
                            <asp:GridView runat="server" ID="gvUser" CssClass="table table-condensed">

                            </asp:GridView>
                        </div>
                    </div>
                   
                    
                    <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
                    <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
                </div>


                <div class="panel-footer">
                    
                    <asp:Button ID="btnCancel" runat="server" Text="Đóng lại" OnClick="btnCancel_Click" CssClass="btn btn-default" />
                </div>
            </div>
        </asp:Panel>
    </div>
    <script>
        $(function () {
            $('.selectType').select2(); 
        });
    </script>
</asp:Content>

