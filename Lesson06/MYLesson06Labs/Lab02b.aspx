<%@ Language="C#" %>


<script runat="server">

    protected void Page_Load(Object sender, EventArgs e)
    {
        // If you type something into TextBox1, and open up this url, you will see this data.
        Response.Write(Session["DataFromTextBoxes"].ToString());
    }
</script>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>

</body>
</html>
