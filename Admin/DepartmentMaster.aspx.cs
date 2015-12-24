using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class DepartmentMaster : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\kemrock.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd;
    SqlDataAdapter da;
    DataSet ds;

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
            cmd = new SqlCommand("insert into DeptMaster (deptName,status)values('" + txtMName.Text + "','" + cmbStatus.SelectedValue.ToString() + "')", cn);
            cmd.ExecuteNonQuery();
            Label1.Text = "Record Submitted";
            txtMName.Text = "";
            cmbStatus.SelectedIndex = -1;

            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Label1.Text = "Record Not Submitted";
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtMName.Text = "";
        cmbStatus.SelectedIndex = -1;
        Label1.Text = "";
    }
}