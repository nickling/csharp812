<%@ Page Title="Demo 04" Language="C#" MasterPageFile="~/Lesson06Site.Master" Trace="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script runat="server">
    
    [Serializable]
    class Person {
        public string FirstName, LastName;
        public Person(string FirstName, string LastName)
        { this.FirstName = FirstName; this.LastName = LastName; }//end Constructor
    }//End Class

    protected void Button1_Click(object sender, EventArgs e) {
        ViewState["objP"] = new Person("Bob", "Smith");
        string strData = ((Person)ViewState["objP"]).FirstName;
        strData += "," + ((Person)ViewState["objP"]).LastName;
        HiddenField1.Value = strData;
        Response.Write(strData);
        Response.Write("<hr/>"); }//end Button1_Click()
</script>
<%-- Adding Microsoft's CDN  --%>
<script type="text/javascript" src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    //I will use this script block is for my Client Event Handling
    function ClientCodeButton_Click() {
        //Let's get a reference to Lable1
        var objLabel1 = document.getElementById("ContentPlaceHolder1_Label1");

        //Now let's work with the HiddenField to get the Person's Data!
        //Get String data from Hidden Field
        var strData = (document.getElementById("ContentPlaceHolder1_HiddenField1")).value;
        //Use the String data
        if (strData != "") {
            objLabel1.innerHTML = strData;
            alert(strData + "\n" + "Note how the Server values overwrite the Client values on PostBack!");
        }
    }

    //IMPORTANT:
    // If you want the data to persist you need to store it somewhere the client can re-access it
    // or not use code in that works with a PostBack, such as the $(document).ready(function (){}) 
    /**** Uncomment this section to see an example! ****/
    //$(document).ready(function () {
    //    var objLabel1 = document.getElementById("ContentPlaceHolder1_Label1");
    //    var strData = (document.getElementById("ContentPlaceHolder1_HiddenField1")).value;
    //    objLabel1.innerHTML = strData;
    //})
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Click This Button Twice"
        AutoPostBack="false"
        OnClientClick="ClientCodeButton_Click()" OnClick="Button1_Click" /><br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:HiddenField ID="HiddenField1" runat="server" />
</asp:Content>
