using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace ClassRegistrationSite
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Student.LoggedIn)
            {
                LinkButton LinkButtonMyClasses = (LinkButton)Master.FindControl("LinkButtonMyClasses");
                LinkButtonMyClasses.Visible = true;

                LinkButton LinkButtonRegister = (LinkButton)Master.FindControl("LinkButtonRegister");
                LinkButtonRegister.Visible = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DBConn.ApplicationName = "final project demo";
            DBConn.ConnectionTimeout = 30;
            SqlConnection conn = DBConn.GetSqlConnection();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblLoginFailed.Visible = false;
            try
            {
                Students students = new Students();
                Student student = students.GetStudentByLogin(tbStudentLogin.Text, tbStudentPassword.Text);

                if (student == null)
                {
                    lblLoginFailed.Text = "UserName or password is incorrect. ";
                    lblLoginFailed.Visible = true;
                }
                else
                {
                    Student.LoggedIn = true;
                    Session["Student"] = student;
                    lblLoginFailed.Visible = false;

                    Response.Redirect("MyClasses.aspx");
                }

            }
            catch (Exception ex)
            {
                lblLoginFailed.Text = "UserName or password is incorrect. ";
                lblLoginFailed.Visible = true;
            }
        }
    }
}


