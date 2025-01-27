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
    public partial class RtoLisenceDetails : System.Web.UI.Page
    {
        string Connection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

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
            String aadharno=encrypt(TextBox3.Text);
            String email=encrypt(TextBox4.Text);
            String dob=encrypt(TextBox6.Text);
            String valid = encrypt(TextBox10.Text);

            string imagename = DropDownList2.Text + DropDownList3.Text + TextBox8.Text;
            if (FileUpload1.HasFile)
            {
                // Get the file extension
                string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);

                if (fileExtension.ToLower() != ".jpg")
                {
                    Label2.ForeColor = System.Drawing.Color.Red;
                    Label2.Text = "Only files with .jpg  extension are allowed";
                }
                else
                {

                    // Upload the file

                    FileUpload1.SaveAs(Server.MapPath("~/License_Images/" + imagename + ".jpg"));
                    string fileName = TextBox1.Text.Trim() + Path.GetExtension(imagename);

                    string FilePath = "~/License_Images/" + imagename + ".jpg";
                    Label2.ForeColor = System.Drawing.Color.Green;
                    Label2.Text = "Image uploaded successfully";

                    SqlConnection con = new SqlConnection(Connection);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into Lisence_Details" + "(name,image,address,aadharno,email,phoneno,dob,WonWifeDaughterof,bloogroup,dlno,vehicletype,rtolocation,dateofissue,validtill)values(@name,@image,@address,@aadharno,@email,@phoneno,@dob,@WonWifeDaughterof,@bloogroup,@dlno,@vehicletype,@rtolocation,@dateofissue,@validtill)", con);
                    cmd.Parameters.AddWithValue("@name", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@image", FilePath);
                    cmd.Parameters.AddWithValue("@address", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@aadharno", aadharno);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@phoneno", TextBox5.Text);
                    cmd.Parameters.AddWithValue("@dob", dob);
                    cmd.Parameters.AddWithValue("@WonWifeDaughterof", TextBox7.Text);
                    cmd.Parameters.AddWithValue("@bloogroup", DropDownList1.Text);
                    cmd.Parameters.AddWithValue("@dlno", DropDownList2.Text + DropDownList3.Text + TextBox8.Text);
                    cmd.Parameters.AddWithValue("@vehicletype", DropDownList4.Text);
                    cmd.Parameters.AddWithValue("@rtolocation", DropDownList5.Text + DropDownList6.Text);
                    cmd.Parameters.AddWithValue("@dateofissue", TextBox9.Text);
                    cmd.Parameters.AddWithValue("@validtill",valid);
                    cmd.ExecuteNonQuery();
                    Label1.Text = "Record Has Been Saved Successfully";

                    MailMessage msg = new MailMessage();
                    msg.To.Add(TextBox4.Text);
                    msg.From = new MailAddress("codetester181@gmail.com");
                    msg.Subject = "New Lisence Appplication";
                    msg.Body = "Your lisence application for user:'" + TextBox1.Text + "' has been successfully processed and the DL NO has been generated DLNO:'" + DropDownList2.Text + DropDownList3.Text + TextBox8.Text + "' valid till '" + TextBox10.Text + "' ";
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = new System.Net.NetworkCredential("codetester181@gmail.com", "hlfpdgxtibgrzuvv");
                    smtp.Send(msg);
                    Label1.Text = "mail sent";

                    clrtxt();
                }
            }
        }

        private void clrtxt()
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
