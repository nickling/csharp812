<%@ Page Language="C#" %>

<!DOCTYPE html>
<!--MIxing client and server side code. Notice that the body contains the onload event attr.-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo06</title>
    <script type="text/javascript">

        function startTime() {
            document.getElementById('spanNowClt').innerHTML = new Date();
        }

    </script>
    <script runat="server">

        void Page_Load()
        {
            spanNowSvr.InnerText = DateTime.Now.ToLocalTime().ToLongTimeString();
        }    
    
    </script>

</head>
<body onload="startTime()">
    <form id="form1" runat="server"> <!--make sure available for serverside code. server doesn't have access to DOM, so must specify this..-->
        <div>
            <p>
                Client Code: <span id="spanNowClt" /><br /> <!--Doesn't have the runat="server" tag-->
            </p>
            <p>
                Server Code: <span id="spanNowSvr" runat="server" /><br />
            </p>
        </div>
    </form>
</body>
</html>
