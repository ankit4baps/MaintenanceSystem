using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SupportUser_UploadDocument : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\kemrock.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd;
    string filename;
    int pic_flag = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrnm"] == null || Session["usrnm"] == "")
        {
            Response.Redirect("~/Login.aspx");
        }
        DateTime time = DateTime.Now;
        string format = "dd/MMM/yyyy";
        Label2.Text = time.ToString(format);
        Label1.Text = "";
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string path = Server.MapPath("~/cnc_Photos/");
            filename = FileUpload1.PostedFile.FileName;

            cn.Open();
            SqlCommand cmdpic = new SqlCommand("select pic_name from tb_Photos where pic_name='" + filename + "'", cn);
            SqlDataReader dr = cmdpic.ExecuteReader();
            while (dr.Read())
            {
                pic_flag = 1;
            }
            cn.Close();
            if (pic_flag == 1)
            {
                Label1.Text = "File With This Name Already Exists....";
            }
            else
            {
                cn.Open();
                FileUpload1.PostedFile.SaveAs(path + filename.ToString());
                cmd = new SqlCommand("insert into tb_Photos (pic_name,up_time,user_name) values ('" + filename.ToString() + "','" + Label2.Text + "','" + Session["usrnm"].ToString() + "')", cn);
                cmd.ExecuteNonQuery();
                cn.Close();
                GridView1.DataBind();

            }
        }
    }
    protected void gridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string filename = GridView1.Rows[e.RowIndex].Cells[1].Text;
        System.IO.File.Delete(Server.MapPath("~/cnc_Photos/" + filename));
    }
}