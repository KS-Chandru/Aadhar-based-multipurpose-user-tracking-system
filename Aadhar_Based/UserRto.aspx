<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserRto.aspx.cs" Inherits="Aadhar_Based.UserRto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style3
        {
            height: 42px;
            width: 194px;
            text-align: center;
        }
        .style4
        {
            height: 42px;
            width: 158px;
            text-align: center;
        }
        .style6
        {
            height: 42px;
            width: 221px;
            text-align: center;
        }
        .style7
        {
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
            font-size: medium;
            color: #FF5050;
        }
        .style10
        {
        }
        .style11
        {
            text-align: center;
            font-weight: bold;
            font-size: medium;
            color: #FF9966;
        }
        .style12
        {
            height: 42px;
            width: 100px;
            text-align: center;
        }
    </style>
    <link href="css/Overall.css" type="text/css" rel="Stylesheet" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    </div>
    <div>
        <table align="center" cellpadding="5" cellspacing="5">
            <tr>
                <td class="style3">
                    <asp:Button ID="Button1" runat="server" BackColor="#81184A" Font-Bold="True" 
                        ForeColor="#F0F0F0" Text="License Details" onclick="Button1_Click" 
                        CssClass="btn" />
                </td>
                <td class="style4">
                    <asp:Button ID="Button2" runat="server" BackColor="#81184A" ForeColor="#F0F0F0" 
                        Text="Fines" onclick="Button2_Click1" CssClass="btn" />
                </td>
                <td class="style6">
                    <asp:Button ID="Button3" runat="server" BackColor="#81184A" ForeColor="#F0F0F0" 
                        Text="Renewal" onclick="Button3_Click1" CssClass="btn" />
                </td>
                <td class="style12">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        </div>
        <asp:Panel ID="LisenceDetailspanel" runat="server">
            <div class="style7">
                <span class="style8">LICENSE DETAILS</span><br />
                <asp:GridView ID="GridView1" runat="server" CssClass="style10" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
                        <asp:BoundField DataField="address" HeaderText="address" 
                            SortExpression="address" />
                        <asp:BoundField DataField="aadharno" HeaderText="aadharno" 
                            SortExpression="aadharno" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="phoneno" HeaderText="phoneno" 
                            SortExpression="phoneno" />
                        <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                        <asp:BoundField DataField="WonWifeDaughterof" HeaderText="WonWifeDaughterof" 
                            SortExpression="WonWifeDaughterof" />
                        <asp:BoundField DataField="bloogroup" HeaderText="bloogroup" 
                            SortExpression="bloogroup" />
                        <asp:BoundField DataField="dlno" HeaderText="dlno" SortExpression="dlno" />
                        <asp:BoundField DataField="vehicletype" HeaderText="vehicletype" 
                            SortExpression="vehicletype" />
                        <asp:BoundField DataField="rtolocation" HeaderText="rtolocation" 
                            SortExpression="rtolocation" />
                        <asp:BoundField DataField="dateofissue" HeaderText="dateofissue" 
                            SortExpression="dateofissue" />
                        <asp:BoundField DataField="validtill" HeaderText="validtill" 
                            SortExpression="validtill" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                    SelectCommand="SELECT * FROM [Lisence_Details] WHERE ([aadharno] = @aadharno)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label1" Name="aadharno" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
            </div>
        </asp:Panel>

        <br />
        <asp:Panel ID="FinesPanel" runat="server">
            <div class="style9">
                FINES<br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
                        <asp:BoundField DataField="address" HeaderText="address" 
                            SortExpression="address" />
                        <asp:BoundField DataField="aadharno" HeaderText="aadharno" 
                            SortExpression="aadharno" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="phoneno" HeaderText="phoneno" 
                            SortExpression="phoneno" />
                        <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                        <asp:BoundField DataField="WonWifeDaughterof" HeaderText="WonWifeDaughterof" 
                            SortExpression="WonWifeDaughterof" />
                        <asp:BoundField DataField="bloogroup" HeaderText="bloogroup" 
                            SortExpression="bloogroup" />
                        <asp:BoundField DataField="dlno" HeaderText="dlno" SortExpression="dlno" />
                        <asp:BoundField DataField="vehicletype" HeaderText="vehicletype" 
                            SortExpression="vehicletype" />
                        <asp:BoundField DataField="rtolocation" HeaderText="rtolocation" 
                            SortExpression="rtolocation" />
                        <asp:BoundField DataField="dateofissue" HeaderText="dateofissue" 
                            SortExpression="dateofissue" />
                        <asp:BoundField DataField="validtill" HeaderText="validtill" 
                            SortExpression="validtill" />
                        <asp:BoundField DataField="fine1" HeaderText="fine1" SortExpression="fine1" />
                        <asp:BoundField DataField="fine2" HeaderText="fine2" SortExpression="fine2" />
                        <asp:BoundField DataField="fine3" HeaderText="fine3" SortExpression="fine3" />
                        <asp:BoundField DataField="totalamount" HeaderText="totalamount" 
                            SortExpression="totalamount" />
                        <asp:BoundField DataField="paymentmode" HeaderText="paymentmode" 
                            SortExpression="paymentmode" />
                        <asp:BoundField DataField="paymentstatus" HeaderText="paymentstatus" 
                            SortExpression="paymentstatus" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                    SelectCommand="SELECT * FROM [User_Fines] WHERE ([aadharno] = @aadharno)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label1" Name="aadharno" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </asp:Panel>


        <br />
        <asp:Panel ID="RenewalPanel" runat="server">
            <div class="style11">
                RENEWAL<br />
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource3">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" />
                        <asp:BoundField DataField="address" HeaderText="address" 
                            SortExpression="address" />
                        <asp:BoundField DataField="aadharno" HeaderText="aadharno" 
                            SortExpression="aadharno" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="dlno" HeaderText="dlno" SortExpression="dlno" />
                        <asp:BoundField DataField="vehicletype" HeaderText="vehicletype" 
                            SortExpression="vehicletype" />
                        <asp:BoundField DataField="dateofissued" HeaderText="dateofissued" 
                            SortExpression="dateofissued" />
                        <asp:BoundField DataField="validtill" HeaderText="validtill" 
                            SortExpression="validtill" />
                        <asp:BoundField DataField="renewalstatus" HeaderText="renewalstatus" 
                            SortExpression="renewalstatus" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                    SelectCommand="SELECT * FROM [Lisence_Renewal] WHERE ([aadharno] = @aadharno)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label1" Name="aadharno" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </asp:Panel>



</asp:Content>
