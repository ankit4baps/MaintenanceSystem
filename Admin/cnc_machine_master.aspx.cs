using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_cnc_machine_master : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrnm"] == null || Session["usrnm"] == "")
        {
            Response.Redirect("~/Login.aspx");
        }
        cn.Open();
        Label1.Text = "";
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            cmd = new SqlCommand("insert into MachineDetails values('" + txtMCode.Text + "','" + txtMName.Text + "','" + txtMDescr.Text + "'," + Convert.ToDouble(txtMaPCost.Text) + ",'" + cmbStatus.SelectedValue.ToString() + "')", cn);
            cmd.ExecuteNonQuery();
            Label1.Text = "Record Submitted";
            txtMCode.Text = "";
            txtMName.Text = "";
            txtMDescr.Text = "";
            txtMaPCost.Text = "";
            cmbStatus.SelectedIndex = -1;
            cn.Close();
            GridView1.DataBind();

        }
        catch (Exception ex)
        {
            Label1.Text = "Record Not Submitted";
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtMCode.Text = "";
        txtMName.Text = "";
        txtMDescr.Text = "";
        txtMaPCost.Text = "";
        cmbStatus.SelectedIndex = -1;
        Label1.Text = "";
    }
}
