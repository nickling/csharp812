<%@ Page Title="" Language="C#" MasterPageFile="~/ClassRegistrationSite.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ClassRegistrationSite.WebForm6" %>
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

        #MainWindow_btnSelect{
        margin-left: 20px;
        margin-right: 15px;
        min-width: 130px;
        }

        br{
        clear: left;
        }
    </style>

    <asp:Label ID="Label1" runat="server" Text="Select a Class from the dropdown:"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" DataValueField="ClassId" Width="185px"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdvWebDevProjectConnectionString %>" SelectCommand="SELECT [ClassId], [ClassName] FROM [Classes]"></asp:SqlDataSource>
        
    <asp:Button ID="btnSelect" runat="server" OnClick="btnSelect_Click" Text="Register" />
    <br />
    <hr />
    <br />
    <asp:Label ID="Label2" runat="server">You are currently registered for these classes:</asp:Label>

    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" Width="800px">
        <AlternatingRowStyle BackColor="White" />
        <HeaderStyle BackColor="#2E0854" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
        <PagerStyle BackColor="#7F00FF" ForeColor="White" />
        <RowStyle BackColor="#FDF8FF" />
    </asp:GridView>
    <asp:Label ID="Label3" runat="server" ForeColor="Red">You already signed up for this class!</asp:Label>
</asp:Content>
