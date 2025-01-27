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
    public partial class UserHospital : System.Web.UI.Page
    {
        string Connection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        String name;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["aadharno"].ToString();
            LisenceDetailspanel.Visible = false;
            FinesPanel.Visible = false;
            RenewalPanel.Visible = false;
            HospitalDetails();
        }

        private void HospitalDetails()
        {


            SqlConnection con = new SqlConnection(Connection);
            using (SqlCommand cmd = new SqlCommand("Select hospitalname from Hospital_report where billeraadharno='"+Label1.Text+"'"))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    name = sdr["hospitalname"].ToString();
                    Label2.Text = name.ToString();
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
