<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepositForm.aspx.cs" Inherits="AtmMachineApp.DepositForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin:auto;
            border:2px ridge;
            text-align:center;
            padding-left:70px;
            padding-right:70px;
            padding-top:10px;
            padding-bottom:70px;
             background-color:lightgray;
        }
        .auto-style2 {
            height: 23px;
            width: 256px;
        }
        .auto-style3 {
            width: 256px;
        }
        .bank{
            font-size:35px;
            color:blue;
        }
        .deposit{
            font-size:30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="bank">XPay Life Bank</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="AccountLabel"  runat="server" Text="Label" Height="35px" Width="65px" ForeColor="Green"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="deposit">Deposit</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Enter Amount</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:TextBox ID="DepositTextBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DepositTextBox" Display="Dynamic" ErrorMessage="Plz Enter Amount" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
                    &nbsp;
                    <asp:Label ID="DisplayLabel" runat="server" height="25px" Text="Amount Deposited!!" ForeColor="Green" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="BackButton" runat="server" Text="Back" OnClick="BackButton_Click" CausesValidation="False" />
                    &nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
