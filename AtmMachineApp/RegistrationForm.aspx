<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="AtmMachineApp.RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
           margin:auto;
           border:2px ridge;
           padding-left:60px;
           padding-right:60px;
           padding-top:20px;
           padding-bottom:40px;
           background-color:hotpink;

        }
        .auto-style2 {
            width: 193px;
        }
        .auto-style3 {
            width: 193px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 193px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
        }
        .bank{
            text-align:center;
            font-size:40px;
            color:blue;
        }
        .register{
            text-align:center;
            font-size:30px;
        }
        .auto-style7 {
            width: 193px;
            height: 30px;
        }
        .auto-style8 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="bank" colspan="2">XPay Life Bank</td>
            </tr>
            <tr>
                <td class="register" colspan="2">Registration Form</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">First Name :</td>
                <td>
                    <asp:TextBox ID="firstNameTextBox" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="firstNameTextBox" Display="Dynamic" ErrorMessage="Plz Enter Characters only" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="firstNameTextBox" Display="Dynamic" ErrorMessage="Plz Enter first name" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Last Name : </td>
                <td>
                    <asp:TextBox ID="lastNameTextBox" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="lastNameTextBox" Display="Dynamic" ErrorMessage="Plz Enter Characters only" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="lastNameTextBox" Display="Dynamic" ErrorMessage="Plz Enter last name" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Mobile : </td>
                <td>
                    <asp:TextBox ID="MobileTextBox" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="MobileTextBox" Display="Dynamic" ErrorMessage="Plz Enter 10 Digit Mobile  No." ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[789]\d{9}$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="MobileTextBox" Display="Dynamic" ErrorMessage="Plz Enter mobile number" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Email Id : </td>
                <td class="auto-style4">
                    <asp:TextBox ID="emailTextBox" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="Plz Enter Valid Email" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="Plz Enter email id" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Address : </td>
                <td class="auto-style6">
                    <asp:TextBox ID="addressTextBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="addressTextBox" Display="Dynamic" ErrorMessage="Plz Enter Address" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Account No : </td>
                <td class="auto-style8">
                    <asp:TextBox ID="accountTextBox" runat="server"></asp:TextBox>
                    <asp:Label ID="dublicatAcLabel" runat="server" ForeColor="Red" Text="Acount No Already Register" Visible="False"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="accountTextBox" Display="Dynamic" ErrorMessage="Plz Enter 12 Digit Account No" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[23456789]\d{11}$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="accountTextBox" Display="Dynamic" ErrorMessage="Plz Enter Account No" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Select Security Quetion : </td>
                <td class="auto-style8">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="26px" Width="170px">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" Display="Dynamic" ErrorMessage="Plz Select Quetion" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Security Answer : </td>
                <td>
                    <asp:TextBox ID="answerTextBox" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="answerTextBox" Display="Dynamic" ErrorMessage="Plz Enter Character Only" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="answerTextBox" Display="Dynamic" ErrorMessage="Plz Enter security answer" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password : </td>
                <td>
                    <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="passwordTextBox" Display="Dynamic" ErrorMessage="Plz Enter password" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="RegisterButton" runat="server" OnClick="Button1_Click" Text="Register" />
&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Back_button" runat="server" OnClick="Back_button_Click" Text="Back" CausesValidation="False" />
                &nbsp;
                    <asp:Label ID="RegistrationLabel" height="25px" runat="server" Text="Registration Successful !!" ForeColor="Green" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
