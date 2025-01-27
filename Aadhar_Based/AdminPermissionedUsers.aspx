<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminPermissionedUsers.aspx.cs" Inherits="Aadhar_Based.AdminPermissionedUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style1
    {
        text-align: center;
        font-weight: bold;
        font-size: x-large;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style1">
    PERMISSIONED USERS</p>
<p class="style1">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Center">
        <RowStyle BackColor="#E3EAEB" />
        <Columns>
            <asp:BoundField DataField="aadharno" HeaderText="Aadhar No" 
                SortExpression="aadharno" />
            <asp:BoundField DataField="password" HeaderText="Password" 
                SortExpression="password" />
            <asp:BoundField DataField="role" HeaderText="Role" SortExpression="role" />
        </Columns>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
        SelectCommand="SELECT * FROM [Login]"></asp:SqlDataSource>
</p>
</asp:Content>
