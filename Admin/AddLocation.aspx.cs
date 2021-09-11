using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using CitySeva.Models;

namespace CitySeva.Admin
{
    public partial class AddLocation : System.Web.UI.Page
    {
        dllLocation obj_dllLocation = new dllLocation();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Grid();
                btnUpdate.Visible = false;
                btn_Add.Visible = true;
            }
        }

        public void Grid()
        {

            try
            {
                DataTable Dt = obj_dllLocation.GetAlllocation();
                LocatiionRpt.DataSource = Dt;
                LocatiionRpt.DataBind();
                //lbltotalcount.Text = categoryRpt.Rows.Count.ToString();
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message);
            }



        }

        void ShowMessage(string msg)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript' > alert('" + msg + "');</ script > ");
        }

        protected void categoryRpt_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit1")
            {

                int catID = Convert.ToInt32(e.CommandArgument);
                DataTable dt = obj_dllLocation.GetlocationById(catID);
                if (dt.Rows.Count > 0)
                {
                    txt_location.Text = dt.Rows[0]["location"].ToString();
                    hidUpdatevalue.Value = dt.Rows[0]["id"].ToString();
                    btnUpdate.Visible = true;
                    btn_Add.Visible = false;
                }

            }
            if (e.CommandName == "Delete")
            {
                int catID = Convert.ToInt32(e.CommandArgument);
                string result = obj_dllLocation.Deletelocation(catID);
                if (result == "1")
                {
                    Grid();
                    lblmsg.Text = "<span style='color:green;'>Location Delete</span>";
                }
                else
                {
                    lblmsg.Text = "<span style='color:red;'>Location not Delete</span>";
                }
            }

        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                if (!string.IsNullOrEmpty(txt_location.Text))
                {

                    string result = obj_dllLocation.Addlocation(txt_location.Text.Trim(), "", true);
                    if (result == "1")
                    {
                        Grid();
                        txt_location.Text = "";

                        lblmsg.Text = "<span style='color:green;'>Location Added</span>";

                    }
                    else
                    {
                        lblmsg.Text = "<span style='color:red;'>Location not Added</span>";
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(txt_location.Text))
            {
                string result = obj_dllLocation.Updatelocation(Convert.ToInt32(hidUpdatevalue.Value), txt_location.Text.Trim(), "", true);
                if (result == "1")
                {
                    Grid();
                    btnUpdate.Visible = false;
                    btn_Add.Visible = true;
                    lblmsg.Text = "<span style='color:green;'>Location Updated</span>";
                    txt_location.Text = "";
                }
                else
                {
                    lblmsg.Text = "<span style='color:red;'>Location not Updated</span>";
                }
            }
        }
    }
}