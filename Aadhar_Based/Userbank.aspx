<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Userbank.aspx.cs" Inherits="Aadhar_Based.Userbank" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 53%;
        }
        .style2
        {
            height: 20px;
            text-align: center;
            width: 140px;
        }
        .style4
        {
            height: 20px;
            width: 333px;
            text-align: center;
        }
        .style6
        {
            height: 20px;
            width: 327px;
            text-align: center;
        }
        .style8
        {
            font-size: x-large;
            font-weight: bold;
            color: #FF9966;
        }
        .style9
        {
            text-align: center;
            font-weight: bold;
            font-size:medium;
            color: #FF5050;
        }
        .style11
        {
            text-align: center;
            font-weight: bold;
            font-size:medium;
            color: #FF9966;
        }
        .style12
        {
            height: 20px;
            text-align: center;
            width: 169px;
        }
    </style>
    <link href="css/Overall.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div style="text-align: center">
        <table class="style1" border="0" bgcolor="White" cellpadding="5" 
            cellspacing="5" align="center" >
            <tr>
                <td class="style2">
                    <asp:Button ID="Button1" runat="server" BackColor="#81184A" Font-Bold="True" 
                        ForeColor="#F0F0F0" Text="Bank Details" onclick="Button1_Click" 
                        Width="127px" CssClass="btn" />
                </td>
                <td class="style4">
                    <asp:Button ID="Button2" runat="server" BackColor="#81184A" ForeColor="#F0F0F0" 
                        Text="Transaction Details" onclick="Button2_Click1" CssClass="btn" />
                </td>
                <td class="style6">
                    <asp:Button ID="Button3" runat="server" BackColor="#81184A" ForeColor="#F0F0F0" 
                        Text="Payment Details" onclick="Button3_Click1" CssClass="btn" />
                </td>
                <td class="style12">
                    <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Label"></asp:Label>
                &nbsp;<asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:Panel ID="LisenceDetailspanel" runat="server">
            <div >
                <span ><span class="style8">BANK DETAILS</span></span>
                <span><b><br />
                </b>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="phoneno" HeaderText="phoneno" 
                            SortExpression="phoneno" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="aadharno" HeaderText="aadharno" 
                            SortExpression="aadharno" />
                        <asp:BoundField DataField="address" HeaderText="address" 
                            SortExpression="address" />
                        <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                        <asp:BoundField DataField="gender" HeaderText="gender" 
                            SortExpression="gender" />
                        <asp:BoundField DataField="pancardno" HeaderText="pancardno" 
                            SortExpression="pancardno" />
                        <asp:BoundField DataField="accounttype" HeaderText="accounttype" 
                            SortExpression="accounttype" />
                        <asp:BoundField DataField="photo" HeaderText="photo" SortExpression="photo" />
                        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                        <asp:BoundField DataField="proof1" HeaderText="proof1" 
                            SortExpression="proof1" />
                        <asp:BoundField DataField="proof2" HeaderText="proof2" 
                            SortExpression="proof2" />
                        <asp:BoundField DataField="proof3" HeaderText="proof3" 
                            SortExpression="proof3" />
                        <asp:BoundField DataField="accountno" HeaderText="accountno" 
                            SortExpression="accountno" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                    SelectCommand="SELECT * FROM [Bankaccount_Creation] WHERE ([aadharno] = @aadharno)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label1" Name="aadharno" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </span>
            </div>
        </asp:Panel>

        <br />
        <asp:Panel ID="FinesPanel" runat="server">
            <div class="style9">
                <span class="style14"><span 
                    class="style9"><b>TRANSACTION DETAILS</b><br />
                </span></span>
                <asp:GridView ID="GridView2" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="accountno" HeaderText="accountno" 
                            SortExpression="accountno" />
                        <asp:BoundField DataField="holdername" HeaderText="holdername" 
                            SortExpression="holdername" />
                        <asp:BoundField DataField="credit" HeaderText="credit" 
                            SortExpression="credit" />
                        <asp:BoundField DataField="debit" HeaderText="debit" SortExpression="debit" />
                        <asp:BoundField DataField="balance" HeaderText="balance" 
                            SortExpression="balance" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                    SelectCommand="SELECT * FROM [Account_Transactions] WHERE ([accountno] = @accountno)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label2" Name="accountno" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </asp:Panel>


        <br />
        <asp:Panel ID="RenewalPanel" runat="server">
            <div class="style11">
                <span class="style11"><b>TRANSFER DETAILS<br />
                </b></span>
                <asp:GridView ID="GridView3" runat="server" CssClass="style13" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                    <Columns>
                        <asp:BoundField DataField="senderaccountno" HeaderText="senderaccountno" 
                            SortExpression="senderaccountno" />
                        <asp:BoundField DataField="sendername" HeaderText="sendername" 
                            SortExpression="sendername" />
                        <asp:BoundField DataField="ammount" HeaderText="ammount" 
                            SortExpression="ammount" />
                        <asp:BoundField DataField="reciveraccountno" HeaderText="reciveraccountno" 
                            SortExpression="reciveraccountno" />
                        <asp:BoundField DataField="recivername" HeaderText="recivername" 
                            SortExpression="recivername" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                    SelectCommand="SELECT * FROM [Amount_transfer] WHERE ([senderaccountno] = @senderaccountno)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label2" Name="senderaccountno" 
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </asp:Panel>

    </div>
</asp:Content>
