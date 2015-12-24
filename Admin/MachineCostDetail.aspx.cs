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
using System.IO;

public partial class Admin_MachineCostDetail : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\kemrock.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd;
    string filename;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrnm"] == null || Session["usrnm"] == "")
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            filename = Path.GetFileName(FileUpload1.FileName);
            filename = filename.Replace(" ", "_");
            filename = filename.Replace("'", "");
            filename = filename.Replace("&", "_");

            cn.Open();
            cmd = new SqlCommand("insert into MachineCostDetail (Machine_Header,Machine_pic_Name) values('" + DropDownList1.SelectedValue + "','" + filename + "')", cn);
            cmd.ExecuteNonQuery();
            cn.Close();
            FileUpload1.SaveAs(Server.MapPath("~/MachineCost/" + filename));
            GridView1.DataBind();
        }
        else
        {
            Label1.Text = "Please Select a File For Upload";
        }
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string fname;
        int rowid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        FileUpload fileup = GridView1.Rows[e.RowIndex].FindControl("fp1") as FileUpload;

        if (fileup.HasFile)
        {
            fname = Path.GetFileName(fileup.FileName);
            fname = fname.Replace(" ", "_");
            fname = fname.Replace("'", "");
            fname = fname.Replace("&", "_");

            SqlDataSource1.UpdateCommand = "update MachineCostDetail set Machine_pic_Name='" + fname + "' where MachineCost_Id='" + rowid + "'";
            fileup.SaveAs(Server.MapPath("~/MachineCost/" + fname));
            GridView1.DataBind();
        }
        else
        {
            Label1.Text = "Please Select a File For Upload";
        }
    }
}
