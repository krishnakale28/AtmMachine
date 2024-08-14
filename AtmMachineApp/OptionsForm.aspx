<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OptionsForm.aspx.cs" Inherits="AtmMachineApp.OptionsForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin:auto;
            text-align:center;
            border:2px ridge;
            padding-left:60px;
            padding-right:60px;
            padding-top:10px;
            padding-bottom:20px;
            background-color:cadetblue;
        }
        .auto-style2 {
            height: 23px;
        }
        .bank{
            font-size:40px;
            color:blue;
        }
        .welcome{
            font-size:30px;
            color:green;
        }
        .option{
            font-size:30px;
        }
        .auto-style3 {
            height: 25px;
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
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="welcome">Welcome <asp:Label style="font-size:20px" ID="Label1" runat="server" Height="23px" Text="Label" ForeColor="Green" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="option">Options</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="WithdrawButton" runat="server" Text="Withdraw" Width="142px" OnClick="WithdrawButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="DepositButton" runat="server" Text="Deposit" Width="142px" OnClick="DepositButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="CheckBalanceButton" runat="server" Text="Check Balance" Width="142px" OnClick="CheckBalanceButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="ShowPassbookButton" runat="server" Text="Show Passbook" Width="142px" OnClick="ShowPassbookButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="LogOutButton" runat="server" Text="Log Out" Width="142px" OnClick="LogOutButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
