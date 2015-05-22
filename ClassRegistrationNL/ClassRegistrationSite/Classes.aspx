<%@ Page Title="" Language="C#" MasterPageFile="~/ClassRegistrationSite.Master" AutoEventWireup="true" CodeBehind="Classes.aspx.cs" Inherits="ClassRegistrationSite.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainWindow" runat="server">

    <asp:Label ID="Label2" runat="server">These classes are currently available.</asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ClassId" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" Width="800px">
        <Columns>
            <asp:BoundField DataField="ClassId" HeaderText="ClassId" ReadOnly="True" SortExpression="ClassId" />
            <asp:BoundField DataField="ClassName" HeaderText="ClassName" SortExpression="ClassName" />
            <asp:BoundField DataField="ClassDate" HeaderText="ClassDate" SortExpression="ClassDate" />
            <asp:BoundField DataField="ClassDescription" HeaderText="ClassDescription" SortExpression="ClassDescription" />
        </Columns>
        <AlternatingRowStyle BackColor="White" />
        <HeaderStyle BackColor="#2E0854" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
        <PagerStyle BackColor="#7F00FF" ForeColor="White" />
        <RowStyle BackColor="#FDF8FF" />
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdvWebDevProjectConnectionString %>" SelectCommand="SELECT * FROM [Classes]"></asp:SqlDataSource>
</asp:Content>
