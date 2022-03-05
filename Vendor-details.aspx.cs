using CitySeva.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitySeva.dashboard
{
    public partial class Vendor_details : System.Web.UI.Page
    {

        dllVendor dllVendor = new dllVendor();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                string vId = Request.QueryString["vid"].ToString();
                string b_id = Request.QueryString["bid"].ToString();
                if (!string.IsNullOrEmpty(b_id))
                {
                    hidrequestid.Value = b_id;
                    DisplayImages(vId);
                }
            }

        }
        private void DisplayImages(string vid)
        {
            if (!string.IsNullOrEmpty(vid))
            {
                DataSet ds = dllVendor.GetVendorProfileData(Convert.ToInt32(vid));
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {

                        string img = "";
                        string img1 = "<img class='xzoom5' id='xzoom-magnific'   width='400px' height='250' src='Uploads/" + ds.Tables[0].Rows[0]["ImagePath"].ToString() + "' xoriginal='Uploads/" + ds.Tables[0].Rows[0]["ImagePath"].ToString() + "' />" + "<div class='xzoom-thumbs'>";
                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            img += "<a href='Uploads/" + ds.Tables[0].Rows[i]["ImagePath"].ToString() + "'>"
                                  + "<img class='xzoom-gallery5' width='80' height='60' src='Uploads/" + ds.Tables[0].Rows[i]["ImagePath"].ToString() + "' title='The description goes here'></a>";
                        }
                        img1 = img1 + img + "</div>";

                        //string htmlImage = "<img class='xzoom5' id='xzoom-magnific' src='images/gallery/preview/01_b_car.jpg' xoriginal='images/gallery/original/01_b_car.jpg' />"
                        //                                    + "<div class='xzoom-thumbs'>"
                        //                                        + "<a href='images/gallery/original/01_b_car.jpg'>"
                        //                                            + "<img class='xzoom-gallery5' width='80' src='images/gallery/thumbs/01_b_car.jpg' xpreview='images/gallery/preview/01_b_car.jpg' title='The description goes here'></a>"
                        //                                        + "<a href='images/gallery/original/02_o_car.jpg'>"
                        //                                            + "<img class='xzoom-gallery5' width='80' src='images/gallery/preview/02_o_car.jpg' title='The description goes here'></a>"
                        //                                        + "<a href='images/gallery/original/03_r_car.jpg'>"
                        //                                            + "<img class='xzoom-gallery5' width='80' src='images/gallery/preview/03_r_car.jpg' title='The description goes here'></a>"
                        //                                        + "<a href='images/gallery/original/04_g_car.jpg'>"
                        //                                            + "<img class='xzoom-gallery5' width='80' src='images/gallery/preview/04_g_car.jpg' title='The description goes here'></a>"
                        //                                    + "</div>";
                        ProfileImages.InnerHtml = img1;
                    }
                    if (ds.Tables[1].Rows.Count > 0)
                    {
                        lblBusinessName.Text = ds.Tables[1].Rows[0]["business_name"].ToString();
                        lblBusinessAddress.Text = ds.Tables[1].Rows[0]["business_address"].ToString();
                        lblPaymentMode.Text = ds.Tables[1].Rows[0]["PaymentMode"].ToString();
                        lblBookingAmount.Text = ds.Tables[1].Rows[0]["BookingAmount"].ToString();
                        lblRestAmount.Text = ds.Tables[1].Rows[0]["RestAmount"].ToString();
                        lblCancellationPolicy.Text = ds.Tables[1].Rows[0]["OrderCancellled"].ToString();
                        lblBusinessInfoHeading.InnerText = ds.Tables[1].Rows[0]["business_name"].ToString();
                        lblBusinessInfo.InnerText = ds.Tables[1].Rows[0]["Businessinfo"].ToString();
                        lblServiceCity.Text = ds.Tables[1].Rows[0]["city"].ToString();
                        chkYesDash.Checked = ds.Tables[1].Rows[0]["other_city"].ToString() == "True" ? true : false;
                        chkTravelDash.Checked = ds.Tables[1].Rows[0]["travel_and_stay"].ToString() == "True" ? true : false;



                    }
                    if (ds.Tables[2].Rows.Count > 0)
                    {
                        hometab.InnerText = ds.Tables[2].Rows[0]["ServiceType"].ToString();
                        profiletab.InnerText = ds.Tables[2].Rows[1]["ServiceType"].ToString();

                        string[] strServices = ds.Tables[2].Rows[0]["services"].ToString().Split(',');
                        string chkServices = "";
                        if (strServices.Length > 0)
                        {
                            for (int i = 0; i < strServices.Length; i++)
                            {
                                chkServices += "<div class='form-check'>"
                                               + "<input class='form-check-input' type='checkbox' checked='true' value='' id='defaultCheck1'>"
                                               + "<label class='form-check-label' for='defaultCheck1'>" + strServices[i].ToString() + "</label>"
                                               + "</div>";
                            }
                        }
                        divServices.InnerHtml = chkServices;

                        lblPlatePrice.InnerText = ds.Tables[2].Rows[0]["PerPlatePrice"].ToString();
                        lblPlateItems.InnerText = ds.Tables[2].Rows[0]["Items"].ToString();
                        lblCookingPriceStart.InnerText = ds.Tables[2].Rows[1]["PerPlatePrice"].ToString();
                        lblNumberGuest.InnerText = ds.Tables[2].Rows[1]["NumOfGuest"].ToString();

                    }
                }
            }


        }

    }
}