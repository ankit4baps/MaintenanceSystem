using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class SupportUser_EditLog : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    decimal sum = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrnm"] == null || Session["usrnm"] == "")
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            lblServiceNo.Text = Request.QueryString["service"].ToString();
            cn.Open();
            SqlCommand cmdItem = new SqlCommand("select item_desc,item_req from itemDetails where service_no='" + lblServiceNo.Text + "'", cn);
            SqlDataReader drItem = cmdItem.ExecuteReader();
            while (drItem.Read())
            {
                lblItemDescr.Text = drItem["item_desc"].ToString();
                lblRQty.Text = drItem["item_req"].ToString();
            }
            drItem.Close();
            cn.Close();
        }
    }
    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView3.SelectedRow;
        string photoname = row.Cells[0].Text;

        string filepath = Server.MapPath("~/cnc_Photos/" + photoname);
        FileInfo fi = new FileInfo(filepath);
        if (fi.Exists)
        {
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", String.Format("attachment;filename=" + photoname));
            Response.AddHeader("Content-Length", fi.Length.ToString());
            Response.WriteFile(filepath);
            Response.End();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "clientscript", "alert('No Such File Exists!!!')", true);
        }
    }
}