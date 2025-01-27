<%@ Page Title="" Language="C#" MasterPageFile="~/Bank.Master" AutoEventWireup="true" CodeBehind="Bank_account_creation.aspx.cs" Inherits="AadharBased_govt_side.Bank_account_creation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: center;
            font-size: x-large;
            font-weight: bold;
        }
        .style2
        {
            width: 59%;
        }
        .style3
        {
            text-align: center;
        }
        .style4
        {
            text-align: center;
            height: 33px;
        }
        .style5
        {
            height: 33px;
        }
        .style6
        {
            text-align: center;
            height: 26px;
        }
        .style7
        {
            height: 26px;
        }
        .style8
        {
            text-align: center;
            height: 44px;
        }
        .style9
        {
            width: 396px;
        }
        .style10
        {
            height: 26px;
            width: 396px;
        }
    </style>
    <link href="css/Overall.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style1">
        BANK ACCOUNT CREATION</p>
    <table align="center" class="style2" cellpadding="5" cellspacing="5">
        <tr>
            <td class="style3">
                Account Holder Name</td>
            <td class="style9">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="txt"></asp:TextBox>
            &nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="*" ValidationGroup="tbl"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Account Holder&nbsp; Phone No</td>
            <td class="style9">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="txt"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="*" ValidationExpression="[0-9]{10}" 
                    ValidationGroup="tbl"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Account Holder Email Id</td>
            <td class="style9">
                <asp:TextBox ID="TextBox3" runat="server" CssClass="txt"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="*" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="tbl"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Account Holder Aadhar No</td>
            <td class="style9">
                <asp:TextBox ID="TextBox4" runat="server" CssClass="txt"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="*" ValidationExpression="[0-9]{12}" 
                    ValidationGroup="tbl"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Account Holder Address</td>
            <td class="style9">
                <asp:TextBox ID="TextBox5" runat="server" CssClass="txt"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox5" ErrorMessage="*" ValidationGroup="tbl"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Account Holder Dob</td>
            <td class="style10">
                <asp:TextBox ID="TextBox6" runat="server" CssClass="txt"></asp:TextBox>
            </td>
            <td class="style7">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="TextBox6" ErrorMessage="*" 
                    ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" 
                    ValidationGroup="tbl"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Gender</td>
            <td class="style9">
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="ddl">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Pan card Number</td>
            <td class="style9">
                <asp:TextBox ID="TextBox7" runat="server" CssClass="txt"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox7" ErrorMessage="*" ValidationGroup="tbl"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Account Type</td>
            <td class="style9">
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="ddl">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Savings Account with cheque book</asp:ListItem>
                    <asp:ListItem>Savings Account without cheque book</asp:ListItem>
                    <asp:ListItem>Current Accouunt</asp:ListItem>
                    <asp:ListItem>Premium Account</asp:ListItem>
                    <asp:ListItem>Deposit account</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Date Of Opening</td>
            <td class="style9">
                <asp:TextBox ID="TextBox8" runat="server" CssClass="txt"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="TextBox8" ErrorMessage="*" 
                    ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" 
                    ValidationGroup="tbl"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Proof 1 No</td>
            <td class="style9">
                <asp:TextBox ID="TextBox9" runat="server" CssClass="txt"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox9" ErrorMessage="*" ValidationGroup="tbl"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Proof 2 No</td>
            <td class="style9">
                <asp:TextBox ID="TextBox10" runat="server" CssClass="txt"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBox10" ErrorMessage="*" ValidationGroup="tbl"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Proof 3 No</td>
            <td class="style9">
                <asp:TextBox ID="TextBox11" runat="server" CssClass="txt"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="TextBox11" ErrorMessage="*" ValidationGroup="tbl"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Account No</td>
            <td class="style5">
                <asp:TextBox ID="TextBox12" runat="server" ReadOnly="True" Width="60px" 
                    CssClass="txt"></asp:TextBox>
                &nbsp;<asp:TextBox ID="TextBox13" runat="server" ReadOnly="True" Width="67px" 
                    CssClass="txt">101011</asp:TextBox>
                &nbsp;<asp:TextBox ID="TextBox14" runat="server" ReadOnly="True" CssClass="txt"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Generate" 
                    CssClass="btn" />
            </td>
            <td class="style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="TextBox14" ErrorMessage="*" ValidationGroup="tbl"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Passport Size Photo</td>
            <td class="style5">
                <asp:FileUpload ID="FileUpload1" runat="server" />
&nbsp;</td>
            <td class="style5">
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style8" colspan="3">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                     Text="Create" CssClass="btn" Height="34px" ValidationGroup="tbl" />
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="3">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
