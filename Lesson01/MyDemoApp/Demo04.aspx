
<%@ Page Language="C#" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Demo04</title>

<script runat="server">

    // this never makes it to the browser - it;s a "recipe" for the browser.
    void Page_Load()
    {
        //<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo04.aspx.cs" Inherits="MyDemoApp.Demo04" %>
        //disabling this since it looks for the code behind page
        
        //ASP.NET code uses a Script tag just like JavaScript, but it must include:
        //The runat=”server” attribute
        //A directive stating the page is using C# 
        //An asp: namespace for an ASP.NET tag; this is not standard HTML 

        lblServerTime.Text = DateTime.Now.ToString();
    }

</script>
</head>
<body>
    <form id="form1">
    <div>
       The current time is: <asp:Label ID="lblServerTime" runat="server" />
    </div>
    </form>
</body>
</html>

