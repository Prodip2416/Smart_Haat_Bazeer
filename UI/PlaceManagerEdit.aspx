﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlaceManagerEdit.aspx.cs" Inherits="HaatBazeer.UI.PlaceManagerEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div class="=container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                 <div class="text-center text-danger">
        <h3 class="text-center text-danger">
            Place Manager Edit Page
        </h3>
    </div>
    <br/><br/>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Edit" OnItemUpdated="DetailsView1_ItemUpdated" OnItemUpdating="DetailsView1_ItemUpdating">
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
            <asp:TemplateField HeaderText="Name" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Invalid Email" Font-Bold="True" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mobile No" SortExpression="mobileNo">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("mobileNo") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" 
                        ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("mobileNo") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("mobileNo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
          
            <asp:TemplateField HeaderText="National Id" SortExpression="nId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("nId") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="#CC0000" ControlToValidate="TextBox5"
                         ErrorMessage="Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("nId") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("nId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="Button2_Click" Text="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                       ConflictDetection="CompareAllValues"
                       ConnectionString="<%$ ConnectionStrings:MyCon %>"
                       DeleteCommand="DELETE FROM [PlaceManagers] WHERE [id] = @original_id AND [name] = @original_name AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND [mobileNo] = @original_mobileNo AND (([image] = @original_image) OR ([image] IS NULL AND @original_image IS NULL)) AND (([nId] = @original_nId) OR ([nId] IS NULL AND @original_nId IS NULL))"
                       InsertCommand="INSERT INTO [PlaceManagers] ([name], [email], [mobileNo], [image], [nId]) VALUES (@name, @email, @mobileNo, @image, @nId)"
                       OldValuesParameterFormatString="original_{0}"
                       SelectCommand="SELECT [id], [name], [email], [mobileNo], [image], [nId] FROM [PlaceManagers] WHERE ([id] = @id)"
                       UpdateCommand="UPDATE [PlaceManagers] SET [name] = @name, [email] = @email, [mobileNo] = @mobileNo, [nId] = @nId WHERE [id] = @original_id AND [name] = @original_name AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND [mobileNo] = @original_mobileNo AND (([nId] = @original_nId) OR ([nId] IS NULL AND @original_nId IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_mobileNo" Type="String" />
           
            <asp:Parameter Name="original_nId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="mobileNo" Type="String" />
         
            <asp:Parameter Name="nId" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="placeManager" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="mobileNo" Type="String" />
          
            <asp:Parameter Name="nId" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_mobileNo" Type="String" />
           
            <asp:Parameter Name="original_nId" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br/><br/>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>

    <br/>
    <a href="PlaceManager.aspx">Back To Place Manager Page</a>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
   
</asp:Content>
