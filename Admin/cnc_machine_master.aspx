<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="cnc_machine_master.aspx.cs" Inherits="Admin_cnc_machine_master" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/StyleSheet.css" rel="Stylesheet" type="text/css" />
      

      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <table width="100%">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: left">
            <asp:Label ID="Label1" runat="server" ForeColor="Red" style="text-align: left"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="titleStyle">
                Machine Master</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Machine Id :</td>
        <td>
            <asp:TextBox ID="txtMCode" runat="server" Width="180px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtMCode" ErrorMessage="Enter Machine Id" Font-Bold="True" 
                ValidationGroup="a"></asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr>
            <td class="textStyle">
                Machine Name :</td>
        <td>
            <asp:TextBox ID="txtMName" runat="server" Width="180px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtMName" ErrorMessage="Enter Machine Name" Font-Bold="True" 
                ValidationGroup="a"></asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr>
            <td class="textStyle">
                Machine Description :</td>
        <td>
            <asp:TextBox ID="txtMDescr" runat="server" TextMode="MultiLine" Width="180px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtMDescr" Display="Dynamic" 
                ErrorMessage="Enter Machine Description" Font-Bold="True" 
                ValidationGroup="a"></asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr>
            <td class="textStyle">
                Machine Per/Hr Cost :</td>
        <td>
            <asp:TextBox ID="txtMaPCost" runat="server" Width="180px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtMCode" ErrorMessage="Enter Machine Cost" Font-Bold="True" 
                ValidationGroup="a"></asp:RequiredFieldValidator>
        </td>
        </tr>
        <tr>
            <td class="textStyle">
                Status :</td>
        <td>
            <asp:DropDownList ID="cmbStatus" runat="server" Width="90px">
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>InActive</asp:ListItem>
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
            <td>
                &nbsp;</td>
            <td>
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" 
            ValidationGroup="a" onclick="btnsubmit_Click" CssClass="buttonStyle"/>
        &nbsp;<asp:Button ID="btnClear" runat="server" 
                 Text="Clear" onclick="btnClear_Click" CssClass="buttonStyle" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Machine_Id" DataSourceID="SqlDataSource1" AllowPaging="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="Machine_Id" HeaderText="Machine_Id" ReadOnly="True" 
                            SortExpression="Machine_Id" />
                        <asp:BoundField DataField="MachineName" HeaderText="MachineName" 
                            SortExpression="MachineName" />
                        <asp:BoundField DataField="MachineDescr" HeaderText="MachineDescr" 
                            SortExpression="MachineDescr" />
                        <asp:BoundField DataField="MachineCost" HeaderText="MachineCost" 
                            SortExpression="MachineCost" />
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <EditItemTemplate>
                                <asp:DropDownList ID="cmbst" runat="server" Width="90px" 
                                    SelectedValue='<%# bind("status") %>'>
                                    <asp:ListItem>Active</asp:ListItem>
                                    <asp:ListItem>InActive</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Kemrock.mdf;Integrated Security=True;User Instance=True" 
                    ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT Machine_Id, MachineName, MachineDescr, MachineCost, status FROM MachineDetails" 
                    UpdateCommand="UPDATE MachineDetails SET MachineName = @MachineName, MachineDescr = @MachineDescr, MachineCost = @MachineCost, status = @status WHERE (Machine_Id = @Machine_Id)">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</div>
</asp:Content>

