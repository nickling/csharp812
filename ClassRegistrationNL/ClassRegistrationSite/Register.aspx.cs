using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ClassRegistrationSite
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label3.Visible = false;

            LinkButton LinkButtonMyClasses = (LinkButton)Master.FindControl("LinkButtonMyClasses");
            LinkButtonMyClasses.Visible = true;

            LinkButton LinkButtonRegister = (LinkButton)Master.FindControl("LinkButtonRegister");
            LinkButtonRegister.Visible = true;
            
            PopulateGridView();
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            Label2.Text = "";
            try
            {
                Student student = (Student)(Session["Student"]);
                Students students = new Students();
                students.InsClassStudent(student.StudentId, int.Parse(DropDownList1.SelectedValue.ToString()));
                PopulateGridView();
            }
            catch(Exception ex)
            {
                Label3.Visible = true;
                Label3.Text = "You have already registered for this class";
            }
        }
        private void PopulateGridView()
        {
            GridView1.DataSource = null;
            // Curr Student
            Student student = (Student)(Session["Student"]);
            Students students = new Students();
            DataTable dt = students.GetMyClasses(student.StudentId);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}