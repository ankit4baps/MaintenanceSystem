<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="CompletedLog.aspx.cs" Inherits="Admin_CompletedLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
    <tr>
        <td>
                &nbsp;</td>
        <td>
                &nbsp;</td>
    </tr>
    <tr>
        <td class="titleStyle" colspan="2">
                Completed Service Log 
        </td>
    </tr>
    <tr>
        <td>
                &nbsp;</td>
        <td>
                &nbsp;</td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:GridView ID="GridView5" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource7" 
                    EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
                Width="100%" style="font-size: 10pt; font-family: Tahoma, Arial, sans-serif">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="service_no" HeaderText="Service No" 
                            SortExpression="service_no" />
                    <asp:BoundField DataField="service_details" 
                            HeaderText="Internal Work Order No." SortExpression="service_details" />
                    <asp:BoundField DataField="service_req_by" 
                            HeaderText="Service Required By (Dept. Name)" SortExpression="service_req_by" />
                    <asp:BoundField DataField="service_comp_by" HeaderText="Requestion By(User)" 
                            SortExpression="service_comp_by" />
                    <asp:BoundField DataField="comp_on" HeaderText="Completion Date" 
                            SortExpression="comp_on" />
                    <asp:BoundField DataField="service_attend_by" HeaderText="Completed By (Support User)" 
                            SortExpression="service_attend_by" />
                    <asp:HyperLinkField DataNavigateUrlFields="service_no" 
                            DataNavigateUrlFormatString="ViewStatus.aspx?service={0}" 
                            Text="Status" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    
                SelectCommand="SELECT service_no, service_req_by, service_details, service_comp_by, comp_on, service_attend_by, service_pre_date FROM serviceDetails WHERE (service_status = 'Completed') ORDER BY service_no DESC">
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
</asp:Content>

