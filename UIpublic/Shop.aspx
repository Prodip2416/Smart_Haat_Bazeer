<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="HaatBazeer.UIpublic.Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <br />
    <div class="container">
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
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
                            <p> <b>Description :</b><%# Eval("description") %>
                            </p>
                            <p><b>Status : </b><%# Eval("status") %>
                            </p>
                            <p> <b>Comments : </b><%# Eval("comments") %>
                            </p>
                           <%-- <p > <b>Likes : </b><%# Eval("rating") %>
                            </p>--%>

                            <br/>
                            <p class="text-danger">To view full details, comment and confirm price<br>Please click
                                <b>Continue</b> button :)
                            </p><br/>
                            <a href='<%# "ShopDetails.aspx?shop=" + Eval("id") %>' class="btn btn-info">Continue</a>
                        </div>
                    </div>
                   
                </ItemTemplate>

            </asp:Repeater>
        </div>
       
    </div>
</asp:Content>
