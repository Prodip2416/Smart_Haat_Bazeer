<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="ProductEdit.aspx.cs" Inherits="HaatBazeer.UIpublic.ProductEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/><br/><br/>
  
    <div class="Container">
        <div class="row">
            <h3 class="text-center text-danger">Product Edit Page</h3>
            <br/>
            <br/>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" BackColor="#DEBA84"
                             BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                             DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Edit" OnItemUpdated="DetailsView1_ItemUpdated">
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <Fields>
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tag" SortExpression="tag">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("tag") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("tag") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("tag") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price" SortExpression="price">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="description">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("description") %>' TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <%-- <asp:TemplateField HeaderText="User" SortExpression="userId">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" SelectedValue='<%# Bind("userId") %>' runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [Users]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("userId") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("userId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="CategoryId" SortExpression="categoryId">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" SelectedValue='<%# Bind("categoryId") %>' runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="id">
                                </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Select One" Font-Bold="True" ForeColor="#CC0000" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [Category]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("categoryId") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("categoryId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Update History" SortExpression="updateHistory">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("updateHistory") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox7" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("updateHistory") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("updateHistory") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="statuId">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList3" SelectedValue='<%# Bind("statuId") %>' runat="server" DataSourceID="SqlDataSource5" DataTextField="description" DataValueField="id">
                                </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="DropDownList3" ErrorMessage="Select One" Font-Bold="True" ForeColor="#CC0000" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [description] FROM [Status]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("statuId") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("statuId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" OnClick="Button2_Click" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>"
                               DeleteCommand="DELETE FROM [Product] WHERE [id] = @original_id" InsertCommand="INSERT INTO [Product] ([name], [tag], [price], [description], [userId], [categoryId], [updateHistory], [statuId]) VALUES (@name, @tag, @price, @description, @userId, @categoryId, @updateHistory, @statuId)" OldValuesParameterFormatString="original_{0}"
                               SelectCommand="SELECT [id], [name], [tag], [price], [description], [userId], [categoryId], [updateHistory], [statuId] FROM [Product] WHERE ([id] = @id)"
                             
                  UpdateCommand="UPDATE [Product] SET [name] = @name, [tag] = @tag, [price] = @price, [description] = @description, [categoryId] = @categoryId, [updateHistory] = @updateHistory, [statuId] = @statuId WHERE [id] = @original_id">
                     <DeleteParameters>
                         <asp:Parameter Name="original_id" Type="Int32" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="name" Type="String" />
                         <asp:Parameter Name="tag" Type="String" />
                         <asp:Parameter Name="price" Type="Double" />
                         <asp:Parameter Name="description" Type="String" />
                         <asp:Parameter Name="userId" Type="Int32" />
                         <asp:Parameter Name="categoryId" Type="Int32" />
                         <asp:Parameter Name="updateHistory" Type="String" />
                         <asp:Parameter Name="statuId" Type="Int32" />
                     </InsertParameters>
                     <SelectParameters>
                         <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="product" Type="Int32" />
                     </SelectParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="name" Type="String" />
                         <asp:Parameter Name="tag" Type="String" />
                       
                         <asp:Parameter Name="price" Type="Double" />
                         <asp:Parameter Name="description" Type="String" />
                        
                         <asp:Parameter Name="categoryId" Type="Int32" />
                      
                         <asp:Parameter Name="updateHistory" Type="String" />
                         <asp:Parameter Name="statuId" Type="Int32" />
                         <asp:Parameter Name="original_id" Type="Int32" />
                     </UpdateParameters>
                 </asp:SqlDataSource>
                <br/>
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <br/>
    <br/>
    <a href="Profile.aspx">Back To Main Page</a>

        </div>
    </div>
</asp:Content>
