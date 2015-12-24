<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="OperatorMaster.aspx.cs" Inherits="Admin_OperatorMaster" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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
            Operator Master</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="textStyle">
            Operator Name :</td>
        <td>
            <asp:TextBox ID="txtOname" runat="server" Width="180px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtOname" ErrorMessage="Enter Operator Name" Font-Bold="True" 
                ValidationGroup="a"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="textStyle">
            Empolyee No :</td>
        <td>
            <asp:TextBox ID="txtENo" runat="server" Width="180px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtENo" ErrorMessage="Enter Employee No" Font-Bold="True" 
                ValidationGroup="a"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="textStyle">
            Per/Hr Rate :</td>
        <td>
            <asp:TextBox ID="txtPHRate" runat="server" Width="180px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtPHRate" ErrorMessage="Enter Per/Hr Rate" Font-Bold="True" 
                ValidationGroup="a"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="textStyle">
            Per/Day Rate :</td>
        <td>
            <asp:TextBox ID="txtPDRate" runat="server" Width="180px"></asp:TextBox>
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
        <td style="text-align: right">
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" 
             ValidationGroup="a" onclick="btnsubmit_Click" CssClass="buttonStyle"/>
        </td>
        <td>
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
                CellPadding="4" DataKeyNames="Oper_Id" DataSourceID="SqlDataSource1" 
                ForeColor="#333333" GridLines="None" AllowPaging="True">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="Oper_Id" HeaderText="Oper_Id" 
                        SortExpression="Oper_Id" Visible="False" />
                    <asp:BoundField DataField="OperName" HeaderText="Operator Name" 
                        SortExpression="OperName" />
                    <asp:BoundField DataField="EmpNo" HeaderText="Employee No." 
                        SortExpression="EmpNo" />
                    <asp:BoundField DataField="PHRate" HeaderText="Per/Hr Rate" 
                        SortExpression="PHRate" />
                    <asp:BoundField DataField="PDRate" HeaderText="Per/Day Rate" 
                        SortExpression="PDRate" />
                    <asp:TemplateField HeaderText="Status" SortExpression="status">
                        <EditItemTemplate>
                            <asp:DropDownList ID="cmbEStatus" runat="server" Width="90px" 
                                SelectedValue='<%# bind("Status") %>'>
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>InActive</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# bind("Status") %>'></asp:Label>
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
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT Oper_Id, OperName, EmpNo, PHRate, PDRate, Status FROM OperatorMaster" 
                UpdateCommand="UPDATE OperatorMaster SET OperName = @OperName, EmpNo = @EmpNo, PHRate = @PHRate, PDRate = @PDRate, Status = @Status WHERE (Oper_Id = @Oper_Id)">
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

