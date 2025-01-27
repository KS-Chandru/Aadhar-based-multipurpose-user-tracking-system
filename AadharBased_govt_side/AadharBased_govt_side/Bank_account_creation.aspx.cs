using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Net.Mail;
using System.Text;
using System.Security.Cryptography;

namespace AadharBased_govt_side
{
    public partial class Bank_account_creation : System.Web.UI.Page
    {
        string Connection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox12.Text = DateTime.Now.Year.ToString();
        }
        public string encrypt(string encryptString)
{
    string EncryptionKey = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    byte[] clearBytes = Encoding.Unicode.GetBytes(encryptString);
    using(Aes encryptor = Aes.Create())
    {
        Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
        });
        encryptor.Key = pdb.GetBytes(32);
        encryptor.IV = pdb.GetBytes(16);
        using(MemoryStream ms = new MemoryStream())
        {
            using(CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write)) {
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
            String name=encrypt(TextBox1.Text);
            String aadharno=encrypt(TextBox4.Text);
            String panno=encrypt(TextBox6.Text);
            String dob=encrypt(TextBox7.Text);

            string imagename = TextBox12.Text + TextBox13.Text + TextBox14.Text;
            if (DropDownList1.Text != "" || DropDownList2.Text != "")
            {
                if (FileUpload1.HasFile)
                {
                    // Get the file extension
                    string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);

                    if (fileExtension.ToLower() != ".jpg" && fileExtension.ToUpper() != ".jpeg")
                    {
                        Label2.ForeColor = System.Drawing.Color.Red;
                        Label2.Text = "Only files with .jpg and .jpeg extension are allowed";
                    }
                    else
                    {

                        // Upload the file

                        FileUpload1.SaveAs(Server.MapPath("~/Bank_Images/" + imagename + ".jpg"));
                        string fileName = TextBox1.Text.Trim() + Path.GetExtension(imagename);

                        string FilePath = "~/Bank_Images/" + imagename+".jpg";
                        Label2.ForeColor = System.Drawing.Color.Green;
                        Label2.Text = "Image uploaded successfully";

                        SqlConnection con = new SqlConnection(Connection);
                        con.Open();
                        SqlCommand cmd = new SqlCommand("insert into Bankaccount_Creation" + "(name,phoneno,email,aadharno,address,dob,gender,pancardno,accounttype,photo,date,proof1,proof2,proof3,accountno)values(@name,@phoneno,@email,@aadharno,@address,@dob,@gender,@pancardno,@accounttype,@photo,@date,@proof1,@proof2,@proof3,@accountno)", con);
                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@phoneno", TextBox2.Text);
                        cmd.Parameters.AddWithValue("@email", TextBox3.Text);
                        cmd.Parameters.AddWithValue("@aadharno", aadharno);
                        cmd.Parameters.AddWithValue("@address", TextBox5.Text);
                        cmd.Parameters.AddWithValue("@dob", dob);
                        cmd.Parameters.AddWithValue("@gender", DropDownList1.Text);
                        cmd.Parameters.AddWithValue("@pancardno", panno);
                        cmd.Parameters.AddWithValue("@accounttype", DropDownList2.Text);
                        cmd.Parameters.AddWithValue("@photo", FilePath);
                        cmd.Parameters.AddWithValue("@date", TextBox8.Text);
                        cmd.Parameters.AddWithValue("@proof1", TextBox9.Text);
                        cmd.Parameters.AddWithValue("@proof2", TextBox10.Text);
                        cmd.Parameters.AddWithValue("@proof3", TextBox11.Text);
                        cmd.Parameters.AddWithValue("@accountno", TextBox12.Text + TextBox13.Text + TextBox14.Text);
                        accountbal();
                        cmd.ExecuteNonQuery();
                        Label1.Text = "Record Has Been Saved Successfully";



                        String accno = TextBox12.Text + TextBox13.Text + TextBox14.Text;
                        MailMessage msg = new MailMessage();
                        msg.To.Add(TextBox3.Text);
                        msg.From = new MailAddress("codetester181@gmail.com");
                        msg.Subject = "New account creation details";
                        msg.Body = "Your account has been created successfullly your account no:'" + accno + "' Use this for your future reference.";
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587;
                        smtp.EnableSsl = true;
                        smtp.UseDefaultCredentials = true;
                        smtp.Credentials = new System.Net.NetworkCredential("codetester181@gmail.com", "hlfpdgxtibgrzuvv");
                        smtp.Send(msg);
                        Label1.Text = "mail sent";

                    }
                }
            }
            

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
            TextBox14.Text = "";
        }
        public void accountbal()
        {
            string accountno = TextBox12.Text + TextBox13.Text + TextBox14.Text;
            string bal = "1000";
            SqlConnection con = new SqlConnection(Connection);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Account_C_D" + "(accountno,holdername,balance)values(@accountno,@holdername,@balance)", con);
            cmd.Parameters.AddWithValue("@accountno", accountno);
            cmd.Parameters.AddWithValue("@balance", bal);
            cmd.Parameters.AddWithValue("@holdername", TextBox1.Text);
            cmd.ExecuteNonQuery();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Random r = new Random();
            int genRand = r.Next(1000, 9999);
            TextBox14.Text=(genRand.ToString());
                                      

        }

    }
}