using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lesson01
{
    public partial class Lab03 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Student myStudent = new Student("Kyle Smith", "someone@live.com", "image/nick.jpg");
            Response.Write(myStudent.GetHtml());

        }
    }
}