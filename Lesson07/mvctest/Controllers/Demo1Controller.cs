using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace mvctest.Controllers
{
    public class Demo1Controller : Controller
    {
        // Basically like a code behind page
        // you would make a view, that would make a presentation of the actions on these.
        // right click on index(), add a view. no layout.
        // no more toolbar in the view.
        // very old school...no c# code since they are not aspx pages.
        // GET: /Demo1/
        public ActionResult Index()
        {
            return View();
        }
	}
}