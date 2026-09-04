
	  <%@ Page Title="List" Language="C#" MasterPageFile="~/MachineRepair/NestedMasterPage1.master" AutoEventWireup="true"
    CodeBehind="Delete.aspx.cs" Inherits="QlyMain.MaintenanceRepairs.Delete" EnableEventValidation="false" %>
  <asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
		  
		  
		  <section class="content-header">
		  <h1> MaintenanceRepair <small></small> </h1>
		  <ol class="breadcrumb">
		   <li><a href="~/index.aspx" runat="server"><i class="fa fa-dashboard"></i>Home</a></li>
		  <li class="active"> MaintenanceRepair</li>
		   </section>
		  
		  <div class="content">
		  <h2>Confirm Deletion</h2>
		  <p>Are you sure you want to delete the following MaintenanceRepairs?</p>
			 <label class="form-label" for="txtRequestID">RequestID<span class="required-field">*</span></label>
			 <asp:Label ID="lblRequestID" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtUserID">UserID<span class="required-field">*</span></label>
			 <asp:Label ID="lblUserID" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtThoiGianBatDauSua">ThoiGianBatDauSua<span class="required-field">*</span></label>
			 <asp:Label ID="lblThoiGianBatDauSua" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtNguoiSua">NguoiSua<span class="required-field">*</span></label>
			 <asp:Label ID="lblNguoiSua" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtCacHangMucKiemTra">CacHangMucKiemTra<span class="required-field">*</span></label>
			 <asp:Label ID="lblCacHangMucKiemTra" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtNguyenNhanLoi">NguyenNhanLoi<span class="required-field">*</span></label>
			 <asp:Label ID="lblNguyenNhanLoi" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtHangDongKhacPhuc">HangDongKhacPhuc<span class="required-field">*</span></label>
			 <asp:Label ID="lblHangDongKhacPhuc" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtCodeSuCo">CodeSuCo<span class="required-field">*</span></label>
			 <asp:Label ID="lblCodeSuCo" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtThoiGianKetThuc">ThoiGianKetThuc<span class="required-field">*</span></label>
			 <asp:Label ID="lblThoiGianKetThuc" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtSuaDuocHayKhong">SuaDuocHayKhong<span class="required-field">*</span></label>
			 <asp:Label ID="lblSuaDuocHayKhong" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtThoiGianDuKien">ThoiGianDuKien<span class="required-field">*</span></label>
			 <asp:Label ID="lblThoiGianDuKien" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtLyDoKhongSuaDuoc">LyDoKhongSuaDuoc<span class="required-field">*</span></label>
			 <asp:Label ID="lblLyDoKhongSuaDuoc" runat="server" CssClass="form-value"></asp:Label>
			 <label class="form-label" for="txtCreateDate">CreateDate<span class="required-field">*</span></label>
			 <asp:Label ID="lblCreateDate" runat="server" CssClass="form-value"></asp:Label>
			   <asp:Label ID="lblMessage" runat="server" CssClass="form-error" />
			    <asp:Literal ID="LiteralThongBao" runat="server"> </asp:Literal>
			  <div class="form-button-container">
			 <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="form-button delete-button" />
			 <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="form-button cancel-button" />
			 </div>
	 </div>
 </asp:Content>
	 
	 
