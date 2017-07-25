using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CS345_Proj2_Library_AaronYoung.App_Code
{
    public class ContactUtility
    {
        public string id { get; set; }
        public string Name { get; set; }
        public string Content { get; set; }
        public string Time { get; set; }

        public void insertLog()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ay_library"].ConnectionString);
            conn.Open();
            string insertQuery = "insert into Library_Contact_Log(Name, Content) values (@Name, @Content)";
            SqlCommand cmd = new SqlCommand(insertQuery, conn);
            cmd.Parameters.AddWithValue("@Name", Name);
            cmd.Parameters.AddWithValue("@Content", Content);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}