<%@ Page Title="" Language="C#" MasterPageFile="~/LabSite.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            

            $("#<%=Label1.ClientID %>").html("This is using an ID"); 

            //4) Add code to handle the Click event and test it using an alert box.
            //$("#%Button1.ClientID %>").click(function () { 
            $("#Button1").click(function () { 
                //var strData = $('#<%=TextBox1.ClientID %>').val();
                //alert("This displays the text in TextBox1: " + strData);
                var strData = $('#<%=TextBox1.ClientID %>').val();
                //$("#<%=Label1.ClientID %>").html(strData);//This will not work as expected!
                $("#<%=Label1.ClientID %>").html($('#<%=TextBox1.ClientID %>').val()); 
            })  //end of step 4's nested function

        });     //end of document.ready function

        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    
    <asp:TextBox ID="TextBox1" runat="server" Text="Text in Textbox1"></asp:TextBox>
    <br />
    
    <%--// <!--Button runat server makes this into a submit button. -->
    <%--  <asp:Button ID="Button1" runat="server" Text="Button" ViewStateMode="Disabled" />-->  --%>
    <input type="button" id="Button1" value="Button"/>
    <br />

</asp:Content>


