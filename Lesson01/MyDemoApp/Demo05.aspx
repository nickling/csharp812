<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo05.aspx.cs" Inherits="Lesson01.Demo05" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
    <div>
       The current time is: <asp:Label ID="lblServerTime" runat="server" />
    </div>
    </form>
</body>
</html>

<!--ASP.Net also has an option to use a separate code page to help you divide the Server-side
     processing code and your Client-side processing code. -->