<%@ Page Title="" Language="C#" MasterPageFile="~/LabSite.Master" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["DataFromTextBoxes"] = TextBox1.Text;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
</asp:Content>
