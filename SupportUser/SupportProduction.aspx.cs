using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class SupportUser_SupportProduction : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    DateTime date = DateTime.Now;
    decimal sum = 0;
    string remark;
    string mRate;
    string oid, oname, orate;
    decimal amt = 0;
    decimal machiRate = 0;
    string comyBy;
    string proVal;
    decimal finalOperCost = 0, finalMacCost = 0, totalCost = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usrnm"] == null || Session["usrnm"] == "")
        {
            Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            Panel1.Visible = false;
        }
        string format = "dd/MMM/yyyy";
        lblDate.Text = date.ToString(format);
        Label1.Text = "";
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ddlserviceNo.SelectedValue == "-1")
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "clientScript", "alert('You must select Service No before Proceeding.!!!')", true);
            return;
        }
        if (Convert.ToDecimal(txtWQty.Text) > Convert.ToDecimal(lblQty.Text))
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "clientScript", "alert('Worked Qty cannot be greater then left Qty.!!!')", true);
        }
        else
        {
            string checkString = txtRemarks.Text;
            remark = checkString.Replace("'", "");

            cn.Open();
            SqlCommand macCost = new SqlCommand("select MachineCost from MachineDetails where MachineName='" + ddlMachineName.SelectedItem + "'", cn);
            SqlDataReader drmacCost = macCost.ExecuteReader();
            while (drmacCost.Read())
            {
                mRate = drmacCost["MachineCost"].ToString();
            }
            drmacCost.Close();
            cn.Close();
            machiRate = Convert.ToDecimal(mRate.ToString()) * Convert.ToDecimal(txtMWHrs.Text);
            cn.Open();
            SqlCommand cmdCost = new SqlCommand("insert into tb_machineCost values('" + ddlserviceNo.SelectedValue + "','" + ddlMachineName.SelectedValue + "','" + txtMWHrs.Text + "','" + machiRate + "','" + ddlShift.SelectedValue + "')", cn);
            cmdCost.ExecuteNonQuery();
            cn.Close();

            CheckBox chk;
            foreach (GridViewRow rowItem in GridView3.Rows)
            {
                chk = (CheckBox)(rowItem.Cells[0].FindControl("chkOp"));
                if (chk.Checked)
                {
                    cn.Open();
                    SqlCommand selop = new SqlCommand("select * from OperatorMaster where OperName='" + chk.Text + "'", cn);
                    SqlDataReader drop = selop.ExecuteReader();
                    while (drop.Read())
                    {
                        oid = drop["Oper_Id"].ToString();
                        oname = drop["OperName"].ToString();
                        orate = drop["PHRate"].ToString();
                    }
                    drop.Close();
                    SqlCommand cmdOp = new SqlCommand("insert into tb_operatorTrack values('" + ddlserviceNo.SelectedValue + "','" + oid + "')", cn);
                    cmdOp.ExecuteNonQuery();
                    
                    amt = Convert.ToDecimal(orate) * Convert.ToDecimal(txtMWHrs.Text);
                    SqlCommand opCost = new SqlCommand("insert into tb_operCost values('" + ddlserviceNo.SelectedValue + "','" + oname + "','" + txtMWHrs.Text + "','" + amt + "')", cn);
                    opCost.ExecuteNonQuery();
                    cn.Close();
                }
            }
            cn.Open();
            SqlCommand cmdSupply = new SqlCommand("insert into supplyProduction values('" + ddlserviceNo.SelectedValue + "','" + ddlTime.SelectedValue + "','" + ddlShift.SelectedValue + "','" + txtWQty.Text + "','" + txtPDate.Text + "','" + ddlMachineName.SelectedValue + "','" + txtRemarks.Text + "','" + txtMWHrs.Text + "','" + amt + "','" + machiRate + "')", cn);
            cmdSupply.ExecuteNonQuery();
            cn.Close();
            GridView4.DataBind();
            lblQty.Text = (Convert.ToDecimal(lblQty.Text) - Convert.ToDecimal(txtWQty.Text)).ToString();

            cn.Open();
            SqlCommand cmdCompBy = new SqlCommand("select service_comp_by from serviceDetails where service_no='" + ddlserviceNo.SelectedValue + "'", cn);
            SqlDataReader drCompBy = cmdCompBy.ExecuteReader();
            while (drCompBy.Read())
            {
                comyBy = drCompBy["service_comp_by"].ToString();
            }
            drCompBy.Close();
            SqlCommand getmail = new SqlCommand("select emailId from UserDetails where loginID='" + comyBy + "'", cn);
            SqlDataReader drEmail = getmail.ExecuteReader();
            while (drEmail.Read())
            {
                Session["email"] = drEmail["emailId"].ToString();
            }
            drEmail.Close();
            cn.Close();

            if (Convert.ToDecimal(lblQty.Text) == 0)
            {
                cn.Open();
                SqlCommand cmdProReq = new SqlCommand("select SUM(worked_qty) as worked_qty from supplyProduction where service_no='" + ddlserviceNo.SelectedValue + "'", cn);
                SqlDataAdapter daProReq = new SqlDataAdapter(cmdProReq);
                DataTable dtProReq = new DataTable();
                daProReq.Fill(dtProReq);

                cn.Close();
                int rowPro = dtProReq.Rows.Count;
                proVal = dtProReq.Rows[0]["worked_qty"].ToString();

                cn.Open();
                SqlCommand cmdFetch = new SqlCommand("select * from serviceDetails where service_no='" + ddlserviceNo.SelectedValue + "'", cn);
                SqlDataReader drFetch = cmdFetch.ExecuteReader();
                while (drFetch.Read())
                {
                    Session["work_id"] = drFetch["service_details"].ToString();
                    Session["request_by"] = drFetch["service_comp_by"].ToString();
                }
                drFetch.Close();
                cn.Close();

                cn.Open();
                SqlCommand cmdOperCost = new SqlCommand("select SUM(operCostTender) as oper_CostTender from tb_operCost where service_no='" + ddlserviceNo.SelectedValue + "'", cn);
                SqlDataReader drOperCost = cmdOperCost.ExecuteReader();
                while (drOperCost.Read())
                {
                    finalOperCost = Convert.ToDecimal(drOperCost["oper_CostTender"].ToString());
                }
                drOperCost.Close();
                cn.Close();

                cn.Open();
                SqlCommand cmdMacCost = new SqlCommand("select SUM(machineCostTender) as mac_CostTender from tb_machineCost where service_no='" + ddlserviceNo.SelectedValue + "'", cn);
                SqlDataReader drMacCost = cmdMacCost.ExecuteReader();
                while (drMacCost.Read())
                {
                    finalMacCost = Convert.ToDecimal(drMacCost["mac_CostTender"].ToString());
                }
                drmacCost.Close();
                cn.Close();

                totalCost = finalOperCost + finalMacCost;

                Label1.Text = "<html><body><hr>";
                Label1.Text = Label1.Text + "<center><b><font size=" + 12 + " color=blue>Production Completion Details</font></b></center><br>";
                Label1.Text = Label1.Text + "<hr><br>";
                //Label1.Text = Label1.Text + "Production of the<br>";
                Label1.Text = Label1.Text + "<b>CNC Service No. :</b>" + ddlserviceNo.SelectedValue + "<br>";
                Label1.Text = Label1.Text + "<b>Production Done By :</b>" + Session["usrnm"] + "<br>";
                Label1.Text = Label1.Text + "<b>Qty. Produced :</b>" + proVal + "<br>";
                Label1.Text = Label1.Text + "<b>Internal Work Order No :</b>" + Session["work_id"].ToString() + "<br>";
                Label1.Text = Label1.Text + "<b>Service Requested By :</b>" + Session["request_by"].ToString() + "<br>";
                //Label1.Text = Label1.Text + "<b>Upload Date :</b>" + Label6.Text + "<br>";
                Label1.Text = Label1.Text + "<hr><br>";
                Label1.Text = Label1.Text + "<center><b><font size=" + 10 + " color=blue>Costing of Request</font></b></center><br>";
                Label1.Text = Label1.Text + "<b>Operator Cost for Request :</b>" + finalOperCost + "<br>";
                Label1.Text = Label1.Text + "<b>Machine Cost for Request :</b>" + finalMacCost + "<br>";
                Label1.Text = Label1.Text + "<b>Total Cost :</b>" + totalCost + "<br>";
                Label1.Text = Label1.Text + "<hr><br>";
                //Label1.Text = Label1.Text + "<b>Note:-This is Auto Generated Mail,Please Dont Reply To This Mail</b><br>";
                Label1.Text = Label1.Text + "Thanks/Regards<br>";
                Label1.Text = Label1.Text + "<b>Kemrock Fabrication Department</b><br></body></html>";
            }
            txtRemarks.Text = "";
            txtPDate.Text = "";
            txtWQty.Text = "";
            txtMWHrs.Text = "";
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
        SqlCommand cmdWork = new SqlCommand("select worked_qty from supplyProduction where service_no='" + ddlserviceNo.SelectedValue + "'", cn);
        SqlDataAdapter daWork = new SqlDataAdapter(cmdWork);
        DataTable dt = new DataTable();
        daWork.Fill(dt);
        cn.Close();

        int rowcnt = dt.Rows.Count;
        if (rowcnt == 0)
        {
            lblQty.Text = lblReqQty.Text;
        }
        else
        {
            for (int i = 0; i <= rowcnt - 1; i++)
            {
                sum = sum + Convert.ToDecimal(dt.Rows[i]["worked_qty"].ToString());
            }
            lblQty.Text = (Convert.ToDecimal(lblReqQty.Text) - sum).ToString();
        }
    }
    //protected void GridView4_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    string g = GridView4.DataKeys[e.RowIndex].Value.ToString();
    //    SqlDataSource6.DeleteCommand = "delete from supplyProduction where supp_entry='" + g + "'";
    //}
}