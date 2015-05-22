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
        objCmd = new System.Data.OleDb.OleDbCommand("Select ProductID, ProductName From [Northwind].[dbo].[Products]", objOleCon);

        //3. Commands multiple Results - Process the results
        System.Data.OleDb.OleDbDataReader objDR;
        try
        {
            objDR = objCmd.ExecuteReader();
            Label1.Text = "<p>Multiple Results</p>";
            while (objDR.Read() == true)
            {
                Label1.Text += "<p>"
                    + objDR["ProductID"].ToString() + ", " + objDR["ProductName"].ToString()
                    + @"</p>";
            }
            objDR.Close();
        }
        catch (Exception ex)
        {
            Label1.Text = ex.ToString();
        }

        
        
        
        
        
        
        
        //3. Process the Results (if any)
        //Label1.Text = "<p>Number of items: " + intOrderCount.ToString() + "</p>";

        //4. Free up resources
        objOleCon.Close();
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>

