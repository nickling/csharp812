using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.OleDb;


namespace ClassRegistration
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        Boolean blnDateSelected = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack != true)
            {
                Calendar1.SelectedDate = DateTime.Today;
            }
        }

        protected void ButtonSubmitRequest_Click(object sender, EventArgs e)
        {

            if (Page.IsValid && Calendar1.SelectedDate != null)
            {
                try
                {
                    //1. Make a Connection
                    System.Data.OleDb.OleDbConnection objOleCon;
                    objOleCon = new System.Data.OleDb.OleDbConnection();
                    objOleCon.ConnectionString = @"Provider=SQLOLEDB;Data Source=(local);Integrated Security=SSPI;Initial Catalog=AdvWebDevProject";
                    objOleCon.Open();

                    //2. Issue a Command
                    System.Data.OleDb.OleDbCommand objCmd;
                    objCmd = new System.Data.OleDb.OleDbCommand();
                    objCmd.Connection = objOleCon;

                    #region New Verion With Sproc.
                    objCmd.CommandType = System.Data.CommandType.StoredProcedure;

                    //3. Process the Results
                    //Using the same connection, change the SQL code and execute another command.
                    string strSQLCommand = @"pInsLoginRequest";

                    //@Name ,
                    OleDbParameter objParamName = new OleDbParameter();
                    objParamName.Direction = System.Data.ParameterDirection.Input;
                    objParamName.DbType = System.Data.DbType.String;
                    objParamName.ParameterName = "@Name";
                    objParamName.Value = TextBoxName.Text;
                    objCmd.Parameters.Add(objParamName);

                    //@EmailAddress,
                    OleDbParameter objParamEmailAddress = new OleDbParameter();
                    objParamEmailAddress.Direction = System.Data.ParameterDirection.Input;
                    objParamEmailAddress.DbType = System.Data.DbType.String;
                    objParamEmailAddress.ParameterName = "@EmailAddress";
                    objParamEmailAddress.Value = TextBoxEmailAddress.Text;
                    objCmd.Parameters.Add(objParamEmailAddress);

                    //@LoginName,
                    OleDbParameter objParamLoginName = new OleDbParameter();
                    objParamLoginName.Direction = System.Data.ParameterDirection.Input;
                    objParamLoginName.DbType = System.Data.DbType.String;
                    objParamLoginName.ParameterName = "@LoginName";
                    objParamLoginName.Value = TextBoxLoginName.Text;
                    objCmd.Parameters.Add(objParamLoginName);

                    //@NewOrReactivate,
                    OleDbParameter objParamNewOrReactivate = new OleDbParameter();
                    objParamNewOrReactivate.Direction = System.Data.ParameterDirection.Input;
                    objParamNewOrReactivate.DbType = System.Data.DbType.String;
                    objParamNewOrReactivate.ParameterName = "@NewOrReactivate";
                    objParamNewOrReactivate.Value = (RadioButtonNew.Checked == true ? "New" : "Reactivate");
                    objCmd.Parameters.Add(objParamNewOrReactivate);

                    //@ReasonForAccess,
                    OleDbParameter objParamReasonForAccess = new OleDbParameter();
                    objParamReasonForAccess.Direction = System.Data.ParameterDirection.Input;
                    objParamReasonForAccess.DbType = System.Data.DbType.String;
                    objParamReasonForAccess.ParameterName = "@ReasonForAccess";
                    objParamReasonForAccess.Value = TextBoxReason.Text;
                    objCmd.Parameters.Add(objParamReasonForAccess);

                    //@DateNeededBy
                    OleDbParameter objParamDateNeededBy = new OleDbParameter();
                    objParamDateNeededBy.Direction = System.Data.ParameterDirection.Input;
                    objParamDateNeededBy.DbType = System.Data.DbType.String;
                    objParamDateNeededBy.ParameterName = "@DateNeededBy";
                    objParamDateNeededBy.Value = Calendar1.SelectedDate.ToShortDateString();
                    objCmd.Parameters.Add(objParamDateNeededBy);

                    #endregion


                    Response.Write(strSQLCommand);//TODO: Remove after testing.
                    objCmd.CommandText = strSQLCommand;
                    int RowsAffected = objCmd.ExecuteNonQuery(); // Ex. Inserts, Updates, Deletes SQL commands

                    //4. Run Clean up code
                    objOleCon.Close();

                    //Reset the UI
                    TextBoxName.Text = "";
                    TextBoxEmailAddress.Text = "";
                    TextBoxLoginName.Text = "";
                    TextBoxReason.Text = "";
                    TextBoxName.Focus();
                    LabelInfo.Text = "";
                    //LabelInfo.Text += "Request Received. Thank You!<br/>";
                    //LabelInfo.Text += "A Password will be sent to you once our staff have manually gone over your request";
                    //LabelInfo.BackColor = System.Drawing.Color.LightGreen;

                    Response.Redirect(@"Classes.aspx");
                }
                catch (Exception ex) //TODO: Remove ex after testing.
                {
                    LabelInfo.Text = ex.ToString(); //TODO: Remove after testing.
                    //LabelInfo.Text = "Server Error. Please try again in a moment";
                    LabelInfo.BackColor = System.Drawing.Color.LightSalmon;
                }
            }//end of if
        }//end of method
    }
}


