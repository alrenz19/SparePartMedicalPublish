<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Index.aspx.cs"
    MaintainScrollPositionOnPostback="true"
    Inherits="QlyMain.Index" %>

<%@ Register Src="~/ucDashboard/ucHeadDashboard.ascx" TagPrefix="uc1" TagName="ucHeadDashboard" %>
<%@ Register Src="~/ucDashboard/ucSparePart.ascx" TagPrefix="uc1" TagName="ucSparePart" %>
<%@ Register Src="~/ucDashboard/ucTopCodeLoi.ascx" TagPrefix="uc1" TagName="ucTopCodeLoi" %>
<%@ Register Src="~/ucDashboard/ucMachineDangHong.ascx" TagPrefix="uc1" TagName="ucMachineDangHong" %>
<%@ Register Src="~/ucDashboard/ucMachineTopMayHongTrong30ngay.ascx" TagPrefix="uc1" TagName="ucMachineTopMayHongTrong30ngay" %>
<%@ Register Src="~/ucDashboard/ucTongGioLoiCacNgayTrongThang.ascx" TagPrefix="uc1" TagName="ucTongGioLoiCacNgayTrongThang" %>
<%@ Register Src="~/ucDashboard/ucTongGioLoiCacThangTrongNam.ascx" TagPrefix="uc1" TagName="ucTongGioLoiCacThangTrongNam" %>
<%@ Register Src="~/ucDashboard/ucTongGioLoiCacNgayTrongThangVoiChartJs.ascx" TagPrefix="uc1" TagName="ucTongGioLoiCacNgayTrongThangVoiChartJs" %>
<%@ Register Src="~/ucDashboard/ucMachineTopMayHong.ascx" TagPrefix="uc1" TagName="ucMachineTopMayHong" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/chart.js"></script>
    <script src="Scripts/chartjs-plugin-datalabels.js"></script>



    <section class="content-header">
        
        <h1><asp:Label ID="lblDashboard" runat="server" Text= "Dashboard"></asp:Label> <b style="color: red"></b>
            
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
            <li class="active">Dashboard</li>
        </ol>
    </section>
    <section class="content">
        <!-- Small boxes (Stat box) -->
        <uc1:ucHeadDashboard runat="server" ID="ucHeadDashboard"></uc1:ucHeadDashboard>

        <!-- /.row -->
        <!--Tổng hợp lỗi theo từng ngày trong tháng-->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <uc1:ucTongGioLoiCacNgayTrongThangVoiChartJs runat="server" ID="ucTongGioLoiCacNgayTrongThangVoiChartJs" />

            </div>

        </div>


        <div class="row">
            <!--MÁY ĐANG DỪNG -->
            <section class="col-md-12 col-sm-12 col-xs-12 col-lg-12 connectedSortable ui-sortable">
                <uc1:ucMachineDangHong runat="server" ID="ucMachineDangHong" />
            </section>
            <!-- MÁY ĐANG DỪNG -->

        </div>
        <!-- /.row (main row) -->

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <uc1:ucTongGioLoiCacNgayTrongThang runat="server" ID="ucTongGioLoiCacNgayTrongThang" />
            </div>
           
        </div>
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                 <!--Top 10 máy hỏng trong 30 ngày gần đây-->
 <uc1:ucMachineTopMayHongTrong30ngay runat="server" ID="ucMachineTopMayHongTrong30ngay" />

            </div> 
            
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                  <uc1:ucMachineTopMayHong runat="server" ID="ucMachineTopMayHong111" />
  <!--Top 10 máy hỏng trong 180 ngày gần đây-->
            </div>
        </div> 
        <!--#Tổng hợp lỗi theo từng ngày trong tháng-->

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <!--Tổng số lỗi từng tháng trong năm-->
                <uc1:ucTongGioLoiCacThangTrongNam runat="server" ID="ucTongGioLoiCacThangTrongNam" />
                <!--# Tổng số lỗi từng tháng trong năm-->
            </div>
        </div>
        <%--  
        <uc1:ucSparePart runat="server" id="ucSparePart"></uc1:ucSparePart>
        <uc1:ucTopCodeLoi runat="server" id="ucTopCodeLoi"></uc1:ucTopCodeLoi>--%>
        <!-- Main row -->




    </section>



</asp:Content>
