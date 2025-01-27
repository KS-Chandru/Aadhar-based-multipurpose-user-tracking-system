using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Aadhar_Based
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        string Connection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Connection);
            con.Open();
            if (checkemail() == true)
            {
                Label1.Text = "Your AADHAR Number is Already Registered with Us";
                TextBox5.BackColor = System.Drawing.Color.PaleGreen;
                TextBox6.BackColor = System.Drawing.Color.PaleGreen;

            }
            else
            {
                SqlCommand cmd = new SqlCommand("insert into UserRegistration" + "(name,phoneno,address,emailid,aadharno,password)values(@name,@phoneno,@address,@emailid,@aadharno,@password)", con);
                cmd.Parameters.AddWithValue("@name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@phoneno", TextBox2.Text);
                cmd.Parameters.AddWithValue("@address", TextBox3.Text);
                cmd.Parameters.AddWithValue("@emailid", TextBox4.Text);
                cmd.Parameters.AddWithValue("@aadharno", TextBox6.Text);
                cmd.Parameters.AddWithValue("@Password", TextBox8.Text);
                cmd.ExecuteNonQuery();
                Label1.Text = "Record Has Been Saved Successfully";
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox7.Text = "";
                TextBox8.Text = ""; 
                TextBox6.Text = "";
            }
        }
             private Boolean checkemail()
    {
        Boolean emailavailable = false;
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd = new SqlCommand("select * from UserRegistration where aadharno= '"+TextBox6.Text+"'", con);
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            emailavailable = true;
          
        }
        con.Close();

        return emailavailable;
        }
    }
}
