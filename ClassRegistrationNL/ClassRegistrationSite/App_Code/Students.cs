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
        public Student GetStudentByLogin(string Login, string Password)
        {
            Student s = null;
            using (SqlConnection conn = DBConn.GetSqlConnection())
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {

                    cmd.CommandText = "select * from Students where StudentLogin = '" + Login + "' and StudentPassword='" + Password + "'";
                    SqlDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    try
                    {
                        //StudentId = Int32.Parse(reader["StudentId"].ToString());
                        //if (Int32.TryParse(reader["StudentId"].ToString(), out result))
                        if (reader.Read())
                        {
                            s = new Student();
                            s.Load(reader);
                            int val = s.StudentId;
                        }
                    }
                    catch (Exception ex)
                    {

                    }
                }
            }
            return s;
            /*
            System.Data.SqlClient.SqlConnection objCon;
            objCon = new System.Data.SqlClient.SqlConnection();
            objCon.ConnectionString = @"Data Source=(local);Initial Catalog=AdvWebDevProject;Integrated Security=True;";

            System.Data.SqlClient.SqlCommand objCmd;
            objCmd = new System.Data.SqlClient.SqlCommand();
            objCmd.Connection = objCon;
            objCmd.CommandType = System.Data.CommandType.StoredProcedure;

            //sproc name
            objCmd.CommandText = "pSelLoginIdByLoginAndPassword";


            System.Data.SqlClient.SqlParameter objRC;
            objRC = new System.Data.SqlClient.SqlParameter();
            objRC.ParameterName = "@RC";
            objRC.SqlDbType = System.Data.SqlDbType.Int;
            objRC.Direction = System.Data.ParameterDirection.ReturnValue;
            objCmd.Parameters.Add(objRC);

            System.Data.SqlClient.SqlParameter objStudentLogin;
            objStudentLogin = new System.Data.SqlClient.SqlParameter();
            objStudentLogin.ParameterName = "@StudentLogin";
            objStudentLogin.SqlDbType = System.Data.SqlDbType.NVarChar;
            objStudentLogin.Size = 50;
            objStudentLogin.Direction = System.Data.ParameterDirection.Input;
            objStudentLogin.Value = Login;
            objCmd.Parameters.Add(objStudentLogin);

            System.Data.SqlClient.SqlParameter objStudentPassword;
            objStudentPassword = new System.Data.SqlClient.SqlParameter();
            objStudentPassword.ParameterName = "@StudentPassword";
            objStudentPassword.SqlDbType = System.Data.SqlDbType.NVarChar;
            objStudentPassword.Size = 50;
            objStudentPassword.Direction = System.Data.ParameterDirection.Input;
            objStudentPassword.Value = Password;
            objCmd.Parameters.Add(objStudentPassword);

            System.Data.SqlClient.SqlParameter objStudentID;
            objStudentID = new System.Data.SqlClient.SqlParameter();
            objStudentID.ParameterName = "@StudentId";
            objStudentID.SqlDbType = System.Data.SqlDbType.Int;
            objStudentID.Direction = System.Data.ParameterDirection.Output;
            objCmd.Parameters.Add(objStudentID);

            Student s = null;
            try
            {
                objCon.Open();
                SqlDataReader reader = objCmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                int retval = (int)objCmd.Parameters["@StudentId"].Value;
                if (retval != null)
                {
                    s = new Student();
                    s.Load(reader);
                }


            }
            finally
            {
                objCon.Close();
            }

            */

            /*
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
            
            //@StudentLogin
            OleDbParameter objParamStudentLogin = CreateParam(Login, "@StudentLogin", DbType.String, ParameterDirection.Input);
            objCmd.Parameters.Add(objParamStudentLogin);

            //@StudentPassword
            OleDbParameter objParamStudentPassword = CreateParam(Password, "@StudentPassword", DbType.String, ParameterDirection.Input);
            objCmd.Parameters.Add(objParamStudentPassword);

            //@StudentID
            OleDbParameter objParamStudentID = CreateParam("@StudentId", DbType.Int32, ParameterDirection.Output);
            objCmd.Parameters.Add(objParamStudentID);
            
            Student s = null;
            // Execute
            try
            {
                objCmd.CommandText = strSQLCommand;
                OleDbDataReader rdr = objCmd.ExecuteReader();
                //int studentID = Int32.Parse(rdr["StudentId"].ToString());
                //if (studentID != null)
                //{
                    s = new Student();
                    s.Load(rdr);
                //}
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                objOleCon.Close();
            }

            */
            /*
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
             * */

        }

        public DataTable GetClasses()
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = DBConn.GetSqlConnection())
            {
                using (SqlCommand cmd = conn.CreateCommand())
                {

                    cmd.CommandText = "SELECT ClassId, ClassName, ClassDate, ClassDescription FROM vClasses";
                    SqlDataAdapter DataAdaptor = new SqlDataAdapter(cmd);
                    DataAdaptor.Fill(dt);
                }
            }
            return dt;
        }

        public DataTable GetMyClasses(int StudentId)
        {
            DataTable table = new DataTable();
            using (var con = DBConn.GetSqlConnection())
            using (var cmd = new SqlCommand("pSelClassesByStudentID", con))
            using (var da = new SqlDataAdapter(cmd))
            {
                // need to add parametr.
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@StudentId", SqlDbType.Int)).Value = StudentId;
        

                da.Fill(table);
            }
            return table;          
        }

        public void InsClassStudent(int StudentId, int ClassId)
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
                string strSQLCommand = @"pInsClassStudents";

                //@ClassId
                OleDbParameter objParamClassID = CreateParam(ClassId, "@ClassId", DbType.Int32, ParameterDirection.Input);
                objCmd.Parameters.Add(objParamClassID);

                //@StudentId
                OleDbParameter objParamStudentID = CreateParam(StudentId, "@StudentId", DbType.String, ParameterDirection.Input);
                objCmd.Parameters.Add(objParamStudentID);

                // Execute
                try
                {
                    objCmd.CommandText = strSQLCommand;
                    int RowsAffected = objCmd.ExecuteNonQuery();
                }
                catch
                {
                    throw;
                }
                finally
                {
                    objOleCon.Close();
                }
            }
            catch (Exception ex) { /* no exception handling here...*/}

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

        private OleDbParameter CreateParam(int Value, String ParameterName, DbType DbType, ParameterDirection Direction)
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
                try
                {
                    objCmd.CommandText = strSQLCommand;
                    int RowsAffected = objCmd.ExecuteNonQuery();
                }
                catch
                {
                    throw;
                }
                finally
                {
                    objOleCon.Close();
                }
            }
            catch (Exception ex) { /* no exception handling here...*/}

        }
    }
}

