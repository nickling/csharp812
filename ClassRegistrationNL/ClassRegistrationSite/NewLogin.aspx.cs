using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClassRegistrationSite
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Students students = new Students();
            students.InsertNewLogin(txtName.Text, txtEmail.Text, txtLoginName.Text, RadioButtonList1.SelectedValue.ToString(), txtReasonForAccess.Text, Calendar1.SelectedDate);
        }
    }
}