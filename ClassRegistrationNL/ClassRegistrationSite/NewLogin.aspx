<%@ Page Title="" Language="C#" MasterPageFile="~/ClassRegistrationSite.Master" AutoEventWireup="true" CodeBehind="NewLogin.aspx.cs" Inherits="ClassRegistrationSite.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
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

        #MainWindow_Button1{
        margin-left: 120px;
        margin-right: 15px;
        min-width: 130px;
        }

        br{
        clear: left;
        }
    </style>
    <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
    <asp:TextBox ID="txtName" runat="server" style="margin-left: 0px"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Email Address"></asp:Label>
    <asp:TextBox ID="txtEmail" runat="server" style="margin-left: 0px"></asp:TextBox>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Login Name"></asp:Label>
    <asp:TextBox ID="txtLoginName" runat="server" style="margin-left: 0px"></asp:TextBox>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Status"></asp:Label>
    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
        <asp:ListItem Value="New">New</asp:ListItem>
        <asp:ListItem Value="Reactivate">Reactivate</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <asp:Label ID="Label6" runat="server" Text="Reason For Access"></asp:Label>
    <asp:TextBox ID="txtReasonForAccess" runat="server" Height="45px" style="margin-left: 0px" Width="341px"></asp:TextBox>
    <br />
    <asp:Label ID="Label7" runat="server" Text="Date Needed By"></asp:Label>
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="75px" Width="203px">
        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
        <NextPrevStyle VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#808080" />
        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
        <SelectorStyle BackColor="#CCCCCC" />
        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
        <WeekendDayStyle BackColor="#FFFFCC" />
    </asp:Calendar>

    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
</asp:Content>
