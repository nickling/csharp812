<%@ Page Title="" Language="C#" MasterPageFile="~/ClassRegistrationSite.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ClassRegistrationSite.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainWindow" runat="server">
    <style type="text/css">
        span{
        float: left;
        width: 120px;
        font-weight: bold;
        }

        input{
        width: 190px;
        margin-bottom: 5px;
        }

        #MainWindow_btnLogin{
        margin-left: 120px;
        margin-right: 15px;
        margin-top: 5px;
        min-width: 130px;
        }

        br{
        clear: left;
        }
    </style>

    <asp:Label ID="Label1" runat="server" Text="Student Login"></asp:Label>
    <asp:TextBox ID="tbStudentLogin" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="tbStudentPassword" runat="server"></asp:TextBox>

    <br />
    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />

    <asp:LinkButton href="NewLogin.aspx" ID="LinkButton7" runat="server">Create new Login</asp:LinkButton>
    <asp:Label ID="lblLoginFailed" runat="server" Visible="False"></asp:Label>


</asp:Content>
