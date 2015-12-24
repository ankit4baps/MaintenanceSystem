using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class UserCreation : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\kemrock.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd;
    SqlDataReader dr;
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
        GridView1.DataBind();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            cmd = new SqlCommand("select * from UserDetails where loginID='" + txtLogin.Text + "'", cn);
            SqlDataReader r = cmd.ExecuteReader();
            int i = 0;
            while (r.Read())
            {
                i = i + 1;
            }
            if (i > 0)
            {
                Label1.Text = "User Already in Record";
                r.Close();
                return;
            }
            r.Close();

            cmd = new SqlCommand("insert into UserDetails values('" + txtLogin.Text + "','" + txtpass.Text + "','" + cmbType.SelectedValue.ToString() + "','" + cmbStatus.SelectedValue.ToString() + "','" + cmbDept.SelectedValue.ToString() + "','" + txtEmail.Text + "')", cn);
            cmd.ExecuteNonQuery();
            
            Label1.Text = "Record Submitted";
            txtLogin.Text = "";
            txtEmail.Text = "";
            txtpass.Text = "";
            cmbDept.SelectedIndex = -1;
            cmbStatus.SelectedIndex = -1;
            cmbType.SelectedIndex = -1;

            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Label1.Text = "Record Not Submitted";
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtLogin.Text = "";
        txtEmail.Text = "";
        txtpass.Text = "";
        cmbDept.SelectedIndex = -1;
        cmbStatus.SelectedIndex = -1;
        cmbType.SelectedIndex = -1;
    }
}