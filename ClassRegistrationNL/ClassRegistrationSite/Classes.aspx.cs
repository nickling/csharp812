using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ClassRegistrationSite
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If Logged in, display the "Register for Classes" and "My Classes" linkbuttons.
            if (Student.LoggedIn)
            {
                LinkButton LinkButtonMyClasses = (LinkButton)Master.FindControl("LinkButtonMyClasses");
                LinkButtonMyClasses.Visible = true;

                LinkButton LinkButtonRegister = (LinkButton)Master.FindControl("LinkButtonRegister");
                LinkButtonRegister.Visible = true;
            }
            GridView1.DataSource = null;
            Student student = (Student)(Session["Student"]);
            Students students = new Students();
            DataTable dt = students.GetClasses();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}