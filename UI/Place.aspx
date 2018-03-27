<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Place.aspx.cs" Inherits="HaatBazeer.UI.Place" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="=container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                 <div class="text-center text-danger">
        <h2>
            Place Details
        </h2>
    </div>
    <br/>
    <br/>
    <a href="PlaceNew.aspx">New Place</a>
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
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Edit" SortExpression="name">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "PlaceEdit.aspx?place="+Eval("id") %>' runat="server"><i class="glyphicon glyphicon-edit"></i></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Manager" SortExpression="placeManagerID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("placeManagerID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("manager") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Map Link" SortExpression="mapLink" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("mapLink") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("mapLink") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="cityId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("cityId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remarks" SortExpression="remarks">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("remarks") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
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
                       DeleteCommand="DELETE FROM [Place] WHERE [id] = @original_id"
                       InsertCommand="INSERT INTO [Place] ([name], [description], [placeManagerID], [mapLink], [cityId], [remarks]) VALUES (@name, @description, @placeManagerID, @mapLink, @cityId, @remarks)" OldValuesParameterFormatString="original_{0}"
                       SelectCommand="select p.id,p.name,p.description,pm.id,pm.name as manager,p.mapLink,c.id,c.name as city,p.remarks from place as p left join City as c on p.cityId=c.id left join PlaceManagers as pm on p.placeManagerID=pm.id"
                       UpdateCommand="UPDATE [Place] SET [name] = @name, [description] = @description, [placeManagerID] = @placeManagerID, [mapLink] = @mapLink, [cityId] = @cityId, [remarks] = @remarks WHERE [id] = @original_id AND [name] = @original_name AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([placeManagerID] = @original_placeManagerID) OR ([placeManagerID] IS NULL AND @original_placeManagerID IS NULL)) AND (([mapLink] = @original_mapLink) OR ([mapLink] IS NULL AND @original_mapLink IS NULL)) AND [cityId] = @original_cityId AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_description" Type="String" />
            <asp:Parameter Name="original_placeManagerID" Type="Int32" />
            <asp:Parameter Name="original_mapLink" Type="String" />
            <asp:Parameter Name="original_cityId" Type="Int32" />
            <asp:Parameter Name="original_remarks" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="placeManagerID" Type="Int32" />
            <asp:Parameter Name="mapLink" Type="String" />
            <asp:Parameter Name="cityId" Type="Int32" />
            <asp:Parameter Name="remarks" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="placeManagerID" Type="Int32" />
            <asp:Parameter Name="mapLink" Type="String" />
            <asp:Parameter Name="cityId" Type="Int32" />
            <asp:Parameter Name="remarks" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_name" Type="String" />
            <asp:Parameter Name="original_description" Type="String" />
            <asp:Parameter Name="original_placeManagerID" Type="Int32" />
            <asp:Parameter Name="original_mapLink" Type="String" />
            <asp:Parameter Name="original_cityId" Type="Int32" />
            <asp:Parameter Name="original_remarks" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br/>
    <br/>
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
   
</asp:Content>
