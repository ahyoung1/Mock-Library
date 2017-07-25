using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CS345_Proj2_Library_AaronYoung.App_Code;

namespace CS345_Proj2_Library_AaronYoung
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            message_LBL.Enabled = false;
            message_LBL.EnableViewState = false;
            message_LBL.Visible = false;
        }
        
        protected void ButtonContact_Click(object sender, EventArgs e)
        {
            ContactUtility con = new ContactUtility();
            con.Name = name_TB.Text;
            con.Content = content_TB.Text;
            con.insertLog();
            message_LBL.Text = "Sending Successful!";
            message_LBL.Visible = true;
            message_LBL.EnableViewState = true;
            message_LBL.Enabled = true;
            message_LBL.ForeColor = System.Drawing.Color.Red;
        }
    }
}