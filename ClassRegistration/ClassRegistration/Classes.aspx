<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Classes.aspx.cs" Inherits="ClassRegistration.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>This is the Classes Page</p>
    <!-- This will require making some calls to the backend page. We will need to review postbacks and sessions
        upon doing so, we can write the code to call stored procedures, which there may be an example in #5
        -->
        <div style="font-size: xx-large; color: #000000;">
        Our Current Classes</div>
    <p style="font-size: medium; color: #333333;">&nbsp;Please review our most current classes below. </p>

    <asp:GridView ID="GridViewClassList" runat="server" AutoGenerateColumns="False" 
    CellPadding="3" DataKeyNames="ClassId" DataSourceID="SqlDataSource1" 
        GridLines="None" BackColor="White" BorderColor="White" BorderStyle="Ridge" 
        BorderWidth="2px" CellSpacing="1" >
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="ClassId" HeaderText="Item" ReadOnly="True" 
                SortExpression="ClassId" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ClassName" HeaderText="Class" 
                SortExpression="ClassName" />
            <asp:BoundField DataField="ClassDate" HeaderText="Date" 
                SortExpression="ClassDate" DataFormatString="{0:d}" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ClassDescription" HeaderText="Description" 
                SortExpression="ClassDescription" >
            <ItemStyle Width="300px" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="Maroon" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" BorderColor="Black" 
            BorderStyle="Solid" BorderWidth="2px" />
        <SelectedRowStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
<br />
<asp:Button ID="ButtonRegisterClass" runat="server" 
    onclick="ButtonRegisterClass_Click" Text="Register for Selected Class" 
    Width="332px" />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:AdvWebProjectConnectionString %>" 
    ProviderName="<%$ ConnectionStrings:AdvWebProjectConnectionString.ProviderName %>" 
    
        SelectCommand="SELECT [ClassId], [ClassName], [ClassDate], [ClassDescription] FROM [vClasses]" 
        CacheDuration="180" EnableCaching="True">
</asp:SqlDataSource>
</asp:Content>