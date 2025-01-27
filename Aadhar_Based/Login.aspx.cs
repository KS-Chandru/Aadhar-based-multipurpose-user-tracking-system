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
    public partial class Login : System.Web.UI.Page
    {
        string Connection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        string str, UserName, Password;
        SqlCommand com;
        SqlDataAdapter sqlda;
        DataTable dt;
        int RowCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Connection);
            con.Open();
            str = "Select aadharno,password,role from Login";
            com = new SqlCommand(str);
            sqlda = new SqlDataAdapter(com.CommandText, con);
            dt = new DataTable();
            sqlda.Fill(dt);
            RowCount = dt.Rows.Count;
            for (int i = 0; i < RowCount; i++)
            {
                UserName = dt.Rows[i]["aadharno"].ToString();
                Password = dt.Rows[i]["password"].ToString();
                if (UserName == TextBox1.Text && Password == TextBox2.Text)
                {
                    Session["aadharno"] = UserName;
                    if (dt.Rows[i]["role"].ToString() == "Admin")
                        Response.Redirect("AdminDefault.aspx");
                    else if (dt.Rows[i]["role"].ToString() == "User")
                        Response.Redirect("UserDefault.aspx");
                    else
                    {
                        Label1.Text = "Invalid User Name or Password! Please try again!";
                    }
                }
            }
        }
    }
}
