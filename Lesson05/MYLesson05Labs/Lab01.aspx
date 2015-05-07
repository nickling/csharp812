<%@ Page Title="" Language="C#" MasterPageFile="~/LabSite.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
            $(document).ready(DisplayInLabel());

            function DisplayInLabel() {
                alert("JQuery is working in Lab01");
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

</asp:Content>
