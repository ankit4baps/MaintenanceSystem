<%@ Page Title="" Language="C#" MasterPageFile="~/SupportUser/SupportMaster.master" AutoEventWireup="true" CodeFile="UploadDocument.aspx.cs" Inherits="SupportUser_UploadDocument" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
    <tr>
        <td colspan="2" style="text-align: right; color: Red;">
            <asp:Label ID="Label2" runat="server" ForeColor="Black"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center; color: Red;">
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="titleStyle" colspan="2">
            Upload Documents</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="textStyle">
            Upload New Photo/Document :</td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
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
            &nbsp;</td>
        <td>
            <asp:Button ID="btnsubmit" runat="server" Text="Upload" 
            ValidationGroup="a" onclick="btnsubmit_Click" CssClass="buttonStyle"/>
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
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
                EnableModelValidation="True" style="margin-left: 0px" 
                DataKeyNames="p_id" DataSourceID="SqlDataSource1" 
                AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" 
                AllowPaging="True" OnRowDeleting="gridView1_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="p_id" HeaderText="p_id" Visible="False" />
                    <asp:BoundField DataField="pic_name" HeaderText="Photo/Doc. Name" 
                        SortExpression="pic_name" />
                    <asp:BoundField DataField="up_time" HeaderText="Upload Date" 
                        SortExpression="up_time" />
                    <asp:BoundField DataField="user_name" HeaderText="UserName" 
                        SortExpression="user_name" Visible="False" />
                    <asp:CommandField ShowDeleteButton="True" />
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
                
                
                SelectCommand="SELECT p_id, pic_name, up_time, user_name FROM tb_Photos WHERE (user_name = @user_name)" 
                DeleteCommand="delete from tb_Photos where p_id=@p_id">
                <SelectParameters>
                    <asp:SessionParameter Name="user_name" SessionField="usrnm" />
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

