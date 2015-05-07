<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="randomwebform.aspx.cs" Inherits="MYLesson06Labs.randomwebform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="ClassName" HeaderText="ClassName" SortExpression="ClassName" />
                <asp:BoundField DataField="ClassDate" HeaderText="ClassDate" SortExpression="ClassDate" />
                <asp:BoundField DataField="ClassDescription" HeaderText="ClassDescription" SortExpression="ClassDescription" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdvWebDevProjectConnectionString %>" SelectCommand="SELECT [ClassName], [ClassDate], [ClassDescription] FROM [vClasses]"></asp:SqlDataSource>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server">
        </asp:EntityDataSource>
    </div>
    </form>
</body>
</html>
