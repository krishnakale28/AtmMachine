<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPasswordForm.aspx.cs" Inherits="AtmMachineApp.ForgotPasswordForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin:auto;
            border:2px ridge;
            padding-left:90px;
            padding-right:90px;
            padding-bottom:30px;
            padding-top:15px;
            background-color:lightpink;
        }
        .auto-style3 {
            height: 26px;
            width: 298px;
        }
        .bank{
            font-size:40px;
            text-align:center;
            color:blue;
        }
        .reset{
            font-size:27px;
            text-align:center;
        }
        .auto-style4 {
            font-size: 40px;
            text-align: center;
            width: 298px;
        }
        .auto-style5 {
            font-size: 30px;
            text-align: center;
            width: 298px;
        }
        .auto-style6 {
            width: 298px;
        }
        .auto-style7 {
            width: 298px;
        }
        .auto-style8 {
            width: 298px;
            height: 23px;
        }
        .auto-style9 {
            margin-left: 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="bank">XPay Life bank</td>
            </tr>
            <tr>
                <td class="reset">Password Reset Form </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Select Quetion:</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="26px" Width="170px">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" Display="Dynamic" ErrorMessage="Please Select quetion" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Type The Answer:</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:TextBox ID="AnswerTextBox" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="AnswerTextBox" Display="Dynamic" ErrorMessage="Plz Enter Character Only" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AnswerTextBox" Display="Dynamic" ErrorMessage="Plz enter anwer" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Enter Mobile No:</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:TextBox ID="mobileTextBox" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="mobileTextBox" Display="Dynamic" ErrorMessage="Plz Enter 10 Digit Mobile" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="mobileTextBox" Display="Dynamic" ErrorMessage="Plz enter mobile number" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enter New Password:</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="NewPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="NewPasswordTextBox" Display="Dynamic" ErrorMessage="Plz enter new password" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="Submit_Button" runat="server" Text="Submit" OnClick="Submit_Button_Click" />
                    <asp:Label ID="ForgotPassLabel" Height="25px" runat="server" Text="Password Change Successful !!" CssClass="auto-style9" ForeColor="Green" Visible="False" Width="350px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Back_button" runat="server" CausesValidation="False" OnClick="Back_button_Click" Text="Back" />
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
