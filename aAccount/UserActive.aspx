<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="userActive.aspx.cs" Inherits="HaatBazeer.UserActive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/><br/><br/>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="alert-danger text-center"></h2> Welcome,,,,,
                <p class="text-danger"> please Active your account by using email,,,,,</p>
            </div>
            <div class="col-md-12">
                <div >
                    <asp:Button ID="btnActive" runat="server" class=" btn btn-primary" Text="Active" OnClick="btnActive_Click"/>
                </div>

            </div>
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </div>


</asp:Content>
