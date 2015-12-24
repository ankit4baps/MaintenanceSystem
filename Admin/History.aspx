<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="Admin_History" %>

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
            History
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
                            HeaderText="Service Details" SortExpression="service_details" />
                    <asp:BoundField DataField="service_req_by" 
                            HeaderText="Service Required By" SortExpression="service_req_by" />
                    <asp:BoundField DataField="service_inspe_by" HeaderText="Inspection By(Dept)" 
                        SortExpression="service_inspe_by" />
                    <asp:BoundField DataField="service_inspe_name" 
                        HeaderText="Inspection Name(Person)" SortExpression="service_inspe_name" />
                    <asp:BoundField DataField="service_comp_by" HeaderText="Requestion By(User)" 
                            SortExpression="service_comp_by" />
                    <asp:BoundField DataField="service_remark" HeaderText="Remarks" 
                            SortExpression="service_remark" />
                    <asp:BoundField DataField="service_pre_date" HeaderText="Service Date" 
                            SortExpression="service_pre_date" />
                    <asp:HyperLinkField DataNavigateUrlFields="service_no" 
                            DataNavigateUrlFormatString="HistoryCard.aspx?service={0}" 
                            Text="Status" HeaderText="View" />
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
                    
                
                SelectCommand="SELECT service_no, service_req_by, service_details, service_comp_by, service_pre_date, service_inspe_by, service_inspe_name, service_remark FROM serviceDetails WHERE (ank_flag = @ank_flag) ORDER BY service_no DESC">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="ank_flag" />
                </SelectParameters>
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

