using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CS345_Proj2_Library_AaronYoung.App_Code
{
    public class PatronUtility
    {
        public string libraryCardNumber { get; set; }
        public string fName { get; set; }
        public string lName { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public PatronUtility(){}

        public void insertData()
        {
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ay_library"].ConnectionString);
            conn.Open();
            string insertString = "insert into Patron (library_Card_Num, fName, lName, email, password) values (@library_card_number, @fName, @lName, @email, @password)";
            SqlCommand cmd = new SqlCommand(insertString, conn);
            cmd.Parameters.AddWithValue("@library_card_number", libraryCardNumber);
            cmd.Parameters.AddWithValue("@fName", fName);
            cmd.Parameters.AddWithValue("@lName", lName);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", EncryptPassword.encryptString(password));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public bool isRegistered()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ay_library"].ConnectionString);
            conn.Open();
            string checkUser = "select * from Patron where library_Card_Num=@library_card_number";
            SqlCommand cmd = new SqlCommand(checkUser, conn);
            cmd.Parameters.AddWithValue("@library_card_number", libraryCardNumber);
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
        public bool checkPassword()
        {
            String hashedPassword = EncryptPassword.encryptString(password);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ay_library"].ConnectionString);
            conn.Open();
            string checkUser = "select * from Patron where library_Card_Num=@library_card_number";
            SqlCommand cmd = new SqlCommand(checkUser, conn);
            cmd.Parameters.AddWithValue("@library_card_number", libraryCardNumber);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr["password"].ToString().Equals(hashedPassword))
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
            dr.Close();
            conn.Close();
            return false;
        }
        public PatronUtility getUser(string libraryCardNumber)
        {
            PatronUtility customer = new PatronUtility();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ay_library"].ConnectionString);
            conn.Open();
            string checkUser = "select library_Card_Num, fName, lName, email, password from Patron where library_Card_Num=@library_card_number";
            SqlCommand comd = new SqlCommand(checkUser, conn);
            comd.Parameters.AddWithValue("@library_card_number", libraryCardNumber);
            SqlDataReader dr = comd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                customer.libraryCardNumber = dr[0].ToString();
                customer.fName = dr[1].ToString();
                customer.lName = dr[2].ToString();
                customer.email = dr[3].ToString();
                customer.password = dr[4].ToString();
            }
            dr.Close();
            conn.Close();
            return customer;
        }
        public void resetPassword(string newpwd)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ay_library"].ConnectionString);
            conn.Open();
            string checkUser = "update Patron set Patron.password = @password where Patron.library_Card_Num = @library_card_number";
            SqlCommand comd = new SqlCommand(checkUser, conn);
            comd.Parameters.AddWithValue("@library_card_number", libraryCardNumber);
            comd.Parameters.AddWithValue("@password", EncryptPassword.encryptString(newpwd));
            comd.ExecuteNonQuery();
            conn.Close();
        }
    }
}