<%@ Page Language="C#" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Demo07c</title>
    <script runat="server">
        void Page_Load(object sender, System.EventArgs e)
        {
            string strData = Request.Form["DataFromText2"];
            Response.Write("<h1><span style=\"color:Red\">" + strData + "</span></h1>");
        } 
    </script>
</head>
<body>
    This page will not display anything until another page sends <i>this page</i> some data using an HTTP Post!
</body>
</html>
