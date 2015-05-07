using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MYLesson06Labs
{
    [Serializable]
    public class MyGlobalClasses
    {
        public string FirstName, LastName;
        public MyGlobalClasses(string FirstName, string LastName)
        { this.FirstName = FirstName; this.LastName = LastName; }//end Constructor
    }//End Class
}
/*
 * Properties --> BUild action --> Content. Otherwise will have compilation issues.
 * 
 * MVC projects aren't Website projects, they are Web Application projects. Website 
 * projects (unless pre-compiled) are deployed with source code, and are dynamically 
 * compiled by the ASP.NET runtime. Web Application projects are built and deployed 
 * as separate stages. App_Code is a special ASP.NET folder which is compiled 
 * separately from the rest of the application. This is why the items in App_Code 
 * default to Content, so they can be deployed (source) separately of the application 
 * (which gets compiled).
 */
