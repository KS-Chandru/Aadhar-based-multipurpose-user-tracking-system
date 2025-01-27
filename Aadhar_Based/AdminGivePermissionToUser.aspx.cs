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
    public partial class AdminGivePermissionToUser : System.Web.UI.Page
    {
        string Connection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da;
        DataSet ds;
        String status = "User";
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Connection);
            if (!Page.IsPostBack)
            {
                cmd = new SqlCommand("select aadharno from UserRegistration", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    DropDownList1.Items.Add(dr[0].ToString());
                }
                con.Close();
            }


            con.Open();
            da = new SqlDataAdapter("select * from UserRegistration", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();

            con.Open();
            da = new SqlDataAdapter("select * from Login", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();
            con.Close();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Connection);
            if (DropDownList1.Text == null)
            {
            }
            else
            {
                cmd = new SqlCommand("select password from UserRegistration where aadharno='" + DropDownList1.Text + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    TextBox1.Text = Convert.ToString(dr[0]);


                }
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Connection);
            con.Open();
            cmd = new SqlCommand("insert into Login values('" + DropDownList1.Text + "','" + TextBox1.Text + "','" + status + "')", con);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Permission granted')</script>");
            cmd.Dispose();
            con.Close();

            con.Open();
            da = new SqlDataAdapter("select * from Login", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();
            con.Close();
        }
    }
}
