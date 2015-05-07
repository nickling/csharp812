<%@ Page Title="" Language="C#" MasterPageFile="~/Lesson04.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    function ClientCodeButton_Click() {
        top.resizeTo(500, 300);
        try {
            debugger;
            //ASP.NET dynamically creates a client side name for ASP.NET controls.
            document.getElementById("Label2").innerHTML = "test";
        }
        catch (e) {
            //Here is what the proper name will be.
            document.getElementById("ContentPlaceHolder1_Label2").innerHTML = e.message;
        }
        alert("Pause before trip to the server!");

    }
    function ValidateTextBox() {
        var objLabel1 = null;
        var objTextBox1 = "";
        var blnReturn = true;

        objLabel1 = document.getElementById("ContentPlaceHolder1_Label2");
        objLabel1.innerHTML = "The textbox is not empty";
        strText = document.getElementById("ContentPlaceHolder1_SQLTextBox").value;

        try {
            if (strText == "") throw "The textbox cannot be Empty";
        }
        catch (ex) {
            objLabel1.innerHTML = "Input Error: " + ex.toString();
            blnReturn = false;// This will stop the Submit to the server
        }
        return blnReturn;
    }

</script>

<script runat="server">
    protected void ServerCodeButton_Click(object sender, EventArgs e)
    {
        System.Data.OleDb.OleDbConnection objOleCon;
        objOleCon = new System.Data.OleDb.OleDbConnection();
        System.Data.OleDb.OleDbCommand objCmd;
        objCmd = new System.Data.OleDb.OleDbCommand();

        try
        {   //1. Make a Connection
            string strOledbConnection = @"Provider=SQLOLEDB;
                                Data Source=(local);
                                Integrated Security=SSPI;
                                Initial Catalog=Master";
            objOleCon.ConnectionString = strOledbConnection;
            objOleCon.Open();

            //2. Issue a Command
            objCmd.Connection = objOleCon;
            //objCmd.CommandText = "Select Count(*) From Sys.Databases";
            objCmd.CommandText = SQLTextBox.Text;
            int intOrderCount = (int)objCmd.ExecuteScalar();

            //3. Process the Results
            Label1.Text += "<b>" + intOrderCount.ToString() + "</b>";
        }
        catch (Exception ex) { Label1.Text += "<b>" + ex.ToString() + "</b>"; }
        finally { objOleCon.Close(); } //4. Run clean up code
    }
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>
    You can copy paste this into the textbox: Select Count(*) From Sys.Databases
    <br />
    <asp:Button ID="ServerCodeButton" runat="server" Text="Server Code" 
        OnClick="ServerCodeButton_Click" />&nbsp;
    <asp:TextBox ID="SQLTextBox" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label1" runat="server" Text="The Number of Databases is: "
        Style="font-size: large"></asp:Label>
    <br />
    <asp:Button ID="ClientCodeButton" runat="server" Text="Client Code" 
        OnClientClick="return ValidateTextBox()" />&nbsp;
    <br />
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
</div>
</asp:Content>
