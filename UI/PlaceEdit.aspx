<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlaceEdit.aspx.cs" Inherits="HaatBazeer.UI.PlaceEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div class="=container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                  <div class="text-center text-danger">
        <h3 class="text-center text-danger">
            Place Edit Page
        </h3>
    </div>
    <br/>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Edit" OnItemUpdated="DetailsView1_ItemUpdated">
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Manager" SortExpression="placeManagerID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" Selectedvalue='<%# Bind("placeManagerID") %>' runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [PlaceManagers]"></asp:SqlDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("placeManagerID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("placeManagerID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Map Link" SortExpression="mapLink">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("mapLink") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("mapLink") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("mapLink") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City" SortExpression="cityId">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" Selectedvalue='<%# Bind("cityId") %>' runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000" Operator="NotEqual" ValueToCompare="0"></asp:CompareValidator>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [City]"></asp:SqlDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("cityId") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("cityId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remarks" SortExpression="remarks">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("remarks") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("remarks") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="Button2_Click" Text="Cancel" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [Place] WHERE [id] = @original_id AND [name] = @original_name AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([placeManagerID] = @original_placeManagerID) OR ([placeManagerID] IS NULL AND @original_placeManagerID IS NULL)) AND (([mapLink] = @original_mapLink) OR ([mapLink] IS NULL AND @original_mapLink IS NULL)) AND [cityId] = @original_cityId AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL))" InsertCommand="INSERT INTO [Place] ([name], [description], [placeManagerID], [mapLink], [cityId], [remarks]) VALUES (@name, @description, @placeManagerID, @mapLink, @cityId, @remarks)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [name], [description], [placeManagerID], [mapLink], [cityId], [remarks] FROM [Place] WHERE ([id] = @id)" UpdateCommand="UPDATE [Place] SET [name] = @name, [description] = @description, [placeManagerID] = @placeManagerID, [mapLink] = @mapLink, [cityId] = @cityId, [remarks] = @remarks WHERE [id] = @original_id AND [name] = @original_name AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([placeManagerID] = @original_placeManagerID) OR ([placeManagerID] IS NULL AND @original_placeManagerID IS NULL)) AND (([mapLink] = @original_mapLink) OR ([mapLink] IS NULL AND @original_mapLink IS NULL)) AND [cityId] = @original_cityId AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL))">
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
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="place" Type="Int32" />
        </SelectParameters>
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
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    
    <br/>
    <a href="Place.aspx">Back To Place Page</a>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
  
</asp:Content>
