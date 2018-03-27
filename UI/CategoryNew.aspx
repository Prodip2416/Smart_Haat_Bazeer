<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryNew.aspx.cs" Inherits="HaatBazeer.UI_Admin.CategoryNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div class="=container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                 <div class="text-center text-danger">
        <h3 class="text-center text-danger">
            Category New Page
        </h3>
    </div>
    <br/>
    <br/>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Insert" OnItemInserted="DetailsView1_ItemInserted">
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
            <asp:TemplateField HeaderText="Name" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category" SortExpression="categoryId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("categoryId") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList1" SelectedValue='<%# Bind("categoryId") %>' runat="server"
                                      DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id">
                           
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [Category]"></asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("categoryId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="Button2_Click" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="New" Text="New" />
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
                       DeleteCommand="DELETE FROM [Category] WHERE [id] = @original_id AND [name] = @original_name AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([categoryId] = @original_categoryId) OR ([categoryId] IS NULL AND @original_categoryId IS NULL))" 
        InsertCommand="INSERT INTO [Category] ([name], [Description], [categoryId]) VALUES (@name, @Description, @categoryId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [name], [Description], [categoryId] FROM [Category]" UpdateCommand="UPDATE [Category] SET [name] = @name, [Description] = @Description, [categoryId] = @categoryId WHERE [id] = @original_id AND [name] = @original_name AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([categoryId] = @original_categoryId) OR ([categoryId] IS NULL AND @original_categoryId IS NULL))">
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
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
  
    <br/>
    <a href="Category.aspx">Back To Category Page</a> 
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
  
</asp:Content>
