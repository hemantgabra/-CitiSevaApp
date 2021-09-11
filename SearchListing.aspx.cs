using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CitySeva.Models;

namespace CitySeva
{
    public partial class SearchListing : System.Web.UI.Page
    {
        dllVendeRregistration vendeRregistration = new dllVendeRregistration();
        string servic = "";
        string Location = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                 servic = Request.QueryString["ser"].ToString();
                 Location = Request.QueryString["lc"].ToString();
                Grid();
            }
           
        }
        private void Grid()
        {
           
            DataTable Dt = vendeRregistration.GetAllVendorSearch(servic, Location);
            if (Dt.Rows.Count > 0)
            {
                categoryRpt.DataSource = Dt;
                categoryRpt.DataBind();
            }
            else
            {

                lbllstingMsg.Text = "NO listing match ";
            }




        }

        protected void categoryRpt_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                hidrequestid.Value = e.CommandArgument.ToString();
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript'>  openDilog();</script> ");


            }
        }

         

        protected void categoryRpt_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Reference the Repeater Item.
                RepeaterItem item = e.Item;
                //Reference the Controls.
                string lbl_price_start_from = (item.FindControl("lbl_price_start_from") as Label).Text;
                string lbl_number_of_guest = (item.FindControl("lbl_number_of_guest") as Label).Text;
                string lbl_package = (item.FindControl("lbl_package") as Label).Text;
                string lbl_payment_mode = (item.FindControl("lbl_payment_mode") as Label).Text;
                string lbl_cooking_package = (item.FindControl("lbl_cooking_package") as Label).Text;
                string lbl_price_per_plate_from = (item.FindControl("lbl_price_per_plate_from") as Label).Text;

                HtmlGenericControl div_price_start_from = e.Item.FindControl("div_price_start_from") as HtmlGenericControl;
                HtmlGenericControl div_number_of_guest = e.Item.FindControl("div_number_of_guest") as HtmlGenericControl;
                HtmlGenericControl div_package = e.Item.FindControl("div_package") as HtmlGenericControl;
                HtmlGenericControl div_cooking_package = e.Item.FindControl("div_cooking_package") as HtmlGenericControl;
                HtmlGenericControl div_payment_mode = e.Item.FindControl("div_payment_mode") as HtmlGenericControl;
                HtmlGenericControl div_price_per_plate_from = e.Item.FindControl("div_price_per_plate_from") as HtmlGenericControl;
                if (string.IsNullOrEmpty(lbl_price_start_from))
                {
                    div_price_start_from.Visible = false;
                }
                else {
                    div_price_start_from.Visible = true;
                }
                if (string.IsNullOrEmpty(lbl_number_of_guest))
                {
                    div_number_of_guest.Visible = false;
                }
                else
                {
                    div_number_of_guest.Visible = true;
                }
                if (string.IsNullOrEmpty(lbl_package))
                {
                    div_package.Visible = false;
                }
                else
                {
                    div_package.Visible = true;
                }
                if (string.IsNullOrEmpty(lbl_cooking_package))
                {
                    div_cooking_package.Visible = false;
                }
                else
                {
                    div_cooking_package.Visible = true;
                }
                if (string.IsNullOrEmpty(lbl_price_per_plate_from))
                {
                    div_price_per_plate_from.Visible = false;
                }
                else
                {
                    div_price_per_plate_from.Visible = true;
                }
                if (string.IsNullOrEmpty(lbl_payment_mode))
                {
                    div_payment_mode.Visible = false;
                }
                else
                {
                    div_payment_mode.Visible = true;
                }

            }
        }
    }
}