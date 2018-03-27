<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="HaatBazeer.UI.Comments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="Container">
        <div class="row">         
            <div class="col-md-12">
                <h2 class="text-center text-primary">Product Comment Details</h2>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="id" SortExpression="id" Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Details" SortExpression="userName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("userName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <b>Name : </b> <asp:Label ID="Label2" runat="server" Text='<%# Bind("userName") %>'></asp:Label>
                                <br/>
                                <br/>
                                <b>Image : </b> <img height="100" src='<%# "../UIpublic/profilePicture/images/"+ Eval("userImage") %>'/>
                            
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Product Details" SortExpression="product">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("product") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <b>Product Name : </b><asp:Label ID="Label4" runat="server" Text='<%# Bind("product") %>'></asp:Label>
                                <br/><br/>
                                <b>Product Image :</b><img height="100" src='<%# "uploads/productImages/"+Eval("fileName") %>'/>
                               
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Comment" SortExpression="description">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                             <b>Comment : </b>   <asp:Label ID="Label6" runat="server" Text='<%# Bind("description") %>'></asp:Label>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [userName], [userImage], [product], [fileName], [description] FROM [vwCommentDetails]"></asp:SqlDataSource>
            </div>
            
        </div>
    </div>
</asp:Content>
