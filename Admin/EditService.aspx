<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="EditService.aspx.cs" Inherits="Admin_EditService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 450px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="right">
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="titleStyle" colspan="4">
                Machining Service Request</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td style="font-weight: 700; text-align: right;">
                Date :</td>
            <td>
                <asp:Label ID="lblTime" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Service No. :</td>
            <td class="style2">
                <asp:Label ID="lblSerNo" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Service Required By
                <br />
                (Department Wise) :</td>
            <td class="style2">
                <asp:Label ID="lblReqBy" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Internal Work Order No. :</td>
            <td class="style2">
                <asp:Label ID="lblIntWNo" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Inspection :</td>
            <td class="style2">
                <asp:Label ID="lblInsp" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Email ID :</td>
            <td class="style2">
                <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Person Name :</td>
            <td class="style2">
                <asp:Label ID="lblPers" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Drwaing Details :</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td class="style2">
                <asp:Panel ID="Panel1" runat="server" Height="200px" ScrollBars="Auto">
                    <strong>Upload Edited Copy :</strong><asp:FileUpload ID="FileUpload1" 
                        runat="server" />
                    &nbsp;
                    <asp:Button ID="btnUpload" runat="server" CssClass="buttonStyle" 
                        onclick="btnUpload_Click" Text="Upload" />
                    <br />
                    <br />
                    <strong>Files Uploaded till Date :<br /> </strong>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        DataSourceID="SqlDataSource1" EnableModelValidation="True" ForeColor="Black" 
                        GridLines="Vertical" onselectedindexchanged="GridView1_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="pic_name" HeaderText="Photo Name" 
                                SortExpression="pic_name" />
                            <asp:BoundField DataField="up_time" HeaderText="Upload Date" 
                                SortExpression="up_time" />
                            <asp:ButtonField CommandName="Select" 
                                ImageUrl="~/cnc_Photos/662_1241_128_arrow_blue_download_icon.png" 
                                Text="Download" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT pic_name, up_time FROM tb_Photos WHERE (service_no = @service_no)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="service_no" QueryStringField="service" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-decoration: underline; font-weight: 700">
                Item Details :</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Item Description :</td>
            <td class="style2">
                <asp:Label ID="lblItemDesc" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Required Qty :</td>
            <td class="style2">
                <asp:Label ID="lblReqQty" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
             &nbsp;</td>
            <td class="style2">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataSourceID="SqlDataSource2" EnableModelValidation="True" ForeColor="Black" 
                    GridLines="Vertical" 
                    onselectedindexchanged="GridView2_SelectedIndexChanged" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="item_used_now" HeaderText="Basic Used" 
                            SortExpression="item_used_now" />
                        <asp:BoundField DataField="item_basic_sch" HeaderText="Material Dely. Sch" 
                            SortExpression="item_basic_sch" />
                        <asp:BoundField DataField="item_delivered" HeaderText="Delivered Qty." 
                            SortExpression="item_delivered" />
                        <asp:BoundField DataField="item_del_sch" 
                            HeaderText="Dely. Sch. After Machining" SortExpression="item_del_sch" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT item_used_now, item_basic_sch, item_delivered, item_del_sch FROM itemDetails WHERE (service_no = @service_no)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="service_no" QueryStringField="service" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Remarks :</td>
            <td class="style2">
                <asp:Label ID="lblRemark" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Prepare Date :</td>
            <td class="style2">
                <asp:Label ID="lblPreDate" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Prepared By :</td>
            <td class="style2">
                <asp:Label ID="lblPreBy" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Approved By :</td>
            <td class="style2">
                <asp:CheckBox ID="chkSac" runat="server" Text="Sachin" />
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CheckBox ID="chkJik" runat="server" Text="Jiken" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
                <asp:Button ID="btnUpdate" runat="server" CssClass="buttonStyle" 
                    onclick="btnUpdate_Click" Text="Update" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

