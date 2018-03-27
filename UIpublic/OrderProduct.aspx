<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="OrderProduct.aspx.cs" Inherits="HaatBazeer.UIpublic.OrderProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/><br/><br/><br/>
    <h3 class="text-center text-danger"></h3>
    <div class="container">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <itemTemplate>
                <div class="row">
                    <h3 class="alert-success"> Product Details</h3><br/>
                    <div class="col-md-2"></div>
                    <div class="col-md-4">
                        <br/><br/><br/><br/>
                        <b class="text-primary">Name : </b><%# Eval("product") %>
                        <br/><br/>
                        <b class="text-primary">Price : </b><%# Eval("price") %><br/><br/>
                        <b class="text-primary">Upload Date : </b><%# Eval("productUploadDate") %>
                        <br/><br/>
                        <b class="text-primary">Remarks : </b><%# Eval("remarks") %>
                    </div>
                    <div class="col-md-4">
                        <br/>
                        <img height="400" src='<%# "../UI/uploads/productImages/" + Eval("fileName") %>'/>

                    </div>
                      <div class="col-md-2"></div>
                </div><br/>
                <div class="row">
                    <h3 class="alert-success">Location && Manager Details</h3><br/>
                    <div class="col-md-6">
                        <b>Location : </b><%# Eval("place") %>
                        <br/>
                        <b>Manager Name : </b><%# Eval("manager") %>
                        <br/>
                        <b>Mobile No : </b><%# Eval("mobileNo") %>
                        <br/>
                        <b>Buying Date : </b><%# Eval("productBuyDate") %>

                        <img  width="300" src='<%# "../UI/uploads/images/" + Eval("image") %>'/>
                    </div>
                    <div class="col-md-6">
                        <br/>
                        <iframe src='<%# Eval("maplink") %>' height="500" width="500"></iframe>
                    </div>
                </div>
                <br/>
                <br/>
                 <h3 class="alert-danger text-center">
                    Another Product
                </h3>
            </itemTemplate>
           
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [product], [price], [productUploadDate], [fileName], [remarks], [place], [maplink], [productBuyDate], [manager], [mobileNo], [image], [uId] FROM [vwBuyingProductDetails] WHERE ([uId] = @uId)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="uId" SessionField="userId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
