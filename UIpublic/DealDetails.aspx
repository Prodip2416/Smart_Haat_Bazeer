<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="DealDetails.aspx.cs" Inherits="HaatBazeer.UIpublic.DealDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2 class="text-center text-danger">Order Confirm </h2>
                <br/>
                <div class="form-horizontal">
                    
                    <div class="form-group">
                        <asp:Label ID="Label3" AssociatedControlID="lblUserName" runat="server" CssClass="control-label col-md-2" Text="Name"></asp:Label>
                        <div class="col-md-6">
                            <asp:Label ID="lblUserName" CssClass="control-label" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label1" AssociatedControlID="lblProduct" runat="server" CssClass="control-label col-md-2" Text="Product"></asp:Label>
                        <div class="col-md-6">
                            <asp:Label ID="lblProduct" CssClass="control-label" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" AssociatedControlID="ddlPlace" runat="server" CssClass="control-label col-md-2" Text="Place"></asp:Label>
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlPlace" CssClass="form-control" runat="server" AutoPostBack="True" DataTextField="name" DataValueField="id"></asp:DropDownList>
                            <asp:CompareValidator ID="CompareValidator1" ControlToValidate="ddlPlace" ForeColor="red" ValueToCompare="0" Operator="NotEqual" runat="server" ErrorMessage="Select One"></asp:CompareValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label5" AssociatedControlID="txtRemarks" runat="server" CssClass="control-label col-md-2" Text="Remarks"></asp:Label>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtRemarks" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRemarks" ForeColor="red" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button ID="btnSave" runat="server" Text="Confirm" CssClass="btn btn-default" OnClick="btnSave_Click"/>
                        </div>
                    </div>
                    <br/>
                    <br/>
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                    <br/>
                    <br/>
                </div>
            </div>
            <div class="col-md-6">
                <iframe src='<%= LoadMap() %>' width="500" height="450" frameborder="0" style="border: 0" allowfullscreen></iframe>
            </div>


        </div>
        <br /><br />
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <h2 class="text-center text-danger">Place Manager Details</h2>
                    <div class="col-md-2"></div>
                    <div class="col-md-4">
                        <br/><br/><br/><br/>
                        <div>
                            <b class="text-primary">Name : <%# Eval("name") %></b>
                            <br/>
                            <b class="text-primary">Email : </b><%# Eval("email") %><br/>
                            <b class="text-primary">Mobile No : </b><%# Eval("mobileNo") %><br/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <img height="300" class="img" src='<%# "../UI/uploads/images/" + Eval("Image") %>'/>
                    </div>
                       <div class="col-md-2"></div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
