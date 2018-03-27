<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="HaatBazeer.UIpublic.EditProfile" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/><br/>
    <div class="container">
        <div class="row">
            <h2 class="text-center text-info">Edit Profile</h2>
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="80%" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource1" DefaultMode="Edit" OnItemUpdated="DetailsView1_ItemUpdated">
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Invalid Email" Font-Bold="True" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password" SortExpression="password">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("password") %>' ></asp:TextBox>
                                <ajaxToolkit:PasswordStrength ID="TextBox3_PasswordStrength" runat="server" BehaviorID="TextBox3_PasswordStrength" TargetControlID="TextBox3" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Confirm Password" SortExpression="password">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox88" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox88" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox3" ControlToValidate="TextBox88" ErrorMessage="Password Does not Match" Font-Bold="True" ForeColor="#CC0000"></asp:CompareValidator>

                            </EditItemTemplate>
                          
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mobile No" SortExpression="mobileNo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("mobileNo") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("mobileNo") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("mobileNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="National Id" SortExpression="nId">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("nId") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("nId") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("nId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Local Address" SortExpression="localAddress">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("localAddress") %>' TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("localAddress") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("localAddress") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Permanent Address" SortExpression="permanentAddress">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("permanentAddress") %>' TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox7" ErrorMessage="Required" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("permanentAddress") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("permanentAddress") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City" SortExpression="cityId">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" SelectedValue='<%# Bind("cityId") %>' runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name] FROM [City]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("cityId") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("cityId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"/>
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" OnClick="Button2_Click" Text="Cancel"/>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"/>
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"/>
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center"/>
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"/>
                </asp:DetailsView>
                <br/>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label><br/>
                <a href="Profile.aspx" class="text-danger">Back to MyProfile</a>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [Users] WHERE [id] = @original_id AND [name] = @original_name AND [email] = @original_email AND [password] = @original_password AND [mobileNo] = @original_mobileNo AND (([nId] = @original_nId) OR ([nId] IS NULL AND @original_nId IS NULL)) AND (([localAddress] = @original_localAddress) OR ([localAddress] IS NULL AND @original_localAddress IS NULL)) AND (([permanentAddress] = @original_permanentAddress) OR ([permanentAddress] IS NULL AND @original_permanentAddress IS NULL)) AND (([cityId] = @original_cityId) OR ([cityId] IS NULL AND @original_cityId IS NULL))" InsertCommand="INSERT INTO [Users] ([name], [email], [password], [mobileNo], [nId], [localAddress], [permanentAddress], [cityId]) VALUES (@name, @email, @password, @mobileNo, @nId, @localAddress, @permanentAddress, @cityId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [name], [email], [password], [mobileNo], [nId], [localAddress], [permanentAddress], [cityId] FROM [Users] WHERE ([id] = @id)" UpdateCommand="UPDATE [Users] SET [name] = @name, [email] = @email, [password] = @password, [mobileNo] = @mobileNo, [nId] = @nId, [localAddress] = @localAddress, [permanentAddress] = @permanentAddress, [cityId] = @cityId WHERE [id] = @original_id AND [name] = @original_name AND [email] = @original_email AND [password] = @original_password AND [mobileNo] = @original_mobileNo AND (([nId] = @original_nId) OR ([nId] IS NULL AND @original_nId IS NULL)) AND (([localAddress] = @original_localAddress) OR ([localAddress] IS NULL AND @original_localAddress IS NULL)) AND (([permanentAddress] = @original_permanentAddress) OR ([permanentAddress] IS NULL AND @original_permanentAddress IS NULL)) AND (([cityId] = @original_cityId) OR ([cityId] IS NULL AND @original_cityId IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_email" Type="String" />
                        <asp:Parameter Name="original_password" Type="String" />
                        <asp:Parameter Name="original_mobileNo" Type="String" />
                        <asp:Parameter Name="original_nId" Type="String" />
                        <asp:Parameter Name="original_localAddress" Type="String" />
                        <asp:Parameter Name="original_permanentAddress" Type="String" />
                        <asp:Parameter Name="original_cityId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="mobileNo" Type="String" />
                        <asp:Parameter Name="nId" Type="String" />
                        <asp:Parameter Name="localAddress" Type="String" />
                        <asp:Parameter Name="permanentAddress" Type="String" />
                        <asp:Parameter Name="cityId" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="mobileNo" Type="String" />
                        <asp:Parameter Name="nId" Type="String" />
                        <asp:Parameter Name="localAddress" Type="String" />
                        <asp:Parameter Name="permanentAddress" Type="String" />
                        <asp:Parameter Name="cityId" Type="Int32" />
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_email" Type="String" />
                        <asp:Parameter Name="original_password" Type="String" />
                        <asp:Parameter Name="original_mobileNo" Type="String" />
                        <asp:Parameter Name="original_nId" Type="String" />
                        <asp:Parameter Name="original_localAddress" Type="String" />
                        <asp:Parameter Name="original_permanentAddress" Type="String" />
                        <asp:Parameter Name="original_cityId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</asp:Content>
