<%@ Page Title="" Language="C#" MasterPageFile="~/Hospital.Master" AutoEventWireup="true" CodeBehind="Hospital_Info.aspx.cs" Inherits="AadharBased_govt_side.Hospital_Info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: center;
            font-weight: bold;
        }
        .style2
        {
            width: 39%;
        height: 286px;
    }
        .style3
        {
            text-align: center;
        }
        .style4
        {
            width: 212px;
            height: 20px;
        }
        .style5
        {
            height: 20px;
        text-align: center;
    }
    .style6
    {
        text-align: center;
    }
    .style7
    {
        width: 212px;
        text-align: center;
        height: 30px;
    }
    .style8
    {
        text-align: center;
        height: 30px;
    }
    </style>
    <link href="css/Overall.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style1">
        HOSPITAL DETAILS</p>
    <table align="center" class="style2" cellpadding="5" cellspacing="5">
        <tr>
            <td align="center" class="style3">
                Hospital Name</td>
            <td class="style6">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3" style="text-align: center">
                Hopital Phone No</td>
            <td class="style6">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3" style="text-align: center">
                Hospital Email</td>
            <td class="style6">
                <asp:TextBox ID="TextBox3" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3" style="text-align: center">
                Hospital Address</td>
            <td class="style6">
                <asp:TextBox ID="TextBox4" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style7" style="text-align: center">
                Hospital Type</td>
            <td class="style8">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    CssClass="ddl">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Clinic</asp:ListItem>
                    <asp:ListItem>Hospital</asp:ListItem>
                    <asp:ListItem>Multi Speciality Hospital</asp:ListItem>
                    <asp:ListItem>Govt Hospital</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style4" style="text-align: center">
                District</td>
            <td class="style5">
                <asp:TextBox ID="TextBox5" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Dean Name</td>
            <td class="style6">
                <asp:TextBox ID="TextBox6" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Save" 
                    Width="68px" CssClass="btn" />
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
