using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Net.Mail;

namespace AadharBased_govt_side
{
    public partial class Hospital_Info : System.Web.UI.Page
    {
        string Connection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

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
        protected void Button1_Click(object sender, EventArgs e)
        {
            String email=encrypt(TextBox3.Text);
            String deanname=encrypt(TextBox6.Text);


            SqlConnection con = new SqlConnection(Connection);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Hospital_details" + "(name,phoneno,email,address,hospitaltype,district,deanname)values(@name,@phoneno,@email,@address,@hospitaltype,@district,@deanname)", con);
            cmd.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@phoneno", TextBox2.Text);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@address", TextBox4.Text);
            cmd.Parameters.AddWithValue("@hospitaltype", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@district", TextBox5.Text);
            cmd.Parameters.AddWithValue("@deanname",deanname );
            cmd.ExecuteNonQuery();
            Label1.Text = "Data has been saved";

             
                        MailMessage msg = new MailMessage();
                        msg.To.Add(TextBox3.Text);
                        msg.From = new MailAddress("codetester181@gmail.com");
                        msg.Subject = "Hospital Registration";
                        msg.Body = "Your hospital::'"+TextBox1.Text+"' details has been successfully registerd to the system on behalf of the Dean Dr.'"+TextBox6.Text+"'";
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
        }
        
    }
}
