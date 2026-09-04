<%@ Page Title="Detail" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Details.aspx.cs" Inherits="QlyMain.RepairRequestss.Details" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="~/ucControl/ucTimelineMainLeader.ascx" TagPrefix="uc1" TagName="ucTimelineMainLeader" %>
<%@ Register Src="~/ucControl/ucTimelineMaintConfirm.ascx" TagPrefix="uc1" TagName="ucTimelineMaintConfirm" %>
<%@ Register Src="~/ucControl/ucTimeLineProductionConfirm.ascx" TagPrefix="uc1" TagName="ucTimeLineProductionConfirm" %>
<%@ Register Src="~/ucControl/ucTimelineRequestInfor.ascx" TagPrefix="uc1" TagName="ucTimelineRequestInfor" %>
<%@ Register Src="~/ucControl/ucRequestInforDetail.ascx" TagPrefix="uc1" TagName="ucRequestInforDetail" %>
<%@ Register Src="~/ucControl/ucTimelineMaintenanceRepair.ascx" TagPrefix="uc1" TagName="ucTimelineMaintenanceRepair" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">

    <div class="content">
        <div class="row">
            <div class="col-md-12  col-xs-12 col-sm-12">
                <asp:LinkButton ID="lbtClose" Text="Đóng lại" runat="server" CssClass="btn btn-default pull-right"
                    OnClick="lbtClose_Click"> 
        <i class="fa fa-close"></i>  Close</asp:LinkButton>

            </div>
            <div class="clearfix"></div>
        </div>
        <div class="row">
            <%--  <div class="col-md-4">
                <uc1:ucRequestInforDetail runat="server" ID="ucRequestInforDetail" />
            </div>--%>

            <div class="col-md-12">


                <uc1:ucTimelineRequestInfor runat="server" ID="ucTimelineRequestInfor" />

                <uc1:ucTimelineMaintConfirm runat="server" ID="ucTimelineMaintConfirm" />

                <uc1:ucTimelineMaintenanceRepair runat="server" ID="ucTimelineMaintenanceRepair" />

                <uc1:ucTimelineMainLeader runat="server" ID="ucTimelineMainLeader" />


                <uc1:ucTimeLineProductionConfirm runat="server" ID="ucTimeLineProductionConfirm" />

                <asp:LinkButton ID="lbtClose22" Text="Close" runat="server" CssClass="btn btn-default"
                    OnClick="lbtClose_Click"> 
      <i class="fa fa-close"></i>  Close</asp:LinkButton>
            </div>


        </div>




    </div>
</asp:Content>



