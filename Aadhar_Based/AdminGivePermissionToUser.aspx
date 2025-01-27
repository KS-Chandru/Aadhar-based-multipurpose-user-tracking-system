<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminGivePermissionToUser.aspx.cs" Inherits="Aadhar_Based.AdminGivePermissionToUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style1
    {
        font-size: large;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align=center>
<br />

<table>
<tr>
<td>
    <span class="style1">&nbsp;REGISTRATION DETAILS</span></td>
</tr>
</table>
<br />
<table>
<tr>
<td>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="647px" Height="109px">
        <RowStyle BackColor="#EFF3FB" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</td>
</tr>
</table>
<br />
<table>
<tr>
<td>
    <span class="style3">User Name</span>
</td>
<td>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        Height="27px" Width="124px" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
</td>
</tr>
<tr>
<td class="style2">
    <span class="style3">Password</span>
</td>
<td>
    <asp:TextBox ID="TextBox1" runat="server" 
        ></asp:TextBox>
</td>
</tr>

</table>
<table>
<tr>
<td>
    <asp:Button ID="Button1" runat="server" Text="Permission" BackColor="#FF6600" 
        Font-Bold="True" ForeColor="White" onclick="Button1_Click" />
</td>
</tr>
</table>
<br />
<table>
<tr>
<td class="style1">
    PERMISSIONED USER
</td>
</tr>
</table>
<br />
<table>
<tr>
<td>
    <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" Width="460px">
        <RowStyle BackColor="#EFF3FB" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</td>
</tr>
</table>
<br />
</div>
</asp:content>
