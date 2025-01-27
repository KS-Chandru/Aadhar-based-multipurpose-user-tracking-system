<%@ Page Title="" Language="C#" MasterPageFile="~/Rto.Master" AutoEventWireup="true" CodeBehind="Rto_Renewal.aspx.cs" Inherits="AadharBased_govt_side.Rto_Renewal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: center;
            color: #FF9966;
        }
        .style2
        {
            width: 39%;
        }
        .style4
        {
            text-align: center;
            width: 165px;
        }
        .style5
        {
            width: 48%;
        }
        .style6
        {
            color: #000000;
            font-weight: bold;
        }
        .style7
        {
            text-align: center;
            color: #FF9966;
            font-weight: bold;
            font-size: x-large;
        }
    </style>
    <link href="css/Overall.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style7">
        RTO RENEWAL</p>
    <p class="style1">
        <table align="center" cellpadding="5" cellspacing="5" class="style5">
            <tr>
                <td class="style6">
                    Enter The Dl No To Check Details</td>
                <td>
        <asp:TextBox ID="TextBox1" runat="server" Width="200px" CssClass="txt"></asp:TextBox>
                </td>
                <td>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="SEARCH" 
                        CssClass="btn" />
                </td>
            </tr>
        </table>
        &nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
    <p class="style1">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" 
            CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </p>
    <table align="center" class="style2" cellpadding="5" cellspacing="5">
        <tr>
            <td align="center" class="style4">
                Name</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="txt"></asp:TextBox>
            </td>
            <td rowspan="3">
                <asp:Image ID="Image2" runat="server" Height="100px" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style4">
                Image</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Address</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Aadhar No</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Email</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Dl No</td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Vehicle Type
            </td>
            <td>
                <asp:TextBox ID="TextBox8" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Date Of Issued</td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Valid Till</td>
            <td>
                <asp:TextBox ID="TextBox10" runat="server" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Renewal</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    CssClass="ddl">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Renewed</asp:ListItem>
                    <asp:ListItem>Not Renewed</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Save" 
                    CssClass="btn" />
            </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
