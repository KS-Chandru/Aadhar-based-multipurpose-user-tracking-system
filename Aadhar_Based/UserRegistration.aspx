<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="Aadhar_Based.UserRegistration" %>
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
        width: 55%;
        height: 346px;
    }
    .style3
    {
        text-align: center;
    }
    .style4
    {
            width: 200px;
        }
</style>
<link href="css/Overall.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style1">
    REGISTRATION</p>
<table align="center" border="1" class="style2" cellpadding="5" cellspacing="5">
    <tr>
        <td class="style3">
            Name</td>
        <td class="style4">
            <asp:TextBox ID="TextBox1" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="*" ValidationGroup="table"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Phone No</td>
        <td class="style4">
            <asp:TextBox ID="TextBox2" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="*" ValidationGroup="table"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Address</td>
        <td class="style4">
            <asp:TextBox ID="TextBox3" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox3" ErrorMessage="*" ValidationGroup="table"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Email Id</td>
        <td class="style4">
            <asp:TextBox ID="TextBox4" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox4" ErrorMessage="*" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="table"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Aadhar Number</td>
        <td class="style4">
            <asp:TextBox ID="TextBox5" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        </td>
        <td rowspan="2">
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="TextBox5" ControlToValidate="TextBox6" 
                ErrorMessage="Aadhar No Do Not Match" ValidationGroup="table"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Re Enter Aadhar No</td>
        <td class="style4">
            <asp:TextBox ID="TextBox6" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            password</td>
        <td class="style4">
            <asp:TextBox ID="TextBox7" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        </td>
        <td rowspan="2">
            <asp:CompareValidator ID="CompareValidator2" runat="server" 
                ControlToCompare="TextBox7" ControlToValidate="TextBox8" 
                ErrorMessage="Password Do Not Match" ValueToCompare="table"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="style3">
            Re Enter Password</td>
        <td class="style4">
            <asp:TextBox ID="TextBox8" runat="server" Width="150px" CssClass="txt"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3" colspan="3">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                Text="Register" CssClass="btn" />
        </td>
    </tr>
    <tr>
        <td class="style3" colspan="3">
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
