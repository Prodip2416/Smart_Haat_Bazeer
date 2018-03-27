<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Deal.aspx.cs" Inherits="HaatBazeer.UI.Deal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2 class="text-center text-danger">Deal Details</h2>
    <br/>
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="80%" OnRowDeleted="GridView1_RowDeleted">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"/>
                                <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"/>
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
                        <asp:TemplateField HeaderText="ProductId" SortExpression="productId">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("productId") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("productId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PlaceId" SortExpression="placeId">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("placeId") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("placeId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UserId" SortExpression="userId">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("userId") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("userId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" SortExpression="date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Remarks" SortExpression="remarks">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("remarks") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"/>
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"/>
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center"/>
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"/>
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"/>
                    <SortedAscendingCellStyle BackColor="#FFF1D4"/>
                    <SortedAscendingHeaderStyle BackColor="#B95C30"/>
                    <SortedDescendingCellStyle BackColor="#F1E5CE"/>
                    <SortedDescendingHeaderStyle BackColor="#93451F"/>
                </asp:GridView>
                <br/>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                <h3 class="text-center text-info"> Please Click Select Button To View Details</h3>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [DealDetails] WHERE [id] = @original_id AND [productId] = @original_productId AND [placeId] = @original_placeId AND [userId] = @original_userId AND (([date] = @original_date) OR ([date] IS NULL AND @original_date IS NULL)) AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL))" InsertCommand="INSERT INTO [DealDetails] ([productId], [placeId], [userId], [date], [remarks]) VALUES (@productId, @placeId, @userId, @date, @remarks)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [productId], [placeId], [userId], [date], [remarks] FROM [DealDetails]" UpdateCommand="UPDATE [DealDetails] SET [productId] = @productId, [placeId] = @placeId, [userId] = @userId, [date] = @date, [remarks] = @remarks WHERE [id] = @original_id AND [productId] = @original_productId AND [placeId] = @original_placeId AND [userId] = @original_userId AND (([date] = @original_date) OR ([date] IS NULL AND @original_date IS NULL)) AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id" Type="Int32"/>
                        <asp:Parameter Name="original_productId" Type="Int32"/>
                        <asp:Parameter Name="original_placeId" Type="Int32"/>
                        <asp:Parameter Name="original_userId" Type="Int32"/>
                        <asp:Parameter Name="original_date" Type="DateTime"/>
                        <asp:Parameter Name="original_remarks" Type="String"/>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="productId" Type="Int32"/>
                        <asp:Parameter Name="placeId" Type="Int32"/>
                        <asp:Parameter Name="userId" Type="Int32"/>
                        <asp:Parameter Name="date" Type="DateTime"/>
                        <asp:Parameter Name="remarks" Type="String"/>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="productId" Type="Int32"/>
                        <asp:Parameter Name="placeId" Type="Int32"/>
                        <asp:Parameter Name="userId" Type="Int32"/>
                        <asp:Parameter Name="date" Type="DateTime"/>
                        <asp:Parameter Name="remarks" Type="String"/>
                        <asp:Parameter Name="original_id" Type="Int32"/>
                        <asp:Parameter Name="original_productId" Type="Int32"/>
                        <asp:Parameter Name="original_placeId" Type="Int32"/>
                        <asp:Parameter Name="original_userId" Type="Int32"/>
                        <asp:Parameter Name="original_date" Type="DateTime"/>
                        <asp:Parameter Name="original_remarks" Type="String"/>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            <div class="col-md-2">

            </div>
        </div>
        <br/><br/>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource2" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="id" SortExpression="id" Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Upload Product Details" SortExpression="uploadProduct">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("uploadProduct") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <b>Name : </b><asp:Label ID="Label2" runat="server" Text='<%# Bind("uploadProduct") %>'></asp:Label>
                                <br/>
                                <b>Mobile No : </b><asp:Label ID="Label8" runat="server" Text='<%# Bind("uMobileNo") %>'></asp:Label>
                                <br/>
                               <br/>
                                <b>Image : </b><img  height="100" src='<%# "../UIpublic/profilePicture/images/"+ Eval("uploadUser") %>'/>
                              <br/>
                                <br/>
                                <b>Product Name :</b> <asp:Label ID="Label4" runat="server" Text='<%# Bind("product") %>'></asp:Label>
                                <br/><br/>
                                <b>Product Image : </b><img height="100" src='<%# "uploads/productImages/"+ Eval("pImage") %>'/>
                              <br/>
                                <br/>
                                <b>Price : </b><asp:Label ID="Label16" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Place & Manager Details" SortExpression="place">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("place") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                               <b>Place : </b> <asp:Label ID="Label5" runat="server" Text='<%# Bind("place") %>'></asp:Label>
                                <br/>
                                <b>Manager : </b><asp:Label ID="Label6" runat="server" Text='<%# Bind("manager") %>'></asp:Label>
                                <br/>
                               <b>Mobile No : </b> <asp:Label ID="Label7" runat="server" Text='<%# Bind("managerMobile") %>'></asp:Label>
                                <br/><br/>
                                <b>Image : </b><img height="100" src='<%# "uploads/images/"+Eval("managerImage") %>'/> 
                             
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Buying Details" SortExpression="user">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("user") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                              <b>Name : </b>  <asp:Label ID="Label9" runat="server" Text='<%# Bind("user") %>'></asp:Label>
                                <br/>
                               <b>Email : </b> <asp:Label ID="Label10" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                <br/>
                                <b>Mobile No : </b><asp:Label ID="Label11" runat="server" Text='<%# Bind("mobileNo") %>'></asp:Label>
                                <br/><br/>
                                <b>Image : </b><img height="100" src='<%# "../UIpublic/profilePicture/images/" +Eval("userImage") %>'/>
                              
                                <br/>

                            </ItemTemplate>
                        </asp:TemplateField>
  
                        <asp:TemplateField HeaderText="Deal Date" SortExpression="dealDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("dealDate") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                               <b>Date : </b> <asp:Label ID="Label13" runat="server" Text='<%# Bind("dealDate") %>'></asp:Label>
                                <br/>
                               <b>Remarks : </b> <asp:Label ID="Label14" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [uploadProduct], [uploadUser], [uMobileNo], [product], [pImage], [price], [place], [manager], [managerMobile], [managerImage], [user], [email], [mobileNo], [userImage], [dealDate], [remarks] FROM [vwDealDetyails] WHERE ([id] = @id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>   
</asp:Content>
