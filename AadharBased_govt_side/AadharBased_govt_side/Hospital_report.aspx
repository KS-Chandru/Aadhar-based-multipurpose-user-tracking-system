<%@ Page Title="" Language="C#" MasterPageFile="~/Hospital.Master" AutoEventWireup="true" CodeBehind="Hospital_report.aspx.cs" Inherits="AadharBased_govt_side.Hospital_report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style1
    {
        text-align: center;
        font-weight: bold;
    }
    .style2
    {
        width: 35%;
    }
    .style3
    {
        text-align: center;
        }
    .style4
    {
        text-align: center;
    }
        .style5
        {
            color: #FF0000;
        }
        .style6
        {
            text-align: center;
            width: 203px;
            height: 26px;
        }
        .style7
        {
            text-align: center;
            height: 26px;
        }
        .style8
        {
            width: 46%;
        }
    </style>
    <link href="css/Overall.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style1">
    HOSPITAL REPORT</p>
<p class="style1">
    <table align="center" cellpadding="5" cellspacing="5" class="style8">
        <tr>
            <td>
                                Enter Bill No To Fetch Details</td>
            <td>
    <asp:TextBox ID="TextBox1" runat="server" CssClass="txt"></asp:TextBox>
            </td>
            <td>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search" 
                    CssClass="btn" />
            </td>
        </tr>
    </table>
    &nbsp;
&nbsp;
    </p>
<p class="style1">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        HorizontalAlign="Center">
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
            Hospital Name</td>
        <td class="style4">
            <asp:TextBox ID="TextBox2" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Phone No</td>
        <td class="style4">
            <asp:TextBox ID="TextBox3" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Hospital
            Email</td>
        <td class="style4">
            <asp:TextBox ID="TextBox4" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Address</td>
        <td class="style4">
            <asp:TextBox ID="TextBox5" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Bill No</td>
        <td class="style4">
            <asp:TextBox ID="TextBox6" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style6">
            Bill Name</td>
        <td class="style7">
            <asp:TextBox ID="TextBox7" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Bill Email</td>
        <td class="style4">
            <asp:TextBox ID="TextBox14" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Biller Aadhar No</td>
        <td class="style4">
            <asp:TextBox ID="TextBox15" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Patient Name</td>
        <td class="style4">
            <asp:TextBox ID="TextBox8" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Assigned Doctor</td>
        <td class="style4">
            <asp:TextBox ID="TextBox9" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Patient Condition</td>
        <td class="style4">
            <asp:TextBox ID="TextBox10" runat="server" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Patient report</td>
        <td class="style4">
            <asp:TextBox ID="TextBox11" runat="server" TextMode="MultiLine" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Treatment Details</td>
        <td class="style4">
            <asp:TextBox ID="TextBox12" runat="server" TextMode="MultiLine" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Re vistiting Date
        </td>
        <td class="style4">
            <asp:TextBox ID="TextBox13" runat="server" CssClass="txt"></asp:TextBox>
        &nbsp;<span class="style5">If Not NIL</span></td>
    </tr>
    <tr>
        <td class="style3" colspan="2">
            <asp:Button ID="Button2" runat="server" Text="SAVE" onclick="Button2_Click" 
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
