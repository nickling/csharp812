<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHead" runat="server">
<%--Client Script, --%>
<script type="text/javascript">
    alert("Client Page JavaScript");
</script>

<%--Server Code,--%>
<script runat="server">
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox2.Text = "Text from the Content Page's Server Control";
    }
</script>

<%--CSS--%>
<style>
    .blueColor {
        border: medium dashed #0000FF;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderFormDiv1" runat="server">
Client Script, Server Code, CSS, Standard HTML, and Web Server Controls
    <br />
can all placed in both the Master page and Content pages.<br />
<asp:TextBox ID="TextBox2" runat="server" Width="362px"></asp:TextBox>
<asp:Button ID="Button2" runat="server" Text="Button" class="blueColor" OnClick="Button2_Click" />
<br />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderFormDiv2" runat="server">
&nbsp;View Source to see this placement!
        <hr class="blueColor" />
</asp:Content>
