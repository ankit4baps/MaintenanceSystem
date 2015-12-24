<%@ Page Title="" Language="C#" MasterPageFile="~/SupportUser/SupportMaster.master" AutoEventWireup="true" CodeFile="CompletedLog.aspx.cs" Inherits="SupportUser_CompletedLog" %>

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
                Completed Service Log </td>
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
                        <asp:BoundField DataField="service_req_by" 
                            HeaderText="Service Required By (Dept. Name)" SortExpression="service_req_by" />
                        <asp:BoundField DataField="service_details" 
                            HeaderText="Internal Work Order No." SortExpression="service_details" />
                        <asp:BoundField DataField="service_comp_by" HeaderText="Requestion By" 
                            SortExpression="service_comp_by" />
                        <asp:BoundField DataField="service_pre_date" 
                            HeaderText="Service Logged On(Date)" SortExpression="service_pre_date" />
                        <asp:BoundField DataField="service_attend_by" HeaderText="Service Completed By" 
                            SortExpression="service_attend_by" />
                        <asp:BoundField DataField="comp_on" HeaderText="Service Completion Date" 
                            SortExpression="comp_on" />
                        <asp:HyperLinkField DataNavigateUrlFields="service_no" 
                            DataNavigateUrlFormatString="SupportViewStatus.aspx?service={0}" 
                            Text="View Status" />
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
                    SelectCommand="SELECT service_no, service_req_by, service_details, service_comp_by, comp_on, service_attend_by, service_pre_date FROM serviceDetails WHERE (service_status = 'Completed') AND (service_attend_by = @service_attend_by) ORDER BY service_no DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="service_attend_by" SessionField="usrnm" />
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

