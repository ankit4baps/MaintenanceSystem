<%@ Page Title="" Language="C#" MasterPageFile="~/SupportUser/SupportMaster.master" AutoEventWireup="true" CodeFile="EditLog.aspx.cs" Inherits="SupportUser_EditLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 115px;
            font-weight: 700;
        }
    .style2
    {
        width: 496px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Service No. :</td>
            <td>
                <asp:Label ID="lblServiceNo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td style="font-weight: 700; text-decoration: underline">
                Service Details</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="SqlDataSource2" EnableModelValidation="True" 
                    ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="service_req_by" HeaderText="Service Required By(Dept.)" 
                            SortExpression="service_req_by" />
                        <asp:BoundField DataField="service_details" HeaderText="Internal Work Order No" 
                            SortExpression="service_details" />
                        <asp:BoundField DataField="service_inspe_by" HeaderText="Inspection By (Dept.)" 
                            SortExpression="service_inspe_by" />
                        <asp:BoundField DataField="service_inspe_name" HeaderText="Inspection Name" 
                            SortExpression="service_inspe_name" />
                        <asp:BoundField DataField="service_email_id" HeaderText="Inspection (EMail-Id)" 
                            SortExpression="service_email_id" />
                        <asp:BoundField DataField="service_comp_by" HeaderText="Complain Log By" 
                            SortExpression="service_comp_by" />
                        <asp:BoundField DataField="service_pre_date" HeaderText="Complain Date" 
                            SortExpression="service_pre_date" />
                        <asp:BoundField DataField="service_remark" HeaderText="Remark" 
                            SortExpression="service_remark" />
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
                    
                    SelectCommand="SELECT service_req_by, service_details, service_inspe_by, service_inspe_name, service_email_id, service_comp_by, service_pre_date, service_remark FROM serviceDetails WHERE (service_no = @service_no)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="service_no" QueryStringField="service" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td style="font-weight: 700; text-decoration: underline">
                Item Planner</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                Item Description :
                <asp:Label ID="lblItemDescr" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                Required Qty. :
                <asp:Label ID="lblRQty" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:GridView ID="GridView2" runat="server" 
                                    AutoGenerateColumns="False" CellPadding="4" 
                                    DataSourceID="SqlDataSource3" EnableModelValidation="True" ForeColor="#333333" 
                                    GridLines="None" Width="600px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="item_used_now" HeaderText="Basic Qty." 
                                            SortExpression="item_used_now" />
                        <asp:BoundField DataField="item_basic_sch" HeaderText="Material Dely. Sch" 
                                            SortExpression="item_basic_sch" />
                        <asp:BoundField DataField="item_delivered" HeaderText="Delivered Qty." 
                                            SortExpression="item_delivered" />
                        <asp:BoundField DataField="item_del_sch" 
                                            HeaderText="Dely. Sch. After Machining" SortExpression="item_del_sch" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                                        HorizontalAlign="Left" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                                    
                                    
                    SelectCommand="SELECT item_used_now, item_basic_sch, item_delivered, item_del_sch FROM itemDetails WHERE (service_no = @service_no)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="service_no" QueryStringField="service" 
                                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td style="font-weight: 700; text-decoration: underline">
                Files Uploaded</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:GridView ID="GridView3" runat="server" 
                        AutoGenerateColumns="False" CellPadding="4" 
                        DataSourceID="SqlDataSource1" EnableModelValidation="True" ForeColor="#333333" 
                        GridLines="None" 
                    onselectedindexchanged="GridView3_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="pic_name" HeaderText="Photo Name" 
                                SortExpression="pic_name" />
                        <asp:BoundField DataField="up_time" HeaderText="Upload Date" 
                                SortExpression="up_time" />
                        <asp:ButtonField CommandName="Select" 
                                ImageUrl="~/cnc_Photos/662_1241_128_arrow_blue_download_icon.png" 
                                Text="Download" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT pic_name, up_time FROM tb_Photos WHERE (service_no = @service_no)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="service_no" QueryStringField="service" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

