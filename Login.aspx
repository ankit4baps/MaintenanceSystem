<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/StyleSheet.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 31%;
            margin-left: 35%;
            border-color: Red;
            border-width: 2px;
            border-style: solid;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #000080; font-family: 'Times New Roman', Times, serif; font-size: xx-large; font-weight: bolder; color: #FFFFFF; text-align: center;">
    
        Kemrock Industries &amp; Exports Ltd.</div>

    <table class="style1">
        <tr>
            <td colspan="2" 
                style="text-align: center; font-size: x-large; color: #008000; font-weight: bolder">
                Login</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right; color: #800080; font-weight: bolder;">
                User Name:</td>
            <td>
                <asp:TextBox ID="txtunm" runat="server" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtunm" ErrorMessage="*" Font-Bold="False" 
                    ValidationGroup="a"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; color: #800080; font-weight: bolder;">
                Password:</td>
            <td>
                <asp:TextBox ID="txtpass" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtpass" ErrorMessage="*" Font-Bold="False" 
                    ValidationGroup="a"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; color: #800080; font-weight: bolder;">
                Type:</td>
            <td>
                <asp:DropDownList ID="cmbtype" runat="server" Width="90px">
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Support User</asp:ListItem>
                    <asp:ListItem>Service User</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btnlogin" runat="server" BackColor="Green" 
                    BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="Medium" 
                    ForeColor="Yellow" onclick="btnlogin_Click" Text="Login" 
                    ValidationGroup="a" CssClass="b" />
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" BackColor="Green" 
                    BorderColor="Yellow" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" 
                    Font-Size="Medium" ForeColor="Yellow" Text="Cancel" 
                    onclick="btnCancel_Click" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

    </form>
</body>
</html>
