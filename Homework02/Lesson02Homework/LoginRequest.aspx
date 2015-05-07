<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginRequest.aspx.cs" Inherits="Lesson02Homework.LoginRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Request Page</title>
    <style type="text/css">
        .style1 {
            background-color: #CCFFCC;
        }
        #form1 {
            background-color: rgba(51, 102, 153, 0.5);
        }
    </style>
</head>
<body>
    <p class="style1">
        In this home work you are asked to collect data login data from a user and write
        it to a text file on the web server. Once that is working you need to add at least one CSS3 and one HTML5 feature to the page. Finally you must create a Google Blog that document what you did. </p>
    <p>Example:</p>

    <form id="form1" runat="server">
    <div>
        <div>
            <asp:Label ID="LabelName" runat="server" Text="Name"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LabelEmailAddress" runat="server" Text="EmailAddress"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBoxEmailAddress" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LabelLoginName" runat="server" Text="LoginName"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBoxLoginName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LabelReason" runat="server" Text="Reason for access?"></asp:Label>
            &nbsp;<br />
            <asp:TextBox ID="TextBoxReason" runat="server" Height="161px" Width="553px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" Width="203px" />
            <br />
            <br />
            <asp:Label ID="LabelInfo" runat="server" Text="A Password will be sent to you once a staff member has manually gone over your request"></asp:Label>
            .</div>
        </div>
    </form>
</body>
</html>
