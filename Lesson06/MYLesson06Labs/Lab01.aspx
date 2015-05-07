<%@ Page Title="Demo02" Language="C#" MasterPageFile="~/LabSite.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script runat="server">

        class Person
        {
            public string FirstName;
            public string LastName;
          /* Note I am using a field, and not a property, to contrast creating JavaScript object later. */

            public Person(string FirstName, string LastName)
            {
                this.FirstName = FirstName;
                this.LastName = LastName;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //You can send an Object's State as a string 
            Person objP = new Person("Bob", "Smith");

            //Traditional way of sending text data          
            Response.Write(objP.FirstName + ", " + objP.LastName + "<hr/>");

            //ASP.NET way of sending text data    
            Label1.Text = objP.FirstName + ", " + objP.LastName;
            
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="When you press the button, Bob Smith will appear"></asp:Label>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
</asp:Content>
