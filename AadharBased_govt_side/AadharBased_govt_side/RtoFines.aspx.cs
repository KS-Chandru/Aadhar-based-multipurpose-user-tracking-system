using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Net.Mail;

namespace AadharBased_govt_side
{
    public partial class RtoFines : System.Web.UI.Page
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
            TextBox7.Text = GridView1.SelectedRow.Cells[7].Text;
            TextBox8.Text = GridView1.SelectedRow.Cells[8].Text;
            TextBox9.Text = GridView1.SelectedRow.Cells[9].Text;
            TextBox10.Text = GridView1.SelectedRow.Cells[10].Text;
            TextBox11.Text = GridView1.SelectedRow.Cells[11].Text;
            TextBox12.Text = GridView1.SelectedRow.Cells[12].Text; 
            TextBox13.Text = GridView1.SelectedRow.Cells[13].Text;
            TextBox14.Text = GridView1.SelectedRow.Cells[14].Text;
            TextBox15.Text = GridView1.SelectedRow.Cells[15].Text;

            String aadhar=Decrypt(TextBox5.Text);
            String email=Decrypt(TextBox6.Text);
            String dob=Decrypt(TextBox8.Text);
            String validtill=Decrypt(TextBox15.Text);

            TextBox5.Text = aadhar;
            TextBox6.Text = email;
            TextBox8.Text = dob;
            TextBox15.Text = validtill;
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
            String dob = encrypt(TextBox8.Text);
            String validtill = encrypt(TextBox15.Text);

            SqlConnection con = new SqlConnection(Connection);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into User_Fines" + "(name,image,address,aadharno,email,phoneno,dob,WonWifeDaughterof,bloogroup,dlno,vehicletype,rtolocation,dateofissue,validtill,fine1,fine2,fine3,totalamount,paymentmode,paymentstatus)values(@name,@image,@address,@aadharno,@email,@phoneno,@dob,@WonWifeDaughterof,@bloogroup,@dlno,@vehicletype,@rtolocation,@dateofissue,@validtill,@fine1,@fine2,@fine3,@totalamount,@paymentmode,@paymentstatus)", con);
            cmd.Parameters.AddWithValue("@name", TextBox2.Text);
            cmd.Parameters.AddWithValue("@image", TextBox3.Text);
            cmd.Parameters.AddWithValue("@address", TextBox4.Text);
            cmd.Parameters.AddWithValue("@aadharno", aadhar);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@phoneno", TextBox7.Text);
            cmd.Parameters.AddWithValue("@dob", dob);
            cmd.Parameters.AddWithValue("@WonWifeDaughterof", TextBox9.Text);
            cmd.Parameters.AddWithValue("@bloogroup", TextBox10.Text);
            cmd.Parameters.AddWithValue("@dlno", TextBox11.Text);
            cmd.Parameters.AddWithValue("@vehicletype", TextBox12.Text);
            cmd.Parameters.AddWithValue("@rtolocation", TextBox13.Text);
            cmd.Parameters.AddWithValue("@dateofissue", TextBox14.Text);
            cmd.Parameters.AddWithValue("@validtill", validtill);
            cmd.Parameters.AddWithValue("@fine1", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@fine2", DropDownList2.Text);
            cmd.Parameters.AddWithValue("@fine3", DropDownList3.Text);
            cmd.Parameters.AddWithValue("@totalamount", TextBox16.Text);
            cmd.Parameters.AddWithValue("@paymentmode", DropDownList4.Text);
            cmd.Parameters.AddWithValue("@paymentstatus", DropDownList5.Text);
            cmd.ExecuteNonQuery();
            Label1.Text = "Fine Issued";


            MailMessage msg = new MailMessage();
            msg.To.Add(TextBox6.Text);
            msg.From = new MailAddress("codetester181@gmail.com");
            msg.Subject = "Fines From RTO";
            msg.Body = "Fines have Been Forced on to your DLNO:'"+TextBox11.Text+"' total fine amt rs:₹'"+TextBox16.Text+"' has been '"+DropDownList5.Text+"'";
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
            TextBox11.Text = "";
            TextBox12.Text = "";
            TextBox13.Text = "";
            TextBox14.Text = "";
            TextBox15.Text = "";
            TextBox16.Text = "";
            TextBox17.Text = "";
            TextBox18.Text = "";
            TextBox19.Text = "";
        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Connection);
            SqlCommand cmd = new SqlCommand("SELECT  * FROM Fines where fines='" + DropDownList1.Text + "'",con);
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataTable Dt = new DataTable();
            adpt.Fill(Dt);
            TextBox17.Text = Dt.Rows[0][1].ToString();
            
           
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(Connection);
            SqlCommand cmd = new SqlCommand("SELECT  * FROM Fines where fines='" + DropDownList2.Text + "'", con);
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataTable Dt = new DataTable();
            adpt.Fill(Dt);
            TextBox18.Text = Dt.Rows[0][1].ToString();
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(Connection);
            SqlCommand cmd = new SqlCommand("SELECT  * FROM Fines where fines='" + DropDownList3.Text + "'", con);
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataTable Dt = new DataTable();
            adpt.Fill(Dt);
            TextBox19.Text = Dt.Rows[0][1].ToString();
        }

      
        

        protected void Button3_Click(object sender, EventArgs e)
        {
            int a = Int32.Parse(TextBox17.Text);
            int b = Int32.Parse(TextBox18.Text);
            int c = Int32.Parse(TextBox19.Text);
            int d;
            d = a + b + c;
            TextBox16.Text = d.ToString();
        }

        
    }
}
