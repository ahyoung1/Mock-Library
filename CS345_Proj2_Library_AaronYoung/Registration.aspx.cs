using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using CS345_Proj2_Library_AaronYoung.App_Code;

namespace CS345_Proj2_Library_AaronYoung
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBoxFName.Focus();
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            PatronUtility patron = new PatronUtility();
            patron.libraryCardNumber = library_Card_Num_TB.Text;
            patron.fName = TextBoxFName.Text;
            patron.lName = TextBoxLName.Text;
            patron.email = TextBoxEmail.Text;
            patron.password = TB_Password.Text;
            if (patron.isRegistered())
            {
                Label10.Text = "This user already exists, please log in";
                Label10.ForeColor = System.Drawing.Color.Red;
                Response.AddHeader("refresh", "4;url=Login.aspx");
            }
            else
            {
                patron.insertData();
                Label10.Text = "You have registered with The Wonderland Library successfully!";
                Label10.ForeColor = System.Drawing.Color.Red;
                Response.AddHeader("refresh", "2; url=Login.aspx");
            }
        }
    }
}