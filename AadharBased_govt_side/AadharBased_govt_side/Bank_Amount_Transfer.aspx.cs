using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace AadharBased_govt_side
{
    public partial class Bank_Amount_Transfer : System.Web.UI.Page
   {
        string Connection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        string name="132134";
        string teext5;
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Visible = false;
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            teext5 = TextBox5.Text;
            checkbalancesender();
            checkbalancereciever();
           credit();
            debit();
            amttransfer();
        }
        public string encrypt(string encryptString)
        {
            string EncryptionKey = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            byte[] clearBytes = Encoding.Unicode.GetBytes(encryptString);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
        });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    encryptString = Convert.ToBase64String(ms.ToArray());
                }
            }
            return encryptString;
        }
        private void amttransfer()
        {
            String fromacc=encrypt(TextBox2.Text);
            String toacc=encrypt(TextBox9.Text);
            SqlConnection con1 = new SqlConnection(Connection);
            con1.Open();
            SqlCommand cmd1 = new SqlCommand("insert into [Aadhar_based].[dbo].[Amount_transfer] values('" + fromacc + "','" + TextBox3.Text + "','" + TextBox5.Text + "','" + toacc + "','" + TextBox10.Text + "')", con1);         
            cmd1.ExecuteNonQuery();
            Label6.Text = "Amount transferd Successfully";

            
            MailMessage msg = new MailMessage();
            msg.To.Add(TextBox6.Text);
            msg.From = new MailAddress("codetester181@gmail.com");
            msg.Subject = "Amount Transfer";
            msg.Body = "The amount has been transfed from account no:'"+TextBox2.Text+"' to accno:'"+TextBox9.Text+"' the sum of rs:₹'"+TextBox5.Text+"'";
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = new System.Net.NetworkCredential("codetester181@gmail.com", "hlfpdgxtibgrzuvv");
            smtp.Send(msg);
            Label1.Text = "mail sent";
        }

        private void checkbalancereciever()
        {
            string Accountbalance;
            string Transamt = TextBox5.Text;
            SqlConnection con = new SqlConnection(Connection);
            using (SqlCommand cmd = new SqlCommand("SELECT balance from Account_C_D WHERE accountno = '" + TextBox9.Text + "'"))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    Accountbalance = sdr["balance"].ToString();
                    Label5.Text = Accountbalance.ToString();

                }
                con.Close();

            }
        }

        


       public void checkbalancesender()
        {
            string Accountbalance;
            string Transamt = TextBox5.Text;
            SqlConnection con = new SqlConnection(Connection);
            using (SqlCommand cmd = new SqlCommand("SELECT balance from Account_C_D WHERE accountno = '" + TextBox2.Text + "'"))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                   Accountbalance = sdr["balance"].ToString();
                   Label4.Text = Accountbalance.ToString();
                    
                }
                con.Close();

            }
            int accountbal=Convert.ToInt32(Accountbalance),transamt=Convert.ToInt32(Transamt);
            if (accountbal >= transamt)
            {
                Button3.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Insufficent Funds in '"+TextBox2.Text+"'')</script>");
            }

        }
        public void otpp()
        { 
            
Random r = new Random();
            int genRand = r.Next(1000, 9999);
            string otp = (genRand.ToString());
            Label1.Text = otp;
        }
    protected void Button3_Click(object sender, EventArgs e )
        {

            otpp();
        
            string to = TextBox6.Text;
          
            MailMessage msg = new MailMessage();
            msg.To.Add(to);
            msg.From = new MailAddress("codetester181@gmail.com");
            msg.Subject = "OTP For Transaction";
            msg.Body = Label1.Text;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = new System.Net.NetworkCredential("codetester181@gmail.com", "hlfpdgxtibgrzuvv");
            smtp.Send(msg);
            Label2.Text = "mail sent";
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string userotp, otp;
            otp = Label1.Text;
            userotp = TextBox7.Text;
            if (userotp == otp)
            {
                Button1.Visible = true;
                Label3.Text = "OTP Verified";
            }
            else
            {
                Label3.Text = "OTP Incorrect";
            }
        }
       public void credit() 
        {
            
            int balance, credit, accbal;
            credit = Convert.ToInt32(TextBox5.Text);
            accbal = Convert.ToInt32(Label5.Text);
            balance = credit + accbal;
            string debit = "0";
            SqlConnection con1 = new SqlConnection(Connection);
            con1.Open();
            SqlCommand cmd1 = new SqlCommand("insert into [Aadhar_based].[dbo].[Account_Transactions]" + "(accountno,holdername,credit,debit,balance)values(@accountno,@holdername,@credit,@debit,@balance)", con1);
            cmd1.Parameters.AddWithValue("@accountno", TextBox9.Text);
            cmd1.Parameters.AddWithValue("@holdername", TextBox10.Text);
            cmd1.Parameters.AddWithValue("@credit", credit);
            cmd1.Parameters.AddWithValue("@debit", debit);
            cmd1.Parameters.AddWithValue("@balance", balance);
            cmd1.ExecuteNonQuery();
            SqlCommand cmd2 = new SqlCommand("UPDATE Account_C_D set balance='" + balance + "' where accountno='" + TextBox9.Text + "'", con1);
            cmd2.ExecuteNonQuery();
            Label2.Text = "Amount credited Successfully";
        }
        public void debit() 
        {
            string txt5 = teext5;
            int balance, debit, accbal;
            debit = Convert.ToInt32(txt5);
            accbal = Convert.ToInt32(Label4.Text);
            balance = accbal - debit;
            string credit = "0";
            SqlConnection con1 = new SqlConnection(Connection);
            con1.Open();
            SqlCommand cmd1 = new SqlCommand("insert into [Aadhar_based].[dbo].[Account_Transactions]" + "(accountno,holdername,credit,debit,balance)values(@accountno,@holdername,@credit,@debit,@balance)", con1);
            cmd1.Parameters.AddWithValue("@accountno", TextBox2.Text);
            cmd1.Parameters.AddWithValue("@holdername", TextBox3.Text);
            cmd1.Parameters.AddWithValue("@credit", credit);
            cmd1.Parameters.AddWithValue("@debit", debit);
            cmd1.Parameters.AddWithValue("@balance", balance);
            cmd1.ExecuteNonQuery();
            SqlCommand cmd2 = new SqlCommand("UPDATE Account_C_D set balance='" + balance + "' where accountno='" + TextBox2.Text + "'", con1);
            cmd2.ExecuteNonQuery();
            Label2.Text = "Amount Debited Successfully";
        }
       

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            checkbalancesender();
            checkbalancereciever();
        }

        

        

        
    }
}
