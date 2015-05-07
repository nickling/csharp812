<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo08.aspx.cs" Inherits="MyDemoApp.Demo08" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Demo08</title>
    <script runat="server">
      protected void ButtonLogin_Click(object sender, EventArgs e)
      {
        //Olde, ASP, way of getting form data...Don't use response.Write.....(sort of like console.writeline, for debugging purposes.)
        string strName = Request.Form["TextBoxName"];
        string strPassword = Request.Form["TextBoxPassword"];
        Response.Write("<span style=\"color:Red\">Name: " + strName + "</span><hr/>");
        Response.Write("<span style=\"color:Red\">Password: " + strPassword + "</span>");

        //The modern ASP.NET way of getting form data ... Elegant. Standard C# Syntax
          // Object, property.
          // Not building a string here. Use Properties of the Label Object (refered by Name)
        strName = TextBoxName.Text;
        //Response.Write(strName);
        LabelInfo.Text = "Name: " + strName + "<hr/> Password: " + TextBoxPassword.Text;
        LabelInfo.ForeColor = System.Drawing.Color.Green;
      }
    </script>
    <style type="text/css">
        .style1
        {
            width: 27%;
        }

        .style2
        {
            width: 76px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <br />
    Please Login in to accessed your information.<br />
    <br />
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Label ID="LabelName" runat="server" Text="Name"></asp:Label>
            </td>
            <td>&nbsp;
            <asp:TextBox ID="TextBoxName" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="LabelPassword" runat="server" Text="Password"></asp:Label>
            </td>
            <td>&nbsp;
            <asp:TextBox ID="TextBoxPassword" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="ButtonLogin" runat="server" onclick="ButtonLogin_Click" OnClick="ButtonLogin_Click" Text="Login"
        Width="253px" />
    <br />
    <br />
    &nbsp;<asp:Label ID="LabelInfo" runat="server" Text="(Information)"></asp:Label>
    </div>
    </form>
</body>
</html>
