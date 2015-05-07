<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo04</title>
    <style type="text/css">
        .MyFormDiv {
            border-style: solid;
            border-color: inherit;
            border-width: 2px;
            POSITION: absolute;
            left: 50px;
            top: 50px;
            background-color: #;
            width: 250px;
            height: 50px;
            /*New in CSS3*/
            border-radius: 25px;
        }
    </style>

</head>
<body class="newStyle1">
    <form id="form1" runat="server">
        <div class="MyFormDiv">
           &nbsp; <asp:Label ID="Label1" runat="server" Text="Try moving this around using Split View"></asp:Label>
        </div>
    </form>
</body>
</html>

