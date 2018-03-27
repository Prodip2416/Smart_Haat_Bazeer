<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="HaatBazeer.UI_Admin.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="=container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                  <div class="text-center text-danger">
        <h2 class="text-center text-danger">Category</h2>
    </div>
   
    <br/>
    <a href="CategoryNew.aspx">New Category</a>
    <br/><br/>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowDeleted="GridView1_RowDeleted" Width="100%">
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
                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "CategoryEdit.aspx?category="+Eval("id") %>' runat="server"><i class="glyphicon glyphicon-edit"></i></asp:HyperLink>
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
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category" SortExpression="categoryId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("categoryId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("category") %>'></asp:Label>
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
                       ConflictDetection="CompareAllValues"
                       ConnectionString="<%$ ConnectionStrings:MyCon %>"
                       DeleteCommand="DELETE FROM [Category] WHERE [id] = @original_id"
                       InsertCommand="INSERT INTO [Category] ([name], [Description], [categoryId]) VALUES (@name, @Description, @categoryId)"
                       OldValuesParameterFormatString="original_{0}"
                       SelectCommand="SELECT c.id, c.name, c.Description, c1.id,c1.name as category FROM [Category] as c left join category as c1 on c.categoryId=c1.id" 
        UpdateCommand="UPDATE [Category] SET [name] = @name, [Description] = @Description, [categoryId] = @categoryId WHERE [id] = @original_id AND [name] = @original_name AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([categoryId] = @original_categoryId) OR ([categoryId] IS NULL AND @original_categoryId IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_categoryId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="categoryId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="categoryId" Type="Int32" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_Description" Type="String" />
            <asp:Parameter Name="original_categoryId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
 
    <br/>
    <asp:Label ID="lblMessage" runat="server" ></asp:Label>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
  
</asp:Content>
