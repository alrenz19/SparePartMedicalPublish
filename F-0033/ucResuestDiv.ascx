<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucResuestDiv.ascx.cs" Inherits="QlyMain.F_0033.ucResuestDiv" %>
<h4>1. Request division</h4>
<div class="row">
    <div class="col-md-4">
        <div class="input-group">
            <div class="input-group-addon">Division/Section :</div>
            <asp:TextBox ID="txtDiv" runat="server" class="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="col-md-4">
        <div class="input-group">
            <div class="input-group-addon">Issued by :</div>
            <asp:TextBox ID="txtIssuedBy" runat="server" class="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="col-md-4">
        <div class="input-group">
            <div class="input-group-addon">Request date:</div>
            <asp:TextBox ID="txtRequestDate" runat="server" class="form-control"></asp:TextBox>
        </div>
    </div>
</div>
<div class="row">
    <div class="input-group">
        <input type="radio" id="rdProduce" runat="server" style="margin-left: 10px"
            value="True" name="Produce" />
        Produce 
        <input type="radio" id="rdMaintenance" runat="server" style="margin-left: 10px"
            value="True" name="Maintenance" />Maintenance 
    </div>
    <div class="input-group">
        <input type="radio" id="rdCustomize" runat="server" style="margin-left: 10px"
            value="True" name="Customize" />Customize
        <input type="radio" id="rdOthers" runat="server" style="margin-left: 10px"
            value="True" name="Others" />Others
          <asp:TextBox ID="txtOthers" runat="server" class="form-control"></asp:TextBox>
    </div>
</div>
<div class="row">
    <div class="input-group">
        Request Contents  :
          <asp:TextBox ID="txtRequestContents" runat="server" class="form-control"></asp:TextBox>
    </div>
</div>
<div class="row">
    <div class="input-group">
        Purpose : 
          <asp:TextBox ID="txtPurpose" runat="server" class="form-control"></asp:TextBox>
    </div>
    <div>
        Attached Document/Comment  
    </div>
</div>
<div class="row">
    <div class="input-group">
        Require Date  :
         <asp:TextBox ID="txtRequireDate" runat="server" class="form-control"></asp:TextBox>
    </div>
</div>
<div class="row">
    <div class="input-group">
        Details :
         <asp:TextBox ID="txtDetails" runat="server" class="form-control"></asp:TextBox>
    </div>
</div>
<div class="row">
    <div class="input-group">
        Remark:
         <asp:TextBox ID="txtRemark" runat="server" class="form-control"></asp:TextBox>
    </div>
</div>
<div class="row">
    <div class="input-group">
        Approved by
         <asp:TextBox ID="txtApprovedBy" runat="server" class="form-control"></asp:TextBox>
    </div>
</div>
<h4>2. PE Division</h4>
<h5>2.1 Confirm of receiving </h5>
<div class="row">
    <table>
        <tr>
            <td>Acceptance date :</td>
            <td>
                <asp:TextBox ID="txtAcceptanceDate" runat="server" class="form-control"></asp:TextBox></td>
            <td>Acceptance No. : </td>
            <td>
                <asp:TextBox ID="txtAcceptanceNo" onfocus="this.value='PEZ-'" runat="server" class="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Estimated amount:</td>
            <td>
                <asp:TextBox ID="txtEstimatedAmount" runat="server" class="form-control"></asp:TextBox>
            </td>
            <td>Attached Document/Comment
            </td>
        </tr>
        <tr>
            <td>Expected finish date: </td>
            <td>
                <asp:TextBox ID="txtExpectedFinishDate" runat="server" class="form-control"></asp:TextBox>
            </td>
            <td>Approved by </td>
            <td>Check by </td>
        </tr>
        <tr>
            <td>Expected finish date: </td>
            <td> <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox></td>
        </tr>
    </table>
</div>
