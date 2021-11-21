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
    public partial class SearchListingNew : System.Web.UI.Page
    {
        dllVendeRregistration vendeRregistration = new dllVendeRregistration();
        dllVendor dllVendor = new dllVendor();
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

            DataTable Dt = vendeRregistration.GetVendorListingstring(servic, Location);
            if (Dt.Rows.Count > 0)
            {
                categoryRpt.DataSource = Dt;
                categoryRpt.DataBind();

                DataTable DtImage = dllVendor.GetVendorImages(Convert.ToInt32(Dt.Rows[0]["vandor_Id"].ToString()));
                string strImages = "";
                for (int i = 0; i < DtImage.Rows.Count; i++)
                {
                    strImages += "<div class='item'>" +
                                     "<img width='285' height='198' src='Uploads/" + DtImage.Rows[i]["ImagePath"].ToString() + "' />" +
                                          "</div>";

                }
          

                imgListing.InnerHtml = strImages;
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
                //hidrequestid.Value = e.CommandArgument.ToString();
                //ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language = 'javascript'>  openDilog();</script> ");
                HiddenField hiddenBusinessId = (HiddenField)e.Item.FindControl("hidBusinessId");
                Response.Redirect("~/Vendor-details.aspx?vid=" + e.CommandArgument.ToString()+"&bid="+ hiddenBusinessId.Value);       
            }
        }


    }
}