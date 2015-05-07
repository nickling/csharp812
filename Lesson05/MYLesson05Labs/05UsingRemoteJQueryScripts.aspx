﻿<%@ Page Title="05UsingRemoteJQueryScripts.aspx" Language="C#" MasterPageFile="~/LabSite.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<%-- Here is an example from the W3Schools http://www.w3schools.com/jquery/tryit.asp?filename=tryjquery_lib_google --%>

<%-- , but this time we will do the something similar with Microsoft's CDN --%>
<script type="text/javascript" src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.1.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {

        //Inset a new click event function into the page after it is loaded.
        $("p").click(function () { $(this).hide(); });
        // [this] refers to the DOM object that fired the event
    });
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <p>
            If you click on me, I will disappear.
        </p>
        <p>
            Click me away!
        </p>
        <p>
            Click me too!
        </p>
    </div>
</asp:Content>
