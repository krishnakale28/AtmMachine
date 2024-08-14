<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="AtmMachineApp.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin:auto;
            border:2px ridge;
            padding-left:30px;
            padding-right:30px;
            padding-bottom:20px;
            padding-top:10px;
            background-color:lightsalmon;

        }
        .auto-style2 {
            width: 103px;
        }
        .bank{
            font-size:40px;
            text-align:center;
            color:blue;
        }
        .welcome{
            font-size:30px;
            text-align:center;
            color:green;
        }
        .auto-style3 {
            font-size: 30px;
            text-align: center;
            color: green;
            height: 38px;
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
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">Welcome</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">UserName : </td>
                <td>
                    <asp:TextBox ID="UserNameTextBox" runat="server" Width="140px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserNameTextBox" Display="Dynamic" ErrorMessage="Plz Enter UserName" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password : </td>
                <td>
                    <asp:TextBox ID="PasswordTextBox" runat="server" Width="140px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired0" runat="server" ControlToValidate="PasswordTextBox" Display="Dynamic" ErrorMessage="Plz Enter Password" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="Login_button" runat="server" Text="Login" OnClick="Login_button_Click" />
&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Register_Button" runat="server" Text="Register" CausesValidation="False" OnClick="Register_Button_Click" />
&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="ForgotPwrd_Button" runat="server" Text="Forgot password" CausesValidation="False" OnClick="ForgotPwrd_Button_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
