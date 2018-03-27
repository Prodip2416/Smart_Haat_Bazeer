<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="userLogin.aspx.cs" Inherits="HaatBazeer.aAccount.userLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/>
<br/><br/>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h2 class="text-primary text-center">User Login</h2>
                    <hr/>
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText"/>
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                                                        CssClass="text-danger" ErrorMessage="The email field is required."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="txtPassword" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword" CssClass="text-danger" ErrorMessage="The password field is required."/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="chkRememberMe"/>
                                <asp:Label runat="server" AssociatedControlID="chkRememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" ID="btnLogin" Text="Log in" CssClass="btn btn-default" OnClick="btnLogin_Click"/>
                        </div>
                    </div>
                </div>
                <p>
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label><br/><br/>
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" NavigateUrl="userRegister.aspx" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
                </p>

            </section>
        </div>
   <div class="col-md-3"></div>

    </div>
</asp:Content>
