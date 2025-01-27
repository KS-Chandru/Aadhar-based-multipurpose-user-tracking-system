<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserHospital.aspx.cs" Inherits="Aadhar_Based.UserHospital" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 52%;
        }
        .style3
        {
            height: 20px;
            width: 192px;
            text-align: center;
        }
        .style4
        {
            height: 20px;
            width: 333px;
            text-align: center;
        }
        .style5
        {
            height: 20px;
            width: 253px;
            text-align: center;
        }
        .style6
        {
            height: 20px;
            width: 327px;
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
            font-size: x-large;
            color: #FF5050;
        }
        .style10
        {
        }
        .style11
        {
            text-align: center;
            font-weight: bold;
            font-size: x-large;
            color: #FF9966;
        }
    </style>
    <link href="css/Overall.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table class="style1" border="0" bgcolor="White" align="center" cellpadding="5" 
            cellspacing="5" >
            <tr>
                <td class="style3">
                    <asp:Button ID="Button1" runat="server" BackColor="#81184A" Font-Bold="True" 
                        ForeColor="#F0F0F0" Text="Hospital Details" onclick="Button1_Click" 
                        CssClass="btn" />
                </td>
                <td class="style4">
                    <asp:Button ID="Button2" runat="server" BackColor="#81184A" ForeColor="#F0F0F0" 
                        Text="Admition Details" onclick="Button2_Click1" CssClass="btn" />
                </td>
                <td class="style6">
                    <asp:Button ID="Button3" runat="server" BackColor="#81184A" ForeColor="#F0F0F0" 
                        Text="Bill Details" onclick="Button3_Click1" CssClass="btn" />
                </td>
                <td class="style5">
                    <asp:Label ID="Label1" runat="server" ForeColor="Black"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        </div>
        <asp:Panel ID="LisenceDetailspanel" runat="server">
            <div class="style7">
                <span class="style8">HOSPITAL DETAILS</span><br />
                <asp:GridView ID="GridView1" runat="server" CssClass="style10" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="phoneno" HeaderText="phoneno" 
                            SortExpression="phoneno" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="address" HeaderText="address" 
                            SortExpression="address" />
                        <asp:BoundField DataField="hospitaltype" HeaderText="hospitaltype" 
                            SortExpression="hospitaltype" />
                        <asp:BoundField DataField="district" HeaderText="district" 
                            SortExpression="district" />
                        <asp:BoundField DataField="deanname" HeaderText="deanname" 
                            SortExpression="deanname" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                    SelectCommand="SELECT * FROM [Hospital_details] WHERE ([name] = @name)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label2" Name="name" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </asp:Panel>

        <br />
        <asp:Panel ID="FinesPanel" runat="server">
            <div class="style9">
                ADMISSION DETAILS<br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="hospitalname" HeaderText="hospitalname" 
                            SortExpression="hospitalname" />
                        <asp:BoundField DataField="phoneno" HeaderText="phoneno" 
                            SortExpression="phoneno" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="address" HeaderText="address" 
                            SortExpression="address" />
                        <asp:BoundField DataField="billno" HeaderText="billno" 
                            SortExpression="billno" />
                        <asp:BoundField DataField="billname" HeaderText="billname" 
                            SortExpression="billname" />
                        <asp:BoundField DataField="billemail" HeaderText="billemail" 
                            SortExpression="billemail" />
                        <asp:BoundField DataField="billeraadharno" HeaderText="billeraadharno" 
                            SortExpression="billeraadharno" />
                        <asp:BoundField DataField="patientname" HeaderText="patientname" 
                            SortExpression="patientname" />
                        <asp:BoundField DataField="assigneddoctor" HeaderText="assigneddoctor" 
                            SortExpression="assigneddoctor" />
                        <asp:BoundField DataField="patientcondition" HeaderText="patientcondition" 
                            SortExpression="patientcondition" />
                        <asp:BoundField DataField="patientreport" HeaderText="patientreport" 
                            SortExpression="patientreport" />
                        <asp:BoundField DataField="treatmentdetails" HeaderText="treatmentdetails" 
                            SortExpression="treatmentdetails" />
                        <asp:BoundField DataField="revisitingdate" HeaderText="revisitingdate" 
                            SortExpression="revisitingdate" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                    SelectCommand="SELECT * FROM [Hospital_report] WHERE ([billeraadharno] = @billeraadharno)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label1" Name="billeraadharno" 
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </asp:Panel>


        <br />
        <asp:Panel ID="RenewalPanel" runat="server">
            <div class="style11">
                BILL DETAILS<asp:GridView ID="GridView3" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="phoneno" HeaderText="phoneno" 
                            SortExpression="phoneno" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="address" HeaderText="address" 
                            SortExpression="address" />
                        <asp:BoundField DataField="hospitaltype" HeaderText="hospitaltype" 
                            SortExpression="hospitaltype" />
                        <asp:BoundField DataField="district" HeaderText="district" 
                            SortExpression="district" />
                        <asp:BoundField DataField="deanname" HeaderText="deanname" 
                            SortExpression="deanname" />
                        <asp:BoundField DataField="billno" HeaderText="billno" 
                            SortExpression="billno" />
                        <asp:BoundField DataField="billname" HeaderText="billname" 
                            SortExpression="billname" />
                        <asp:BoundField DataField="billeremail" HeaderText="billeremail" 
                            SortExpression="billeremail" />
                        <asp:BoundField DataField="billeraadharno" HeaderText="billeraadharno" 
                            SortExpression="billeraadharno" />
                        <asp:BoundField DataField="billamount" HeaderText="billamount" 
                            SortExpression="billamount" />
                        <asp:BoundField DataField="paymentdate" HeaderText="paymentdate" 
                            SortExpression="paymentdate" />
                        <asp:BoundField DataField="paymentmode" HeaderText="paymentmode" 
                            SortExpression="paymentmode" />
                        <asp:BoundField DataField="schemes" HeaderText="schemes" 
                            SortExpression="schemes" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbconnection %>" 
                    SelectCommand="SELECT * FROM [Hospital_bill] WHERE ([billeraadharno] = @billeraadharno)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label1" Name="billeraadharno" 
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </asp:Panel>



</asp:Content>
    

    
