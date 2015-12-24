<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ViewLog.aspx.cs" Inherits="Admin_ViewLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/StyleSheet.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
    td {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2" class="titleStyle">
                View Service Logs</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
                    EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
                    style="margin-top: 0px" Width="100%">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="service_no" HeaderText="Service No" 
                            SortExpression="service_no" />
                        <asp:BoundField DataField="service_details" 
                            HeaderText="Internal Work Order No." SortExpression="service_details" />
                        <asp:BoundField DataField="service_req_by" 
                            HeaderText="Service Required By(Dept.Name)" SortExpression="service_req_by" />
                        <asp:BoundField DataField="service_inspe_by" HeaderText="Inspection. By" 
                            SortExpression="service_inspe_by" />
                        <asp:BoundField DataField="service_inspe_name" 
                            HeaderText="Inspection  By(Person Name)" SortExpression="service_inspe_name" />
                        <asp:BoundField DataField="service_comp_by" HeaderText="Requestion By" 
                            SortExpression="service_comp_by" />
                        <asp:HyperLinkField DataNavigateUrlFields="service_no" HeaderText="Edit" 
                            Text="Edit" DataNavigateUrlFormatString="EditService.aspx?service={0}" />
                        <asp:HyperLinkField HeaderText="Status" Text="View" 
                            DataNavigateUrlFields="service_no" 
                            DataNavigateUrlFormatString="ViewStatus.aspx?service={0}" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    
                    SelectCommand="SELECT service_no, service_req_by, service_details, service_inspe_by, service_inspe_name, service_comp_by, ank_flag, service_status FROM serviceDetails WHERE (service_status = 'Pending') ORDER BY service_no DESC">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

