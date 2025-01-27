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
    public partial class Hospital_Bills : System.Web.UI.Page
    {
        string Connection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text;
            SqlConnection con = new SqlConnection(Connection);
            SqlDataAdapter Adp = new SqlDataAdapter("select * from Hospital_details where name='" + name + "'", con);
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
            TextBox6.Text = GridView1.SelectedRow.Cells[5].Text;
            TextBox7.Text = GridView1.SelectedRow.Cells[6].Text;
            TextBox8.Text = GridView1.SelectedRow.Cells[7].Text;

            String email=Decrypt(TextBox4.Text);
            String Deanname = Decrypt(TextBox8.Text);

            TextBox4.Text = email;
            TextBox8.Text = Deanname;

           
            
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

            String deanname = encrypt(TextBox8.Text);
            String aadharno = encrypt(TextBox14.Text);
            SqlConnection con = new SqlConnection(Connection);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Hospital_bill" + "(name,phoneno,email,address,hospitaltype,district,deanname,billno,billname,billeremail,billeraadharno,billamount,paymentdate,paymentmode,schemes)values(@name,@phoneno,@email,@address,@hospitaltype,@district,@deanname,@billno,@billname,@billeremail,@billeraadharno,@billamount,@paymentdate,@paymentmode,@schemes)", con);
            cmd.Parameters.AddWithValue("@name", TextBox2.Text);
            cmd.Parameters.AddWithValue("@phoneno", TextBox3.Text);
            cmd.Parameters.AddWithValue("@email", TextBox4.Text);
            cmd.Parameters.AddWithValue("@address", TextBox5.Text);
            cmd.Parameters.AddWithValue("@hospitaltype", TextBox6.Text);
            cmd.Parameters.AddWithValue("@district", TextBox7.Text);
            cmd.Parameters.AddWithValue("@deanname", TextBox8.Text);
            cmd.Parameters.AddWithValue("@billno", TextBox9.Text);
            cmd.Parameters.AddWithValue("@billname", TextBox10.Text);
            cmd.Parameters.AddWithValue("@billeremail", TextBox13.Text);
            cmd.Parameters.AddWithValue("@billeraadharno", aadharno);
            cmd.Parameters.AddWithValue("@billamount", TextBox11.Text);
            cmd.Parameters.AddWithValue("@paymentdate", TextBox12.Text); 
            cmd.Parameters.AddWithValue("@paymentmode", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@schemes", DropDownList2.Text);
            cmd.ExecuteNonQuery();
            Label1.Text = "Data has been saved";

            MailMessage msg = new MailMessage();
            msg.To.Add(TextBox13.Text);
            msg.From = new MailAddress("codetester181@gmail.com");
            msg.Subject = "Hospital Bill";
            msg.Body = "Your hospital bill::'" + TextBox9.Text + "' details has been successfully registerd to the system on as Bill Amount'"+TextBox11.Text+"' paid on'"+TextBox12.Text+"' by means of'"+DropDownList1.Text+"' ";
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
        }

    }
}
