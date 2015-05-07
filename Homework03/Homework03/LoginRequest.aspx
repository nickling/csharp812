<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginRequest.aspx.cs" Inherits="Homework03.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>This is the Login Request Page</p>
    <asp:Label ID="LblUsername" runat="server" Text="Username:"></asp:Label>
    <asp:TextBox ID="TbUsername" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="LblPassword" runat="server" Text="Password:"></asp:Label>
    <asp:TextBox ID="TBPassword" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Submit" />
</asp:Content>
