<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlaceManager.aspx.cs" Inherits="HaatBazeer.PlaceManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="=container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                  <div class="text-center text-danger">
        <h2>
            Place Manager
        </h2>
    </div>
    <br/>
    <br/>
    <a href="PlaceManagerNew.aspx"> New Place Manager</a>
    <br/>
    <br/>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="100%" OnRowDeleted="GridView1_RowDeleted">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select" />
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Edit" SortExpression="name">

                 <ItemTemplate>
                     <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "PlaceManagerEdit.aspx?placeManager=" + Eval("id") %>' runat="server"><i class="glyphicon glyphicon-edit"></i></asp:HyperLink>
                 </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mobile No" SortExpression="mobileNo">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("mobileNo") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("mobileNo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image" SortExpression="image">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("image") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                      <asp:Image ID="Image1" src='<%# "uploads/images/" + Eval("image") %>' Height="100px" runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="National Id" SortExpression="nId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("nId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("nId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                       ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>"
         DeleteCommand="DELETE FROM [PlaceManagers] WHERE [id] = @original_id" InsertCommand="INSERT INTO [PlaceManagers] ([name], [email], [mobileNo], [image], [nId]) VALUES (@name, @email, @mobileNo, @image, @nId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [name], [email], [mobileNo], [image], [nId] FROM [PlaceManagers]" UpdateCommand="UPDATE [PlaceManagers] SET [name] = @name, [email] = @email, [mobileNo] = @mobileNo, [image] = @image, [nId] = @nId WHERE [id] = @original_id AND [name] = @original_name AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND [mobileNo] = @original_mobileNo AND (([image] = @original_image) OR ([image] IS NULL AND @original_image IS NULL)) AND (([nId] = @original_nId) OR ([nId] IS NULL AND @original_nId IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_mobileNo" Type="String" />
            <asp:Parameter Name="original_image" Type="String" />
            <asp:Parameter Name="original_nId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="mobileNo" Type="String" />
            <asp:Parameter Name="image" Type="String" />
            <asp:Parameter Name="nId" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="mobileNo" Type="String" />
            <asp:Parameter Name="image" Type="String" />
            <asp:Parameter Name="nId" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_mobileNo" Type="String" />
            <asp:Parameter Name="original_image" Type="String" />
            <asp:Parameter Name="original_nId" Type="String" />
        </UpdateParameters>
</asp:SqlDataSource>
    <br/>
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
  
</asp:Content>
