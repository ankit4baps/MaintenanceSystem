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

public partial class ServiceUser_NewWorkLog : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlCommand cmd;
    string filename;
    int pic_flag = 0;
    int exit_flag = 0;
    static int temp_prev_qty = 0;
    int sum = 0;
    int serviceNo;
    string str;
    string temp_pic, temp_up, temp_user;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrnm"] == null || Session["usrnm"] == "")
        {
            Response.Redirect("~/Login.aspx");
        }
        if (Session["usrnm"] == null || Session["usrnm"] == "")
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            Label1.Text = "";
            //lblServiceNo.Visible = false;
            DateTime time = DateTime.Now;
            string format = "dd/MMM/yyyy";
            Label3.Text = time.ToString(format);
            Panel1.Visible = false;
            temp_prev_qty = 0;
            lblName.Text = Session["usrnm"].ToString();
            //lblServiceNo.Text = serviceNo.ToString();

            cn.Open();
            SqlCommand cmd = new SqlCommand("delete from temp_pic where username='" + Session["usrnm"].ToString() + "'", cn);
            cmd.ExecuteNonQuery();
            cn.Close();


            cn.Open();
            SqlCommand cm = new SqlCommand("delete from temp_item_table", cn);
            cm.ExecuteNonQuery();
            cn.Close();

        }
    }
    protected void Chkqc_CheckedChanged(object sender, EventArgs e)
    {
        if (Chkqc.Checked == true)
        {
            Chkdesign.Visible = false;
            Chkmy.Visible = false;
        }
        else
        {
            Chkdesign.Visible = true;
            Chkmy.Visible = true;
        }
    }
    protected void Chkdesign_CheckedChanged(object sender, EventArgs e)
    {
        if (Chkdesign.Checked == true)
        {
            Chkqc.Visible = false;
            Chkmy.Visible = false;
        }
        else
        {
            Chkqc.Visible = true;
            Chkmy.Visible = true;
        }
    }
    protected void Chkmy_CheckedChanged(object sender, EventArgs e)
    {
        if (Chkmy.Checked == true)
        {
            Chkdesign.Visible = false;
            Chkqc.Visible = false;

            cn.Open();
            SqlCommand cmd = new SqlCommand("select loginID,emailId from UserDetails where loginID='" + Session["usrnm"].ToString() + "'", cn);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtEmail.Text = dr["emailId"].ToString();
                txtPerName.Text = dr["loginID"].ToString();
            }
            cn.Close();
        }
        else
        {
            Chkdesign.Visible = true;
            Chkqc.Visible = true;

            txtEmail.Text = "";
            txtPerName.Text = "";
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int photoCount = GridView1.Rows.Count;

        if (photoCount == 0)
        {
            Label1.Text = "Please Upload Any Drwaing/Document and Then Proceed!!!";
            return;
        }

        int itemCount = GridView2.Rows.Count;

        if (itemCount == 0)
        {
            Label1.Text = "Please Enter Item Planner Schedule!!!";
            return;
        }

        if (Label10.Text == "Label")
        {
            Label1.Text = "You Have Not Done Item Planning. Please Plan the Item!!!";
            return;
        }

        if (Convert.ToInt32(Label10.Text) == 0)
        {
            cn.Open();
            if (Chkqc.Checked == true)
            {
                str = "insert into serviceDetails values('" + ddlDeptUser.SelectedValue + "','" + txtIntWorkNo.Text + "','" + Chkqc.Text + "','" + txtPerName.Text + "','" + txtEmail.Text + "','" + Session["usrnm"].ToString() + "','" + Label3.Text + "','" + txtRemarks.Text + "',0,0,'Pending','','" + Session["usrnm"].ToString() + "')";
            }
            else if (Chkmy.Checked == true)
            {
                str = "insert into serviceDetails values('" + ddlDeptUser.SelectedValue + "','" + txtIntWorkNo.Text + "','" + Chkmy.Text + "','" + txtPerName.Text + "','" + txtEmail.Text + "','" + Session["usrnm"].ToString() + "','" + Label3.Text + "','" + txtRemarks.Text + "',0,0,'Pending','','" + Session["usrnm"].ToString() + "')";
            }
            else if (Chkdesign.Checked == true)
            {
                str = "insert into serviceDetails values('" + ddlDeptUser.SelectedValue + "','" + txtIntWorkNo.Text + "','" + Chkdesign.Text + "','" + txtPerName.Text + "','" + txtEmail.Text + "','" + Session["usrnm"].ToString() + "','" + Label3.Text + "','" + txtRemarks.Text + "',0,0,'Pending','','" + Session["usrnm"].ToString() + "')";
            }
            SqlCommand cmd = new SqlCommand(str, cn);
            cmd.ExecuteNonQuery();
            cn.Close();

            cn.Open();
            SqlCommand cmd1 = new SqlCommand("select max(service_no) as service_no from serviceDetails", cn);
            SqlDataReader dr = cmd1.ExecuteReader();
            while (dr.Read())
            {
                serviceNo = Convert.ToInt32(dr["service_no"].ToString());
            }
            cn.Close();
            dr.Close();

            lblServiceNo.Text = "Your Service Number : " + serviceNo;

            lblShow.Text = "<html><body><hr>";
            lblShow.Text = lblShow.Text + "<center><b><font size=" + 12 + " color=blue>CNC Service Details</font></b></center><br>";
            lblShow.Text = lblShow.Text + "<hr><br>";
            lblShow.Text = lblShow.Text + "<b>Service No. :</b>" + serviceNo + "<br>";
            lblShow.Text = lblShow.Text + "<b>Service Logged By :</b>" + Session["usrnm"] + "<br>";
            lblShow.Text = lblShow.Text + "<b>Service Required By(Department) :</b>" + ddlDeptUser.SelectedValue + "<br>";
            lblShow.Text = lblShow.Text + "<b>Internal Work Order No. OR Project Name :</b>" + txtIntWorkNo.Text + "<br>";
            //lblShow.Text = lblShow.Text + "<b>Required By Date :</b>" + Txtreqdate.Text + "<br>";
            lblShow.Text = lblShow.Text + "<b>Required Qty :</b>" + txtReqQty.Text + "<br>";
            lblShow.Text = lblShow.Text + "<b>Prepared By Date :</b>" + Label3.Text + "<br>";
            lblShow.Text = lblShow.Text + "<b>Remark :</b>" + txtRemarks.Text + "<br>";
            lblShow.Text = lblShow.Text + "<hr><br>";
            lblShow.Text = lblShow.Text + "<b>Note:-This is Auto Generated Mail,Please Dont Reply To This Mail</b><br>";
            lblShow.Text = lblShow.Text + "Thanks/Regards<br>";
            lblShow.Text = lblShow.Text + "<b>Kemrock Maintenance Department</b><br></body></html>";


            //cn.Open();
            //SqlCommand cmdpic = new SqlCommand("select * from temp_pic where userName='" + Session["usrnm"].ToString() + "' and uptime='" + Label3.Text + "'", cn);
            //SqlDataReader drpic = cmdpic.ExecuteReader();
            //while (drpic.Read())
            //{
            //    temp_pic = drpic["temp_picName"].ToString();
            //    temp_up = drpic["uptime"].ToString();
            //    temp_user = drpic["userName"].ToString();

            //    SqlCommand inspic = new SqlCommand("insert into tb_Photos values('" + serviceNo + "','" + temp_pic + "','" + temp_up + "','" + temp_user + "')", cn);
            //    inspic.ExecuteNonQuery();
            //    drpic.Close();
            //}
            //cn.Close();

            cn.Open();
            int rowcount = GridView1.Rows.Count;
            for (int i = 0; i <= rowcount - 1; i++)
            {
                SqlCommand inspic = new SqlCommand("insert into tb_Photos values('" + serviceNo + "','" + GridView1.Rows[i].Cells[0].Text + "','" + GridView1.Rows[i].Cells[1].Text + "','" + Session["usrnm"].ToString() + "')", cn);
                inspic.ExecuteNonQuery();
            }
            cn.Close();

            cn.Open();
            int rowct=GridView2.Rows.Count;
            for (int i = 0; i <= rowct - 1; i++)
            {
                SqlCommand insItem = new SqlCommand("insert into itemDetails values('" + serviceNo + "','" + txtItemDescr.Text + "','" + txtReqQty.Text + "','" + GridView2.Rows[i].Cells[0].Text + "','" + GridView2.Rows[i].Cells[1].Text + "','" + GridView2.Rows[i].Cells[2].Text + "','" + GridView2.Rows[i].Cells[3].Text + "')", cn);
                insItem.ExecuteNonQuery();
            }
            cn.Close();

            txtIntWorkNo.Text = "";
            txtItemDescr.Text = "";
            Chkdesign.Checked = false;
            Chkmy.Checked = false;
            Chkqc.Checked = false;
            GridView1.Dispose();
            GridView2.Dispose();
        }
        else
        {
            Label1.Text = "You Have not finished with Item Planning. Please Plan the Item!!!";
            return;
        }
    }
    protected void rtbYes_CheckedChanged(object sender, EventArgs e)
    {
        if (rtbYes.Checked == true)
        {
            Panel1.Visible = true;
        }
        else
        {
            Panel1.Visible = false;
        }
    }
    protected void rtbNo_CheckedChanged(object sender, EventArgs e)
    {
        if (rtbNo.Checked == true)
        {
            Panel1.Visible = false;
        }
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string path = Server.MapPath("~/cnc_Photos/");
            filename = FileUpload1.PostedFile.FileName;
            bool fileok = false;

            cn.Open();
            SqlCommand pic = new SqlCommand("select * from temp_pic where temp_picName='" + filename + "'", cn);
            SqlDataReader dr = pic.ExecuteReader();
            while (dr.Read())
            {
                pic_flag = 1;
            }
            cn.Close();
            dr.Close();

            if (pic_flag == 1)
            {
                Label1.Text = "File with this name is already Exist......";
            }
            else
            {
                string fileExtension = null;
                fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                string[] allowExt = { ".pdf", ".dwg", ".iges", ".step", ".ste", ".jpeg", ".jpg", ".png", ".gif" };
                for (int i = 0; i <= allowExt.Length - 1; i++)
                {
                    if (fileExtension == allowExt[i])
                    {
                        fileok = true;
                    }
                }
                if (fileok)
                {
                    cn.Open();
                    FileUpload1.PostedFile.SaveAs(path + filename.ToString());
                    SqlCommand cmd = new SqlCommand("insert into temp_pic values('" + filename.ToString() + "','" + Label3.Text + "','" + Session["usrnm"].ToString() + "')", cn);
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    Label1.Text = "";
                    GridView1.DataBind();
                }
            }
        }
    }

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow r = GridView2.Rows[e.RowIndex];
        GridViewRow row = GridView2.SelectedRow;

        int c = Convert.ToInt32(row);

        string valcell = r.Cells[2].Text;
        int id = (int)GridView2.DataKeys[e.RowIndex].Value;

        Label10.Text = (Convert.ToInt32(Label10.Text) + Convert.ToInt32(valcell)).ToString();

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        checkval();

        string startDate = txtMateDe.Text;
        string endDate = txtDelySch.Text;
        int temp_day = 0;
        DateTime tempStartDate, tempEndDate;
        TimeSpan tempStore;
        tempStartDate = Convert.ToDateTime(startDate);
        tempEndDate = Convert.ToDateTime(endDate);
        tempStore = tempStartDate.Subtract(tempEndDate);
        temp_day = Convert.ToInt32(tempStore.Days.ToString());

        if (temp_day >= 0)
        {
            lblItemError.Text = "Delivery Date Sch. Cannot be less then or equal to Basic Delivery Sch.!!";
            return;
        }

        if (exit_flag == 0)
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand("insert into temp_item_table values('" + txtBasicReq.Text + "','" + txtMateDe.Text + "','" + txtDeliNeed.Text + "','" + txtDelySch.Text + "')", cn);
            cmd.ExecuteNonQuery();
            GridView2.DataBind();
            cn.Close();
            txtBasicReq.Text = "";
            txtDeliNeed.Text = "";
            txtDelySch.Text = "";
            txtMateDe.Text = "";
        }
    }
    protected void txtReqQty_TextChanged(object sender, EventArgs e)
    {
        Label10.Text = txtReqQty.Text;
        if (temp_prev_qty >= 0 && Convert.ToInt32(Label10.Text) <= 0)
        {
            lblItemError.Text = "Not Enough Qty. Left!!!";
            return;
        }
        if (temp_prev_qty == 0)
        {
            temp_prev_qty = Convert.ToInt32(txtReqQty.Text);
            Label10.Text = txtReqQty.Text;
        }
        if (temp_prev_qty > 0)
        {
            temp_prev_qty = temp_prev_qty - Convert.ToInt32(Label10.Text);
            Label10.Text = (Convert.ToInt32(txtReqQty.Text) - temp_prev_qty).ToString();
            temp_prev_qty = Convert.ToInt32(txtReqQty.Text);
        }
    }
    protected void txtBasicReq_TextChanged(object sender, EventArgs e)
    {
        txtDeliNeed.Text = txtBasicReq.Text;
    }
    private void checkval()
    {
        int required = Convert.ToInt32(txtReqQty.Text);
        int rowct = GridView2.Rows.Count;
        for (int i = 0; i <= rowct - 1; i++)
        {
            sum = sum + Convert.ToInt32(GridView2.Rows[i].Cells[0].Text);
        }
        Label10.Text = (required - sum).ToString();
        sum += Convert.ToInt32(txtBasicReq.Text);
        //Label10.Text = (Convert.ToInt32(txtReqQty.Text) - sum).ToString();

        if (sum > required)
        { 
            lblItemError.Text = "Not Enough Required Quantity!!!";
            exit_flag = 1;
        }
        if (sum <= required)
        {
            Label10.Text = (required - sum).ToString();
        }
    }
}