using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class SupportUser_SupportDelivery : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    DateTime date = DateTime.Now;
    string proVal,delVal;
    decimal sum = 0;
    string chkstr, delstr;
    string oper_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrnm"] == null || Session["usrnm"] == "")
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            Panel1.Visible = false;
            lblItemDesc.Text = "";
            lblReqQty.Text = "";
            Panel2.Visible = false;
        }
        string format = "dd/MMM/yyyy";
        lblDate.Text = date.ToString(format);
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ddlserviceNo.SelectedValue == "-1")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "clientScript", "alert('You must select Service No before Proceeding.!!!')", true);
            return;
        }
        if (Convert.ToDecimal(txtDQty.Text) > Convert.ToDecimal(lblQty.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "clientScript", "alert('Delivery Qty. must be less then Production Qty. !!!')", true);
            return;
        }
        if (Convert.ToDecimal(lblQty.Text) == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "clientScript", "alert('No More Qty. Left For particular Service!!')", true);
        }
        else
        {
            chkstr = txtRemarks.Text;
            delstr = chkstr.Replace("'", "");

            cn.Open();
            SqlCommand cmdSave = new SqlCommand("insert into supp_Delivery values('" + ddlserviceNo.SelectedValue + "','" + ddlTime.SelectedValue + "','" + ddlShift.SelectedValue + "','" + txtDQty.Text + "','" + txtDDate.Text + "','" + delstr + "')", cn);
            cmdSave.ExecuteNonQuery();
            cn.Close();
            GridView4.DataBind();

            cn.Open();
            CheckBox chk;
            foreach (GridViewRow rowitem in GridView3.Rows)
            {
                chk = (CheckBox)(rowitem.Cells[0].FindControl("chkOp"));
                if (chk.Checked)
                {
                    SqlCommand cmdOp = new SqlCommand("select Oper_Id from OperatorMaster where OperName='" + chk.Text + "'", cn);
                    SqlDataReader dr = cmdOp.ExecuteReader();
                    while (dr.Read())
                    {
                        oper_id = dr["Oper_Id"].ToString();
                    }
                    dr.Close();

                    SqlCommand cmdIns = new SqlCommand("insert into tb_operatorTrack values('" + ddlserviceNo.SelectedValue + "','" + oper_id + "')", cn);
                    cmdIns.ExecuteNonQuery();
                }
            }
            cn.Close();
            lblQty.Text = (Convert.ToDecimal(lblQty.Text) - Convert.ToDecimal(txtDQty.Text)).ToString();
            txtDDate.Text = "";
            txtDQty.Text = "";
            txtRemarks.Text = "";

            if (Convert.ToDecimal(lblQty.Text) == 0)
            {
                Panel2.Visible = true;
            }
            else
            {
                Panel2.Visible = false;
            }
        }
    }
    protected void ddlserviceNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        cn.Open();
        SqlCommand cmd = new SqlCommand("select item_desc,item_req from itemDetails where service_no='" + ddlserviceNo.SelectedValue + "'", cn);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            lblItemDesc.Text = dr["item_desc"].ToString();
            lblReqQty.Text = dr["item_req"].ToString();
        }
        dr.Close();
        cn.Close();
        Panel1.Visible = true;

        cn.Open();
        SqlCommand cmdProReq = new SqlCommand("select SUM(worked_qty) as worked_qty from supplyProduction where service_no='" + ddlserviceNo.SelectedValue + "'", cn);
        SqlDataAdapter daProReq = new SqlDataAdapter(cmdProReq);
        DataTable dtProReq = new DataTable();
        daProReq.Fill(dtProReq);

        cn.Close();
        int rowPro = dtProReq.Rows.Count;
        proVal = dtProReq.Rows[0]["worked_qty"].ToString();
        if (proVal == "")
        {
            lblQty.Text = "0";
        }
        else
        {
            for (int j = 0; j <= rowPro - 1; j++)
            {
                lblQty.Text = dtProReq.Rows[j]["worked_qty"].ToString();
            }
        }

        cn.Open();
        SqlCommand cmdReq = new SqlCommand("select SUM(delivery_qty) as delivery_qty from supp_Delivery where service_no='" + ddlserviceNo.SelectedValue + "'", cn);
        SqlDataAdapter daReq = new SqlDataAdapter(cmdReq);
        DataTable dt = new DataTable();
        daReq.Fill(dt);
        cn.Close();

        int rowcnt = dt.Rows.Count;
        delVal = dt.Rows[0]["delivery_qty"].ToString();
        if (delVal == "")
        {

        }
        else
        {
            for (int i = 0; i <= rowcnt - 1; i++)
            {
                sum = sum + Convert.ToDecimal(dt.Rows[i]["delivery_qty"].ToString());
            }
            lblQty.Text = (Convert.ToDecimal(lblQty.Text) - sum).ToString();
        }
        if (Convert.ToDecimal(lblQty.Text) == 0)
        {
            Panel2.Visible = true;
        }
        else
        {
            Panel2.Visible = false;
        }
    }
    protected void btnComplete_Click(object sender, EventArgs e)
    {
        if (chkComplete.Checked == true)
        {
            cn.Open();
            SqlCommand cmdComp = new SqlCommand("update serviceDetails set service_status='Completed',comp_on='" + lblDate.Text + "',service_attend_by='" + Session["usrnm"].ToString() + "' where service_no='" + ddlserviceNo.SelectedValue + "'", cn);
            cmdComp.ExecuteNonQuery();
            cn.Close();
            Response.Redirect("SupportDelivery.aspx");
        }
    }
}