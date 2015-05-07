<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
       string strData = TextBox1.Text + " " + TextBox2.Text;
       Response.Write("<hr />" + strData + "<hr />" );
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lab01</title>
<%--    <style type="text/css">
        .MyFormDiv {
            border-style: solid;
            border-color: inherit;
            border-width: 2px;
            POSITION: absolute;
            left: 50px;
            top: 50px;
            background-color: silver;
            width: 300px;
            height: 150px;
            /*New in CSS3*/
            border-radius: 25px;
            box-shadow: 10px 10px 5px #888888;
        }

        .TextBox {
            border: 2px solid;
            margin-left: 10px;
            Width: 200px;
            border-radius: 05px;
        }

        .Button {
            border: 2px solid;
            margin-left: 10px;
            Width: 280px;
            border-radius: 05px;
        }
    </style>--%>



</head>
<body class="newStyle1">
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Please login using your name and password:"></asp:Label>
        <div class="MyFormDiv">
            <br />
            &nbsp;Name:<asp:TextBox ID="TextBox1" runat="server" class="TextBox"></asp:TextBox>
            <br />
            <br />
            &nbsp;Pass:&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server" class="TextBox"></asp:TextBox>
            <br />
            <br />
            
            <asp:Button ID="Button1" runat="server" Text="Button" class="Button" OnClick="Button1_Click"  />
        </div>

    </form>
</body>
</html>
