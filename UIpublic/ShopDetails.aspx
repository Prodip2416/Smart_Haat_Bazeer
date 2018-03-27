<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="ShopDetails.aspx.cs" Inherits="HaatBazeer.UIpublic.ShopDetails" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <br/>
    <br/>
    <br/>
   
    <div class="container">

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="row">
                    <div class="col-md-12" style="float: left">
                        <h2 class="alert-info"><%# Eval("name") %></h2>
                        <br/>
                        <div class="col-md-6">
                            <a href='<%# "../UI/uploads/productImages/" + Eval("fileName") %>' class="thumbnail">
                                <p>View Full Picture</p>
                                <img class="img-responsive" width="350" height="250" src='<%# "../UI/uploads/productImages/" + Eval("fileName") %>'/>
                            </a>
                        </div>
                        <div class="col-md-6">
                            <h3><b>Price : </b><%# Eval("price") %>
                            </h3>
                            <p><b>Description :</b><%# Eval("description") %></p>
                            <p>
                                <b>Comments : </b><%# Eval("comments") %>
                            </p>
                           <%-- <p>
                                <b>Likes : </b><%# Eval("rating") %>
                            </p>--%>
                            <p>
                                <b>Status : </b><%# Eval("status") %>
                            </p>
                            <br/>
                        <%--    <asp:Button ID="btnLike" OnClick="btnLike_OnClick" runat="server" Text="Like"  />--%>
                            <br/>
                            <br/>
                            <p class="text-danger">If all information is <b>ok</b> and you want to buy this product
                             please <a href='<%# "DealDetails.aspx?shop=" + Eval("id") %>' class="btn btn-info">Click Here</a> to <b>Confirm</b> </p>
                        </div>
                    </div>

                </div>
            </ItemTemplate>
        </asp:Repeater>
        <br/>
        <hr/>
        <br/>

        <div class="row">
            <div class="col-md-12">
                 <div class="col-md-3">
                  
                   
                </div>
                <div class="col-md-6">
                    <b>Comment Section : </b><br/>
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <br/>
                            <span class="text-info"><b><%# Eval("user") %></b> </span> : <%# Eval("comment") %>
                     
                            <i class='<%# LoadDelete() %> '></i> 
                            <br/>
                        </ItemTemplate>
                    </asp:Repeater>
                    <br/>
                    <asp:TextBox ID="txtComment" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtComment" ErrorMessage="*" Font-Bold="True" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <ajaxToolkit:TextBoxWatermarkExtender ID="txtComment_TextBoxWatermarkExtender" runat="server" BehaviorID="txtComment_TextBoxWatermarkExtender" TargetControlID="txtComment" WatermarkText="Leave Your Comment">
                    </ajaxToolkit:TextBoxWatermarkExtender>
                    <asp:Button ID="btnComment" runat="server" CssClass="btn btn-success" OnClick="btnComment_OnClick" Text="Comment"/>
                    <br/>
                    <%--  <asp:Button ID="btn" runat="server" CssClass="btn btn-success" OnClick="btn_OnClick" Text="Like"/>--%>
                    <br/>
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </div>
                <div class="col-md-3">


                </div>

            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>"
                           SelectCommand="SELECT [id], [comment], [userId], [user], [productId], [productName] FROM [vwProductComment] WHERE ([productId] = @productId)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="productId" QueryStringField="shop" Type="Int32"/>
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>"
                           SelectCommand="SELECT [id], [name], [tag], [fileName], [price], [date], [description], [categoryId], [category], [updateHistory], 
            [user], [Rating], [Comments], [status] FROM [vwProduct] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="shop" Type="Int32"/>
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
