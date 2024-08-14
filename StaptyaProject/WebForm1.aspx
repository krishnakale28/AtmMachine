<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication3.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 256px;
        }
        .auto-style3 {
            width: 256px;
            height: 38px;
        }
        .auto-style4 {
            height: 38px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>


            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="mobileNo" HeaderText="mobileNo" SortExpression="mobileNo" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:CheckBoxField DataField="otpVerify" HeaderText="otpVerify" SortExpression="otpVerify" />
                    <asp:BoundField DataField="userlayer" HeaderText="userlayer" SortExpression="userlayer" />
                    <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />
                    <asp:CheckBoxField DataField="isActive" HeaderText="isActive" SortExpression="isActive" />
                    <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Height="80" Width="80" />
            </ItemTemplate>
        </asp:TemplateField>

                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KrishnaAtmMashineSystemDbConnectionString %>" DeleteCommand="DELETE FROM users WHERE (Id = @Id)" InsertCommand="INSERT INTO [users] ([user_id], [Name], [Address], [mobileNo], [Email], [otpVerify], [userlayer], [Remark], [isActive], [ImagePath]) VALUES (@user_id, @Name, @Address, @mobileNo, @Email, @otpVerify, @userlayer, @Remark, @isActive, @ImagePath)" ProviderName="<%$ ConnectionStrings:KrishnaAtmMashineSystemDbConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [users]" UpdateCommand="UPDATE [users] SET [user_id] = @user_id, [Name] = @Name, [Address] = @Address, [mobileNo] = @mobileNo, [Email] = @Email, [otpVerify] = @otpVerify, [userlayer] = @userlayer, [Remark] = @Remark, [isActive] = @isActive, [ImagePath] = @ImagePath WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="user_id" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="mobileNo" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="otpVerify" Type="Boolean" />
                    <asp:Parameter Name="userlayer" Type="String" />
                    <asp:Parameter Name="Remark" Type="String" />
                    <asp:Parameter Name="isActive" Type="Boolean" />
                    <asp:Parameter Name="ImagePath" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="user_id" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="mobileNo" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="otpVerify" Type="Boolean" />
                    <asp:Parameter Name="userlayer" Type="String" />
                    <asp:Parameter Name="Remark" Type="String" />
                    <asp:Parameter Name="isActive" Type="Boolean" />
                    <asp:Parameter Name="ImagePath" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>


        </div>
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">user_id</td>
                    <td>
                        <asp:TextBox ID="UserIdTextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Name</td>
                    <td>
                        <asp:TextBox ID="NameTextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Address</td>
                    <td>
                        <asp:TextBox ID="AddressTextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">mobile</td>
                    <td>
                        <asp:TextBox ID="MobileTextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">email</td>
                    <td>
                        <asp:TextBox ID="EmailTextBox5" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">otp verify</td>
                    <td>
                        <asp:RadioButton ID="OtpRadioButton1" runat="server" Text="OTP Verification" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">user layer</td>
                    <td>
                        <asp:DropDownList ID="LayerDropDownList1" runat="server">
                            <asp:ListItem>select</asp:ListItem>
                            <asp:ListItem>Water Bill</asp:ListItem>
                            <asp:ListItem>Property Bill</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">remark</td>
                    <td>
                        <asp:TextBox ID="RemarkTextBox6" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">isActive</td>
                    <td>
                        <asp:RadioButton ID="ActiveRadioButton2" runat="server" Text="Active" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Image</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style4">
                        <asp:Button ID="submitbutton" runat="server" OnClick="submitbutton_Click" Text="Submit" />
&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="Clear" OnClick="Button2_Click" />
                        <asp:Label ID="Label1" runat="server" Text="Proper working" Visible="False" ForeColor="#00CC00"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>