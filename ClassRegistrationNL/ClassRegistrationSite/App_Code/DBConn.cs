using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace ClassRegistrationSite
{
    public class DBConn
    {
        public SqlConnection GetConnection()
        {
            System.Data.SqlClient.SqlConnection objCon;
            objCon = new System.Data.SqlClient.SqlConnection();
            objCon.ConnectionString = @"Data Source=(local);Initial Catalog=AdvWebDevProject;Integrated Security=True;";
            return objCon;
        }
















        public static string ConnectionString
        {
            get

            {
                string connStr = ConfigurationManager.ConnectionStrings["dbConnection"].ToString();
                SqlConnectionStringBuilder sb = new SqlConnectionStringBuilder(connStr);
                sb.ApplicationName = ApplicationName ?? sb.ApplicationName;
                sb.ConnectTimeout = (ConnectionTimeout > 0) ? ConnectionTimeout : sb.ConnectTimeout;
                return sb.ToString();
            }
        }

        public static SqlConnection GetSqlConnection()

        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();
            return conn;
        }

        public static string ApplicationName { get; set; }

        public static int ConnectionTimeout { get; set; }   

    }
}
