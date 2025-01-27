<%@ Page Title="" Language="C#" MasterPageFile="~/Rto.Master" AutoEventWireup="true" CodeBehind="RtoFines.aspx.cs" Inherits="AadharBased_govt_side.RtoFines" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style5
        {
            width: 42%;
        }
        .style6
        {
            width: 42%;
        }
        .style7
        {
            width: 153px;
        }
        .style8
        {
            text-align: center;
            }
        .style9
        {
            width: 37%;
        }
        .style10
        {
            width: 246px;
        }
        .style11
        {
            text-align: center;
            font-size: x-large;
            font-weight: bold;
            color: #FF9966;
        }
    </style>
    <link href="css/Overall.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="style11">
        FINES</p>
   
       
                <table align="center" cellpadding="5" cellspacing="5" 
        class="style9">
                    <tr>
                        <td>
                            <b>Enter The Dl No</b></td>
                        <td class="style10">
          
                <asp:TextBox ID="TextBox1" runat="server" Width="200px" CssClass="txt"></asp:TextBox>
         
                        </td>
                        <td>
         
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search"
                                CssClass="btn" />
            
  
                        </td>
                    </tr>
    </table>
    <br />
&nbsp;<br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" 
        CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <br />
    <table align="center" class="style5" cellpadding="5" cellspacing="5">
        <tr>
            <td>
                Name</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Image</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Address</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Aadhar No</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Email</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Phone No</td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Dob</td>
            <td>
                <asp:TextBox ID="TextBox8" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Son/Wife/Daughter Of</td>
            <td>
                <asp:TextBox ID="TextBox9" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Blood Group</td>
            <td>
                <asp:TextBox ID="TextBox10" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Dl No</td>
            <td>
                <asp:TextBox ID="TextBox11" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Vehicle Type</td>
            <td>
                <asp:TextBox ID="TextBox12" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Rto Location</td>
            <td>
                <asp:TextBox ID="TextBox13" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Date Issued</td>
            <td>
                <asp:TextBox ID="TextBox14" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Valid Till</td>
            <td>
                <asp:TextBox ID="TextBox15" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        </table>
    <br />
    <table align="center" class="style6" cellpadding="5" cellspacing="5">
        <tr>
            <td class="style7" style="text-align: center">
                Fine 1</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="fines" DataValueField="fines" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" CssClass="ddl">
                </asp:DropDownList>
&nbsp;
                <asp:TextBox ID="TextBox17" runat="server" 
                     ReadOnly="True" Width="200px" CssClass="txt"></asp:TextBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                    SelectCommand="SELECT DISTINCT [fines] FROM [Fines]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style7" style="text-align: center">
                Fine 2</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="fines" DataValueField="fines" 
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged" CssClass="ddl">
                </asp:DropDownList>
&nbsp;
                <asp:TextBox ID="TextBox18" runat="server" 
                     ReadOnly="True" Width="200px" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Fine 3</td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="fines" DataValueField="fines" 
                    onselectedindexchanged="DropDownList3_SelectedIndexChanged" CssClass="ddl">
                </asp:DropDownList>
&nbsp;
                <asp:TextBox ID="TextBox19" runat="server" 
                    ReadOnly="True" Width="200px" CssClass="txt"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Total Fine Amount</td>
            <td>
                <asp:TextBox ID="TextBox16" runat="server" ReadOnly="True" Width="200px" 
                    CssClass="txt"></asp:TextBox>
&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                    Text="Calculate" CssClass="btn" />
            </td>
        </tr>
        <tr>
            <td class="style8">
                Payment&nbsp; mode</td>
            <td>
                <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
                    CssClass="ddl">
                    <asp:ListItem>.</asp:ListItem>
                    <asp:ListItem>Cash</asp:ListItem>
                    <asp:ListItem>Online</asp:ListItem>
                    <asp:ListItem>Stash</asp:ListItem>
                </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Payment Status&nbsp;
                <asp:DropDownList ID="DropDownList5" 
                    runat="server" CssClass="ddl">
                    <asp:ListItem>.</asp:ListItem>
                    <asp:ListItem>Paid</asp:ListItem>
                    <asp:ListItem>Not Paid</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" colspan="2">
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="SAVE" 
                    CssClass="btn" />
            </td>
        </tr>
        <tr>
            <td class="style8" colspan="2">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
