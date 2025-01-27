<%@ Page Title="" Language="C#" MasterPageFile="~/Bank.Master" AutoEventWireup="true" CodeBehind="Bank_credit_debit.aspx.cs" Inherits="AadharBased_govt_side.Bank_credit_debit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 50%;
        }
        .style2
        {
            height: 20px;
            text-align: center;
        }
        .style3
        {
            text-align: center;
        }
        .style4
        {
            height: 20px;
            width: 210px;
            text-align: center;
        }
        .style5
        {
            text-align: center;
        }
        .style6
        {
            width: 210px;
            text-align: center;
        }
        .style7
        {
            width: 210px;
            text-align: center;
            height: 26px;
        }
        .style8
        {
            height: 26px;
        }
        .style9
        {
            width: 63%;
            height: 51px;
        }
        .style10
        {
            width: 459px;
            font-weight: bold;
        }
        .style11
        {
            width: 229px;
        }
        .style12
        {
            width: 48%;
        }
        .style13
        {
            width: 352px;
        }
        .style14
        {
            width: 197px;
        }
        .style15
        {
            width: 246px;
        }
        .style16
        {
            font-size: x-large;
        }
    </style>
    <link href="css/Overall.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Select Weather Credit Or Debit&nbsp;
        <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" 
            oncheckedchanged="RadioButton1_CheckedChanged" Text="CREDIT" />
&nbsp;<asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" 
            oncheckedchanged="RadioButton2_CheckedChanged" Text="DEBIT" />
    </p>
    <asp:Panel ID="Panel1" runat="server">
        <div class="style3">
            <b><span class="style16">CREDIT</span></b><br />
            <table align="center" cellpadding="5" cellspacing="5" class="style9">
                <tr>
                    <td class="style10">
                        Enter Account No To Fetch Balance</td>
                    <td class="style11">
                        <asp:TextBox ID="TextBox11" runat="server" CssClass="txt"></asp:TextBox>
                    </td>
                    <td class="style15">
                        <asp:Button ID="Button5" runat="server" CssClass="btn" 
                            onclick="Button1_Click" Text="Fetch" />
                    </td>
                </tr>
            </table>
            &nbsp;&nbsp;<br />
            <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                ForeColor="Black" GridLines="Vertical" AutoGenerateSelectButton="True" 
                HorizontalAlign="Center" 
                onselectedindexchanged="GridView1_SelectedIndexChanged">
                <RowStyle BackColor="#F7F7DE" />
                <FooterStyle BackColor="#CCCC99" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <br />
        </div>
        <table align="center" class="style1" cellpadding="5" cellspacing="5">
            <tr>
                <td class="style4">
                    Account No</td>
                <td class="style2">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    Account Holder Name</td>
                <td style="text-align: center">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Balance In Account</td>
                <td class="style2">
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Amount To Deposit</td>
                <td class="style8" style="text-align: center">
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="txt"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5" colspan="2">
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="Deposit" CssClass="btn" Width="120px" />
                </td>
            </tr>
            <tr>
                <td class="style5" colspan="2">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel2" runat="server">
        <div class="style3">
            <b><span class="style16">DEBIT</span><br />
            <br />
            <table cellpadding="3" cellspacing="3" class="style12" align="center">
                <tr>
                    <td class="style13">
                        Enter Account No To Fetch Balance</td>
                    <td class="style14">
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="txt"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" CssClass="btn" onclick="Button3_Click1" 
                            Text="Fetch" />
                    </td>
                </tr>
            </table>
            <br />
            </b>&nbsp;&nbsp;<br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateSelectButton="True" 
                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center" 
                onselectedindexchanged="GridView2_SelectedIndexChanged">
                <RowStyle BackColor="#F7F7DE" />
                <FooterStyle BackColor="#CCCC99" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <br />
            <table align="center" class="style1" cellpadding="5" cellspacing="5">
                <tr>
                    <td class="style4">
                        Account No</td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox7" runat="server" CssClass="txt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        Account Holder Name</td>
                    <td style="text-align: center">
                        <asp:TextBox ID="TextBox8" runat="server" CssClass="txt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Balance In Account</td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox9" runat="server" CssClass="txt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        Amount To Withdraw</td>
                    <td class="style8" style="text-align: center">
                        <asp:TextBox ID="TextBox10" runat="server" CssClass="txt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style5" colspan="2">
                        <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                            Text="Deposit" CssClass="btn" />
                    </td>
                </tr>
                <tr>
                    <td class="style5" colspan="2">
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <p>
    </p>
</asp:Content>
