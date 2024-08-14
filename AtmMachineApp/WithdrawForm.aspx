<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WithdrawForm.aspx.cs" Inherits="AtmMachineApp.WithdrawForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
           margin:auto;
           border:2px ridge;
           text-align:center;
           padding-right:60px;
           padding-left:60px;
           padding-top:10px;
           padding-bottom:40px;
           background-color:lightgray;
        }
        .auto-style2 {
            height: 30px;
        }
        .bank{
            font-size:35px;
            color:blue;
        }
        .withdraw{
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
                    <td>
                        <asp:Label ID="accountLabel" runat="server" Height="35px" Text="Label" ForeColor="Green"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="withdraw">Withdraw</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Enter Amount</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="WithdrawTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="WithdrawTextBox" Display="Dynamic" ErrorMessage="Plz Enter Amount" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
&nbsp; &nbsp;<asp:Label ID="DisplayLabel" runat="server" height="25px" Text="Amount Withdraw Successful!!" ForeColor="Green" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="BackButton" runat="server" Text="Back" OnClick="BackButton_Click1" CausesValidation="False" />
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
