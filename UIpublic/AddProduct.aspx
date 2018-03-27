<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="HaatBazeer.UIpublic.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/><br/><br/>
<br/>
<h3 class="text-danger text-center">Product add page</h3>
    <br/>
    <div class="Container">
        <div class="row">
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Insert" OnItemInserted="DetailsView1_ItemInserted" OnItemInserting="DetailsView1_ItemInserting">
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"/>
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
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tag" SortExpression="tag">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("tag") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("tag") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("tag") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="FileName" SortExpression="fileName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("fileName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:FileUpload ID="fleImage" runat="server"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fleImage" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("fileName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price" SortExpression="price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Description" SortExpression="description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("description") %>' TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               <%-- <asp:TemplateField HeaderText="User" SortExpression="userId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("userId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("userId") %>' DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Select One" Font-Bold="True" ForeColor="#CC0000" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [Users]"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("userId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>--%>

                <asp:TemplateField HeaderText="Category" SortExpression="categoryId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("categoryId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList2" SelectedValue='<%# Bind("categoryId") %>' runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Select One" Font-Bold="True" ForeColor="#CC0000" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [Category]"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("categoryId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Update History" SortExpression="updateHistory">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("updateHistory") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("updateHistory") %>' TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox10" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("updateHistory") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Status" SortExpression="statuId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("statuId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList6" SelectedValue='<%# Bind("statuId") %>' runat="server" DataSourceID="SqlDataSource9" DataTextField="description" DataValueField="id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [description] FROM [Status]"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("statuId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <InsertItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"/>
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="Button2_Click" Text="Cancel"/>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="New" Text="New"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"/>
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"/>
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center"/>
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"/>
        </asp:DetailsView>
        <br/>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <br/>
            <a class="text-danger" href="Profile.aspx">Back To Main page</a>
<asp:SqlDataSource ID="SqlDataSource1" runat="server"
                   ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>"
                   DeleteCommand="DELETE FROM [Product] WHERE [id] = @original_id AND [name] = @original_name AND [tag] = @original_tag AND [fileName] = @original_fileName AND [price] = @original_price AND (([date] = @original_date) OR ([date] IS NULL AND @original_date IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([userId] = @original_userId) OR ([userId] IS NULL AND @original_userId IS NULL)) AND (([ip] = @original_ip) OR ([ip] IS NULL AND @original_ip IS NULL)) AND [categoryId] = @original_categoryId AND (([updateHistory] = @original_updateHistory) OR ([updateHistory] IS NULL AND @original_updateHistory IS NULL)) AND (([messageId] = @original_messageId) OR ([messageId] IS NULL AND @original_messageId IS NULL)) AND (([commentId] = @original_commentId) OR ([commentId] IS NULL AND @original_commentId IS NULL)) AND (([ratingId] = @original_ratingId) OR ([ratingId] IS NULL AND @original_ratingId IS NULL)) AND (([statuId] = @original_statuId) OR ([statuId] IS NULL AND @original_statuId IS NULL))"
     InsertCommand="INSERT INTO [Product] ([name], [tag], [fileName], [price],[date], [description], [userId], [ip], [categoryId], [updateHistory], [statuId]) VALUES (@name, @tag, @fileName, @price,@date, @description, @userId,@ip, @categoryId, @updateHistory, @statuId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [name], [tag], [fileName], [price], [date], [description], [userId], [ip], [categoryId], [updateHistory], [messageId], [commentId], [ratingId], [statuId] FROM [Product]" UpdateCommand="UPDATE [Product] SET [name] = @name, [tag] = @tag, [fileName] = @fileName, [price] = @price, [date] = @date, [description] = @description, [userId] = @userId, [ip] = @ip, [categoryId] = @categoryId, [updateHistory] = @updateHistory, [messageId] = @messageId, [commentId] = @commentId, [ratingId] = @ratingId, [statuId] = @statuId WHERE [id] = @original_id AND [name] = @original_name AND [tag] = @original_tag AND [fileName] = @original_fileName AND [price] = @original_price AND (([date] = @original_date) OR ([date] IS NULL AND @original_date IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([userId] = @original_userId) OR ([userId] IS NULL AND @original_userId IS NULL)) AND (([ip] = @original_ip) OR ([ip] IS NULL AND @original_ip IS NULL)) AND [categoryId] = @original_categoryId AND (([updateHistory] = @original_updateHistory) OR ([updateHistory] IS NULL AND @original_updateHistory IS NULL)) AND (([messageId] = @original_messageId) OR ([messageId] IS NULL AND @original_messageId IS NULL)) AND (([commentId] = @original_commentId) OR ([commentId] IS NULL AND @original_commentId IS NULL)) AND (([ratingId] = @original_ratingId) OR ([ratingId] IS NULL AND @original_ratingId IS NULL)) AND (([statuId] = @original_statuId) OR ([statuId] IS NULL AND @original_statuId IS NULL))">
         <DeleteParameters>
             <asp:Parameter Name="original_id" Type="Int32" />
             <asp:Parameter Name="original_name" Type="String" />
             <asp:Parameter Name="original_tag" Type="String" />
             <asp:Parameter Name="original_fileName" Type="String" />
             <asp:Parameter Name="original_price" Type="Double" />
             <asp:Parameter Name="original_date" Type="DateTime" />
             <asp:Parameter Name="original_description" Type="String" />
             <asp:Parameter Name="original_userId" Type="Int32" />
             <asp:Parameter Name="original_ip" Type="String" />
             <asp:Parameter Name="original_categoryId" Type="Int32" />
             <asp:Parameter Name="original_updateHistory" Type="String" />
             <asp:Parameter Name="original_messageId" Type="Int32" />
             <asp:Parameter Name="original_commentId" Type="Int32" />
             <asp:Parameter Name="original_ratingId" Type="Int32" />
             <asp:Parameter Name="original_statuId" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="name" Type="String" />
             <asp:Parameter Name="tag" Type="String" />
             <asp:Parameter Name="fileName" Type="String" />
             <asp:Parameter Name="price" Type="Double" />
             <asp:parameter Name="date" Type="DateTime" />
             <asp:Parameter Name="description" Type="String" />
             <asp:Parameter Name="userId" Type="Int32" />
             <asp:Parameter Name="ip" Type="string" />
             <asp:Parameter Name="categoryId" Type="Int32" />
             <asp:Parameter Name="updateHistory" Type="String" />
            
             <asp:Parameter Name="statuId" Type="Int32" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="name" Type="String" />
             <asp:Parameter Name="tag" Type="String" />
             <asp:Parameter Name="fileName" Type="String" />
             <asp:Parameter Name="price" Type="Double" />
             <asp:Parameter Name="date" Type="DateTime" />
             <asp:Parameter Name="description" Type="String" />
             <asp:Parameter Name="userId" Type="Int32" />
             <asp:Parameter Name="ip" Type="String" />
             <asp:Parameter Name="categoryId" Type="Int32" />
             <asp:Parameter Name="updateHistory" Type="String" />
             <asp:Parameter Name="messageId" Type="Int32" />
             <asp:Parameter Name="commentId" Type="Int32" />
             <asp:Parameter Name="ratingId" Type="Int32" />
             <asp:Parameter Name="statuId" Type="Int32" />
             <asp:Parameter Name="original_id" Type="Int32" />
             <asp:Parameter Name="original_name" Type="String" />
             <asp:Parameter Name="original_tag" Type="String" />
             <asp:Parameter Name="original_fileName" Type="String" />
             <asp:Parameter Name="original_price" Type="Double" />
             <asp:Parameter Name="original_date" Type="DateTime" />
             <asp:Parameter Name="original_description" Type="String" />
             <asp:Parameter Name="original_userId" Type="Int32" />
             <asp:Parameter Name="original_ip" Type="String" />
             <asp:Parameter Name="original_categoryId" Type="Int32" />
             <asp:Parameter Name="original_updateHistory" Type="String" />
             <asp:Parameter Name="original_messageId" Type="Int32" />
             <asp:Parameter Name="original_commentId" Type="Int32" />
             <asp:Parameter Name="original_ratingId" Type="Int32" />
             <asp:Parameter Name="original_statuId" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>