using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Net.Mail;

namespace AadharBased_govt_side
{
    public partial class Hospital_report : System.Web.UI.Page
    {
        string Connection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text;
            SqlConnection con = new SqlConnection(Connection);
            SqlDataAdapter Adp = new SqlDataAdapter("select * from Hospital_bill where billno='" + name + "'", con);
            DataTable Dt = new DataTable();
            Adp.Fill(Dt);
            GridView1.DataSource = Dt;
            GridView1.DataBind();
        }
        public string Decrypt(string cipherText)
        {
            string EncryptionKey = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            cipherText = cipherText.Replace(" ", "+");
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
        });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox2.Text = GridView1.SelectedRow.Cells[1].Text;
            TextBox3.Text = GridView1.SelectedRow.Cells[2].Text;
            TextBox4.Text = GridView1.SelectedRow.Cells[3].Text;
            TextBox5.Text = GridView1.SelectedRow.Cells[4].Text;
            TextBox6.Text = GridView1.SelectedRow.Cells[8].Text;
            TextBox7.Text = GridView1.SelectedRow.Cells[9].Text;
            TextBox14.Text = GridView1.SelectedRow.Cells[10].Text;
            TextBox15.Text = GridView1.SelectedRow.Cells[11].Text;

            String aadnhar = Decrypt(TextBox15.Text);
            TextBox15.Text = aadnhar;
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
        protected void Button2_Click(object sender, EventArgs e)
        {
            String billaadhar = encrypt(TextBox15.Text);
            SqlConnection con = new SqlConnection(Connection);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Hospital_report" + "(hospitalname,phoneno,email,address,billno,billname,billemail,billeraadharno,patientname,assigneddoctor,patientcondition,patientreport,treatmentdetails,revisitingdate)values(@hospitalname,@phoneno,@email,@address,@billno,@billname,@billemail,@billeraadharno,@patientname,@assigneddoctor,@patientcondition,@patientreport,@treatmentdetails,@revisitingdate)", con);
            cmd.Parameters.AddWithValue("@hospitalname", TextBox2.Text);
            cmd.Parameters.AddWithValue("@phoneno", TextBox3.Text);
            cmd.Parameters.AddWithValue("@email", TextBox4.Text);
            cmd.Parameters.AddWithValue("@address", TextBox5.Text);
            cmd.Parameters.AddWithValue("@billno", TextBox6.Text);
            cmd.Parameters.AddWithValue("@billname", TextBox7.Text);
            cmd.Parameters.AddWithValue("@billemail", TextBox14.Text);
            cmd.Parameters.AddWithValue("@billeraadharno", billaadhar);
            cmd.Parameters.AddWithValue("@patientname", TextBox8.Text);
            cmd.Parameters.AddWithValue("@assigneddoctor", TextBox9.Text);
            cmd.Parameters.AddWithValue("@patientcondition", TextBox10.Text);
            cmd.Parameters.AddWithValue("@patientreport", TextBox11.Text);
            cmd.Parameters.AddWithValue("@treatmentdetails", TextBox12.Text);
            cmd.Parameters.AddWithValue("@revisitingdate", TextBox13.Text);
            cmd.ExecuteNonQuery();
            Label1.Text = "Data has been saved";

            MailMessage msg = new MailMessage();
            msg.To.Add(TextBox14.Text);
            msg.From = new MailAddress("codetester181@gmail.com");
            msg.Subject = "Hospital Report";
            msg.Body = "Your Hospital Report for BillNo::'" + TextBox6.Text + "' for Patient:'"+TextBox8.Text+"' treated by Doctor:'"+TextBox9.Text+"' reports has been generated and been stored successfully and reports are:'"+TextBox11.Text+"' and the Revisiting date for the patient '"+TextBox13.Text+"'";
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = new System.Net.NetworkCredential("codetester181@gmail.com", "hlfpdgxtibgrzuvv");
            smtp.Send(msg);
            Label1.Text = "mail sent";

            cleartxt();
        }

        private void cleartxt()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            TextBox12.Text = "";
            TextBox13.Text = "";
            TextBox14.Text = "";
            TextBox15.Text = "";
        }
    }
}
