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

public partial class Admin_EditService : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    string ser_no;
    int sach = 0, jik = 0;
    DateTime time = DateTime.Now;
    string filename, fname;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrnm"] == null || Session["usrnm"] == "")
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            string format = "dd/MMM/yyyy";
            lblTime.Text = time.ToString(format);
            ser_no = Request.QueryString["service"].ToString();
            cn.Open();
            SqlCommand cmd = new SqlCommand("select * from serviceDetails where service_no='" + ser_no + "'", cn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblSerNo.Text = ser_no;
                lblReqBy.Text = dr["service_req_by"].ToString();
                lblIntWNo.Text = dr["service_details"].ToString();
                lblInsp.Text = dr["service_inspe_by"].ToString();
                lblEmail.Text = dr["service_email_id"].ToString();
                lblPers.Text = dr["service_inspe_name"].ToString();
                lblRemark.Text = dr["service_remark"].ToString();
                lblPreDate.Text = dr["service_pre_date"].ToString();
                lblPreBy.Text = dr["service_comp_by"].ToString();
                sach = Convert.ToInt32(dr["ank_flag"].ToString());
                jik = Convert.ToInt32(dr["jik_flag"].ToString());

                if (sach == 1)
                {
                    chkSac.Checked = true;
                }
                if (jik == 1)
                {
                    chkJik.Checked = true;
                }
            }
            cn.Close();

            cn.Open();
            SqlCommand cmditem = new SqlCommand("select item_desc,item_req from itemDetails where service_no='" + ser_no + "'", cn);
            SqlDataReader dritem = cmditem.ExecuteReader();
            while (dritem.Read())
            {
                lblItemDesc.Text = dritem["item_desc"].ToString();
                lblReqQty.Text = dritem["item_req"].ToString();
            }
            cn.Close();
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        
        cn.Open();
        if (chkSac.Checked == true)
        {
            sach = 1;
            cmd = new SqlCommand("update serviceDetails set ank_flag='" + sach + "',jik_flag='" + jik + "' where service_no='" + lblSerNo.Text + "'", cn);
        }
        if (chkJik.Checked == true)
        {
            jik = 1;
            cmd = new SqlCommand("update serviceDetails set ank_flag='" + sach + "',jik_flag='" + jik + "' where service_no='" + lblSerNo.Text + "'", cn);
        }
        if (chkSac.Checked == true && chkJik.Checked == true)
        {
            sach = 1;
            jik = 1;
            cmd = new SqlCommand("update serviceDetails set ank_flag='" + sach + "',jik_flag='" + jik + "' where service_no='" + lblSerNo.Text + "'", cn);
        }
        if (chkSac.Checked == false && chkJik.Checked == false)
        {
            cmd = new SqlCommand("update serviceDetails set ank_flag='" + sach + "',jik_flag='" + jik + "' where service_no='" + lblSerNo.Text + "'", cn);
        }
        cmd.ExecuteNonQuery();
        cn.Close();

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
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
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            filename = Path.GetFileName(FileUpload1.FileName);
            fname = filename.Replace(" ", "_");
            fname = fname.Replace("'", "");
            fname = fname.Replace("&", "_");
            FileUpload1.SaveAs(Server.MapPath("~/cnc_Photos/" + fname));
            GridView1.DataBind();

            cn.Open();
            string format = "dd/MMM/yyyy";
            lblTime.Text = time.ToString(format);

            SqlCommand cmd = new SqlCommand("insert into tb_Photos values('" + lblSerNo.Text + "','" + fname + "','" + lblTime.Text + "','" + Session["usrnm"].ToString() + "')", cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            GridView1.DataBind();
        }
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}