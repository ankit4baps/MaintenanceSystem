<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="UserCreation.aspx.cs" Inherits="UserCreation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="right"> 
    <table width="100%">
        <tr>
            <td colspan="2" style="text-align: center; color: Red;">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center; color: Red;">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="titleStyle" colspan="2">
                User Details</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Login Id:</td>
            <td>
                <asp:TextBox ID="txtLogin" runat="server" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtLogin" ErrorMessage="Enter LoginID" Font-Bold="True" 
                    ValidationGroup="a"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="textStyle">
                Password:</td>
            <td>
                <asp:TextBox ID="txtpass" runat="server" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtpass" ErrorMessage="Enter Password" Font-Bold="True" 
                    ValidationGroup="a"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="textStyle">
                Type:</td>
            <td>
                <asp:DropDownList ID="cmbType" runat="server" Width="90px">
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Support User</asp:ListItem>
                    <asp:ListItem>Service User</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="textStyle">
                Status:</td>
            <td>
                <asp:DropDownList ID="cmbStatus" runat="server" Width="90px">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>InActive</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="textStyle">
                Department:</td>
            <td>
                <asp:DropDownList ID="cmbDept" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="deptName" DataValueField="deptName" Width="90px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [deptName] FROM [DeptMaster]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Active" Name="status" Type="string"/>
                </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="textStyle">
                E-Mail Id:</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="180px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Enter Proper E-Mail Address" 
                    Font-Bold="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="a"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: right" class="style1">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" 
                ValidationGroup="a" onclick="btnsubmit_Click" CssClass="buttonStyle"/>
            </td>
            <td>
                &nbsp;<asp:Button ID="btnClear" runat="server" 
                 Text="Clear" onclick="btnClear_Click" CssClass="buttonStyle" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" 
                    EnableModelValidation="True" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="loginID" HeaderText="Login ID" ReadOnly="True" 
                            SortExpression="loginID" />
                        <asp:BoundField DataField="pass" HeaderText="Password" ReadOnly="True" 
                            SortExpression="pass" />
                        <asp:TemplateField HeaderText="Type">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# bind("type") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    SelectedValue='<%# bind("type") %>'>
                                    <asp:ListItem>Admin</asp:ListItem>
                                    <asp:ListItem>Support User</asp:ListItem>
                                    <asp:ListItem>Service User</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# bind("status") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" 
                                    SelectedValue='<%# bind("status") %>'>
                                    <asp:ListItem>Active</asp:ListItem>
                                    <asp:ListItem>InActive</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="deptName" HeaderText="Department" ReadOnly="True" 
                            SortExpression="deptName" />
                        <asp:BoundField DataField="emailId" HeaderText="E-Mail" 
                            SortExpression="emailId" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT UserDetails.* FROM UserDetails" 
                    UpdateCommand="UPDATE UserDetails SET type = @type, status = @status, emailId = @emailId WHERE (loginID = @loginID)">
                    <UpdateParameters>
                        <asp:Parameter Name="type" />
                        <asp:Parameter Name="status" />
                        <asp:Parameter Name="emailId" />
                        <asp:Parameter Name="loginID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                    
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>

