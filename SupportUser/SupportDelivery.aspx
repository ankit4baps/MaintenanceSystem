<%@ Page Title="" Language="C#" MasterPageFile="~/SupportUser/SupportMaster.master" AutoEventWireup="true" CodeFile="SupportDelivery.aspx.cs" Inherits="SupportUser_SupportDelivery" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-decoration: underline;
        }
    .style2
    {
        width: 573px;
    }
    .style3
    {
        width: 176px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" class="titleStyle">
                Delivery Entry</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td style="text-align: right; font-weight: 700">
                Date :</td>
            <td>
                <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="textStyle">
                Service No. :</td>
            <td>
                <asp:DropDownList ID="ddlserviceNo" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlserviceNo_SelectedIndexChanged" 
                    DataSourceID="SqlDataSource1" DataTextField="service_no" 
                    DataValueField="service_no" AppendDataBoundItems="True" Width="100px">
                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT service_no FROM serviceDetails WHERE (ank_flag = @ank_flag) AND (service_status = @service_status)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="ank_flag" />
                        <asp:Parameter DefaultValue="Pending" Name="service_status" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
        
        <table width="100%">
        <tr>
                <td colspan="2">
                    <asp:Panel ID="Panel1" runat="server" Width="100%">
                        <table width="100%">
                        <tr>
                            <td style="text-decoration: underline; font-weight: 700">
                                </td>
                            <td class="style1">
                                <strong>Service Details</strong></td>
                            
                        </tr>
                        <tr>
                            <td class="textStyle">
                                &nbsp;</td>
                            <td class="style2">
                                &nbsp;</td>
                           
                        </tr>
                        <tr>
                            <td class="textStyle">
                                Item Description :</td>
                            <td class="style2">
                                <asp:Label ID="lblItemDesc" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="textStyle">
                                Required Qty :</td>
                            <td class="style2">
                                <asp:Label ID="lblReqQty" runat="server" Text="Label"></asp:Label>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="textStyle">
                                &nbsp;</td>
                            <td class="style2" style="margin-left: 40px">
                                <asp:GridView ID="GridView2" runat="server" 
                                    AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                                    BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                    DataSourceID="SqlDataSource2" EnableModelValidation="True" ForeColor="Black" 
                                    GridLines="Vertical" Width="100%">
                                    <AlternatingRowStyle BackColor="White" />
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
                                        <asp:ControlParameter ControlID="ddlserviceNo" Name="service_no" 
                                            PropertyName="SelectedValue" Type="Int32"/>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="textStyle">
                                &nbsp;</td>
                            <td class="style2">
                                &nbsp;</td>
                            
                        </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
    </table>
    <table width="100%">
        <tr>
            <td class="textStyle">
                Time :</td>
            <td colspan="3">
                <asp:DropDownList ID="ddlTime" runat="server" DataSourceID="SqlDataSource4" 
                    DataTextField="time_tick" DataValueField="time_tick" Width="100px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [time_tick] FROM [tb_time]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Shift :</td>
            <td colspan="3">
                <asp:DropDownList ID="ddlShift" runat="server" Width="100px">
                    <asp:ListItem>First Shift</asp:ListItem>
                    <asp:ListItem>General Shift</asp:ListItem>
                    <asp:ListItem>Second Shift</asp:ListItem>
                    <asp:ListItem>Night Shift</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Delivered Qty. :</td>
            <td>
                <asp:TextBox ID="txtDQty" runat="server"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="txtDQty_FilteredTextBoxExtender" 
                    runat="server" Enabled="True" FilterType="Numbers" TargetControlID="txtDQty">
                </cc1:FilteredTextBoxExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtDQty" Display="Dynamic" ErrorMessage="*" 
                    onkeypress="return isNumberKeydec(event);" ValidationGroup="a"></asp:RequiredFieldValidator>
            </td>
            <td style="font-weight: 700; text-align: right;" width="auto">
                Left Qty :</td>
            <td colspan="3">
                <asp:Label ID="lblQty" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Operator :</td>
            <td colspan="3">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource5" EnableModelValidation="True" Width="180px" 
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Operators">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkOp" runat="server" 
                                    Text='<%# DataBinder.Eval(Container.DataItem,"OperName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    SelectCommand="SELECT OperName FROM OperatorMaster WHERE (Status = 'Active')">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Remarks :</td>
            <td colspan="3">
                <asp:TextBox ID="txtRemarks" runat="server" Height="50px" TextMode="MultiLine" 
                    Width="280px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                Delivery Date :</td>
            <td colspan="3">
                <asp:TextBox ID="txtDDate" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="txtDDate_CalendarExtender" runat="server" 
                    Enabled="True" Format="dd/MMM/yyyy" TargetControlID="txtDDate">
                </cc1:CalendarExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtDDate" ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator>
                <br />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td colspan="3">
                <asp:Button ID="btnSave" runat="server" CssClass="buttonStyle" Text="Save" 
                    ValidationGroup="a" onclick="btnSave_Click" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td colspan="3" style="font-weight: 700; color: navy;">
                Your Planning</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="6">
                <asp:GridView ID="GridView4" runat="server" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataSourceID="SqlDataSource6" EnableModelValidation="True" ForeColor="Black" 
                    GridLines="Vertical" DataKeyNames="deli_entry">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="service_no" HeaderText="Service No." 
                            SortExpression="service_no" />
                        <asp:BoundField DataField="delivery_qty" HeaderText="Delivered Qty." 
                            SortExpression="delivery_qty" />
                        <asp:BoundField DataField="delivered_on" HeaderText="Delivered Date" 
                            SortExpression="delivered_on" />
                        <asp:BoundField DataField="shift" HeaderText="Shift" SortExpression="shift" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                    
                    SelectCommand="SELECT deli_entry,service_no, delivery_qty, delivered_on, shift  FROM supp_Delivery WHERE (service_no = @service_no)" 
                    
                    
                    DeleteCommand="DELETE FROM supplyProduction WHERE (supp_entry = @supp_entry)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="GridView4" Name="supp_entry" 
                            PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlserviceNo" Name="service_no" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center">
                <asp:Panel ID="Panel2" runat="server">
                    <table class="right">
                        <tr>
                            <td class="style3" style="text-align: right; font-weight: 700">
                                Service Completed :</td>
                            <td style="text-align: left">
                                <asp:CheckBox ID="chkComplete" runat="server" />
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
                            <td style="text-align: left">
                                <asp:Button ID="btnComplete" runat="server" CssClass="buttonStyle" 
                                    Text="Complete" onclick="btnComplete_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="textStyle">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

