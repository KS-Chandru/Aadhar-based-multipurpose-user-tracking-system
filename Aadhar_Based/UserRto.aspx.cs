using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aadhar_Based
{
    public partial class UserRto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["aadharno"].ToString();
            LisenceDetailspanel.Visible = false;
            FinesPanel.Visible = false;
            RenewalPanel.Visible = false;
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            LisenceDetailspanel.Visible = true;
        }
        protected void Button2_Click1(object sender, EventArgs e)
        {
            FinesPanel.Visible = true;
        }
        protected void Button3_Click1(object sender, EventArgs e)
        {
            RenewalPanel.Visible = true;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
            Session.Abandon();
            Session.Clear();

        }
    }
}
