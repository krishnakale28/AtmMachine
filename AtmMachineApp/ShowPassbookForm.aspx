<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowPassbookForm.aspx.cs" Inherits="AtmMachineApp.ShowPassbookForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin:auto;
            border:2px ridge;
            padding-left:20px;
            padding-right:20px;
            padding-top:10px;
            padding-bottom:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>XPay Life Bank</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>A/C Passbook</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Pass Book(Bank Statement)<br />
                        User_Id :
                        <asp:TextBox ID="userIdTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="transaction_id" CellPadding="12" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="transaction_id" HeaderText="Transaction_Id" ReadOnly="True" SortExpression="transaction_id" />
                                <asp:BoundField DataField="transaction_date" HeaderText="Transaction_Date" SortExpression="transaction_date" />
                                <asp:BoundField DataField="transaction_remark" HeaderText="Remarks" SortExpression="transaction_remark" />
                                <asp:BoundField DataField="transaction_type_debit" HeaderText="Debit" SortExpression="transaction_type_debit" />
                                <asp:BoundField DataField="transaction_type_credit" HeaderText="Credit" SortExpression="transaction_type_credit" />
                                <asp:BoundField DataField="current_balance" HeaderText="Amount" SortExpression="current_balance" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KrishnaAtmMashineSystemDbConnectionString %>" ProviderName="<%$ ConnectionStrings:KrishnaAtmMashineSystemDbConnectionString.ProviderName %>" SelectCommand="SELECT [transaction_id], [transaction_date], [transaction_remark], [transaction_type_credit], [transaction_type_debit], [current_balance] FROM [tbl_passbook_master]"></asp:SqlDataSource>
                        <br />
                        <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Text="Back" />
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
