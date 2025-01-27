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
    public partial class Rto_Renewal : System.Web.UI.Page
    {
        string Connection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string dlno = TextBox1.Text;
            SqlConnection con = new SqlConnection(Connection);
            SqlDataAdapter Adp = new SqlDataAdapter("select * from Lisence_Details where dlno='" + dlno + "'", con);
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
            TextBox2.Text = GridView1.SelectedRow.Cells[2].Text;
            TextBox3.Text = GridView1.SelectedRow.Cells[3].Text;
            TextBox4.Text = GridView1.SelectedRow.Cells[4].Text;
            TextBox5.Text = GridView1.SelectedRow.Cells[5].Text;
            TextBox6.Text = GridView1.SelectedRow.Cells[6].Text;
            TextBox7.Text = GridView1.SelectedRow.Cells[11].Text;
            TextBox8.Text = GridView1.SelectedRow.Cells[12].Text;
            TextBox9.Text = GridView1.SelectedRow.Cells[14].Text;
            TextBox10.Text = GridView1.SelectedRow.Cells[15].Text;
            Image2.ImageUrl = GridView1.SelectedRow.Cells[3].Text;


            String aadhar = Decrypt(TextBox5.Text);
            String email = Decrypt(TextBox6.Text);
            String validtill = Decrypt(TextBox10.Text);

            TextBox5.Text = aadhar;
            TextBox6.Text = email;
            TextBox10.Text = validtill;

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


            String aadhar = encrypt(TextBox5.Text);
            String email = encrypt(TextBox6.Text);

            String Renewaldate = DateTime.Parse(TextBox10.Text).AddYears(10).ToString("dd/mm/yyyy");

            if (DropDownList1.Text == "Renewed")
            {
                SqlConnection con = new SqlConnection(Connection);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Lisence_renewal" + "(name,image,address,aadharno,email,dlno,vehicletype,dateofissued,validtill,renewalstatus)values(@name,@image,@address,@aadharno,@email,@dlno,@vehicletype,@dateofissued,@validtill,@renewalstatus)", con);
                cmd.Parameters.AddWithValue("@name", TextBox2.Text);
                cmd.Parameters.AddWithValue("@image", TextBox3.Text);
                cmd.Parameters.AddWithValue("@address", TextBox4.Text);
                cmd.Parameters.AddWithValue("@aadharno", aadhar);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@dlno", TextBox7.Text);
                cmd.Parameters.AddWithValue("@vehicletype", TextBox8.Text);
                cmd.Parameters.AddWithValue("@dateofissued", TextBox9.Text);
                cmd.Parameters.AddWithValue("@validtill", Renewaldate);
                cmd.Parameters.AddWithValue("@renewalstatus", DropDownList1.Text);
                cmd.ExecuteNonQuery();
                Label1.Text = "Data has been saved";

                MailMessage msg = new MailMessage();
                msg.To.Add(TextBox6.Text);
                msg.From = new MailAddress("codetester181@gmail.com");
                msg.Subject = "Intimation Of Your Liscense Renewal";
                msg.Body = "The DLNO:'"+TextBox7.Text+"' has been successfully renewed";
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
            else
            {
                Response.Write("<script>alert('Renewal Not Selected')</script>");
            }


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
}
                
    }
}
