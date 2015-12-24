<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceUser/ServiceMaster.master" AutoEventWireup="true" CodeFile="NewWorkLog.aspx.cs" Inherits="ServiceUser_NewWorkLog" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/StyleSheet.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">

        .style11
        {
            color: #FF3300;
        }
        .style24
        {
            color: #000000;
            font-size: medium;
            font-weight: bold;
        }
        .style26
        {
            text-align: left;
            width: 176px;
            color: Black;
            font-weight: bold;
        }
        .style10
        {
            color: Red;
            font-weight: bold;   
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <table width="100%">
            <tr>
                <td class="style25">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style25">
                    &nbsp;</td>
                <td style="text-align: left">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" style="text-align: left"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="titleStyle">
                Machine Service Request</td>
            </tr>
            <tr>
                <td class="style25">
                    <asp:Label ID="lblServiceNo" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td align="right">
                    Date:
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    Service Required By (Department Wise) :</td>
                <td>
                    <asp:DropDownList ID="ddlDeptUser" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="deptName" DataValueField="deptName">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [deptName] FROM [UserDetails] WHERE ([loginID] LIKE '%' + @loginID + '%')">
                        <SelectParameters>
                            <asp:SessionParameter Name="loginID" SessionField="usrnm" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    Internal Work Order No :</td>
                <td>
                    <asp:TextBox ID="txtIntWorkNo" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtIntWorkNo" ErrorMessage="*" Font-Bold="True" 
                ValidationGroup="a"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    Inspection :</td>
                <td>
                    <asp:CheckBox ID="Chkqc" runat="server" AutoPostBack="True" 
                        oncheckedchanged="Chkqc_CheckedChanged" Text="By KIEL QC" ValidationGroup="a" />
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="Chkdesign" runat="server" AutoPostBack="True" 
                        oncheckedchanged="Chkdesign_CheckedChanged" Text="By Design" 
                        ValidationGroup="a" />
&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="Chkmy" runat="server" AutoPostBack="True" 
                        oncheckedchanged="Chkmy_CheckedChanged" Text="Myself" ValidationGroup="a" />
                </td>
            </tr>
            <tr>
                <td class="style26">
                    E-Mail Id :</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="180px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Enter Proper E-Mail Id" Font-Bold="True" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="a" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    PersonName :</td>
                <td>
                    <asp:TextBox ID="txtPerName" runat="server" Width="180px"></asp:TextBox>
                    &nbsp;</td>
               
            </tr>
            <tr>
                <td class="style25">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style26">
                    Drwaing Provided :</td>
                <td>
                    <asp:RadioButton ID="rtbYes" runat="server" AutoPostBack="True" GroupName="a" 
                        oncheckedchanged="rtbYes_CheckedChanged" Text="Yes" />
&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="rtbNo" runat="server" AutoPostBack="True" GroupName="a" 
                        oncheckedchanged="rtbNo_CheckedChanged" Text="No" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <b>Note :</b> <span class="style11">Whatever drawing you attached we assume as an approved by 
                    respected/resposnible person.We are responsible to do machning as per attached 
                    drawing. So Please be sure at a time of attachment.</span><br />
                    <br />
                    <span class="style24">
                    <b>Note:</b></span> <span class="style10">Please Remove Space in filename while 
                    uploading and give appropriate name.</span><br /><br /></td>
            </tr>
            <tr>
                <td class="style25">
                    &nbsp;</td>
                <td>
                    <asp:Panel ID="Panel1" runat="server" Font-Bold="True">
                        Upload SoftCopy :
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        &nbsp;&nbsp;
                        <asp:Button ID="btnUpload" runat="server" CssClass="buttonStyle" 
                            onclick="btnUpload_Click" Text="Upload" />
                        <br />
                        <br />
                        <span>Note :-
                        <asp:Label ID="Label9" runat="server" ForeColor="Red" 
                            Text="Please upload any one of the .pdf,.dwg,.iges,.step,.ste files for reference and then proceed!!"></asp:Label>
                        <br />
                        <br />
                        Uploaded Files<br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" 
                            AutoGenerateColumns="False" CellPadding="4" 
                            DataSourceID="SqlDataSource2" EnableModelValidation="True" Font-Bold="False" 
                            ForeColor="#333333" GridLines="None" style="margin-left: 0px">
                            <Columns>
                                <asp:BoundField DataField="temp_picName" HeaderText="Photo/Doc. Name" 
                                    SortExpression="temp_picName" />
                                <asp:BoundField DataField="uptime" HeaderText="Upload Date" 
                                    SortExpression="uptime" />
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                            SelectCommand="SELECT temp_picName, uptime FROM temp_pic WHERE (userName = @user_name)">
                            <SelectParameters>
                                <asp:SessionParameter Name="user_name" SessionField="usrnm" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </span>
                    </asp:Panel>
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
                <td class="titleStyle" style="text-align:left">
                    Item Details</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblItemError" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    Item Description :</td>
                <td>
                    <asp:TextBox ID="txtItemDescr" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtItemDescr" ErrorMessage="* Enter Item Description" 
                        Font-Bold="True" ValidationGroup="b"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    Required Qty :</td>
                <td>
                    <asp:TextBox ID="txtReqQty" runat="server" Width="180px" 
                        ontextchanged="txtReqQty_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtReqQty" ErrorMessage="* Enter Requried Qty" 
                        Font-Bold="True" ValidationGroup="b"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td class="style24">
                    Item Planner Schedule</td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td style="font-family: Arial, Helvetica, sans-serif">
                    Remaining Qty :&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td style="font-family: Arial, Helvetica, sans-serif">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td style="font-family: Arial, Helvetica, sans-serif">
                    Basic Required :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtBasicReq" runat="server" 
                        ontextchanged="txtBasicReq_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td style="font-family: Arial, Helvetica, sans-serif">
                    Basic Material Dely. Sch :
                    <asp:TextBox ID="txtMateDe" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtMateDe_CalendarExtender" runat="server" 
                        Enabled="True" Format="dd-MMM-yyyy" TargetControlID="txtMateDe">
                    </cc1:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td style="font-family: Arial, Helvetica, sans-serif">
                    Delivery Neeeded :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtDeliNeed" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td style="font-family: Arial, Helvetica, sans-serif">
                    Dely. Sch After Matching :
                    <asp:TextBox ID="txtDelySch" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtDelySch_CalendarExtender" runat="server" 
                        Enabled="True" Format="dd-MMM-yyyy" TargetControlID="txtDelySch">
                    </cc1:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td style="font-family: Arial, Helvetica, sans-serif">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td style="font-family: Arial, Helvetica, sans-serif; text-align: center">
                    <asp:Button ID="btnAdd" runat="server" CssClass="buttonStyle" Text="Add" 
                        ValidationGroup="b" onclick="btnAdd_Click" />
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        DeleteCommand="DELETE FROM temp_item_table WHERE (temp_id = @temp_id)" 
                        SelectCommand="SELECT item_used_now, item_basic_sch, item_delivered, item_del_sch, temp_id FROM temp_item_table">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataKeyNames="temp_id" DataSourceID="SqlDataSource3" 
                        EnableModelValidation="True" ForeColor="#333333" GridLines="None" 
                        style="font-size: 10pt; font-family: Arial, Helvetica, sans-serif" OnRowDeleting="GridView2_RowDeleting">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="item_used_now" HeaderText="Basic Qty" 
                                SortExpression="item_used_now" />
                            <asp:BoundField DataField="item_basic_sch" HeaderText="Basic Material Dely Sch" 
                                SortExpression="item_basic_sch" />
                            <asp:BoundField DataField="item_delivered" HeaderText="Deliverd Qty" 
                                SortExpression="item_delivered" />
                            <asp:BoundField DataField="item_del_sch" HeaderText="Dely Sch After Machining" 
                                SortExpression="item_del_sch" />
                            <asp:BoundField DataField="temp_id" HeaderText="temp_id" InsertVisible="False" 
                                ReadOnly="True" SortExpression="temp_id" Visible="False" />
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style26">
                    Remarks :</td>
                <td>
                    <asp:TextBox ID="txtRemarks" runat="server" Height="50px" TextMode="MultiLine" 
                        Width="240px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style26">
                    Prepared By :</td>
                <td>
                    <asp:Label ID="lblName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblShow" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnsubmit" runat="server" CssClass="buttonStyle" 
                        onclick="btnsubmit_Click" Text="Save" ValidationGroup="a" />
                </td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" class="style26">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style26">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>

