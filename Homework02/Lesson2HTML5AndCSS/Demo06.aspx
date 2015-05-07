<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Demo06</title>
    <script runat="server">
    protected void Button1_Click(object sender, EventArgs e)
    {
        //NOTE: You must create the app data folder and text file for this to work!
        string strPhyicalPath = MapPath("~/App_Data/TextFile1.txt");
        Response.Write(strPhyicalPath);
        System.IO.StreamReader objSR;
        objSR = new System.IO.StreamReader(strPhyicalPath);
        string strData = objSR.ReadToEnd();
        objSR.Close();

        //Show the data on the page for testing!
        Response.Write("<hr />" + strData + "<hr />");
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
