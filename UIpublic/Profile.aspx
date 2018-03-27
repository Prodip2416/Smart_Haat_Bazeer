<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="HaatBazeer.UI.Public.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>My Profile</h2>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <a href='<%#  "profilePicture/images/" + Eval("Image") %>' class="thumbnail">
                                <p>view full image</p>
                                <img class="img" height="300" src='<%#  "profilePicture/images/" + Eval("Image") %>'/>
                            </a>
                            <br/>
                            <br/><br/>
                            <a href="OrderProduct.aspx">Click Here To View All Ordered Product</a>
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-6">

                            <h2><b>Name : </b><i class="text-info"><%# Eval("name") %></i>
                            </h2>
                            <br />
                            <p>
                                <b>Email : </b><i class="text-danger"><%# Eval("email") %></i>
                            </p>
                            <br />
                            <p>
                                <b>Mobile No : </b><i class="text-danger"><%# Eval("mobileNo") %></i>
                            </p>
                            <br />
                            <p>
                                <b>Join Date : </b><i class="text-danger"><%# Eval("date") %></i>
                            </p>
                            <br />
                            <p>
                                <b>National Id : </b><i class="text-danger"><%# Eval("nId") %></i>
                            </p>
                            <br />
                            <p>
                                <b>City : </b><i class="text-danger"><%# Eval("city") %></i>
                            </p>
                            <br />
                            <p>
                                <b>Local Address : </b><i class="text-danger"><%# Eval("localAddress") %></i>
                            </p>
                            <br />
                            <p>
                                <b>Permanent Address : </b><i class="text-danger"><%# Eval("permanentAddress") %></i>
                            </p>
                            <br />
                            <a href='<%# "EditProfile.aspx?id=" + Eval("id") %>'>Edit Your Profile</a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>"
                    SelectCommand="SELECT [id], [name], [email], [mobileNo], [Image], [date], [nId], 
                    [localAddress], [permanentAddress], [city], [ip] FROM [vwUserProfile] WHERE ([id] = @id)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="id" SessionField="userId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
    <hr />
    <div class="Container">
        <div class="row">
            <h3 class="text-center text-danger"><b>Product Details</b>
            </h3>
            <br />
            <br />
            <a class="text-danger" href="AddProduct.aspx">Add New Product</a><br />
            <br />
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource2" Width="100%">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select" />
                                <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit" SortExpression="name">

                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "ProductEdit.aspx?product="+Eval("id") %>' runat="server"><i class="glyphicon glyphicon-edit"></i></asp:HyperLink>
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
                        <asp:TemplateField HeaderText="Name" SortExpression="name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tag" SortExpression="tag">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("tag") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("tag") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image" SortExpression="fileName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("fileName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <img height="100" src='<%# "../UI/uploads/productImages/" + Eval("fileName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price" SortExpression="price">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" SortExpression="date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="description">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="userId" SortExpression="userId" Visible="False">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("userId") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("userId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="categoryId" SortExpression="categoryId" Visible="True">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("categoryId") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("categoryId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ip" SortExpression="ip" Visible="False">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("ip") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("ip") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="updateHistory" SortExpression="updateHistory">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("updateHistory") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("updateHistory") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="statuId" SortExpression="statuId">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("statuId") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("statuId") %>'></asp:Label>
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
                <br />
                <h3 class="text-center text-success">Press Select Button To View Full Product Details</h3>
                <br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource3" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="id" SortExpression="id" Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Basic Details" SortExpression="name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <b class="text-primary">Name : </b>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                <br />
                                <b class="text-primary">Tag : </b>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("tag") %>'></asp:Label>
                                <br />
                                <b class="text-primary">Price : </b>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                                <br />
                                <b class="text-primary">Category : </b>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("category") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image" SortExpression="fileName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("fileName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <img height="200" src='<%# "../UI/uploads/productImages/"+Eval("fileName") %>' />

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Description" SortExpression="date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <b class="text-primary">Upload Date : </b>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                                <br />
                                <b class="text-primary">Description : </b>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                                <br />
                                <b class="text-primary">Update History : </b>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("updateHistory") %>'></asp:Label>

                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Comment && Status" SortExpression="status">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <b class="text-primary">Comment : </b>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("comment") %>'></asp:Label>
                                <br />
                                <b class=" text-primary">Status : </b>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("status") %>'></asp:Label>
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
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>"
                    SelectCommand="SELECT [id], [name], [tag], [fileName], [price], [date], [description], [updateHistory], [category], [status], [comment] FROM [vwUserProductDetails] WHERE ([id] = @id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:MyCon %>"
                    DeleteCommand="DELETE FROM [Product] WHERE ([id] = @original_id)"
                    InsertCommand="INSERT INTO [Product] ([name], [tag], [fileName], [price], [date], [description], [userId], [categoryId], [ip], [updateHistory], [statuId]) VALUES (@name, @tag, @fileName, @price, @date, @description, @userId, @categoryId, @ip, @updateHistory, @statuId)" OldValuesParameterFormatString="original_{0}"
                    SelectCommand="SELECT [id], [name], [tag], [fileName], [price], [date], [description], [userId], [categoryId], [ip],
                     [updateHistory], [statuId] FROM [Product] WHERE ([userId] = @userId)"
                    UpdateCommand="UPDATE [Product] SET [name] = @name, [tag] = @tag, [fileName] = @fileName, [price] = @price, [date] = @date, [description] = @description, [userId] = @userId, [categoryId] = @categoryId, [ip] = @ip, [updateHistory] = @updateHistory, [statuId] = @statuId WHERE [id] = @original_id AND [name] = @original_name AND [tag] = @original_tag AND [fileName] = @original_fileName AND [price] = @original_price AND (([date] = @original_date) OR ([date] IS NULL AND @original_date IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([userId] = @original_userId) OR ([userId] IS NULL AND @original_userId IS NULL)) AND [categoryId] = @original_categoryId AND (([ip] = @original_ip) OR ([ip] IS NULL AND @original_ip IS NULL)) AND (([updateHistory] = @original_updateHistory) OR ([updateHistory] IS NULL AND @original_updateHistory IS NULL)) AND (([statuId] = @original_statuId) OR ([statuId] IS NULL AND @original_statuId IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_tag" Type="String" />
                        <asp:Parameter Name="original_fileName" Type="String" />
                        <asp:Parameter Name="original_price" Type="Double" />
                        <asp:Parameter Name="original_date" Type="DateTime" />
                        <asp:Parameter Name="original_description" Type="String" />
                        <asp:Parameter Name="original_userId" Type="Int32" />
                        <asp:Parameter Name="original_categoryId" Type="Int32" />
                        <asp:Parameter Name="original_ip" Type="String" />
                        <asp:Parameter Name="original_updateHistory" Type="String" />
                        <asp:Parameter Name="original_statuId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="tag" Type="String" />
                        <asp:Parameter Name="fileName" Type="String" />
                        <asp:Parameter Name="price" Type="Double" />
                        <asp:Parameter Name="date" Type="DateTime" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="userId" Type="Int32" />
                        <asp:Parameter Name="categoryId" Type="Int32" />
                        <asp:Parameter Name="ip" Type="String" />
                        <asp:Parameter Name="updateHistory" Type="String" />
                        <asp:Parameter Name="statuId" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="userId" SessionField="userId" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="tag" Type="String" />
                        <asp:Parameter Name="fileName" Type="String" />
                        <asp:Parameter Name="price" Type="Double" />
                        <asp:Parameter Name="date" Type="DateTime" />
                        <asp:Parameter Name="description" Type="String" />
                        <asp:Parameter Name="userId" Type="Int32" />
                        <asp:Parameter Name="categoryId" Type="Int32" />
                        <asp:Parameter Name="ip" Type="String" />
                        <asp:Parameter Name="updateHistory" Type="String" />
                        <asp:Parameter Name="statuId" Type="Int32" />
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_tag" Type="String" />
                        <asp:Parameter Name="original_fileName" Type="String" />
                        <asp:Parameter Name="original_price" Type="Double" />
                        <asp:Parameter Name="original_date" Type="DateTime" />
                        <asp:Parameter Name="original_description" Type="String" />
                        <asp:Parameter Name="original_userId" Type="Int32" />
                        <asp:Parameter Name="original_categoryId" Type="Int32" />
                        <asp:Parameter Name="original_ip" Type="String" />
                        <asp:Parameter Name="original_updateHistory" Type="String" />
                        <asp:Parameter Name="original_statuId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

</asp:Content>
