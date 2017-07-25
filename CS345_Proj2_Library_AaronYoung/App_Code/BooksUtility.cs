using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CS345_Proj2_Library_AaronYoung.App_Code
{
    public class BooksUtility
    {
        public string ISBN { get; set; }
        public string title { get; set; }
        public string author { get; set; }
        public string loanID { get; set; }
        public string currentBranch { get; set; }
        public string number_of_copies { get; set; }
        public BooksUtility(){}

        /*
            [ISBN]           INT           NOT NULL,
    [title]          VARCHAR (MAX) NOT NULL,
    [author]         VARCHAR (40)  NOT NULL,
    [loan_ID]        INT           NOT NULL,
    [current_branch] VARCHAR (20)  NOT NULL,
            */

        public void insertBook()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ay_library"].ConnectionString);
            conn.Open();
            string qry = "insert into [Books](ISBN, title, author, loan_ID, current_Branch, number_of_copies) values (@ISBN, @title, @author, @loan_ID, @current_Branch, @number_of_copies)";
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@ISBN", ISBN);
            cmd.Parameters.AddWithValue("@title", title);
            cmd.Parameters.AddWithValue("@author", author);
            cmd.Parameters.AddWithValue("@loan_ID", loanID);
            cmd.Parameters.AddWithValue("@current_Branch", currentBranch);
            cmd.Parameters.AddWithValue("@number_of_copies", number_of_copies);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public Boolean checkIsCopy()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ay_library"].ConnectionString);
            conn.Open();
            string checkBook = "select * from Books where ISBN=@ISBN";
            SqlCommand cmd = new SqlCommand(checkBook, conn);
            cmd.Parameters.AddWithValue("@ISBN", ISBN);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                dr.Close();
                conn.Close();
                return true;
            }
            else
            {
                dr.Close();
                conn.Close();
                return false;
            }
        }

        public void increaseQuantity()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ay_library"].ConnectionString);
            conn.Open();
            string increaseQuantity = "Update Books set number_of_copies = number_of_copies + 1 where ISBN = @ISBN";
            SqlCommand cmd = new SqlCommand(increaseQuantity, conn);
            cmd.Parameters.AddWithValue("@ISBN", ISBN);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}