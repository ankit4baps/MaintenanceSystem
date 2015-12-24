<%@ Page Title="" Language="C#" MasterPageFile="~/SupportUser/SupportMaster.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="SupportUser_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

td { font-family: Tahoma, Arial, Sans-Serif; font-size: 10pt; }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
    <tr>
        <td align="center" class="titleStyle" colspan="2">
            Change Password</td>
    </tr>
    <tr>
        <td style="width: 137px; height: 26px">
            &nbsp;</td>
        <td style="height: 26px">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 137px; height: 26px">
            <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Black" 
                Text="Login ID :"></asp:Label>
        </td>
        <td style="height: 26px">
            <asp:TextBox ID="txtuser" runat="server" Enabled="False" Width="236px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtuser" Display="Dynamic" ErrorMessage="* Enter Login ID" 
                ValidationGroup="Save"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 137px">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Black" 
                Text="Old Password :"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtoldpassword" runat="server" Width="234px" 
                TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtoldpassword" Display="Dynamic" 
                ErrorMessage="* Enter Password" ValidationGroup="Save"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 137px">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="Black" 
                Text="New Password :"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtnewpassword" runat="server" Width="234px" 
                TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtnewpassword" Display="Dynamic" 
                ErrorMessage="* Enter Password" ValidationGroup="Save"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td style="width: 137px">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 137px">
        </td>
        <td align="left">
            <asp:Button ID="btnsubmit" runat="server" CssClass="buttonStyle" 
                Font-Bold="True" OnClick="btnsubmit_Click" Text="Submit" ValidationGroup="Save" 
                Width="112px" />
&nbsp;
            <asp:Button ID="btncancel" runat="server" CssClass="buttonStyle" 
                Font-Bold="True" OnClick="btncancel_Click" Text="Clear" Width="112px" />
&nbsp;
            <asp:Button ID="btnBack" runat="server" CssClass="buttonStyle" Font-Bold="True" 
                OnClick="btnback_Click" Text="Back" Width="112px" />
        </td>
    </tr>
</table>
</asp:Content>

