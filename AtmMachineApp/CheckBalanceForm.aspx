<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckBalanceForm.aspx.cs" Inherits="AtmMachineApp.CheckBalanceForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin:auto;
            text-align:center;
            border:2px ridge;
            padding-right:60px;
            padding-left:60px;
            padding-top:10px;
            padding-bottom:30px;
            background-color:lightgray;
        }
        .bank{
            font-size:40px;
            color:blue;
        }
        .balance{
            font-size:30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="bank">XPay Life Bank</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="balance">Check Balance</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>User name :&nbsp;&nbsp;
                        <asp:Label ID="accountLabel" runat="server" ForeColor="Green" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>User_Id :&nbsp;&nbsp; <asp:TextBox ID="UserIdTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>A/C Balance :&nbsp;
                        <asp:TextBox ID="AcBalanceTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Text="Back" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
