<%@ Page Title="" Language="C#" MasterPageFile="~/Bank.Master" AutoEventWireup="true" CodeBehind="Bank_Amount_Transfer.aspx.cs" Inherits="AadharBased_govt_side.Bank_Amount_Transfer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 43%;
        }
        .style2
        {
            width: 221px;
        }
        .style3
        {
            width: 42%;
        }
        .style5
        {
            width: 245px;
            height: 45px;
        }
        .style6
        {
            height: 45px;
        }
        .style7
        {
            width: 245px;
        }
        .style8
        {
            font-size: x-large;
            font-weight: bold;
        }
    </style>
    <link href="css/Overall.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div><p class="style8">ONLINE TRANACTION</p>
    <table align="left" class="style1" cellpadding="5" cellspacing="5">
        <tr>
            <td class="style7">
                Enter Your Account No</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Re Enter Your Account No</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="txt" ></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBox1" ControlToValidate="TextBox2" ErrorMessage="*" 
                    ValidationGroup="table1"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style5">
                Enter Your Name</td>
            <td class="style6">
                <asp:TextBox ID="TextBox3" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Enter The Amount</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Re Enter The Amount</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="txt"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToCompare="TextBox4" ControlToValidate="TextBox5" ErrorMessage="*" 
                    ValidationGroup="table1"></asp:CompareValidator>
                <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Enter Your Email To send Otp</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="txt"></asp:TextBox>
                &nbsp;<asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Send" 
                     CssClass="btn" />
            </td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Enter The Otp Recived In Email
            </td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server" CssClass="txt"></asp:TextBox>
                &nbsp;<asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                    Text="Verify" CssClass="btn" />
            </td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label3" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

    <br />
    <br />

    <table align="right" class="style3" cellpadding="5" cellspacing="5">
        <tr>
            <td class="style2">
                Enter Reciver Account No</td>
            <td>
                <asp:TextBox ID="TextBox8" runat="server" CssClass="txt"></asp:TextBox>
                <asp:Label ID="Label5" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Re Enter Reciver Account no</td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server" CssClass="txt"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator3" runat="server" 
                    ControlToCompare="TextBox8" ControlToValidate="TextBox9" ErrorMessage="*" 
                    ValidationGroup="table2"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Enter The Reciver Name</td>
            <td>
                <asp:TextBox ID="TextBox10" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    <br />

    <br />
    <br />

    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Send" 
        CssClass="btn"  />
        <br />
        <asp:Label ID="Label6" runat="server"></asp:Label>
        <br />
        </div>
</asp:Content>
