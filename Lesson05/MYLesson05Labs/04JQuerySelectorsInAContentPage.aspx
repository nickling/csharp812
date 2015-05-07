<%@ Page Title="04JQuerySelectorsInAContentPage" Language="C#" MasterPageFile="~/LabSite.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery-2.1.3.min.js" type="text/javascript"></script>
<script type="text/javascript">

    $(document).ready(function () {
        // This Anonymous function will fire once the document has completed loading in the
        //Browser and is "READY."

        //This is using the standard JQuery syntax (Which does not work!)
        $("#Label1").html("This is using the standard JQuery syntax, so it does not work. ");

        //However, using the standard JavaScript syntax does work!
        $("#ContentPlaceHolder1_Label2").html("Standard JavaScript syntax . ContentPlaceHolderID + _ + Label ID");

        // In a Content page you can also use the following syntax to access the objects.
        // it's using Response.write shorthand code %= to get the labels name
        $("#<%=Label3.ClientID%>").html("This works! This uses the response.write shorthand code: %= to get the label's name.");
});
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div>
<h1>Labels 2 and 3 are working properly</h1>
        <asp:Label ID="Label1" runat="server" Text="Label1???"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label2"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Label3"></asp:Label>
    </div>
</asp:Content>
