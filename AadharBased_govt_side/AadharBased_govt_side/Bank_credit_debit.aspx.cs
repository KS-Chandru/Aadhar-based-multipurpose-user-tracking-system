using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace AadharBased_govt_side
{
    public partial class Bank_credit_debit : System.Web.UI.Page
    {
        string Connection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            
            
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton2.Checked = false;
            Panel1.Visible = true;
            Panel2.Visible = false;
            if (RadioButton1.Checked = true) { Panel1.Visible = true; } else { Panel1.Visible = false; }
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton1.Checked = false;
            Panel1.Visible = false;
            Panel2.Visible = true;
if (RadioButton2.Checked = true) { Panel2.Visible = true; } else { Panel2.Visible=false;}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            string name = TextBox11.Text;
            SqlConnection con = new SqlConnection(Connection);
            SqlDataAdapter Adp = new SqlDataAdapter("select * from Account_C_D where accountno='" + name + "'", con);
            DataTable Dt = new DataTable();
            Adp.Fill(Dt);
            GridView1.DataSource = Dt;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            TextBox2.Text = GridView1.SelectedRow.Cells[1].Text;
            TextBox3.Text = GridView1.SelectedRow.Cells[2].Text;
            TextBox4.Text = GridView1.SelectedRow.Cells[3].Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            int balance, credit, accbal;
            credit = Convert.ToInt32(TextBox5.Text);
            accbal = Convert.ToInt32(TextBox4.Text);
            balance = credit + accbal;
            string debit = "0";
            SqlConnection con = new SqlConnection(Connection);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Account_Transactions" + "(accountno,holdername,credit,debit,balance)values(@accountno,@holdername,@credit,@debit,@balance)", con);
            cmd.Parameters.AddWithValue("@accountno", TextBox2.Text);
            cmd.Parameters.AddWithValue("@holdername", TextBox3.Text);
            cmd.Parameters.AddWithValue("@credit", credit);
            cmd.Parameters.AddWithValue("@debit", debit);
            cmd.Parameters.AddWithValue("@balance", balance);
            cmd.ExecuteNonQuery();
            SqlCommand cmd1 = new SqlCommand("UPDATE Account_C_D set holdername='" + TextBox3.Text + "',balance='" + balance + "' where accountno='" + TextBox2.Text + "'", con);
            cmd1.ExecuteNonQuery();
            Label1.Text = "Amount credited Successfully";
            
        }
        

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            TextBox7.Text = GridView2.SelectedRow.Cells[1].Text;
            TextBox8.Text = GridView2.SelectedRow.Cells[2].Text;
            TextBox9.Text = GridView2.SelectedRow.Cells[3].Text;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            int balance, debit, accbal;
            debit = Convert.ToInt32(TextBox10.Text);
            accbal = Convert.ToInt32(TextBox9.Text);
            balance = accbal - debit;
            string credit = "0";
            SqlConnection con = new SqlConnection(Connection);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Account_Transactions" + "(accountno,holdername,credit,debit,balance)values(@accountno,@holdername,@credit,@debit,@balance)", con);
            cmd.Parameters.AddWithValue("@accountno", TextBox7.Text);
            cmd.Parameters.AddWithValue("@holdername", TextBox8.Text);
            cmd.Parameters.AddWithValue("@credit", credit);
            cmd.Parameters.AddWithValue("@debit", debit);
            cmd.Parameters.AddWithValue("@balance", balance);
            cmd.ExecuteNonQuery();
            SqlCommand cmd1 = new SqlCommand("UPDATE Account_C_D set holdername='" + TextBox3.Text + "',balance='" + balance + "' where accountno='" + TextBox2.Text + "'", con);
            cmd1.ExecuteNonQuery();
            Label2.Text = "Amount Debited Successfully";
            
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            string name = TextBox6.Text;
            SqlConnection con = new SqlConnection(Connection);
            SqlDataAdapter Adp = new SqlDataAdapter("select * from Account_C_D where accountno='" + name + "'", con);
            DataTable Dt = new DataTable();
            Adp.Fill(Dt);
            GridView2.DataSource = Dt;
            GridView2.DataBind();
        }
    }
}
