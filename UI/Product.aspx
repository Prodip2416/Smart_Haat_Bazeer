<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="HaatBazeer.UI.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="=container">
        <div class="row">
         
            <div class="col-md-12">
                 <div>
        <h2 class="text-center text-danger">Product</h2>
    </div>

    <br />
    <a href="ProductNew.aspx">New Product</a>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" Width="100%" DataKeyNames="id" OnRowDeleted="GridView1_RowDeleted" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"/>
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"/>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Edit" SortExpression="name">
               
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "ProductEdit.aspx?product="+ Eval("id") %>' runat="server"><i class="glyphicon glyphicon-edit"></i></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Basic Details" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <b>Name : </b><asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    <br/>
                    <b>Tag : </b><asp:Label ID="Label2" runat="server" Text='<%# Bind("tag") %>'></asp:Label>
                    <br/>
                    <b>Category : </b> <asp:Label ID="Label10" runat="server" Text='<%# Bind("category") %>'></asp:Label>
                    <br/>
                    <b>Price : </b><asp:Label ID="Label4" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                    <br/>
                    <b>Upload Product Date : </b> <asp:Label ID="Label6" runat="server" Text='<%# Bind("date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           
            <asp:TemplateField HeaderText="Image" SortExpression="fileName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("fileName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" src='<%# "uploads/productImages/" + Eval("fileName") %>' Height="100px" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
          
          
            <asp:TemplateField HeaderText="Product Description" SortExpression="description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User Details" SortExpression="userId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("userId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <b>Name : </b> <asp:Label ID="Label8" runat="server" Text='<%# Bind("user") %>'></asp:Label>
                    <br/>
                    <b>Image : </b><img height="100" src='<%# "../UIpublic/profilePicture/images/" + Eval("uImage") %>'/>
                    <br/>
                  
                    <b>Ip : </b> <asp:Label ID="Label9" runat="server" Text='<%# Bind("ip") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>     
            <asp:TemplateField HeaderText="Update History && Status" SortExpression="updateHistory">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("updateHistory") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <b>Update History : </b><asp:Label ID="Label11" runat="server" Text='<%# Bind("updateHistory") %>'></asp:Label>
                    <br/>
                    <b>Status : </b><asp:Label ID="Label15" runat="server" Text='<%# Bind("status") %>'></asp:Label>
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
                   ConnectionString="<%$ ConnectionStrings:MyCon %>"
                   SelectCommand="SELECT p.id, p.name, p.tag, p.fileName, p.price, p.date, p.description,u.id, u.name AS [user], u.Image as uImage,
 p.ip, ct.id, ct.name AS category, p.updateHistory, s.id, s.description AS status
FROM  Product AS p 
LEFT JOIN Users AS u ON p.userId = u.id 
left join Category AS ct ON p.categoryId = ct.id 
left join Status AS s ON p.statuId = s.id" ConflictDetection="CompareAllValues"
                   DeleteCommand="DELETE FROM [Product] WHERE [id] = @original_id"
                   InsertCommand="INSERT INTO [Product] ([name], [tag], [fileName], [price], [date], [description], [userId], [ip], [categoryId], [updateHistory], [messageId], [commentId], [ratingId], [statuId]) VALUES (@name, @tag, @fileName, @price, @date, @description, @userId, @ip, @categoryId, @updateHistory, @messageId, @commentId, @ratingId, @statuId)"
                   OldValuesParameterFormatString="original_{0}" 
    UpdateCommand="UPDATE [Product] SET [name] = @name, [tag] = @tag, [fileName] = @fileName, [price] = @price, [date] = @date, [description] = @description, [userId] = @userId, [ip] = @ip, [categoryId] = @categoryId, [updateHistory] = @updateHistory, [messageId] = @messageId, [commentId] = @commentId, [ratingId] = @ratingId, [statuId] = @statuId WHERE [id] = @original_id AND [name] = @original_name AND [tag] = @original_tag AND [fileName] = @original_fileName AND [price] = @original_price AND (([date] = @original_date) OR ([date] IS NULL AND @original_date IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([userId] = @original_userId) OR ([userId] IS NULL AND @original_userId IS NULL)) AND (([ip] = @original_ip) OR ([ip] IS NULL AND @original_ip IS NULL)) AND [categoryId] = @original_categoryId AND (([updateHistory] = @original_updateHistory) OR ([updateHistory] IS NULL AND @original_updateHistory IS NULL)) AND (([messageId] = @original_messageId) OR ([messageId] IS NULL AND @original_messageId IS NULL)) AND (([commentId] = @original_commentId) OR ([commentId] IS NULL AND @original_commentId IS NULL)) AND (([ratingId] = @original_ratingId) OR ([ratingId] IS NULL AND @original_ratingId IS NULL)) AND (([statuId] = @original_statuId) OR ([statuId] IS NULL AND @original_statuId IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_id" Type="Int32" />
       
    </DeleteParameters>
    <InsertParameters>
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
    <br />
    <br />
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>
         
        </div>
    </div>
   

</asp:Content>
