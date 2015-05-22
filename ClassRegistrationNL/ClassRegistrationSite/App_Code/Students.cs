using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.OleDb;

namespace ClassRegistrationSite
{
    public class Students
    {
        public Student GetStudentByLogin(string UserName, string Password)
        {
            Student s = null;
            using (SqlConnection conn = DBConn.GetSqlConnection())
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {

                    cmd.CommandText = "select * from Students where StudentLogin = '" + UserName + "' and StudentPassword='" + Password + "'";
                    SqlDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    if (reader.Read())
                    {
                        s = new Student();
                        s.Load(reader);
                    }
                }
            }
            return s;
        }

        public DataTable GetMyClasses(int StudentId)
        {
            // TODO - swap the stored procedures
            // Combine Students and Student. 
            // is it possible to put these into the DBConn class?


            DataTable dt = new DataTable();
            using (SqlConnection conn = DBConn.GetSqlConnection())
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {

                    cmd.CommandText = "select C.ClassId, C.ClassName, C.ClassDate, C.ClassDescription from ClassStudents CS, Classes C where CS.ClassId = C.ClassId AND CS.StudentId =" + StudentId;
                    SqlDataAdapter DataAdaptor = new SqlDataAdapter(cmd);
                    DataAdaptor.Fill(dt);
                }
            }
            return dt;
        }

        public void InsertStudentClass(int StudentId, int ClassId)
        {
            using (SqlConnection conn = DBConn.GetSqlConnection())
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    try
                    {
                        cmd.CommandText = "Insert into ClassStudents (classId, StudentId) values(" + ClassId + "," + StudentId + ")";
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
            }
        }

        private OleDbParameter CreateParam(String Value, String ParameterName, DbType DbType, ParameterDirection Direction)
        {
            OleDbParameter objParam = new OleDbParameter();
            objParam.Direction = Direction;
            objParam.DbType = DbType;
            objParam.ParameterName = ParameterName;
            objParam.Value = Value;
            return objParam;
        }



        // Takes the input and inserts a new login.
        public void InsertNewLogin(string Name, string EmailAddress, string LoginName ,string NewOrReactivate , string ReasonForAccess, DateTime DateNeededBy)
        {
            try
            {
                System.Data.OleDb.OleDbConnection objOleCon;
                objOleCon = new System.Data.OleDb.OleDbConnection();
                objOleCon.ConnectionString = @"Provider=SQLOLEDB;Data Source=(local);Integrated Security=SSPI;Initial Catalog=AdvWebDevProject";
                objOleCon.Open();

                System.Data.OleDb.OleDbCommand objCmd;
                objCmd = new System.Data.OleDb.OleDbCommand();
                objCmd.Connection = objOleCon;

                objCmd.CommandType = System.Data.CommandType.StoredProcedure;


                // Specify sproc name
                string strSQLCommand = @"pInsLoginRequest";

                //@Name
                OleDbParameter objParamName = CreateParam(Name, "@Name", DbType.String, ParameterDirection.Input);                   
                objCmd.Parameters.Add(objParamName);

                //@EmailAddress
                OleDbParameter objParamEmailAddress = CreateParam(EmailAddress, "@EmailAddress", DbType.String, ParameterDirection.Input);
                objCmd.Parameters.Add(objParamEmailAddress);
                    
                //@LoginName
                OleDbParameter objParamLoginName = CreateParam(LoginName, "@LoginName", DbType.String, ParameterDirection.Input);
                objCmd.Parameters.Add(objParamLoginName);

                //@NewOrReactivate
                OleDbParameter objParamNewOrReactivate = CreateParam(NewOrReactivate, "@NewOrReactivate", DbType.String, ParameterDirection.Input);
                objCmd.Parameters.Add(objParamNewOrReactivate);

                //@ReasonForAccess
                OleDbParameter objParamReasonForAccess = CreateParam(ReasonForAccess, "@ReasonForAccess", DbType.String, ParameterDirection.Input);
                objCmd.Parameters.Add(objParamReasonForAccess);

                //@DateNeededBy
                OleDbParameter objParamDateNeededBy = CreateParam(DateNeededBy.ToShortDateString(), "@DateNeededBy", DbType.String, ParameterDirection.Input);
                objCmd.Parameters.Add(objParamDateNeededBy);

                // Execute
                objCmd.CommandText = strSQLCommand;
                int RowsAffected = objCmd.ExecuteNonQuery();

                objOleCon.Close();
            }
            catch (Exception ex) { /* no exception handling here...*/}

        }
    }
}

