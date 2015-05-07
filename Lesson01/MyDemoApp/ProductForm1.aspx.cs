using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyDemoApp
{
    public partial class ProductForm1 : System.Web.UI.Page
    {
        private void Page_Load(object sender, EventArgs e)
        {
            Product saleProduct = new Product("Kitchen Garbage", 49.99M, "image/trashcan.jpg");
            Response.Write(saleProduct.GetHtml());
            // if you put this on the aspx page, you will need to change Product class back to Properties --> Build Action --> Content.
            // only if you take away the codebehind attr in the page directive.
        }
    }
}