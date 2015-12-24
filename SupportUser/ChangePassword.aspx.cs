using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SupportUser_ChangePassword : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\kemrock.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrnm"] == null || Session["usrnm"] == "")
        {
            Response.Redirect("~/Login.aspx");
        }
        txtuser.Text = Session["usrnm"].ToString();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            cmd = new SqlCommand("select * from UserDetails where loginID='" + Session["usrnm"] + "' and pass='" + txtoldpassword.Text + "'", cn);
            SqlDataReader dr = cmd.ExecuteReader();
            int i = 0;
            while (dr.Read())
            {
                i = i + 1;
            }
            if (i <= 0)
            {
                Response.Write("<script>alert('Invalid Old Password')</script>");
                txtoldpassword.Text = "";
                //txtuser.Text = "";
                txtnewpassword.Text = "";
                dr.Close();
                return;
            }
            dr.Close();
            cmd = new SqlCommand("update UserDetails set pass='" + txtnewpassword.Text + "' where loginID='" + Session["usrnm"] + "'", cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            Response.Write("<script>alert('New Password Saved!!!')</script>");
            txtoldpassword.Text = "";
            //txtuser.Text = "";
            txtnewpassword.Text = "";
        }
        catch (Exception ex)
        { 
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        txtoldpassword.Text = "";
        //txtuser.Text = "";
        txtnewpassword.Text = "";
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("FirstPage.aspx");
    }
}