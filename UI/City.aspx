<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="City.aspx.cs" Inherits="HaatBazeer.City" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="=container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                  <div class="text-center text-danger">
        <h2>
            City
        </h2>
    </div>
    <br/>
    <a href="CityNew.aspx">New City</a>
    <br/>
    <br/>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="100%" OnRowDeleted="GridView1_RowDeleted">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"/>
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"/>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Edit" SortExpression="name">
               
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "CityEdit.aspx?city="+Eval("id") %>' runat="server"><i class="glyphicon glyphicon-edit"></i></asp:HyperLink>
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
            <asp:TemplateField HeaderText="Country" SortExpression="countryId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("countryId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("country") %>'></asp:Label>
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
                       DeleteCommand="DELETE FROM [City] WHERE [id] = @original_id"
                       InsertCommand="INSERT INTO [City] ([name], [countryId]) VALUES (@name, @countryId)"
                       OldValuesParameterFormatString="original_{0}"
                       SelectCommand="SELECT ct.id, ct.name, cn.id, cn.name as country FROM City as ct left join country as cn on ct.countryId=cn.id" 
        UpdateCommand="UPDATE [City] SET [name] = @name, [countryId] = @countryId WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([countryId] = @original_countryId) OR ([countryId] IS NULL AND @original_countryId IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_countryId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="countryId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="countryId" Type="Int32" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_countryId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br/>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
  
</asp:Content>
