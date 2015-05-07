<%@ Page Title="02WorkingWithJQuery" Language="C#" MasterPageFile="~/Lesson5Site.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <%-- This script block is specific for this single page, but uses the JQuery script reference --%>
    <script type="text/javascript">
        $(document).ready(function () { alert("This is a test"); });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol>
        <li>Download the latest version from the jQuery site. http://jquery.com/download/</li>
        <li>Add the downloaded file to your project.</li>
        <li>Add a Reference to the file in your page using the Script tag with a src attribute</li>
        <li>Add your JavaScript code to one or more script blocks.</li>
    </ol>
    * In older versions of Visual Studio you had to also download a document file for IntelliSense
</asp:Content>
