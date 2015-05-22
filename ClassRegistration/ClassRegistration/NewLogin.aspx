<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewLogin.aspx.cs" Inherits="ClassRegistration.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>This is the NewLogin Page</p>

    <div>

        &nbsp;&nbsp;&nbsp;

        <asp:Label ID="LabelName" runat="server" Text="Name"></asp:Label>
        &nbsp;<asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBoxName" Display="Dynamic" 
            ErrorMessage="You must enter your Name"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
            ControlToValidate="TextBoxName" Display="Dynamic" 
            ErrorMessage="Only use characters without numbers, please" 
            ToolTip="Only use characters without numbers, please" 
            ValidationExpression="[a-z A-Z]*"></asp:RegularExpressionValidator>
        <br />
        &nbsp;&nbsp;
        <asp:Label ID="LabelEmailAddress" runat="server" Text="EmailAddress"></asp:Label>
        &nbsp;<asp:TextBox ID="TextBoxEmailAddress" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="TextBoxEmailAddress" Display="Dynamic" 
            ErrorMessage="You must enter your Email Address"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="TextBoxEmailAddress" Display="Dynamic" 
            ErrorMessage="Not a valid email address" 
            ToolTip="&quot;Customer@MyWebApp.com&quot;" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        &nbsp;&nbsp;
        <asp:Label ID="LabelLoginName" runat="server" Text="LoginName"></asp:Label>
        &nbsp;<asp:TextBox ID="TextBoxLoginName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="TextBoxLoginName" Display="Dynamic" 
            ErrorMessage="You must enter your a Login Name"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="TextBoxLoginName" Display="Dynamic" 
            ErrorMessage="Use at least one least one letter and one digit" 
            ToolTip="Use at least one least one letter and one digit" 
            ValidationExpression="[a-z A-Z]+[0-9]+"></asp:RegularExpressionValidator>
        <br />
        &nbsp;
        <asp:RadioButton ID="RadioButtonNew" runat="server" Text="New Login" 
            CssClass="style2" GroupName="LoginType" />
        &nbsp;<asp:RadioButton ID="RadioButtonReactivate" runat="server" Text="Reactivate Login" 
            CssClass="style1" Checked="True" GroupName="LoginType" />
        <br />
        &nbsp;&nbsp;
        <asp:Label ID="LabelReason" runat="server" Text="Reason for access?"></asp:Label>
        &nbsp;<br />
        &nbsp;&nbsp;
        <asp:TextBox ID="TextBoxReason" runat="server" Height="79px" Width="712px"></asp:TextBox>
         <br />
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="TextBoxReason" Display="Dynamic" 
            ErrorMessage="You must enter a Reason you need access"></asp:RequiredFieldValidator>
        <br />
        <span class="style3">&nbsp; Date needed by:</span><br />
        <asp:Calendar ID="Calendar1" runat="server" BackColor="Silver" 
            BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
            Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="243px" 
            ShowGridLines="True" Width="738px">
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
            <OtherMonthDayStyle ForeColor="#CC9966" />
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
            <SelectorStyle BackColor="#FFCC66" />
            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                ForeColor="#FFFFCC" />
            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        </asp:Calendar>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            style="background-color: #FF9999" />
        <asp:Label ID="LabelInfo" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Button ID="ButtonSubmitRequest" runat="server" Text="Submit Request" Width="203px"
            OnClick="ButtonSubmitRequest_Click" />
        <br />
        <br />
    </div>

</asp:Content>