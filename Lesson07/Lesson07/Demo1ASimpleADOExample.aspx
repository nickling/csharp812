<%@ Page Language="C#" %>
<!DOCTYPE html>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        //1. Make a Connection
        System.Data.OleDb.OleDbConnection objOleCon;
        objOleCon = new System.Data.OleDb.OleDbConnection();
        // provider = driver.
        //data Source=localhost, .
        // Catalog=collection of data
        string strOledbConnection = @"Provider=SQLOLEDB;Data Source=(local);Integrated Security=SSPI;Initial Catalog=NorthWind";
        objOleCon.ConnectionString = strOledbConnection;
        objOleCon.Open();

        //2. Issue a Command
        System.Data.OleDb.OleDbCommand objCmd;
        objCmd = new System.Data.OleDb.OleDbCommand("Select Count(*) From Orders", objOleCon);
        int intOrderCount = (int)objCmd.ExecuteScalar();

        //3. Process the Results (if any)
        Label1.Text = "<p>Number of items: " + intOrderCount.ToString() + "</p>";

        //4. Free up resources
        objOleCon.Close();
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
