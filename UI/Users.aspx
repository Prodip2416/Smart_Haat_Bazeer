<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="HaatBazeer.UI.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <h2 class="text-center text-primary"></h2>
            <br/>
            <br/>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="100%">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select" />
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
                    <asp:TemplateField HeaderText="Basic Info" SortExpression="name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <b>Name : </b> <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            <br/>
                            <b>Email : </b><asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                            <br/>
                            <b>Mobile No : </b><asp:Label ID="Label4" runat="server" Text='<%# Bind("mobileNo") %>'></asp:Label>
                            <br/>
                            <b>National Id : </b><asp:Label ID="Label7" runat="server" Text='<%# Bind("nId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>           
                    <asp:TemplateField HeaderText="Image" SortExpression="Image">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Image") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <img height="100" src='<%# "../UIpublic/profilePicture/images/"+ Eval("Image") %>' />           
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Join Date" SortExpression="date">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Address" SortExpression="localAddress">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("localAddress") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <b>City : </b><asp:Label ID="Label12" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                            <br/>
                            <b>Local Address : </b><asp:Label ID="Label8" runat="server" Text='<%# Bind("localAddress") %>'></asp:Label>
                            <br/>
                            <b>Permanent Addres : </b> <asp:Label ID="Label9" runat="server" Text='<%# Bind("permanentAddress") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField HeaderText="Type && Ip" SortExpression="type">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                           <b>Type : </b> <asp:Label ID="Label10" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                            <br/>
                            <b>Ip : </b><asp:Label ID="Label11" runat="server" Text='<%# Bind("ip") %>'></asp:Label>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                               ConnectionString="<%$ ConnectionStrings:MyCon %>"
                               DeleteCommand="DELETE FROM [Users] WHERE ([id] = @original_id )"
                               InsertCommand="INSERT INTO [Users] ([name], [email], [mobileNo], [Image], [date], [nId], [localAddress], [permanentAddress], [cityId], [type], [ip]) VALUES (@name, @email, @mobileNo, @Image, @date, @nId, @localAddress, @permanentAddress, @cityId, @type, @ip)"
                               OldValuesParameterFormatString="original_{0}"
                 SelectCommand="select u.id, u.name, u.email, u.mobileNo, u.[Image], u.[date], u.nId, c.id, c.name as city, u.localAddress, u.permanentAddress,
u.ip, u.[type]
from Users as u
left join City as c on u.cityId=c.id" 
                UpdateCommand="UPDATE [Users] SET [name] = @name, [email] = @email, [mobileNo] = @mobileNo, [Image] = @Image, [date] = @date, [nId] = @nId, [localAddress] = @localAddress, [permanentAddress] = @permanentAddress, [cityId] = @cityId, [type] = @type, [ip] = @ip WHERE [id] = @original_id AND [name] = @original_name AND [email] = @original_email AND [password] = @original_password AND [mobileNo] = @original_mobileNo AND (([Image] = @original_Image) OR ([Image] IS NULL AND @original_Image IS NULL)) AND (([date] = @original_date) OR ([date] IS NULL AND @original_date IS NULL)) AND (([nId] = @original_nId) OR ([nId] IS NULL AND @original_nId IS NULL)) AND (([localAddress] = @original_localAddress) OR ([localAddress] IS NULL AND @original_localAddress IS NULL)) AND (([permanentAddress] = @original_permanentAddress) OR ([permanentAddress] IS NULL AND @original_permanentAddress IS NULL)) AND (([cityId] = @original_cityId) OR ([cityId] IS NULL AND @original_cityId IS NULL)) AND (([type] = @original_type) OR ([type] IS NULL AND @original_type IS NULL)) AND (([ip] = @original_ip) OR ([ip] IS NULL AND @original_ip IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_name" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                 
                    <asp:Parameter Name="original_mobileNo" Type="String" />
                    <asp:Parameter Name="original_Image" Type="String" />
                    <asp:Parameter Name="original_date" Type="DateTime" />
                    <asp:Parameter Name="original_nId" Type="String" />
                    <asp:Parameter Name="original_localAddress" Type="String" />
                    <asp:Parameter Name="original_permanentAddress" Type="String" />
                    <asp:Parameter Name="original_cityId" Type="Int32" />
                    <asp:Parameter Name="original_type" Type="String" />
                    <asp:Parameter Name="original_ip" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
              
                    <asp:Parameter Name="mobileNo" Type="String" />
                    <asp:Parameter Name="Image" Type="String" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="nId" Type="String" />
                    <asp:Parameter Name="localAddress" Type="String" />
                    <asp:Parameter Name="permanentAddress" Type="String" />
                    <asp:Parameter Name="cityId" Type="Int32" />
                    <asp:Parameter Name="type" Type="String" />
                    <asp:Parameter Name="ip" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                 
                    <asp:Parameter Name="mobileNo" Type="String" />
                    <asp:Parameter Name="Image" Type="String" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="nId" Type="String" />
                    <asp:Parameter Name="localAddress" Type="String" />
                    <asp:Parameter Name="permanentAddress" Type="String" />
                    <asp:Parameter Name="cityId" Type="Int32" />
                    <asp:Parameter Name="type" Type="String" />
                    <asp:Parameter Name="ip" Type="String" />
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_name" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                  
                    <asp:Parameter Name="original_mobileNo" Type="String" />
                    <asp:Parameter Name="original_Image" Type="String" />
                    <asp:Parameter Name="original_date" Type="DateTime" />
                    <asp:Parameter Name="original_nId" Type="String" />
                    <asp:Parameter Name="original_localAddress" Type="String" />
                    <asp:Parameter Name="original_permanentAddress" Type="String" />
                    <asp:Parameter Name="original_cityId" Type="Int32" />
                    <asp:Parameter Name="original_type" Type="String" />
                    <asp:Parameter Name="original_ip" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
