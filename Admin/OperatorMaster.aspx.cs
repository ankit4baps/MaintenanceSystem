using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_OperatorMaster : System.Web.UI.Page
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
            cmd = new SqlCommand("insert into OperatorMaster values('" + txtOname.Text + "','" + txtENo.Text + "'," + Convert.ToDouble(txtPHRate.Text) + "," + Convert.ToDouble(txtPDRate.Text) + ",'" + cmbStatus.SelectedValue + "')", cn);
            cmd.ExecuteNonQuery();
            Label1.Text = "Record Submitted";
            GridView1.DataBind();
            txtOname.Text = "";
            txtENo.Text = "";
            txtPDRate.Text = "";
            txtPHRate.Text = "";
            cmbStatus.SelectedIndex = -1;
        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
   
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtOname.Text = "";
        txtENo.Text = "";
        txtPDRate.Text = "";
        txtPHRate.Text = "";
        cmbStatus.SelectedIndex = -1;
    }

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        SqlConnection cnn;
        cnn=new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\kemrock.mdf;Integrated Security=True;User Instance=True");
        string data="select OperName from OperatorMaster where OperName like '" + prefixText + "%'";
        SqlCommand cmd = new SqlCommand(data, cnn);
        cnn.Open();
        SqlDataReader dr;
        List<string> returnData = new List<string>();
        dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        while (dr.Read())
        {
            returnData.Add(dr["Opername"].ToString());
        }
        return returnData.ToArray();
    }
}