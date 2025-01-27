<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Aadhar_Based.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: center;
            font-weight: bold;
            font-size: large;
        }
        .style2
        {
            width: 23%;
        height: 163px;
    }
        .style3
        {
            height: 38px;
        }
    .style4
    {
        height: 38px;
        width: 99px;
        text-align: center;
    }
    .style5
    {
        text-align: center;
    }
    .style6
    {
        text-align: center;
        height: 39px;
    }
    .style7
    {
        height: 39px;
    }
    </style>
    <link href="css/Overall.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style1">
        LOGIN</p>
    <table class="style2" align="center" border="1" cellpadding="5" cellspacing="5">
        <tr>
            <td class="style4">
                Aadhar No</td>
            <td class="style3">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Password</td>
            <td class="style7">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5" colspan="2">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="LOGIN" 
                    CssClass="btn" />
            </td>
        </tr>
        <tr>
            <td class="style5" colspan="2">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
