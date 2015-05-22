using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data;

namespace ClassRegistrationSite
{
    public class DBConn
    {
        private static OleDbParameter CreateParam(String Value, String ParameterName, DbType DbType, ParameterDirection Direction)
        {
            OleDbParameter objParam = new OleDbParameter();
            objParam.Direction = Direction;
            objParam.DbType = DbType;
            objParam.ParameterName = ParameterName;
            objParam.Value = Value;
            return objParam;
        }

        private static OleDbParameter CreateParam(int Value, String ParameterName, DbType DbType, ParameterDirection Direction)
        {
            OleDbParameter objParam = new OleDbParameter();
            objParam.Direction = Direction;
            objParam.DbType = DbType;
            objParam.ParameterName = ParameterName;
            objParam.Value = Value;
            return objParam;
        }

        private static OleDbParameter CreateParam(String ParameterName, DbType DbType, ParameterDirection Direction)
        {
            OleDbParameter objParam = new OleDbParameter();
            objParam.Direction = Direction;
            objParam.DbType = DbType;
            objParam.ParameterName = ParameterName;
            return objParam;
        }

        public static int LoginByLoginAndPass(string Login, string Password)
        {
            System.Data.OleDb.OleDbConnection objOleCon;
            objOleCon = new System.Data.OleDb.OleDbConnection();
            objOleCon.ConnectionString = @"Provider=SQLOLEDB;Data Source=(local);Integrated Security=SSPI;Initial Catalog=AdvWebDevProject";
            objOleCon.Open();

            System.Data.OleDb.OleDbCommand objCmd;
            objCmd = new System.Data.OleDb.OleDbCommand();
            objCmd.Connection = objOleCon;

            objCmd.CommandType = System.Data.CommandType.StoredProcedure;

            //sproc name
            string strSQLCommand = @"pSelLoginIdByLoginAndPassword";
            //Setup the parameters

            //@ReturnCode
            OleDbParameter objParamRC = CreateParam("RC", DbType.Int32, ParameterDirection.ReturnValue);
            objCmd.Parameters.Add(objParamRC);

            //@StudentLogin
            OleDbParameter objParamStudentLogin = CreateParam(Login, "@StudentLogin", DbType.String, ParameterDirection.Input);
            objCmd.Parameters.Add(objParamStudentLogin);

            //@StudentPassword
            OleDbParameter objParamStudentPassword = CreateParam(Password, "@StudentPassword", DbType.String, ParameterDirection.Input);
            objCmd.Parameters.Add(objParamStudentPassword);

            //@StudentID
            OleDbParameter objParamStudentID = CreateParam("@StudentID", DbType.Int32, ParameterDirection.Output);
            objCmd.Parameters.Add(objParamStudentID);
            
            int ReturnStudentID = -1;

            // Execute
            try
            {
                objCmd.CommandText = strSQLCommand;
                int RowsAffected = objCmd.ExecuteNonQuery();
                if(objParamStudentID.Value.GetType() == typeof(Int32))
                {
                    ReturnStudentID = (int)objParamStudentID.Value;
                }
            }
            catch
            {
                throw;
            }
            finally
            {
                objOleCon.Close();
            }
            return ReturnStudentID;
        }

        public static string ConnectionString
        {
            get
            {
                string ConnectionString = ConfigurationManager.ConnectionStrings["dbConnection"].ToString();
                SqlConnectionStringBuilder ConnStringBldr = new SqlConnectionStringBuilder(ConnectionString);
                ConnStringBldr.ApplicationName = ApplicationName ?? ConnStringBldr.ApplicationName;
                ConnStringBldr.ConnectTimeout = (ConnectionTimeout > 0) ? ConnectionTimeout : ConnStringBldr.ConnectTimeout;
                return ConnStringBldr.ToString();
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
