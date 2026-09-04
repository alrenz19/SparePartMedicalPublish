<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucRequestInforDetail.ascx.cs" Inherits="QlyMain.ucControl.ucRequestInforDetail" %>

<asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>

<asp:Panel ID="PanelDetailRequest" runat="server">

    <div class="panel panel-primary">
        <div class="panel panel-heading">
            Thông tin về yêu cầu sửa chữa
        </div>
        <div class="panel panel-body">

            <div class="form-group">
                <label>Máy bị hỏng:</label>
                <asp:Label ID="lblMachineCode" runat="server"></asp:Label>

            </div>

            <label>
                Tên máy
            </label>
            <asp:Label ID="lblMachineName" runat="server" autocomplete="off"></asp:Label>
            <br />

            <label>
                Tên hoặc Mô tả sự cố:
            </label>
            <asp:Label ID="lblProblemName" runat="server" autocomplete="off"></asp:Label>


            <br />
            <label>
                Thời gian máy hỏng:
            </label>
            <b>
                <asp:Label ID="lblNgayLoi" runat="server" autocomplete="off" ReadOnly="true"></asp:Label>
            </b>
            <br />



            <label>
                Ảnh hưởng chất lượng:
            </label>
            <asp:CheckBox ID="chkAnhHuongChatLuong" runat="server" Enabled="false" TextAlign="Right"></asp:CheckBox>

            <asp:Panel ID="panelAnhHuongChatLuong" runat="server" Visible="false">
                Tỉ lệ NG:
          <asp:Label ID="lblTiLeNG" runat="server"></asp:Label>
            </asp:Panel>

            <br />

            <label>
                Ảnh hưởng xuất hàng không:
            </label>
            <asp:CheckBox ID="chkAnhHuongXuatHang" runat="server" Enabled="false" Text="" TextAlign="Right"></asp:CheckBox>

            <asp:Panel ID="panelAnhHuongXuatHang" runat="server" Visible="false">
                Ngày xuất hàng:
      <asp:Label ID="lblNgayXuatHang" runat="server"></asp:Label>
            </asp:Panel>
        </div>
        <div class="panel-footer">
            <asp:HyperLink NavigateUrl="~/MachineRepair/RepairRequestss/List.aspx" runat="server" CssClass="btn btn-default"> 
  <i class="fa fa-close"></i>  Đóng lại</asp:HyperLink>
        </div>

    </div>


</asp:Panel>
