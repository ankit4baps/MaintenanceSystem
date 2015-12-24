using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page 
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\kemrock.mdf;Integrated Security=True;User Instance=True");
    SqlDataAdapter da;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.Open();
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        if (txtpass.Text !="" && txtunm.Text != "")
        {
            da = new SqlDataAdapter("select * from UserDetails where loginID='" + txtunm.Text + "' and pass='" + txtpass.Text + "'", cn);
            ds = new DataSet();
            da.Fill(ds, "login");
            if (ds.Tables[0].Rows.Count == 0)
            {
                Response.Write("Login Error");
            }
            else
            {
                string st = ds.Tables[0].Rows[0][0].ToString();
                string st1 = ds.Tables[0].Rows[0][2].ToString();

                if (st == txtunm.Text && st1 == cmbtype.SelectedValue)
                {
                    //Response.Write(st+";");
                    //Response.Write(st1+";");

                    switch (st1)
                    {
                        case "Admin":
                            Session["usrnm"] = st;
                            Session["type"] = st1;
                            Response.Redirect("~/Admin/FirstPage.aspx");
                            break;
                        case "Support User":
                            Session["usrnm"] = st;
                            Session["type"] = st1;
                            Response.Redirect("~/SupportUser/SupportFirst.aspx");
                            break;
                        case "Service User":
                            Session["usrnm"] = st;
                            Session["type"] = st1;
                            Response.Redirect("~/ServiceUser/ServiceFirst.aspx");
                            break;
                    }
                }
                else
                {
                    Response.Write("Not Proper Selected UserName Or Type...");
                }
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtunm.Text = "";
        txtpass.Text = "";
        cmbtype.SelectedIndex = -1;
    }
}