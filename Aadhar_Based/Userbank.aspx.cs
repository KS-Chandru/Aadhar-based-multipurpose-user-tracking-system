using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Aadhar_Based
{
    public partial class Userbank : System.Web.UI.Page
    {
        string Connection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["aadharno"].ToString();
            LisenceDetailspanel.Visible = false;
            FinesPanel.Visible = false;
            RenewalPanel.Visible = false;
            SqlConnection con = new SqlConnection(Connection);
            using (SqlCommand cmd = new SqlCommand("SELECT accountno FROM Bankaccount_Creation WHERE aadharno='" + Label1.Text + "'"))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    Label2.Text = sdr["accountno"].ToString();
                }
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            LisenceDetailspanel.Visible = true;
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            FinesPanel.Visible = true;
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            RenewalPanel.Visible = true;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
            Session.Abandon();
            Session.Clear();
        }
    }
}
