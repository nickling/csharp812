using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace ClassRegistrationSite
{
    public class Student
    {
        public int StudentId { get; set; }
        public string StudentName { get; set; }
        public string StudentEmail { get; set; }
        public string StudentLogin { get; set; }
        public string StudentPassword { get; set; }
        public static bool LoggedIn { get; set; }

        public void Load(SqlDataReader reader)
        {
            StudentId = Int32.Parse(reader["StudentId"].ToString());
            StudentName = (reader["StudentName"].ToString());
            StudentEmail = (reader["StudentEmail"].ToString());
            StudentLogin = (reader["StudentLogin"].ToString());
            StudentPassword = (reader["StudentPassword"].ToString());

        }
    }
}

