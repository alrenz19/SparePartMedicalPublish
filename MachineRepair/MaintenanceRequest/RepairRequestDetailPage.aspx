<%@ Page Title="Request repair detail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RepairRequestDetailPage.aspx.cs" Inherits="QlyMain.MaintenanceRequest.RepairRequestDetailPage" %>

<%@ Register Src="~/ucControl/ucTimelineMainLeader.ascx" TagPrefix="uc1" TagName="ucTimelineMainLeader" %>
<%@ Register Src="~/ucControl/ucTimelineMaintConfirm.ascx" TagPrefix="uc1" TagName="ucTimelineMaintConfirm" %>
<%@ Register Src="~/ucControl/ucTimeLineProductionConfirm.ascx" TagPrefix="uc1" TagName="ucTimeLineProductionConfirm" %>
<%@ Register Src="~/ucControl/ucTimelineRequestInfor.ascx" TagPrefix="uc1" TagName="ucTimelineRequestInfor" %>
<%@ Register Src="~/ucControl/ucRequestInforDetail.ascx" TagPrefix="uc1" TagName="ucRequestInforDetail" %>






<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">


        <h3>Thông tin request</h3>
        <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>

        <uc1:ucRequestInforDetail runat="server" id="ucRequestInforDetail" />

        <div class="row">
            <div class="col-md-12">
                <div class="col-md-5">
                    <div class="timeline">

                        <uc1:ucTimeLineProductionConfirm runat="server" id="ucTimeLineProductionConfirm" />

                        <uc1:ucTimelineMainLeader runat="server" id="ucTimelineMainLeader" />

                        <uc1:ucTimelineMaintConfirm runat="server" id="ucTimelineMaintConfirm" />

                        <uc1:ucTimelineRequestInfor runat="server" id="ucTimelineRequestInfor" />
                        <div>
                            <i class="fa fa-dot-circle-o bg-purple"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
