<%@ Page Title="" Language="C#" MasterPageFile="~/Hospital.Master" AutoEventWireup="true" CodeBehind="Hospital_Bills.aspx.cs" Inherits="AadharBased_govt_side.Hospital_Bills" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
    .style1
    {
        text-align: center;
        font-weight: bold;
    }
    .style2
    {
        width: 34%;
    }
    .style3
    {
        text-align: center;
    }
        .style4
        {
            width: 42%;
        }
    </style>
<link href="css/Overall.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style1">
    HOSPITAL BILLS</p>
<p class="style1">
    <table align="center" cellpadding="5" cellspacing="5" class="style4">
        <tr>
            <td>
                Enter Hospital Details</td>
            <td>
    <asp:TextBox ID="TextBox1" runat="server" CssClass="txt"></asp:TextBox>
            </td>
            <td>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="SEARCH" 
                    CssClass="btn" />
            </td>
        </tr>
    </table>
</p>
<p class="style1">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" 
        CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <RowStyle BackColor="#E3EAEB" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</p>
<table align="center" class="style2" cellpadding="5" cellspacing="5">
    <tr>
        <td class="style3">
            Name</td>
        <td style="text-align: center">
            <asp:TextBox ID="TextBox2" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Phone No</td>
        <td class="style3">
            <asp:TextBox ID="TextBox3" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Email</td>
        <td class="style3">
            <asp:TextBox ID="TextBox4" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Address</td>
        <td class="style3">
            <asp:TextBox ID="TextBox5" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Hospital Type</td>
        <td class="style3">
            <asp:TextBox ID="TextBox6" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            District</td>
        <td class="style3">
            <asp:TextBox ID="TextBox7" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Dean Name</td>
        <td class="style3">
            <asp:TextBox ID="TextBox8" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Bill No</td>
        <td style="text-align: center">
            <asp:TextBox ID="TextBox9" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Bill Name</td>
        <td class="style3">
            <asp:TextBox ID="TextBox10" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Bill Amount</td>
        <td class="style3">
            <asp:TextBox ID="TextBox11" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Biller Email</td>
        <td class="style3">
            <asp:TextBox ID="TextBox13" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Biller Aadhar No</td>
        <td class="style3">
            <asp:TextBox ID="TextBox14" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Paid Date</td>
        <td class="style3">
            <asp:TextBox ID="TextBox12" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Payment Mode</td>
        <td class="style3">
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="ddl">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>Cash</asp:ListItem>
                <asp:ListItem>Bank Transfer</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Schemes</td>
        <td class="style3">
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="ddl">
                <asp:ListItem>NIL</asp:ListItem>
                <asp:ListItem>Govt Schemes</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style3" colspan="2">
            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Save" 
                CssClass="btn" />
        </td>
    </tr>
    <tr>
        <td class="style3" colspan="2">
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
