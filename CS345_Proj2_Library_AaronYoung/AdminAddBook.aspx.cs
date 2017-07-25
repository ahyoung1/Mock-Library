using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CS345_Proj2_Library_AaronYoung.App_Code;

namespace CS345_Proj2_Library_AaronYoung
{
    public partial class AdminAddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Write("<script language=javascript> var agree; agree=confirm('You have to log in first'); location.replace('Login.aspx');</script>");
                message_LBL.Visible = false;
                message_LBL.Enabled = false;
            }
        }

        protected void add_BTN_Click(object sender, EventArgs e)
        {
            BooksUtility bookutil = new BooksUtility();
            bookutil.ISBN = isbn_TB.Text;
            bookutil.title = title_TB.Text;
            bookutil.author = author_TB.Text;
            bookutil.currentBranch = "Wonderland";
            bookutil.loanID = "0";
            bookutil.number_of_copies = "0";

            if (bookutil.checkIsCopy())
            {
                bookutil.increaseQuantity();
                message_LBL.Enabled = true;
                message_LBL.Visible = true;
                message_LBL.Text = "Inventory of this book has been increased";
            }
            else
            {
                bookutil.insertBook();
                message_LBL.Enabled = true;
                message_LBL.Visible = true;
                message_LBL.Text = "Book has been added to the libary, thanks for the new addition!";
            }
        }
    }
}