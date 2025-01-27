<%@ Page Title="" Language="C#" MasterPageFile="~/Rto.Master" AutoEventWireup="true" CodeBehind="RtoLisenceDetails.aspx.cs" Inherits="AadharBased_govt_side.RtoLisenceDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style1
    {
        text-align: center;
        font-size: x-large;
        font-weight: bold;
        color: #FFCC00;
    }
    .style2
    {
        width: 40%;
        height: 554px;
    }
    .style3
    {
        height: 22px;
    }
    .style4
    {
        height: 22px;
        width: 200px;
        text-align: center;
    }
    .style5
    {
        text-align: center;
    }
        .style6
        {
            text-align: center;
            height: 53px;
        }
        .style7
        {
            height: 53px;
        }
    </style>
<link href="css/Overall.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p align="center" class="style1">
    LICENSE DETAILS</p>
<table align="center" class="style2" cellpadding="5" cellspacing="5">
    <tr>
        <td class="style4">
            Name</td>
        <td class="style3">
            <asp:TextBox ID="TextBox1" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style5">
            Image</td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style5">
            Address</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style5">
            Aadhar No</td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style5">
            Email Address</td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style5">
            Phone No</td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style5">
            Dob</td>
        <td>
            <asp:TextBox ID="TextBox6" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style5">
            Son/Daughter/Wife of</td>
        <td>
            <asp:TextBox ID="TextBox7" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style6">
            Blood Group</td>
        <td class="style7">
            <asp:DropDownList ID="DropDownList1" runat="server" 
                CssClass="ddl">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>B+</asp:ListItem>
                <asp:ListItem>B-</asp:ListItem>
                <asp:ListItem>O+</asp:ListItem>
                <asp:ListItem>O-</asp:ListItem>
                <asp:ListItem>Ab+</asp:ListItem>
                <asp:ListItem>Ab-</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style5">
            Dl No</td>
        <td>
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="ddl">
                <asp:ListItem>TN99</asp:ListItem>
            </asp:DropDownList>
            &nbsp;<asp:DropDownList ID="DropDownList3" runat="server" CssClass="ddl">
                <asp:ListItem>2021</asp:ListItem>
            </asp:DropDownList>
            &nbsp;<asp:TextBox ID="TextBox8" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style5">
            Vehicle Types</td>
        <td>
            <asp:DropDownList ID="DropDownList4" runat="server" CssClass="ddl">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>LMV</asp:ListItem>
                <asp:ListItem>HMV</asp:ListItem>
                <asp:ListItem>HGMV</asp:ListItem>
                <asp:ListItem>HPMV</asp:ListItem>
                <asp:ListItem>LMV &amp; HMV</asp:ListItem>
                <asp:ListItem>LMV &amp; HMV &amp; HGMV</asp:ListItem>
                <asp:ListItem>LMV &amp; HMV &amp; HGMV &amp; HPMV</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style5">
            Rto Location</td>
        <td>
            <asp:DropDownList ID="DropDownList5" runat="server" CssClass="ddl">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>COIMBATORE</asp:ListItem>
            </asp:DropDownList>
            &nbsp;<asp:DropDownList ID="DropDownList6" runat="server" CssClass="ddl">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>East</asp:ListItem>
                <asp:ListItem>West</asp:ListItem>
                <asp:ListItem>North</asp:ListItem>
                <asp:ListItem>South</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style5">
            Date Of Issue</td>
        <td>
            <asp:TextBox ID="TextBox9" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style5">
            Valid Till</td>
        <td>
            <asp:TextBox ID="TextBox10" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style5" colspan="2">
            <asp:Button ID="Button1" runat="server" Text="SAVE" onclick="Button1_Click" 
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
