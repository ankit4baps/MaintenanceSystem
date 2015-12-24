<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="DepartmentMaster.aspx.cs" Inherits="DepartmentMaster" %>

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
            Department Details</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="textStyle">
            Department Name:</td>
        <td>
            <asp:TextBox ID="txtMName" runat="server" Width="180px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtMName" ErrorMessage="Enter Department Name" Font-Bold="True" 
                ValidationGroup="a"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="textStyle">
            Status:</td>
        <td>
            <asp:DropDownList ID="cmbStatus" runat="server" Width="180px">
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>InActive</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="textStyle">
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
                &nbsp;<asp:Button ID="btnClear" runat="server" Text="Clear" 
                    onclick="btnClear_Click" CssClass="buttonStyle" Height="27px" />
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
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
                EnableModelValidation="True" style="margin-left: 0px" 
                DataKeyNames="deptCode" DataSourceID="SqlDataSource1" 
                AutoGenerateColumns="False" ForeColor="#333333" GridLines="None">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="deptCode" HeaderText="DeptCode" 
                        SortExpression="deptCode" Visible="False" />
                    <asp:BoundField DataField="deptName" HeaderText="Department Name" 
                        SortExpression="deptName" />
                    <asp:TemplateField HeaderText="Status" SortExpression="status">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                SelectedValue='<%# bind("status") %>'>
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>InActive</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# bind("status") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [DeptMaster]" 
                UpdateCommand="UPDATE DeptMaster SET deptName = @deptName, status = @status WHERE (deptCode = @deptCode)">
                <%--<UpdateParameters>
                    <asp:Parameter DefaultValue="GridView1.SelectedRow" Name="@deptCode" />
                </UpdateParameters>--%>
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

