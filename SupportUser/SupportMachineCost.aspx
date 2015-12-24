<%@ Page Title="" Language="C#" MasterPageFile="~/SupportUser/SupportMaster.master" AutoEventWireup="true" CodeFile="SupportMachineCost.aspx.cs" Inherits="ServiceUser_ServiceMachineCost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Js/prototype.js" type="text/javascript"></script>
    <script src="../Js/scriptaculous.js" type="text/javascript"></script>
    <script src="../Js/lightbox.js" type="text/javascript"></script>
    <link href="../lightbox.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table width="100%">
        <tr>
            <td colspan="2" style="text-align: right; color: Red;">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center; color: Red;">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="titleStyle" colspan="2">
                Machine Costing Details</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
                EnableModelValidation="True" style="margin-left: 0px" 
                DataKeyNames="MachineCost_Id" DataSourceID="SqlDataSource1" 
                AutoGenerateColumns="False" ForeColor="#333333" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="MachineCost_Id" HeaderText="MachineCost_Id" 
                            Visible="False" />
                        <asp:BoundField DataField="Machine_Header" HeaderText="Title" 
                        SortExpression="Machine_Header" />
                        <asp:BoundField DataField="Machine_pic_Name" HeaderText="File Name" 
                        SortExpression="Machine_pic_Name" />
                        <asp:TemplateField HeaderText="View">
                            <ItemTemplate>
                            <%--<a href='<%# Eval("Machine_pic_Name","~/MachineCost/{0}") %>' rel="lightbox">View</a>--%>
                                &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# Eval("Machine_pic_Name","~/MachineCost/{0}") %>'>View</asp:HyperLink>
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
                SelectCommand="select * from MachineCostDetail"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

