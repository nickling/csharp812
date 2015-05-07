using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MapPath : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string strPhyicalPath = MapPath("~/App_Data/TextFile.txt") ;
       Response.Write(strPhyicalPath );
       System.IO.StreamReader objSR;
       objSR = new System.IO.StreamReader(strPhyicalPath);
       string strData = objSR.ReadToEnd();
       objSR.Close();
       Response.Write("<hr>" + strData);
    }
}