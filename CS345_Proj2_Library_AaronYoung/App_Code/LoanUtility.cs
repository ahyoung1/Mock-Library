using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CS345_Proj2_Library_AaronYoung.App_Code
{
    public class LoanUtility
    {
        public string loanID { get; set; }
        public string ISBN { get; set; }
        public string patronCardNumber { get; set; }
        public string dueDate { get; set; }
        public LoanUtility(){}

        public void insertLoan()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ay_library"].ConnectionString);
            conn.Open();
            string qry = "insert into [Loans] values (@loan_ID, @ISBN, @patron_card_num, @due_date) select @@identity";
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@loan_ID", loanID);
            cmd.Parameters.AddWithValue("@ISBN", ISBN);
            cmd.Parameters.AddWithValue("@patron_card_num", patronCardNumber);
            cmd.Parameters.AddWithValue("@due_date", dueDate);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            loanID = dr[0].ToString();
            dr.Close();
            conn.Close();
        }
        public void readRecordById()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ay_library"].ConnectionString);
            conn.Open();
            string qry = "select * from Loans where (loan_ID = @loan_ID)";
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@loan_ID", loanID);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            loanID = dr["loan_ID"].ToString();
            ISBN = dr["ISBN"].ToString();
            patronCardNumber = dr["patron_card_num"].ToString();
            dueDate = dr["due_date"].ToString();
            dr.Close();
            conn.Close();
        }
        public void removeRecord()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ay_library"].ConnectionString);
            conn.Open();
            string qry = "delete from [Loans] where (loan_ID = @loan_ID)";
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@loan_ID", loanID);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}