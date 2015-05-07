<%@ Page Language="C#" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <script runat="server"> 
 
     //It may seem odd, but you can actually use and ASP.NET page for both content (view) and processing (controller).
     //Next lesson we will see how this is normally placed in a Web Service .asmx code page.
     [System.Web.Services.WebMethod]
     public static string GetServerOutput()
     {
         System.Threading.Thread.Sleep(10);
         return DateTime.Now.ToLongTimeString();
     }
 </script>

    <script src="Scripts/jquery-2.1.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#Button1").click(function () {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    url: "06SamePageWebService.aspx/GetServerOutput",
                    success: function (data) {
                        $("#spanResults").html(data.d);
                    },
                    error: function () {
                        alert("The call to the web service failed.");
                    }
                })
            });
        }); //end ready

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input id="Button1" type="button" value="Button1" />
        <br />
        <br />
        <span id="spanResults"></span>
    </div>
    </form>
</body>
</html>
