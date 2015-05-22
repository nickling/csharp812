<%@ Page Language="C#" %>
<!DOCTYPE html>
<script runat="server">
void btnSubmit_Click(Object sender, EventArgs e)
{
    if (Page.IsValid) //For this property to return true, all validation server controls in the current validation group must validate successfully. -- MS Help
    {
        lblResult.Text = @"<br />Product: " + txtProductName.Text
         		+ "<br />Quantity: " + txtProductQuantity.Text;
    }
}
</script>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>Order Form</title>
<style type="text/css">
    .style1 { width: 249px; height: 225px; }
</style>
</head>

<body>
<form id="form1" runat="server">
<div>
<%--Draws a box around the text and other elements that the field set contains. -- MS Help --%>
&nbsp;<fieldset> 
<%-- Inserts a caption into the box drawn by the fieldSet object. -- MS Help --%>
<legend>Product Order Form</legend>  
 

<asp:Label
    id="lblProductName"
    Text="Product Name:"
    AssociatedControlID="txtProductName"
    Runat="server" />
<br />
<asp:TextBox
    id="txtProductName"
    Runat="server" />

<%-- Use a Validation control to make an input control a required field. The input control fails validation if its value does not change from the InitialValue property upon losing focus. -- MS Help --%>
    <asp:RequiredFieldValidator
        id="reqProductName"
        ControlToValidate="txtProductName"
        Text="(Required)"
        Runat="server" />
<br />
<br />

<asp:Label
    id="lblProductQuantity"
    Text="Product Quantity:"
    AssociatedControlID="txtProductQuantity"
    Runat="server" />
<%-- http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.label.associatedcontrolid%28v=vs.110%29.aspx --%>
<br />        
<asp:TextBox
    id="txtProductQuantity"
    Columns="5"
    Runat="server" /> 

<%-- http://msdn.microsoft.com/en-us/library/bwd43d0x(v=vs.100).aspx --%>
<asp:RequiredFieldValidator
    id="reqProductQuantity"
    ControlToValidate="txtProductQuantity"
    Text="(Required)"
    Display="Dynamic"
    Runat="server" />
<asp:CompareValidator
    id="CompareValidator1"
    ControlToValidate="txtProductQuantity"
    Text="(Invalid Quantity)"
    Operator="DataTypeCheck"
    Type="Integer"
    Runat="server" />
<br /><br />
    
<asp:Button
    id="btnSubmit"
    Text="Submit Product Order"
    OnClick="btnSubmit_Click" 
    Runat="server" />
</fieldset>

<asp:Label
    id="lblResult"
    Runat="server" />
    <p>
In a typical order form you would have several text boxes needing validation code. 
Microsoft includes ASP controls just for this.<br />
    <img alt="" class="style1" src="ValidationControlsInTheToolbox.jpg" /><br />
    </p>
</div>
</form>
</body>
</html>
