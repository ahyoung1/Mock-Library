using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CS345_Proj2_Library_AaronYoung.App_Code;

namespace CS345_Proj2_Library_AaronYoung
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            libCard_TB.Focus();
        }

        protected void login_BTN_Click(object sender, EventArgs e)
        {
            PatronUtility patron = new PatronUtility();
            patron.libraryCardNumber = libCard_TB.Text;
            patron.password = password_TB.Text;

            if (patron.checkPassword())
            {
                Session["user"] = libCard_TB.Text;
                message_LBL.Enabled = true;
                message_LBL.Visible = true;
                message_LBL.Text = "Welcome back!";
                message_LBL.ForeColor = System.Drawing.Color.Red;
                Response.AddHeader("refresh", "2; url=Home.aspx");
            }
            else
            {
                message_LBL.Enabled = true;
                message_LBL.Visible = true;
                message_LBL.Text = "Library card and password combination is not correct!";
                message_LBL.ForeColor = System.Drawing.Color.Red;
                resetLink_BTN.Visible = true;
                resetLink_BTN.Enabled = true;
            }
        }
    }
}