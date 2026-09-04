<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCommentDoiSach.ascx.cs" Inherits="QlyMain.ucControl.ucCommentDoiSach" %>

<div class="box box-success">


    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; min-height: 200px;">
        <div class="box-header ui-sortable-handle" style="cursor: move;">
            <i class="fa fa-comments-o"></i>

            <h3 class="box-title">Comment</h3>


        </div>
        <br />
        <div class="box-body chat" id="chat-box" style="overflow: hidden; width: auto; height: auto;">

            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                <ItemTemplate>
                    <!-- chat item -->
                    <div class="item">
                    

                        <div class="row">

                            <div class="col-md-11">
                                <p class="message">
                                    <a href="#" class="name">
                                        <small class="text-muted pull-right"><i class="fa fa-clock-o"></i><%# Eval("DateCreate") %></small>
                                        <%# Eval("CreatedBy") %>
</a>
                                    <br />
                                    <%# Eval("Comment") %>
                                </p>
                            </div>
                            <div class="col-md-1">
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete" OnClientClick='javascript:return confirm("Are you sure you want to delete?")'
                                    CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'> Xóa </asp:LinkButton>
                            </div>
                        </div>


                    </div>
                    <!-- /.item -->
                 
                </ItemTemplate>

                <FooterTemplate>
                    <div id="trEmpty" runat="server" visible="false">
                        <p align="center">
                            Chưa có comment.
                        </p>
                    </div>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

        </div>
        <div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 26px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 184.366px;"></div>
        <div class="slimScrollRail" style="width: 7px; height: 150%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
    </div>
    <!-- /.chat -->
    <div class="box-footer">
        <div class="input-group">

            <asp:TextBox ID="txtComment" runat="server" CssClass="form-control" placeholder="Type message..."></asp:TextBox>
            <div class="input-group-btn">

                <asp:LinkButton ID="lbtDoiSach" runat="server" OnClick="btnAdd_Click" class="btn btn-success"><i class="fa fa-plus"></i>Thêm</asp:LinkButton>
            </div>

        </div>
    </div>
</div>
